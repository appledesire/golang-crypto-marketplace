package bitcoincash

import (
	"crypto/rand"
	"encoding/base64"
	"encoding/json"
	"errors"
	"fmt"
	"math"
	"os/exec"
	"strconv"
	"strings"
	"time"

	"github.com/vsergeev/btckeygenie/btckey"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/apis/insight"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/db"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/settings"
)

var (
	BCH_FEE               = 330
	PAYMENT_GATE_SETTINGS = settings.LoadPaymentGateSettings()
)

/*
	Models
*/

type BitcoinCashWallet struct {
	PublicKey  string `json:"address" gorm:"primary_key"`
	PrivateKey string `json:"private_key,omitempty" sql:"type:varchar(1024)"`

	// Multisig
	BuyerPublicKey    string `json:"buyer_public_key"`
	SellerPublicKey   string `json:"seller_public_key"`
	MultisigPublicKey string `json:"multisig_public_key"`
	MultisigAddress   string `json:"multisig_address"`

	Type string `json:"type"`

	CreatedAt *time.Time `json:"created_at,omitempty" gorm:"index"`
	UpdatedAt *time.Time `json:"updated_at,omitempty" gorm:"index"`
	DeletedAt *time.Time `json:"deleted_at,omitempty" gorm:"index"`
}

type BitcoinCashWallets []BitcoinCashWallet

type BitcoinCashWalletBalance struct {
	ID                             int     `json:"id" gorm:"primary_key"`
	PublicKey                      string  `json:"address" gorm:"index"`
	Balance                        float64 `json:"balance"`
	BalanceTxApperances            int     `json:"txApperances"`
	UnconfirmedBalance             float64 `json:"unconfirmedBalance"`
	UnconfirmedBalanceTxApperances int     `json:"unconfirmedTxApperances"`

	CreatedAt *time.Time `json:"created_at" gorm:"index"`
	UpdatedAt *time.Time `json:"updated_at" gorm:"index"`
	DeletedAt *time.Time `json:"deleted_at" gorm:"index"`

	BitcoinCashWallet BitcoinCashWallet `json:"-" gorm:"ForeignKey:PublicKey;AssociationForeignKey:PublicKey"`
}

type DisplayBitcoinCashWallet struct {
	PublicKey             string     `json:"address"`
	Balance               float64    `json:"balance"`
	UnconfirmedBalance    float64    `json:"unconfirmed_balance"`
	IsConfirmed           bool       `json:"-"`
	NumberOfConfirmations int        `json:"-"`
	Type                  string     `json:"type"`
	CreatedAt             *time.Time `json:"created_at"`
	UpdatedAt             *time.Time `json:"updated_at"`
}

/*
	Response Models
*/

type BCHPayment struct {
	Address string  `json:"address"`
	Percent float64 `json:"percent"`
	Amount  float64 `json:"amount"`
}

type BCHPaymentResult struct {
	Fee            int                `json:"fee"`
	RawTransaction string             `json:"rawTransaction"`
	Outputs        []insight.TxOutput `json:"outputs"`
	Hash           string             `json:"hash"`
	Error          *string            `json:"error"`
	Description    string             `json:"description"`
}

/*
	Financial Methods
*/

func (w BitcoinCashWallet) SendWithPercentSplit(payments []BCHPayment) (BCHPaymentResult, error) {
	wallets := BitcoinCashWallets{w}

	rawTx, err := wallets.BuildTransactionWithPercentSplit(payments, false)
	if err != nil {
		return rawTx, err
	}

	return rawTx, PushBitcoinCashTransaction(rawTx.RawTransaction)
}

func (wts BitcoinCashWallets) SendWithPercentSplit(payments []BCHPayment) (BCHPaymentResult, error) {
	rawTx, err := wts.BuildTransactionWithPercentSplit(payments, false)
	if err != nil {
		return rawTx, err
	}

	return rawTx, PushBitcoinCashTransaction(rawTx.RawTransaction)
}

func (wts BitcoinCashWallets) SendWithAmountSplit(payments []BCHPayment) (BCHPaymentResult, error) {
	rawTx, err := wts.BuildTransactionWithAmountSplit(payments, false)
	if err != nil {
		return BCHPaymentResult{}, err
	}
	return rawTx, PushBitcoinCashTransaction(rawTx.RawTransaction)
}

/*
	Transaction Building
*/

func (wts BitcoinCashWallets) BuildTransactionWithPercentSplit(
	payments []BCHPayment,
	txfeeOnly bool,
) (BCHPaymentResult, error) {

	var (
		totalPercent = 0.0
		outputs      = []insight.TxOutput{}
		totalBalance = float64(0.0)
	)

	for _, w := range wts {
		balance, err := w.UpdateBalance()
		if err != nil {
			return BCHPaymentResult{}, err
		}
		totalBalance += balance.Balance
	}

	for _, payment := range payments {
		totalPercent += payment.Percent
		payout := int(payment.Percent * totalBalance * 1e8)

		if payout > 0 {
			output := insight.TxOutput{
				PublicKey: payment.Address,
				Satoshis:  payout,
			}
			outputs = append(outputs, output)
		}
	}

	if totalPercent <= 1.0 {
		payout := int((1.0 - totalPercent) * totalBalance * 1e8)
		if payout > 0 {
			output := insight.TxOutput{
				PublicKey: PAYMENT_GATE_SETTINGS.BCHCommissionWallet,
				Satoshis:  payout,
			}
			outputs = append(outputs, output)
		}
	} else {
		return BCHPaymentResult{}, errors.New("Sum of commissions >= 100")
	}

	utxos := []insight.UtxoSet{}
	for _, w := range wts {
		utxo, err := GetUnspentBitcoinCashTransactions(w)
		if err != nil {
			return BCHPaymentResult{}, err
		}

		utxoSet := insight.UtxoSet{
			PrivateKey: w.PrivateKey,
			Utxo:       utxo,
		}
		utxos = append(utxos, utxoSet)
	}

	return BuildRawBitcoinCashTransaction(outputs, utxos, BCH_FEE, 0, txfeeOnly)
}

func (wts BitcoinCashWallets) BuildTransactionWithAmountSplit(payments []BCHPayment, feeOnly bool) (BCHPaymentResult, error) {

	var (
		totalAmount  = 0
		outputs      = []insight.TxOutput{}
		totalBalance = 0
	)

	if len(wts) == 0 {
		return BCHPaymentResult{}, errors.New("BitcoinCashWallet set is empty")
	}

	for _, w := range wts {
		balance, err := w.UpdateBalance()
		if err != nil {
			return BCHPaymentResult{}, err
		}
		totalBalance += int(balance.Balance*1e8) + int(balance.UnconfirmedBalance*1e8)
	}

	if len(payments) == 0 {
		return BCHPaymentResult{}, errors.New("Payments set is empty")
	}

	for _, payment := range payments {
		payout := int(payment.Amount * 1e8)
		totalAmount += payout

		if payout > 0 {
			output := insight.TxOutput{
				PublicKey: payment.Address,
				Satoshis:  payout,
			}
			outputs = append(outputs, output)
		}
	}

	if totalAmount <= totalBalance {
		payout := totalBalance - totalAmount
		if payout > 0 {
			output := insight.TxOutput{
				PublicKey: wts[0].PublicKey,
				Satoshis:  payout,
			}
			outputs = append(outputs, output)
		}
	} else {
		return BCHPaymentResult{}, errors.New("Sum of payouts > total amount")
	}

	utxos := []insight.UtxoSet{}
	for _, w := range wts {
		utxo, err := GetUnspentBitcoinCashTransactions(w)
		if err != nil {
			return BCHPaymentResult{}, err
		}
		utxoSet := insight.UtxoSet{
			PrivateKey: w.PrivateKey,
			Utxo:       utxo,
		}
		utxos = append(utxos, utxoSet)
	}

	return BuildRawBitcoinCashTransaction(outputs, utxos, BCH_FEE, 0, feeOnly)
}

/*
	Balance Methods
*/

func (w BitcoinCashWallet) UpdateBalance() (*BitcoinCashWalletBalance, error) {

	wb, err := GetBitcoinCashWalletBalance(w)
	if err != nil {
		return nil, err
	}

	currentBalance, _ := w.CurrentBalance()

	// First-time balance update
	if currentBalance == nil {
		return wb, wb.Save()
	} else if (currentBalance.Balance != wb.Balance) || (currentBalance.UnconfirmedBalance != wb.UnconfirmedBalance) {
		return wb, wb.Save()
	}

	return currentBalance, nil
}

func (w BitcoinCashWallet) CurrentBalance() (*BitcoinCashWalletBalance, error) {
	var wb BitcoinCashWalletBalance

	err := db.Database.
		Where(&BitcoinCashWalletBalance{PublicKey: w.PublicKey}).
		Order("ID desc").
		First(&wb).
		Error

	if err != nil {
		return nil, err
	}

	return &wb, err
}

/*
	Database Methods
*/

func (w BitcoinCashWallet) Validate() error {
	if w.PublicKey == "" {
		return errors.New("Public key is not valid")
	}

	if w.Type == "multisig" && (w.BuyerPublicKey == "" ||
		w.SellerPublicKey == "" ||
		w.MultisigPublicKey == "" ||
		w.MultisigAddress == "") {
		return errors.New("Invalid multisig BitcoinCashwallet")
	}

	return nil
}

func (w BitcoinCashWallet) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w BitcoinCashWallet) SaveToDatabase() error {
	if existing, _ := FindBitcoinCashWalletByPublicKey(w.PublicKey); existing == nil {
		return db.Database.Create(&w).Error
	}
	return db.Database.Save(&w).Error
}

func (w BitcoinCashWallet) Remove() error {
	return db.Database.Delete(w).Error
}

func (w BitcoinCashWalletBalance) Save() error {
	return db.Database.Create(&w).Error
}

func (w BitcoinCashWalletBalance) Remove() error {
	return db.Database.Delete(w).Error
}

func (w BitcoinCashWalletBalance) DisplayBitcoinCashWallet() DisplayBitcoinCashWallet {

	ds := DisplayBitcoinCashWallet{
		PublicKey:             w.PublicKey,
		UpdatedAt:             w.UpdatedAt,
		CreatedAt:             w.BitcoinCashWallet.CreatedAt,
		NumberOfConfirmations: w.BalanceTxApperances,
		IsConfirmed:           true,
		Balance:               w.Balance,
		UnconfirmedBalance:    w.UnconfirmedBalance,
		Type:                  w.BitcoinCashWallet.Type,
	}

	return ds
}

/*
	Queries
*/

func FindBitcoinCashWalletByPublicKey(publicKey string) (*BitcoinCashWallet, error) {
	var w BitcoinCashWallet

	err := db.Database.
		Where(
			"public_key=? OR multisig_address=?",
			publicKey,
			publicKey,
		).
		First(&w).
		Error

	if err != nil {
		return nil, err
	}

	return &w, err
}

func FindBitcoinCashWalletsWithNonZeroBalance() ([]BitcoinCashWalletBalance, error) {
	bitcoinWalletBalances := []BitcoinCashWalletBalance{}

	err := db.Database.
		Table("v_bitcoin_cash_wallet_balances").
		Model(BitcoinCashWalletBalance{}).
		Preload("BitcoinCashWallet").
		Where("unconfirmed_balance = ?", 0).
		Find(&bitcoinWalletBalances).
		Error

	return bitcoinWalletBalances, err
}

func FindBitcoinCashWalletsWithNonZeroBalanceByType(tp string) ([]BitcoinCashWalletBalance, error) {
	bitcoinWalletBalances := []BitcoinCashWalletBalance{}

	err := db.Database.
		Table("v_bitcoin_cash_wallet_balances").
		Model(BitcoinCashWalletBalance{}).
		Where("type=?", tp).
		Where("unconfirmed_balance = ?", 0).
		Preload("BitcoinCashWallet").
		Find(&bitcoinWalletBalances).
		Error

	return bitcoinWalletBalances, err
}

func FindAllBitcoinCashWallets() ([]BitcoinCashWallet, error) {
	bitcoinWallets := []BitcoinCashWallet{}

	err := db.Database.
		Find(&bitcoinWallets).
		Error

	return bitcoinWallets, err
}

func FindAllBitcoinCashWalletBalances() ([]BitcoinCashWalletBalance, error) {
	bitcoinWalletBalances := []BitcoinCashWalletBalance{}

	err := db.Database.
		Find(&bitcoinWalletBalances).
		Error

	return bitcoinWalletBalances, err
}

/*
	Factory Methods
*/

func CreateBitcoinCashWallet(tp string) (BitcoinCashWallet, error) {
	privateKey, err := btckey.GenerateKey(rand.Reader)
	if err != nil {
		return BitcoinCashWallet{}, err
	}

	now := time.Now()
	BitcoinCashwallet := BitcoinCashWallet{
		PublicKey:  privateKey.ToAddress(),
		PrivateKey: privateKey.ToWIFC(),
		Type:       tp,
		CreatedAt:  &now,
		UpdatedAt:  &now,
	}

	err = BitcoinCashwallet.Save()
	return BitcoinCashwallet, err
}

func CreateMultisigBitcoinCashWallet(buyerPublicKey, sellerPublicKey string) (BitcoinCashWallet, error) {
	privateKey, err := btckey.GenerateKey(rand.Reader)
	if err != nil {
		return BitcoinCashWallet{}, err
	}

	publicKey := fmt.Sprintf("%x", privateKey.PublicKey.ToBytes()[:])
	multisigAddressByte, err := exec.Command(
		"node",
		"nodejs/build_multisig_address_bitcoinjs.js",
		"--pk1", publicKey,
		"--pk2", buyerPublicKey,
		"--pk3", sellerPublicKey,
	).Output()
	if err != nil {
		return BitcoinCashWallet{}, err
	}

	multisigAddress := strings.Trim(string(string(multisigAddressByte[:])), "\n ")

	BitcoinCashwallet := BitcoinCashWallet{
		PublicKey:         privateKey.ToAddress(),
		PrivateKey:        privateKey.ToWIFC(),
		Type:              "multisig",
		BuyerPublicKey:    buyerPublicKey,
		SellerPublicKey:   sellerPublicKey,
		MultisigPublicKey: publicKey,
		MultisigAddress:   multisigAddress,
	}

	err = BitcoinCashwallet.Save()
	return BitcoinCashwallet, err
}

/*
	External APIs
*/

func GetBitcoinCashWalletBalance(w BitcoinCashWallet) (*BitcoinCashWalletBalance, error) {
	wb, err := insight.GetBlockdozerBitcoinCashInsightAPI().GetInsightAddressResponse(w.PublicKey)
	if err != nil {
		return nil, err
	}
	return &BitcoinCashWalletBalance{
		PublicKey:                      wb.PublicKey,
		Balance:                        wb.Balance,
		BalanceTxApperances:            wb.BalanceTxApperances,
		UnconfirmedBalance:             wb.UnconfirmedBalance,
		UnconfirmedBalanceTxApperances: wb.UnconfirmedBalanceTxApperances,
		BitcoinCashWallet:              w,
	}, nil
}

func PushBitcoinCashTransaction(rawtx string) error {
	return insight.GetBlockdozerBitcoinCashInsightAPI().PushInsightTransacation(rawtx)
}

func GetUnspentBitcoinCashTransactions(w BitcoinCashWallet) ([]insight.Tx, error) {
	return insight.GetBlockdozerBitcoinCashInsightAPI().GetInsightUnspentTxResponse(w.PublicKey)
}

func GetRecomnededFee() (int, error) {
	return insight.GetBlockdozerBitcoinCashInsightAPI().EstimateFee()
}

/*
	RCP Calls
*/

func BuildRawBitcoinCashTransaction(
	outputs []insight.TxOutput,
	utxoSet []insight.UtxoSet,
	feePerByte int,
	feeOutput int,
	feeOnly bool,
) (BCHPaymentResult, error) {

	var (
		outsJson, _ = json.Marshal(outputs)
		utxoJson, _ = json.Marshal(utxoSet)
		outs64      = base64.StdEncoding.EncodeToString(outsJson)
		utxo64      = base64.StdEncoding.EncodeToString(utxoJson)
		result      = BCHPaymentResult{}
	)

	println(
		"node",
		"nodejs/build_transaction_bitcoinjs-cash.js",
		"--utxos", utxo64,
		"--outs", outs64,
		"--feePerByte", strconv.Itoa(feePerByte),
		"--feeOutput", strconv.Itoa(feeOutput),
		"--feeOnly", strconv.FormatBool(feeOnly),
	)

	txResult, err := exec.Command(
		"node",
		"nodejs/build_transaction_bitcoinjs-cash.js",
		"--utxos", utxo64,
		"--outs", outs64,
		"--feePerByte", strconv.Itoa(feePerByte),
		"--feeOutput", strconv.Itoa(feeOutput),
		"--feeOnly", strconv.FormatBool(feeOnly),
	).Output()
	if err != nil {
		return result, err
	}

	err = json.Unmarshal(txResult, &result)
	if err != nil {
		return result, err
	}

	if result.Error != nil {
		return result, errors.New(*result.Error)
	}

	return result, nil
}

/*
	Fees
*/

func UpdateBCHTransactionFee() {
	feesResponse, err := GetRecomnededFee()
	if err != nil {
		return
	}
	BCH_FEE = int(math.Max(float64(feesResponse), 5.0))
}

/*
	Database Views
*/

func SetupViews() {
	db.Database.Exec("DROP VIEW IF EXISTS v_bitcoin_cash_wallet_balances")
	db.Database.Exec(`
		CREATE VIEW v_bitcoin_cash_wallet_balances AS
			WITH balances AS (
				SELECT * 
				FROM (
					SELECT DISTINCT ON (public_key) *
					FROM bitcoin_cash_wallet_balances
					ORDER BY public_key, updated_at DESC, ID
				) bcs
			)

			SELECT 
				balances.id, 
				balances.public_key, 
				balances.balance, 
				balances.balance_tx_apperances, 
				balances.unconfirmed_balance, 
				balances.unconfirmed_balance_tx_apperances, 
				bitcoin_cash_wallets.type, 
				bitcoin_cash_wallets.created_at, 
				balances.updated_at, 
				balances.deleted_at FROM balances
			JOIN bitcoin_cash_wallets on bitcoin_cash_wallets.public_key=balances.public_key
			ORDER BY type, balance DESC
	`)
}
