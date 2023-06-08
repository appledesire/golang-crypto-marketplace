package marketplace

import (
	"errors"
	"fmt"
	"time"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
)

/*
	Models
*/

type UserBitcoinCashWallet struct {
	PublicKey string `json:"public_key" gorm:"primary_key"`
	UserUuid  string `json:"-"`

	User User `json:"-"`

	CreatedAt *time.Time `json:"created_at,omitempty"`
	UpdatedAt *time.Time `json:"updated_at,omitempty"`
	DeletedAt *time.Time `json:"deleted_at,omitempty"`
}

type UserBitcoinCashWalletBalance struct {
	ID                 int     `json:"id" gorm:"primary_key"`
	PublicKey          string  `json:"public_key" gorm:"index"`
	Balance            float64 `json:"balance"`
	UnconfirmedBalance float64 `json:"unconfirmed_balance"`
	Type               string  `json:"type"`

	CreatedAt time.Time `json:"created_at"`

	UserBitcoinCashWallet UserBitcoinCashWallet `gorm:"AssociationForeignKey:PublicKey" json:"-"`
}

type UserBitcoinCashWallets []UserBitcoinCashWallet

type UserBitcoinCashWalletAction struct {
	ID                 int    `json:"id" gorm:"primary_key"`
	UserUuid           string `json:"user_uuid" gorm:"user_uuid"`
	PublicKey          string `json:"public_key" gorm:"index"`
	PaymentReceiptUuid string `json:"payment_receipt_uuid" gorm:"payment_receipt_uuid"`

	Action string  `json:"action"`
	Amount float64 `json:"amount"`

	CreatedAt time.Time `json:"created_at"`

	User                  User                  `json:"-"`
	UserBitcoinCashWallet UserBitcoinCashWallet `gorm:"AssociationForeignKey:PublicKey" json:"-"`
	PaymentReceipt        PaymentReceipt        `json:"-"`
}

/*
	Model Methods
*/

func (w UserBitcoinCashWallet) UpdateBalance(force bool) (UserBitcoinCashWalletBalance, error) {
	d, _ := time.ParseDuration("1m")
	now := time.Now()

	if !w.UpdatedAt.Add(d).Before(now) && !force {
		return UserBitcoinCashWalletBalance{}, errors.New("BitcoinCashWallet was updated recently. Please wait.")
	}

	w.UpdatedAt = &now

	err := w.Save()
	if err != nil {
		return UserBitcoinCashWalletBalance{}, err
	}

	balance, err := apis.GetAmountOnBCHAddress(w.PublicKey)
	if err != nil {
		return UserBitcoinCashWalletBalance{}, err
	}

	currentBalance := w.CurrentBalance()
	if currentBalance.Balance != balance.Balance || currentBalance.UnconfirmedBalance != balance.UnconfirmedBalance {

		uwb := UserBitcoinCashWalletBalance{
			PublicKey:          w.PublicKey,
			Balance:            balance.Balance,
			UnconfirmedBalance: balance.UnconfirmedBalance,
			CreatedAt:          now,
			Type:               "blockchain",
		}
		uwb.Save()

		var (
			action string
			amount float64
		)

		if currentBalance.Balance != balance.Balance {
			action = "Balance updated"
			amount = balance.Balance
		} else {
			action = "Unconfirmed balance updated"
			amount = balance.UnconfirmedBalance
		}

		uwa := UserBitcoinCashWalletAction{
			UserUuid:  w.UserUuid,
			PublicKey: w.PublicKey,
			Action:    action,
			Amount:    amount,
			CreatedAt: time.Now(),
		}
		uwa.Save()

		return uwb, nil
	}

	return currentBalance, nil
}

func (w UserBitcoinCashWallet) CurrentBalance() UserBitcoinCashWalletBalance {
	var uwb UserBitcoinCashWalletBalance

	database.
		Where(&UserBitcoinCashWalletBalance{PublicKey: w.PublicKey}).
		Order("created_at DESC").
		First(&uwb)

	return uwb
}

/*
	Database methods
*/

func (w UserBitcoinCashWallet) Validate() error {
	if w.PublicKey == "" {
		return errors.New("Wrong wallet")
	}
	return nil
}

func (w UserBitcoinCashWallet) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w UserBitcoinCashWallet) Remove() error {
	return database.Delete(w).Error
}

func (w UserBitcoinCashWallet) SaveToDatabase() error {
	if existing, _ := FindUserBitcoinCashWalletByPublicKey(w.PublicKey); existing == nil {
		return database.Create(&w).Error
	}
	return database.Save(&w).Error
}

// UserBitcoinCashWalletBalance

func (w UserBitcoinCashWalletBalance) Validate() error {
	if w.PublicKey == "" {
		return errors.New("Wrong wallet")
	}
	return nil
}

func (w UserBitcoinCashWalletBalance) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w UserBitcoinCashWalletBalance) Remove() error {
	return database.Delete(w).Error
}

func (w UserBitcoinCashWalletBalance) SaveToDatabase() error {
	if w.ID != 0 {
		return database.Save(&w).Error
	}
	w.ID = GetNextUserBitcoinCashWalletbalanceID()
	return database.Create(&w).Error
}

func (w UserBitcoinCashWalletAction) Validate() error {
	if w.UserUuid == "" {
		return errors.New("Wrong UserUuid")
	}
	return nil
}

func (w UserBitcoinCashWalletAction) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w UserBitcoinCashWalletAction) Remove() error {
	return database.Delete(w).Error
}

func (w UserBitcoinCashWalletAction) SaveToDatabase() error {
	if w.ID != 0 {
		return database.Save(&w).Error
	}
	w.ID = GetNextUserBitcoinCashWalletActionID()
	return database.Create(&w).Error

}

/*
	Model Methods
*/

func (w UserBitcoinCashWallets) Balance() apis.BCHWalletBalance {
	var balance apis.BCHWalletBalance
	for _, b := range w {
		balance.Balance += b.CurrentBalance().Balance
		balance.UnconfirmedBalance += b.CurrentBalance().UnconfirmedBalance
	}

	return balance
}

func (ws UserBitcoinCashWallets) prepareTransaction(address string, amount float64) ([]string, []apis.BCHPayment, error) {
	if amount > ws.Balance().Balance {
		return []string{}, []apis.BCHPayment{}, errors.New("Amount is greater than balance")
	}

	if !bitcoinRegexp.MatchString(address) {
		return []string{}, []apis.BCHPayment{}, errors.New("Wrong BCH address")
	}

	if len(ws) == 0 {
		return []string{}, []apis.BCHPayment{}, errors.New("Zero-length user wallets")
	}

	addresses := []string{}
	for _, w := range ws {
		cb := w.CurrentBalance()
		if cb.UnconfirmedBalance != float64(0.0) {
			return []string{}, []apis.BCHPayment{}, errors.New("Please wait for previous transactions to confirm")
		}
		if cb.Balance > float64(0.0) {
			addresses = append(addresses, w.PublicKey)
		}
	}

	payments := []apis.BCHPayment{
		{Address: address, Amount: amount},
	}

	return addresses, payments, nil
}

func (ws UserBitcoinCashWallets) Send(address string, amount float64) (PaymentReceipt, error) {

	addresses, payments, err := ws.prepareTransaction(address, amount)
	if err != nil {
		return PaymentReceipt{}, err
	}

	transactionResult, err := apis.SendBCHFromMultipleWalletsWithAmountSplit(addresses, payments)
	if err != nil {
		return PaymentReceipt{}, err
	}

	receipt, err := CreateBCHPaymentReceipt(transactionResult)
	if err != nil {
		return PaymentReceipt{}, err
	}

	uwa := UserBitcoinCashWalletAction{
		Action:             fmt.Sprintf("Sent %f BCH to %s", amount, address),
		UserUuid:           ws[0].UserUuid,
		CreatedAt:          time.Now(),
		PaymentReceiptUuid: receipt.Uuid,
	}

	return receipt, uwa.Save()
}

func (ws UserBitcoinCashWallets) EstimateFee(address string, amount float64) (float64, string, error) {
	addresses, payments, err := ws.prepareTransaction(address, amount)
	if err != nil {
		return 0.0, "", err
	}

	result, err := apis.EstimateBCHFeeFromMultipleWalletsWithAmountSplit(addresses, payments)
	return float64(result.Fee) / 1e8, result.Description, err
}

func (w UserBitcoinCashWallet) SweepToBitcoinWallet(btcWalletAddress string) (PaymentReceipt, error) {

	transactionResult, err := apis.SendBCHToBTC(w.PublicKey, btcWalletAddress)
	if err != nil {
		return PaymentReceipt{}, err
	}

	receipt, err := CreateBTCPaymentReceipt(transactionResult)
	if err != nil {
		return PaymentReceipt{}, err
	}

	uwa := UserBitcoinCashWalletAction{
		Action:             fmt.Sprintf("Sent funds from BCH to BTC wallet"),
		UserUuid:           w.UserUuid,
		CreatedAt:          time.Now(),
		PaymentReceiptUuid: receipt.Uuid,
	}

	return receipt, uwa.Save()
}

/*
	Queries
*/

func GetNextUserBitcoinCashWalletActionID() int {
	var userBitcoinCashWalletAction UserBitcoinCashWalletAction
	database.
		Order("ID desc").
		First(&userBitcoinCashWalletAction)

	return userBitcoinCashWalletAction.ID + 1
}

func GetNextUserBitcoinCashWalletbalanceID() int {
	var userBitcoinCashWalletAction UserBitcoinCashWalletBalance
	database.
		Order("ID desc").
		First(&userBitcoinCashWalletAction)

	return userBitcoinCashWalletAction.ID + 1
}

func GetAllUserBitcoinCashWallets() []UserBitcoinCashWallet {
	var items []UserBitcoinCashWallet
	database.Find(&items)
	return items
}

func GetAlllUserBitcoinCashWalletBalances() []UserBitcoinCashWalletBalance {
	var items []UserBitcoinCashWalletBalance
	database.Find(&items)
	return items
}

func GetAllUserBitcoinCashWalletActions() []UserBitcoinCashWalletAction {
	var items []UserBitcoinCashWalletAction
	database.Find(&items)
	return items
}

func FindUserBitcoinCashWalletByPublicKey(publicKey string) (*UserBitcoinCashWallet, error) {
	var userBitcoinCashWallet UserBitcoinCashWallet

	err := database.
		Where(&UserBitcoinCashWallet{PublicKey: publicKey}).
		First(&userBitcoinCashWallet).
		Error

	if err != nil {
		return nil, err
	}

	return &userBitcoinCashWallet, err
}

func FindBitcoinCashWalletsForUser(userUuid string) []UserBitcoinCashWallet {
	var wallets []UserBitcoinCashWallet

	database.
		Where(&UserBitcoinCashWallet{UserUuid: userUuid}).
		Find(&wallets)

	return wallets
}

func FindUserBitcoinCashWalletActionsForUser(userUuid string) []UserBitcoinCashWalletAction {
	var actions []UserBitcoinCashWalletAction

	database.
		Where(&UserBitcoinCashWalletAction{UserUuid: userUuid}).
		Order("created_at ASC").
		Preload("PaymentReceipt").
		Find(&actions)

	for i := range actions {
		paymentReceipt := actions[i].PaymentReceipt
		if paymentReceipt.Type == "bitcoin_cash" && paymentReceipt.SerializedData != "" {
			bchPaymentResult, err := paymentReceipt.BCHPaymentResult()
			if err != nil {
				continue
			}
			actions[i].PaymentReceipt.BCHPaymentResultItem = &bchPaymentResult
		}
	}

	return actions
}

// FindRecentBitcoinCashWallets returns wallets no older than 1 day
func FindRecentBitcoinCashWallets() []UserBitcoinCashWallet {
	var wallets []UserBitcoinCashWallet

	dayAgo := time.Now().AddDate(0, 0, -7)

	database.
		Where("created_at > ?", dayAgo).
		Find(&wallets)

	return wallets
}

func FindAllBitcoinCashWallets() []UserBitcoinCashWallet {
	var wallets []UserBitcoinCashWallet

	database.Find(&wallets)

	return wallets
}

/*
	CRUD
*/

func CreateBitcoinCashWallet(user User) (*UserBitcoinCashWallet, error) {
	address, err := apis.GenerateBCHAddress("user_wallet")
	if err != nil {
		return nil, err
	}

	uw := UserBitcoinCashWallet{
		PublicKey: address,
		UserUuid:  user.Uuid,
	}

	uwa := UserBitcoinCashWalletAction{
		UserUuid:  uw.UserUuid,
		PublicKey: uw.PublicKey,
		Action:    "BitcoinCashWallet created",
		Amount:    float64(0.0),
	}
	uwa.Save()

	return &uw, uw.Save()
}

// Create views and other representatives
func setupUserBitcoinCashBalanceViews() {
	database.Exec("DROP VIEW IF EXISTS v_user_bitcoin_cash_wallet_balances CASCADE;")
	database.Exec(`
		CREATE VIEW v_user_bitcoin_cash_wallet_balances AS (
			select sum(balance) as balance, sum(unconfirmed_balance) as unconfirmed_balance, user_uuid, username  from (

			WITH UserBitcoinCashWalletBalancesUpdateTimes As (
			   SELECT public_key, MAX(created_at) max_timestamp
			   FROM user_bitcoin_cash_wallet_balances
			   GROUP BY public_key
			)
			select 
				uwb.created_at, uwb.public_key, uwb.balance, uwb.unconfirmed_balance, uw.user_uuid, u.username
			from 
				user_bitcoin_cash_wallet_balances uwb 
			join 
				user_bitcoin_cash_wallets uw on uw.public_key=uwb.public_key 
			join
				users u on u.uuid=uw.user_uuid
			inner join 
				UserBitcoinCashWalletBalancesUpdateTimes t on t.public_key=uwb.public_key and uwb.created_at = t.max_timestamp
			) uwb
			group by username, user_uuid
			order by balance desc
	);`)
}
