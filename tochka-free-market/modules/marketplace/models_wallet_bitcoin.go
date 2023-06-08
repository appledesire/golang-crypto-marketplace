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

type UserBitcoinWallet struct {
	PublicKey string `json:"public_key" gorm:"primary_key"`
	UserUuid  string `json:"-"`
	IsLocked  bool   `json:"-"`

	User User `json:"-"`

	CreatedAt *time.Time `json:"created_at,omitempty"`
	UpdatedAt *time.Time `json:"updated_at,omitempty"`
	DeletedAt *time.Time `json:"deleted_at,omitempty"`
}

type UserBitcoinWalletBalance struct {
	ID                 int     `json:"id" gorm:"primary_key"`
	PublicKey          string  `json:"public_key" gorm:"index"`
	Balance            float64 `json:"balance"`
	UnconfirmedBalance float64 `json:"unconfirmed_balance"`
	Type               string  `json:"type"`

	CreatedAt time.Time `json:"created_at"`

	UserBitcoinWallet UserBitcoinWallet `gorm:"AssociationForeignKey:PublicKey" json:"-"`
}

type UserBitcoinWallets []UserBitcoinWallet

type UserBitcoinWalletAction struct {
	ID                 int    `json:"id" gorm:"primary_key"`
	UserUuid           string `json:"user_uuid" gorm:"user_uuid"`
	PaymentReceiptUuid string `json:"payment_receipt_uuid" gorm:"payment_receipt_uuid"`
	PublicKey          string `json:"public_key" gorm:"index"`

	Action string  `json:"action"`
	Amount float64 `json:"amount"`

	CreatedAt time.Time `json:"created_at"`

	User              User              `json:"-"`
	UserBitcoinWallet UserBitcoinWallet `gorm:"AssociationForeignKey:PublicKey" json:"-"`
	PaymentReceipt    PaymentReceipt    `json:"-"`
}

/*
	Model Methods
*/

func (w UserBitcoinWallet) UpdateBalance(force bool) (UserBitcoinWalletBalance, error) {
	d, _ := time.ParseDuration("1m")
	now := time.Now()

	if !w.UpdatedAt.Add(d).Before(now) && !force {
		return UserBitcoinWalletBalance{}, errors.New("BitcoinWallet was updated recently. Please wait.")
	}

	w.UpdatedAt = &now

	err := w.Save()
	if err != nil {
		return UserBitcoinWalletBalance{}, err
	}

	balance, err := apis.GetAmountOnBTCAddress(w.PublicKey)
	if err != nil {
		return UserBitcoinWalletBalance{}, err
	}

	currentBalance := w.CurrentBalance()
	if currentBalance.Balance != balance.Balance || currentBalance.UnconfirmedBalance != balance.UnconfirmedBalance {

		uwb := UserBitcoinWalletBalance{
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

		uwa := UserBitcoinWalletAction{
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

func (w UserBitcoinWallet) CurrentBalance() UserBitcoinWalletBalance {
	var uwb UserBitcoinWalletBalance

	database.
		Where(&UserBitcoinWalletBalance{PublicKey: w.PublicKey}).
		Order("created_at DESC").
		First(&uwb)

	return uwb
}

/*
	Database methods
*/

// UserBitcoinWallet

func (w UserBitcoinWallet) Validate() error {
	if w.PublicKey == "" {
		return errors.New("Wrong wallet")
	}
	return nil
}

func (w UserBitcoinWallet) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w UserBitcoinWallet) Remove() error {
	return database.Delete(w).Error
}

func (w UserBitcoinWallet) SaveToDatabase() error {
	if existing, _ := FindUserBitcoinWalletByPublicKey(w.PublicKey); existing == nil {
		return database.Create(&w).Error
	}
	return database.Save(&w).Error
}

// UserBitcoinWalletBalance

func (w UserBitcoinWalletBalance) Validate() error {
	if w.PublicKey == "" {
		return errors.New("Wrong wallet")
	}
	return nil
}

func (w UserBitcoinWalletBalance) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w UserBitcoinWalletBalance) Remove() error {
	return database.Delete(w).Error
}

func (w UserBitcoinWalletBalance) SaveToDatabase() error {
	if w.ID != 0 {
		return database.Save(&w).Error
	}
	w.ID = GetNextUserBitcoinWalletbalanceID()
	return database.Create(&w).Error
}

func (w UserBitcoinWalletAction) Validate() error {
	if w.UserUuid == "" {
		return errors.New("Wrong UserUuid")
	}
	return nil
}

func (w UserBitcoinWalletAction) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w UserBitcoinWalletAction) Remove() error {
	return database.Delete(w).Error
}

func (w UserBitcoinWalletAction) SaveToDatabase() error {
	if w.ID != 0 {
		return database.Save(&w).Error
	}
	w.ID = GetNextUserBitcoinWalletActionID()
	return database.Create(&w).Error

}

/*
	Model Methods
*/

func (w UserBitcoinWallets) Balance() apis.BTCWalletBalance {
	var balance apis.BTCWalletBalance
	for _, b := range w {
		balance.Balance += b.CurrentBalance().Balance
		balance.UnconfirmedBalance += b.CurrentBalance().UnconfirmedBalance
	}

	return balance
}

func (ws UserBitcoinWallets) prepareTransaction(address string, amount float64) ([]string, []apis.BTCPayment, error) {
	if amount > ws.Balance().Balance {
		return []string{}, []apis.BTCPayment{}, errors.New("Amount is greater than balance")
	}

	if !bitcoinRegexp.MatchString(address) {
		return []string{}, []apis.BTCPayment{}, errors.New("Wrong BTC address")
	}

	if len(ws) == 0 {
		return []string{}, []apis.BTCPayment{}, errors.New("Zero-length user wallets")
	}

	addresses := []string{}
	for _, w := range ws {
		if w.IsLocked {
			return []string{}, []apis.BTCPayment{}, errors.New("Wallet is currently locked")
		}
		cb := w.CurrentBalance()
		if cb.UnconfirmedBalance != float64(0.0) {
			return []string{}, []apis.BTCPayment{}, errors.New("Please wait for previus transactions to confirm")
		}
		if cb.Balance > float64(0.0) {
			addresses = append(addresses, w.PublicKey)
		}
	}

	payments := []apis.BTCPayment{
		{Address: address, Amount: amount},
	}

	return addresses, payments, nil
}

func (ws UserBitcoinWallets) Send(address string, amount float64) (PaymentReceipt, error) {

	addresses, payments, err := ws.prepareTransaction(address, amount)
	if err != nil {
		return PaymentReceipt{}, err
	}

	transactionResult, err := apis.SendBTCFromMultipleWalletsWithAmountSplit(addresses, payments)
	if err != nil {
		return PaymentReceipt{}, err
	}

	receipt, err := CreateBTCPaymentReceipt(transactionResult)
	if err != nil {
		return PaymentReceipt{}, err
	}

	uwa := UserBitcoinWalletAction{
		Action:             fmt.Sprintf("Sent %f BTC to %s", amount, address),
		UserUuid:           ws[0].UserUuid,
		CreatedAt:          time.Now(),
		PaymentReceiptUuid: receipt.Uuid,
	}

	return receipt, uwa.Save()
}

func (ws UserBitcoinWallets) EstimateFee(address string, amount float64) (float64, string, error) {
	addresses, payments, err := ws.prepareTransaction(address, amount)
	if err != nil {
		return 0.0, "", err
	}

	result, err := apis.EstimateBTCFeeFromMultipleWalletsWithAmountSplit(addresses, payments)
	return float64(result.Fee) / 1e8, result.Description, err
}

/*
	Queries
*/

func GetNextUserBitcoinWalletActionID() int {
	var userBitcoinWalletAction UserBitcoinWalletAction
	database.
		Order("ID desc").
		First(&userBitcoinWalletAction)

	return userBitcoinWalletAction.ID + 1
}

func GetNextUserBitcoinWalletbalanceID() int {
	var userBitcoinWalletAction UserBitcoinWalletBalance
	database.
		Order("ID desc").
		First(&userBitcoinWalletAction)

	return userBitcoinWalletAction.ID + 1
}

func GetAllUserBitcoinWallets() []UserBitcoinWallet {
	var items []UserBitcoinWallet
	database.Find(&items)
	return items
}

func GetAlllUserBitcoinWalletBalances() []UserBitcoinWalletBalance {
	var items []UserBitcoinWalletBalance
	database.Find(&items)
	return items
}

func GetAllUserBitcoinWalletActions() []UserBitcoinWalletAction {
	var items []UserBitcoinWalletAction
	database.Find(&items)
	return items
}

func FindUserBitcoinWalletByPublicKey(publicKey string) (*UserBitcoinWallet, error) {
	var userBitcoinWallet UserBitcoinWallet

	err := database.
		Where(&UserBitcoinWallet{PublicKey: publicKey}).
		First(&userBitcoinWallet).
		Error

	if err != nil {
		return nil, err
	}

	return &userBitcoinWallet, err
}

func FindBitcoinWalletsForUser(userUuid string) []UserBitcoinWallet {
	var wallets []UserBitcoinWallet

	database.
		Where(&UserBitcoinWallet{UserUuid: userUuid}).
		Find(&wallets)

	return wallets
}

func FindUserBitcoinWalletActionsForUser(userUuid string) []UserBitcoinWalletAction {
	var actions []UserBitcoinWalletAction

	database.
		Where(&UserBitcoinWalletAction{UserUuid: userUuid}).
		Order("created_at ASC").
		Preload("PaymentReceipt").
		Find(&actions)

	for i := range actions {
		paymentReceipt := actions[i].PaymentReceipt
		if paymentReceipt.Type == "bitcoin" && paymentReceipt.SerializedData != "" {
			btcPaymentResult, err := paymentReceipt.BTCPaymentResult()
			if err != nil {
				continue
			}
			actions[i].PaymentReceipt.BTCPaymentResultItem = &btcPaymentResult
		}
	}

	return actions
}

// FindRecentBitcoinWallets returns wallets no older than 1 day
func FindRecentBitcoinWallets() []UserBitcoinWallet {
	var wallets []UserBitcoinWallet

	database.
		Where("created_at > ?", time.Now().AddDate(0, 0, -7)).
		Find(&wallets)

	return wallets
}

func FindAllBitcoinWallets() []UserBitcoinWallet {
	var wallets []UserBitcoinWallet
	database.Find(&wallets)
	return wallets
}

/*
	CRUD
*/

func CreateBitcoinWallet(user User) (*UserBitcoinWallet, error) {
	address, err := apis.GenerateBTCAddress("user_wallet")
	if err != nil {
		return nil, err
	}

	uw := UserBitcoinWallet{
		PublicKey: address,
		UserUuid:  user.Uuid,
	}

	uwa := UserBitcoinWalletAction{
		UserUuid:  uw.UserUuid,
		PublicKey: uw.PublicKey,
		Action:    "BitcoinWallet created",
		Amount:    float64(0.0),
	}
	uwa.Save()

	return &uw, uw.Save()
}

// Create views and other representatives
func setupUserBitcoinBalanceViews() {
	database.Exec("DROP VIEW IF EXISTS v_user_bitcoin_wallet_balances CASCADE;")
	database.Exec(`
		CREATE VIEW v_user_bitcoin_wallet_balances AS (
			select sum(balance) as balance, sum(unconfirmed_balance) as unconfirmed_balance, user_uuid, username  from (

			WITH UserBitcoinWalletBalancesUpdateTimes As (
			   SELECT public_key, MAX(created_at) max_timestamp
			   FROM user_bitcoin_wallet_balances
			   GROUP BY public_key
			)
			select 
				uwb.created_at, uwb.public_key, uwb.balance, uwb.unconfirmed_balance, uw.user_uuid, u.username
			from 
				user_bitcoin_wallet_balances uwb 
			join 
				user_bitcoin_wallets uw on uw.public_key=uwb.public_key 
			join
				users u on u.uuid=uw.user_uuid
			inner join 
				UserBitcoinWalletBalancesUpdateTimes t on t.public_key=uwb.public_key and uwb.created_at = t.max_timestamp
			) uwb
			group by username, user_uuid
			order by balance desc
	);`)
}
