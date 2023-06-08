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

type UserEthereumWallet struct {
	PublicKey string `json:"public_key" gorm:"primary_key"`
	UserUuid  string `json:"-"`

	User User `json:"-"`

	CreatedAt *time.Time `json:"created_at,omitempty"`
	UpdatedAt *time.Time `json:"updated_at,omitempty"`
	DeletedAt *time.Time `json:"deleted_at,omitempty"`
}

type UserEthereumWalletBalance struct {
	ID        int     `json:"id" gorm:"primary_key"`
	PublicKey string  `json:"public_key" gorm:"index"`
	Balance   float64 `json:"balance"`
	Type      string  `json:"type"`

	UserEthereumWallet UserEthereumWallet `gorm:"AssociationForeignKey:PublicKey" json:"-"`

	CreatedAt time.Time `json:"created_at"`
}

type UserEthereumWallets []UserEthereumWallet

type UserEthereumWalletAction struct {
	ID                 int    `json:"id" gorm:"primary_key"`
	UserUuid           string `json:"user_uuid" gorm:"user_uuid"`
	PublicKey          string `json:"public_key" gorm:"index"`
	PaymentReceiptUuid string `json:"payment_receipt_uuid" gorm:"payment_receipt_uuid"`

	Action string  `json:"action"`
	Amount float64 `json:"amount"`

	CreatedAt time.Time `json:"created_at"`

	User               User               `json:"-"`
	UserEthereumWallet UserEthereumWallet `gorm:"AssociationForeignKey:PublicKey" json:"-"`
	PaymentReceipt     PaymentReceipt     `json:"-"`
}

/*
	Model Methods
*/

func (w UserEthereumWallet) UpdateBalance(force bool) (UserEthereumWalletBalance, error) {
	d, _ := time.ParseDuration("1m")
	now := time.Now()

	if w.UpdatedAt != nil && w.UpdatedAt.Add(d).After(now) && !force {
		return UserEthereumWalletBalance{}, errors.New("EthereumWallet was updated recently. Please wait.")
	}

	w.UpdatedAt = &now

	err := w.Save()
	if err != nil {
		return UserEthereumWalletBalance{}, err
	}

	balance, err := apis.GetAmountOnETHAddress(w.PublicKey)
	if err != nil {
		return UserEthereumWalletBalance{}, err
	}

	currentBalance := w.CurrentBalance()

	if currentBalance.Balance != balance.Balance {

		uwb := UserEthereumWalletBalance{
			PublicKey: w.PublicKey,
			Balance:   balance.Balance,
			CreatedAt: now,
			Type:      "blockchain",
		}
		uwb.Save()

		uwa := UserEthereumWalletAction{
			UserUuid:  w.UserUuid,
			PublicKey: w.PublicKey,
			Action:    "Balance updated",
			Amount:    balance.Balance,
			CreatedAt: time.Now(),
		}
		uwa.Save()

		return uwb, nil
	}

	return currentBalance, err
}

func (w UserEthereumWallet) CurrentBalance() UserEthereumWalletBalance {
	var uwb UserEthereumWalletBalance

	database.
		Where(&UserEthereumWalletBalance{PublicKey: w.PublicKey}).
		Order("created_at DESC").
		First(&uwb)

	return uwb
}

/*
	Database methods
*/

func (w UserEthereumWallet) Validate() error {
	if w.PublicKey == "" {
		return errors.New("Wrong wallet")
	}
	return nil
}

func (w UserEthereumWallet) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w UserEthereumWallet) Remove() error {
	return database.Delete(w).Error
}

func (w UserEthereumWallet) SaveToDatabase() error {
	if existing, _ := FindUserEthereumWalletByPublicKey(w.PublicKey); existing == nil {
		return database.Create(&w).Error
	}
	return database.Save(&w).Error
}

// UserEthereumWalletBalance

func (w UserEthereumWalletBalance) Validate() error {
	if w.PublicKey == "" {
		return errors.New("Wrong wallet")
	}
	return nil
}

func (w UserEthereumWalletBalance) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w UserEthereumWalletBalance) Remove() error {
	return database.Delete(w).Error
}

func (w UserEthereumWalletBalance) SaveToDatabase() error {
	if w.ID != 0 {
		return database.Save(&w).Error
	}
	return database.Create(&w).Error
}

func (w UserEthereumWalletAction) Validate() error {
	if w.UserUuid == "" {
		return errors.New("Wrong UserUuid")
	}
	return nil
}

func (w UserEthereumWalletAction) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w UserEthereumWalletAction) Remove() error {
	return database.Delete(w).Error
}

func (w UserEthereumWalletAction) SaveToDatabase() error {
	if w.ID != 0 {
		return database.Save(&w).Error
	}
	return database.Create(&w).Error

}

/*
	Model Methods
*/

func (w UserEthereumWallets) Balance() apis.ETHWalletBalance {
	var balance apis.ETHWalletBalance
	for _, b := range w {
		balance.Balance += b.CurrentBalance().Balance
	}

	return balance
}

func (w UserEthereumWallet) Send(address string, amount float64) (PaymentReceipt, error) {

	if amount > w.CurrentBalance().Balance {
		return PaymentReceipt{}, errors.New("Amount is greater than balance")
	}

	if !ethereumRegexp.MatchString(address) {
		return PaymentReceipt{}, errors.New("Wrong ETH address")
	}

	payments := []apis.ETHPayment{
		{Address: address, Amount: amount},
	}

	result, err := apis.SendETH(w.PublicKey, payments)
	if err != nil {
		return PaymentReceipt{}, err
	}

	receipt, err := CreateETHPaymentReceipt(result)
	if err != nil {
		return PaymentReceipt{}, err
	}

	uwa := UserEthereumWalletAction{
		Action:             fmt.Sprintf("Sent %f ETH to %s", amount, address),
		UserUuid:           w.UserUuid,
		CreatedAt:          time.Now(),
		PaymentReceiptUuid: receipt.Uuid,
	}

	return receipt, uwa.Save()
}

/*
	Queries
*/

func GetAllUserEthereumWallets() []UserEthereumWallet {
	var items []UserEthereumWallet
	database.Find(&items)
	return items
}

func GetAlllUserEthereumWalletBalances() []UserEthereumWalletBalance {
	var items []UserEthereumWalletBalance
	database.Find(&items)
	return items
}

func GetAllUserEthereumWalletActions() []UserEthereumWalletAction {
	var items []UserEthereumWalletAction
	database.Find(&items)
	return items
}

func FindUserEthereumWalletByPublicKey(publicKey string) (*UserEthereumWallet, error) {
	var userdEthereumWallet UserEthereumWallet

	err := database.
		Where(&UserEthereumWallet{PublicKey: publicKey}).
		First(&userdEthereumWallet).
		Error

	if err != nil {
		return nil, err
	}

	return &userdEthereumWallet, err
}

func FindEthereumWalletsForUser(userUuid string) []UserEthereumWallet {
	var wallets []UserEthereumWallet

	database.
		Where(&UserEthereumWallet{UserUuid: userUuid}).
		Find(&wallets)

	return wallets
}

func FindUserEthereumWalletActionsForUser(userUuid string) []UserEthereumWalletAction {
	var actions []UserEthereumWalletAction

	database.
		Where(&UserEthereumWalletAction{UserUuid: userUuid}).
		Order("created_at ASC").
		Preload("PaymentReceipt").
		Find(&actions)

	for i := range actions {
		paymentReceipt := actions[i].PaymentReceipt
		if paymentReceipt.Type == "ethereum" && paymentReceipt.SerializedData != "" {
			ethPaymentResult, err := paymentReceipt.ETHPaymentResult()
			if err != nil {
				continue
			}
			actions[i].PaymentReceipt.ETHPaymentResultItem = &ethPaymentResult
		}
	}

	return actions
}

func FindRecentEthereumWallets() []UserEthereumWallet {
	var wallets []UserEthereumWallet

	database.
		Where(
			"created_at > ?",
			time.Now().AddDate(0, 0, -7),
		).
		Find(&wallets)

	return wallets
}

func FindAllEthereumWallets() []UserEthereumWallet {
	var wallets []UserEthereumWallet

	database.Find(&wallets)

	return wallets
}

/*
	CRUD
*/

func CreateEthereumWallet(user User) (*UserEthereumWallet, error) {
	address, err := apis.GenerateETHAddress("user_wallet")
	if err != nil {
		return nil, err
	}

	uw := UserEthereumWallet{
		PublicKey: address,
		UserUuid:  user.Uuid,
	}

	uwa := UserEthereumWalletAction{
		UserUuid:  uw.UserUuid,
		PublicKey: uw.PublicKey,
		Action:    "Ethereum Wallet created",
		Amount:    float64(0.0),
	}
	uwa.Save()

	return &uw, uw.Save()
}

// Create views and other representatives
func setupUserEthereumBalanceViews() {
	database.Exec("DROP VIEW IF EXISTS v_user_ethereum_wallet_balances CASCADE;")
	database.Exec(`
		CREATE VIEW v_user_ethereum_wallet_balances AS (
			select sum(balance) as balance, user_uuid, username  from (

			WITH UserEthereumWalletBalancesUpdateTimes As (
			   SELECT public_key, MAX(created_at) max_timestamp
			   FROM user_ethereum_wallet_balances
			   GROUP BY public_key
			)
			select 
				uwb.created_at, uwb.public_key, uwb.balance, uw.user_uuid, u.username
			from 
				user_ethereum_wallet_balances uwb 
			join 
				user_ethereum_wallets uw on uw.public_key=uwb.public_key 
			join
				users u on u.uuid=uw.user_uuid
			inner join 
				UserEthereumWalletBalancesUpdateTimes t on t.public_key=uwb.public_key and uwb.created_at = t.max_timestamp
			) uwb
			group by username, user_uuid
			order by balance desc
	);`)
}
