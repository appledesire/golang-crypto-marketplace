package tks

import (
	"bytes"
	"encoding/hex"
	"errors"
	"fmt"
	"math/big"
	"time"

	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/ethereum/go-ethereum/crypto"
	"github.com/onrik/ethrpc"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/apis/etherscan"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/db"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/settings"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-ico/contracts"
)

/*
	Models
*/

var (
	PAYMENT_GATE_SETTINGS = settings.LoadPaymentGateSettings()
)

type TKSWallet struct {
	PublicKey  string `json:"address" gorm:"primary_key"`
	PrivateKey string `json:"private_key,omitempty" sql:"type:varchar(1024)"`

	Type string `json:"type"`

	CreatedAt *time.Time `json:"created_at" gorm:"index"`
	UpdatedAt *time.Time `json:"updated_at" gorm:"index"`
	DeletedAt *time.Time `json:"deleted_at" gorm:"index"`
}

type TKSWallets []TKSWallet

type TKSWalletBalance struct {
	ID         int       `json:"id" gorm:"primary_key"`
	PublicKey  string    `json:"address" gorm:"index"`
	ETHBalance uint64    `json:"eth_balance`
	TKSBalance uint64    `json:"tks_balance`
	TKSWallet  TKSWallet `json:"-" gorm:"ForeignKey:PublicKey;AssociationForeignKey:PublicKey"`

	CreatedAt *time.Time `json:"created_at" gorm:"index"`
	UpdatedAt *time.Time `json:"updated_at" gorm:"index"`
	DeletedAt *time.Time `json:"deleted_at" gorm:"index"`
}

type DisplayTKSWallet struct {
	PublicKey  string  `json:"address"`
	ETHBalance float64 `json:"eth_balance"`
	TKSBalance float64 `json:"tks_balance"`
	Type       string  `json:"type"`

	UpdatedAt *time.Time `json:"updated_at,omitempty"`
	CreatedAt *time.Time `json:"created_at,omitempty"`
}

type TKSPayment struct {
	Address string  `json:"address"`
	Percent float64 `json:"percent"`
	Amount  float64 `json:"amount"`
}

type TKSPaymentResult struct {
	Hash       string `json:"hash"`
	RawTx      string `json:"rawTransaction"`
	WalletFrom string `json:"wallet_from"`
	WalletTo   string `json:"wallet_to"`
	Cost       int64  `json:"cost"`
	Amount     int64  `json:"amount"`
}

/*
	Globals
*/

var (
	ethereumAPI = ethrpc.NewEthRPC(PAYMENT_GATE_SETTINGS.EthereumAPIURL)
)

/*
	Model Methods
*/

func (w TKSWallet) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w TKSWalletBalance) Save() error {
	return db.Database.Create(&w).Error
}

func (w TKSWallet) SaveToDatabase() error {
	if existing, _ := FindTKSWalletByPublicKey(w.PublicKey); existing == nil {
		return db.Database.Create(&w).Error
	}
	return db.Database.Save(&w).Error
}

func (w TKSWallet) Validate() error {
	if w.PublicKey == "" {
		return errors.New("Public key is not valid")
	}

	if w.PrivateKey == "" {
		return errors.New("Private key is not present")
	}

	return nil
}

func (w TKSWallet) UpdateBalance() (*TKSWalletBalance, error) {

	println("Updating wallet balance for", w.PublicKey)

	ethBalance, err := ethereumAPI.EthGetBalance(w.PublicKey, "latest")
	if err != nil {
		return nil, err
	}

	tksBalance, err := tochkaShare.BalanceOf(w.PublicKey)
	if err != nil {
		return nil, err
	}

	now := time.Now()
	newBalance := TKSWalletBalance{
		PublicKey: w.PublicKey,
		Balance:   ethBalance.Uint64(),
		TKSWallet: w,
		CreatedAt: &now,
	}

	currentBalance, _ := w.CurrentBalance()
	if currentBalance == nil || (currentBalance != nil && currentBalance.Balance != newBalance.Balance) {
		err = newBalance.Save()
		if err != nil {
			return nil, err
		}
	}

	return &newBalance, nil
}

func (w TKSWallet) CurrentBalance() (*TKSWalletBalance, error) {
	var wb TKSWalletBalance

	err := db.Database.
		Where(&TKSWalletBalance{PublicKey: w.PublicKey}).
		Order("ID desc").
		First(&wb).
		Error

	if err != nil {
		return nil, err
	}

	return &wb, err
}

func (w TKSWalletBalance) DisplayTKSWallet() DisplayTKSWallet {
	dw := DisplayTKSWallet{
		PublicKey: w.PublicKey,
		Balance:   float64(w.Balance) / float64(1e18),
		Type:      w.TKSWallet.Type,
		UpdatedAt: w.CreatedAt,
		CreatedAt: w.TKSWallet.CreatedAt,
	}
	return dw
}

/*
	Financial methods
*/

func (w TKSWallet) Send(to string, value int64) (TKSPaymentResult, error) {

	var (
		buff          bytes.Buffer
		chainId       = big.NewInt(1)
		recipientAddr = common.HexToAddress(to)
		gasLimit      = big.NewInt(21000)
		amount        = big.NewInt(value)
		etx           = TKSPaymentResult{
			WalletFrom: w.PublicKey,
			WalletTo:   to,
			Amount:     value,
		}
	)

	senderPrivKey, err := crypto.HexToECDSA(w.PrivateKey[2:])
	if err != nil {
		return etx, err
	}

	tcount, err := ethereumAPI.EthGetTransactionCount(w.PublicKey, "latest")
	if err != nil {
		return etx, err
	}

	gasPrice, err := ethereumAPI.EthGasPrice()
	if err != nil {
		return etx, err
	}

	cost, err := ethereumAPI.EthEstimateGas(ethrpc.T{
		From:     w.PublicKey,
		To:       to,
		Value:    amount,
		GasPrice: &gasPrice,
		Nonce:    tcount,
	})
	if err != nil {
		return etx, err
	}

	var (
		nonce    = uint64(tcount)
		txAmount = big.NewInt(value - gasPrice.Int64()*int64(cost))
		tx       = types.NewTransaction(nonce, recipientAddr, txAmount, gasLimit, &gasPrice, nil)
		signer   = types.NewEIP155Signer(chainId)
	)

	signedTx, err := types.SignTx(tx, signer, senderPrivKey)
	if err != nil {
		return etx, err
	}
	signedTx.EncodeRLP(&buff)

	etx.RawTx = fmt.Sprintf("0x%x", buff.Bytes())
	hash, err := etherscan.PushEtherscanTransacation(etx.RawTx)
	if err != nil {
		return etx, err
	}
	etx.Hash = hash
	etx.Cost = gasPrice.Int64() * int64(cost)

	return etx, err
}

/*
	Queries
*/

func GetAllTKSWallets() ([]TKSWallet, error) {
	ethWallets := []TKSWallet{}

	err := db.Database.
		Find(&ethWallets).
		Error

	return ethWallets, err
}

func FindTKSWalletByPublicKey(publicKey string) (*TKSWallet, error) {
	var w TKSWallet

	err := db.Database.
		Where("public_key=?", publicKey).
		First(&w).
		Error

	if err != nil {
		return nil, err
	}

	return &w, err
}

func CreateTKSWallet(tp string) (TKSWallet, error) {
	key, _ := crypto.GenerateKey()
	var (
		address    = crypto.PubkeyToAddress(key.PublicKey)
		publicKey  = "0x" + hex.EncodeToString(address[:])
		privateKey = "0x" + hex.EncodeToString(crypto.FromECDSA(key))
	)

	now := time.Now()
	ethWallet := TKSWallet{
		PublicKey:  publicKey,
		PrivateKey: privateKey,
		Type:       tp,
		CreatedAt:  &now,
		UpdatedAt:  &now,
	}

	err := ethWallet.Save()
	return ethWallet, err
}

func FindTKSWalletsWithNonZeroBalance() ([]TKSWalletBalance, error) {
	ethereumWallets := []TKSWalletBalance{}

	err := db.Database.
		Table("v_ethereum_wallet_balances").
		Model(TKSWalletBalance{}).
		Preload("TKSWallet").
		Find(&ethereumWallets).
		Error

	return ethereumWallets, err
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

/*
	init
*/

func init() {
	tochkaShareAddress, err := tochkaICO.Token(nil)
	if err != nil {
		panic(err)
	}

	tochkaShare, err = contracts.NewTochkaShare(tochkaShareAddress, conn)
	if err != nil {
		panic(err)
	}
}
