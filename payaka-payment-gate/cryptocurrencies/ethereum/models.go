package ethereum

import (
	"encoding/hex"
	"errors"
	"strconv"
	"time"

	"github.com/ethereum/go-ethereum/crypto"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/db"
)

/*
	Models
*/

type EthereumWallet struct {
	PublicKey  string `json:"address" gorm:"primary_key"`
	PrivateKey string `json:"private_key,omitempty" sql:"type:varchar(1024)"`

	Type string `json:"type"`

	CreatedAt *time.Time `json:"created_at" gorm:"index"`
	UpdatedAt *time.Time `json:"updated_at" gorm:"index"`
	DeletedAt *time.Time `json:"deleted_at" gorm:"index"`
}

type EthereumWallets []EthereumWallet

type EthereumWalletBalance struct {
	ID             int            `json:"id" gorm:"primary_key"`
	PublicKey      string         `json:"address" gorm:"index"`
	BalanceETH     float64        `json:"balance`
	EthereumWallet EthereumWallet `json:"-" gorm:"ForeignKey:PublicKey;AssociationForeignKey:PublicKey"`

	CreatedAt *time.Time `json:"created_at" gorm:"index"`
	UpdatedAt *time.Time `json:"updated_at" gorm:"index"`
	DeletedAt *time.Time `json:"deleted_at" gorm:"index"`
}

type DisplayEthereumWallet struct {
	PublicKey string     `json:"address"`
	Balance   float64    `json:"balance"`
	UpdatedAt *time.Time `json:"updated_at,omitempty"`
	CreatedAt *time.Time `json:"created_at,omitempty"`
	Type      string     `json:"type"`
}

type ETHPayment struct {
	Address string  `json:"address"`
	Percent float64 `json:"percent"`
	Amount  float64 `json:"amount"`
}

type ETHPaymentResult struct {
	Hash           string `json:"hash"`
	RawTx          string `json:"rawTransaction"`
	WalletFrom     string `json:"wallet_from"`
	WalletTo       string `json:"wallet_to"`
	Cost           uint64 `json:"cost"`
	Amount         uint64 `json:"amount"`
	Contract       string `json:"contract,omitempty"`
	ContractMethod string `json:"contract_method,omitempty"`
}

/*
	Model Methods
*/

// Ethereum Wallet

func (w EthereumWallet) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w EthereumWallet) SaveToDatabase() error {
	if existing, _ := FindEthereumWalletByPublicKey(w.PublicKey); existing == nil {
		return db.Database.Create(&w).Error
	}
	return db.Database.Save(&w).Error
}

func (w EthereumWallet) Validate() error {
	if w.PublicKey == "" {
		return errors.New("Public key is not valid")
	}

	if w.PrivateKey == "" {
		return errors.New("Private key is not present")
	}

	return nil
}

// Ethereum Wallet Balance

func (w EthereumWalletBalance) Save() error {
	return db.Database.Create(&w).Error
}

/*
	View Models
*/

func (w EthereumWalletBalance) DisplayEthereumWallet() DisplayEthereumWallet {
	return DisplayEthereumWallet{
		PublicKey: w.PublicKey,
		Balance:   w.BalanceETH,
		Type:      w.EthereumWallet.Type,
		UpdatedAt: w.CreatedAt,
		CreatedAt: w.EthereumWallet.CreatedAt,
	}
}

/*
	Queries
*/

// EthereumWallet

func GetAllEthereumWallets() ([]EthereumWallet, error) {
	ethWallets := []EthereumWallet{}

	err := db.Database.
		Find(&ethWallets).
		Error

	return ethWallets, err
}

func FindEthereumWalletByPublicKey(publicKey string) (*EthereumWallet, error) {
	var w EthereumWallet

	err := db.Database.
		Where("public_key=?", publicKey).
		First(&w).
		Error

	if err != nil {
		return nil, err
	}

	return &w, err
}

func CreateEthereumWallet(tp string) (EthereumWallet, error) {
	key, _ := crypto.GenerateKey()
	var (
		address    = crypto.PubkeyToAddress(key.PublicKey)
		publicKey  = "0x" + hex.EncodeToString(address[:])
		privateKey = "0x" + hex.EncodeToString(crypto.FromECDSA(key))
	)

	now := time.Now()
	ethWallet := EthereumWallet{
		PublicKey:  publicKey,
		PrivateKey: privateKey,
		Type:       tp,
		CreatedAt:  &now,
		UpdatedAt:  &now,
	}

	err := ethWallet.Save()
	return ethWallet, err
}

// EthereumWalletBalance

func FindEthereumWalletsWithNonZeroBalance() ([]EthereumWalletBalance, error) {
	ethereumWallets := []EthereumWalletBalance{}

	err := db.Database.
		Table("v_ethereum_wallet_balances").
		Model(EthereumWalletBalance{}).
		Preload("EthereumWallet").
		Find(&ethereumWallets).
		Error

	return ethereumWallets, err
}

/*
	Financial methods
*/

func (w EthereumWallet) UpdateBalance() (*EthereumWalletBalance, error) {

	println("Updating wallet balance for", w.PublicKey)
	balance, err := ethereumAPI.EthGetBalance(w.PublicKey, "latest")
	if err != nil {
		return nil, err
	}

	// converting from uint64 to int64 bears 0/1 as first bit, which sets sign to -
	// postgres doesn't support uint64, so we convert uint64 to int64 by parsing a string
	float64Balance, err := strconv.ParseFloat(balance.String(), 64)
	if err != nil {
		return nil, err
	}

	float64Balance /= WEI_IN_ETH

	now := time.Now()
	newBalance := EthereumWalletBalance{
		PublicKey:      w.PublicKey,
		BalanceETH:     float64Balance,
		EthereumWallet: w,
		CreatedAt:      &now,
	}

	currentBalance, _ := w.CurrentBalance()

	if currentBalance == nil || (currentBalance != nil && currentBalance.BalanceETH != newBalance.BalanceETH) {
		err = newBalance.Save()
		if err != nil {
			return nil, err
		}
	}

	return &newBalance, nil
}

func (w EthereumWallet) CurrentBalance() (*EthereumWalletBalance, error) {
	var wb EthereumWalletBalance

	err := db.Database.
		Where(&EthereumWalletBalance{PublicKey: w.PublicKey}).
		Order("ID desc").
		First(&wb).
		Error

	if err != nil {
		return nil, err
	}

	return &wb, err
}

/*
	Database views
*/

func SetupViews() {
	db.Database.Exec("DROP VIEW IF EXISTS v_ethereum_wallet_balances")
	db.Database.Exec(`
		CREATE VIEW v_ethereum_wallet_balances AS
			WITH balances AS (
				SELECT * 
				FROM (
					SELECT DISTINCT ON (public_key) *
					FROM 
						ethereum_wallet_balances
					ORDER BY 
						public_key, updated_at DESC, ID
				) bsc
				WHERE 
					balance > 0 
			)

			SELECT 
				balances.id, 
				balances.public_key, 
				balances.balance, 
				ethereum_wallets.type, 
				ethereum_wallets.created_at, 
				balances.updated_at, 
				balances.deleted_at 
			FROM
				balances
			JOIN 
				ethereum_wallets on ethereum_wallets.public_key=balances.public_key
			ORDER BY 
				type, balance DESC;
	`)
}
