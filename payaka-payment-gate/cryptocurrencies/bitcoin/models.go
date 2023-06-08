package bitcoin

import (
	"crypto/rand"
	"encoding/base64"
	"encoding/json"
	"errors"
	"fmt"

	"os/exec"
	"strconv"
	"strings"
	"time"

	"github.com/vsergeev/btckeygenie/btckey"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/apis/insight"
	_ "qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/apis/sochainbitcoin"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/db"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/settings"
)

var (
	BTC_FEE               = 330
	PAYMENT_GATE_SETTINGS = settings.LoadPaymentGateSettings()
)

/*
	Models
*/

type BitcoinWallet struct {
	PublicKey             string `json:"address" gorm:"primary_key"`
	PublicKeyUncompressed string `json:"address_uncompressed" sql:"unique_index"`

	PrivateKey string `json:"private_key,omitempty" sql:"type:varchar(1024)"`
	WIF        string `json:"-" sql:"type:varchar(1024)" gorm:"column:w_i_f"`
	WIFC       string `json:"-" sql:"type:varchar(1024)" gorm:"column:w_i_f_c"`

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

type BitcoinWallets []BitcoinWallet

type BitcoinWalletBalance struct {
	ID                             int     `json:"id" gorm:"primary_key"`
	PublicKey                      string  `json:"address" gorm:"index"`
	Balance                        float64 `json:"balance"`
	BalanceTxApperances            int     `json:"txApperances"`
	UnconfirmedBalance             float64 `json:"unconfirmedBalance"`
	UnconfirmedBalanceTxApperances int     `json:"unconfirmedTxApperances"`

	CreatedAt *time.Time `json:"created_at" gorm:"index"`
	UpdatedAt *time.Time `json:"updated_at" gorm:"index"`
	DeletedAt *time.Time `json:"deleted_at" gorm:"index"`

	BitcoinWallet BitcoinWallet `json:"-" gorm:"ForeignKey:PublicKey;AssociationForeignKey:PublicKey"`
}

type DisplayBitcoinWallet struct {
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

type BTCPayment struct {
	Address string  `json:"address"`
	Percent float64 `json:"percent"`
	Amount  float64 `json:"amount"`
}

type BTCPaymentResult struct {
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

func (w BitcoinWallet) SendWithPercentSplit(payments []BTCPayment) (BTCPaymentResult, error) {
	wallets := BitcoinWallets{w}

	rawTx, err := wallets.BuildTransactionWithPercentSplit(payments, false)
	if err != nil {
		return rawTx, err
	}

	return rawTx, PushBitcoinTransaction(rawTx.RawTransaction)
}

func (wts BitcoinWallets) SendWithPercentSplit(payments []BTCPayment) (BTCPaymentResult, error) {
	rawTx, err := wts.BuildTransactionWithPercentSplit(payments, false)
	if err != nil {
		return rawTx, err
	}

	return rawTx, PushBitcoinTransaction(rawTx.RawTransaction)
}

func (wts BitcoinWallets) SendWithAmountSplit(payments []BTCPayment) (BTCPaymentResult, error) {
	rawTx, err := wts.BuildTransactionWithAmountSplit(payments, false)
	if err != nil {
		return BTCPaymentResult{}, err
	}
	return rawTx, PushBitcoinTransaction(rawTx.RawTransaction)
}

/*
	Transaction Building
*/

func (wts BitcoinWallets) BuildTransactionWithPercentSplit(
	payments []BTCPayment,
	txfeeOnly bool,
) (BTCPaymentResult, error) {

	var (
		totalPercent = 0.0
		outputs      = []insight.TxOutput{}
		totalBalance = float64(0.0)
	)

	for _, w := range wts {
		balance, err := w.UpdateBalance()
		if err != nil {
			return BTCPaymentResult{}, err
		}
		totalBalance += balance.Balance
	}

	for _, payment := range payments {
		totalPercent += payment.Percent
		payout := int(payment.Percent * totalBalance * 1e8)

		if payout > 1000 {
			output := insight.TxOutput{
				PublicKey: payment.Address,
				Satoshis:  payout,
			}
			outputs = append(outputs, output)
		}
	}

	if totalPercent <= 1.0 {
		payout := int((1.0 - totalPercent) * totalBalance * 1e8)
		if payout > 1000 {
			output := insight.TxOutput{
				PublicKey: PAYMENT_GATE_SETTINGS.BTCCommissionWallet,
				Satoshis:  payout,
			}
			outputs = append(outputs, output)
		}
	} else {
		return BTCPaymentResult{}, errors.New("Sum of commissions >= 100")
	}

	utxos := []insight.UtxoSet{}
	for _, w := range wts {
		utxo, err := GetUnspentBitcoinTransactions(w)
		if err != nil {
			return BTCPaymentResult{}, err
		}

		utxoSet := insight.UtxoSet{
			PrivateKey: w.WIFC,
			Utxo:       utxo,
		}
		utxos = append(utxos, utxoSet)
	}

	return BuildRawBitcoinTransaction(outputs, utxos, BTC_FEE, 0, txfeeOnly)
}

func (wts BitcoinWallets) BuildTransactionWithAmountSplit(payments []BTCPayment, feeOnly bool) (BTCPaymentResult, error) {

	var (
		totalAmount  = 0
		outputs      = []insight.TxOutput{}
		totalBalance = 0
	)

	if len(wts) == 0 {
		return BTCPaymentResult{}, errors.New("BitcoinWallet set is empty")
	}

	for _, w := range wts {
		balance, err := w.UpdateBalance()
		if err != nil {
			return BTCPaymentResult{}, err
		}
		totalBalance += int(balance.Balance*1e8) + int(balance.UnconfirmedBalance*1e8)
	}

	if len(payments) == 0 {
		return BTCPaymentResult{}, errors.New("Payments set is empty")
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
		return BTCPaymentResult{}, errors.New("Sum of payouts > total amount")
	}

	utxos := []insight.UtxoSet{}
	for _, w := range wts {
		utxo, err := GetUnspentBitcoinTransactions(w)
		if err != nil {
			return BTCPaymentResult{}, err
		}
		utxoSet := insight.UtxoSet{
			PrivateKey: w.WIFC,
			Utxo:       utxo,
		}
		utxos = append(utxos, utxoSet)
	}

	return BuildRawBitcoinTransaction(outputs, utxos, BTC_FEE, 0, feeOnly)
}

func (w BitcoinWallet) BuildTransactionFromMultipleInputsAndSingleOutput(txs []insight.Tx, outputAddress string, feeOnly bool) (BTCPaymentResult, error) {

	var (
		totalAmount = float64(0)
		outputs     = []insight.TxOutput{}
	)

	// Calcualte output balance
	for _, tx := range txs {
		totalAmount += tx.Amount
	}

	// Construct output
	output := insight.TxOutput{
		PublicKey: outputAddress,
		Satoshis:  int(totalAmount / 0.00000001),
	}
	outputs = append(outputs, output)

	// Construct list out putut transactions
	utxos := []insight.UtxoSet{
		insight.UtxoSet{
			PrivateKey: w.WIFC,
			Utxo:       txs,
		},
	}

	return BuildRawBitcoinTransaction(outputs, utxos, BTC_FEE, 0, feeOnly)
}

/*
	Balance Methods
*/

func (w BitcoinWallet) UpdateBalance() (*BitcoinWalletBalance, error) {

	wb, err := GetBitcoinWalletBalance(w)
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

func (w BitcoinWallet) CurrentBalance() (*BitcoinWalletBalance, error) {
	var wb BitcoinWalletBalance

	err := db.Database.
		Where(&BitcoinWalletBalance{PublicKey: w.PublicKey}).
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

func (w BitcoinWallet) Validate() error {
	if w.PublicKey == "" {
		return errors.New("Public key is not valid")
	}

	if w.Type == "multisig" && (w.BuyerPublicKey == "" ||
		w.SellerPublicKey == "" ||
		w.MultisigPublicKey == "" ||
		w.MultisigAddress == "") {
		return errors.New("Invalid multisig Bitcoinwallet")
	}

	return nil
}

func (w BitcoinWallet) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w BitcoinWallet) SaveToDatabase() error {
	if existing, _ := FindBitcoinWalletByPublicKey(w.PublicKey); existing == nil {
		return db.Database.Create(&w).Error
	}
	return db.Database.Save(&w).Error
}

func (w BitcoinWallet) Remove() error {
	return db.Database.Delete(w).Error
}

func (w BitcoinWalletBalance) Save() error {
	return db.Database.Create(&w).Error
}

func (w BitcoinWalletBalance) Remove() error {
	return db.Database.Delete(w).Error
}

func (w BitcoinWalletBalance) DisplayBitcoinWallet() DisplayBitcoinWallet {

	ds := DisplayBitcoinWallet{
		PublicKey:             w.PublicKey,
		UpdatedAt:             w.UpdatedAt,
		CreatedAt:             w.BitcoinWallet.CreatedAt,
		NumberOfConfirmations: w.BalanceTxApperances,
		IsConfirmed:           true,
		Balance:               w.Balance,
		UnconfirmedBalance:    w.UnconfirmedBalance,
		Type:                  w.BitcoinWallet.Type,
	}

	return ds
}

/*
	Queries
*/

func FindBitcoinWalletByPublicKey(publicKey string) (*BitcoinWallet, error) {
	var w BitcoinWallet

	err := db.Database.
		Where(
			"public_key=? OR public_key_uncompressed=? OR multisig_address=?",
			publicKey,
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

func FindBitcoinWalletsWithNonZeroBalance() ([]BitcoinWalletBalance, error) {
	bitcoinWalletBalances := []BitcoinWalletBalance{}

	err := db.Database.
		Table("v_bitcoin_wallet_balances").
		Model(BitcoinWalletBalance{}).
		Preload("BitcoinWallet").
		Where("unconfirmed_balance = ? and balance > ?", 0, 0).
		Find(&bitcoinWalletBalances).
		Error

	return bitcoinWalletBalances, err
}

func FindBitcoinWalletsWithNonZeroBalanceByType(tp string) ([]BitcoinWalletBalance, error) {
	bitcoinWalletBalances := []BitcoinWalletBalance{}

	err := db.Database.
		Table("v_bitcoin_wallet_balances").
		Model(BitcoinWalletBalance{}).
		Where("type=?", tp).
		Where("unconfirmed_balance = ? and balance > ?", 0, 0).
		Preload("BitcoinWallet").
		Find(&bitcoinWalletBalances).
		Error

	return bitcoinWalletBalances, err
}

func FindAllBitcoinWallets() ([]BitcoinWallet, error) {
	bitcoinWallets := []BitcoinWallet{}

	err := db.Database.
		Order("created_at desc").
		Find(&bitcoinWallets).
		Error

	return bitcoinWallets, err
}

func FindPremiumBitcoinWallets() ([]BitcoinWallet, error) {
	bitcoinWallets := []BitcoinWallet{}

	err := db.Database.
		Where("type=?", "premium").
		Order("created_at desc").
		Find(&bitcoinWallets).
		Error

	return bitcoinWallets, err
}

func FindAllBitcoinWalletBalances() ([]BitcoinWalletBalance, error) {
	bitcoinWalletBalances := []BitcoinWalletBalance{}

	err := db.Database.
		Find(&bitcoinWalletBalances).
		Error

	return bitcoinWalletBalances, err
}

/*
	Factory Methods
*/

func ImportBitcoinWallet(tp, wif string) (BitcoinWallet, error) {
	privateKey := btckey.PrivateKey{}
	err := privateKey.FromWIF(wif)
	if err != nil {
		return BitcoinWallet{}, err
	}

	now := time.Now()
	btcWallet := BitcoinWallet{
		PublicKey:             privateKey.ToAddress(),
		PublicKeyUncompressed: privateKey.ToAddressUncompressed(),
		WIFC:                  privateKey.ToWIFC(),
		WIF:                   privateKey.ToWIF(),
		Type:                  tp,
		CreatedAt:             &now,
		UpdatedAt:             &now,
	}

	err = btcWallet.Save()
	return btcWallet, err
}

func CreateBitcoinWallet(tp string) (BitcoinWallet, error) {
	privateKey, err := btckey.GenerateKey(rand.Reader)
	if err != nil {
		return BitcoinWallet{}, err
	}

	now := time.Now()
	Bitcoinwallet := BitcoinWallet{
		PublicKey:             privateKey.ToAddress(),
		PublicKeyUncompressed: privateKey.ToAddressUncompressed(),
		WIFC:                  privateKey.ToWIFC(),
		WIF:                   privateKey.ToWIF(),
		Type:                  tp,
		CreatedAt:             &now,
		UpdatedAt:             &now,
	}

	err = Bitcoinwallet.Save()
	return Bitcoinwallet, err
}

func CreateMultisigBitcoinWallet(buyerPublicKey, sellerPublicKey string) (BitcoinWallet, error) {
	privateKey, err := btckey.GenerateKey(rand.Reader)
	if err != nil {
		return BitcoinWallet{}, err
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
		return BitcoinWallet{}, err
	}

	multisigAddress := strings.Trim(string(string(multisigAddressByte[:])), "\n ")

	Bitcoinwallet := BitcoinWallet{
		PublicKey:             privateKey.ToAddress(),
		PublicKeyUncompressed: privateKey.ToAddressUncompressed(),
		WIFC:                  privateKey.ToWIFC(),
		WIF:                   privateKey.ToWIF(),
		Type:                  "multisig",
		BuyerPublicKey:        buyerPublicKey,
		SellerPublicKey:       sellerPublicKey,
		MultisigPublicKey:     publicKey,
		MultisigAddress:       multisigAddress,
	}

	err = Bitcoinwallet.Save()
	return Bitcoinwallet, err
}

/*
	External APIs
*/

func GetBitcoinWalletBalance(w BitcoinWallet) (*BitcoinWalletBalance, error) {

	wb, err := insight.GetRandomBitcoinInsightAPI().GetInsightAddressResponse(w.PublicKey)
	if err != nil {
		return nil, err
	}

	return &BitcoinWalletBalance{
		PublicKey:                      wb.PublicKey,
		Balance:                        wb.Balance,
		BalanceTxApperances:            wb.BalanceTxApperances,
		UnconfirmedBalance:             wb.UnconfirmedBalance,
		UnconfirmedBalanceTxApperances: wb.UnconfirmedBalanceTxApperances,
	}, nil
}

func PushBitcoinTransaction(rawtx string) error {
	return insight.GetAnonymizedInsightAPI().PushInsightTransacation(rawtx)
}

func GetUnspentBitcoinTransactions(w BitcoinWallet) ([]insight.Tx, error) {
	return insight.GetRandomBitcoinInsightAPI().GetInsightUnspentTxResponse(w.PublicKey)
}

func GetRecommenedFee() (int, error) {
	return insight.GetRandomBitcoinInsightAPI().EstimateFee()
}

/*
	RPC Calls
*/

func BuildRawBitcoinTransaction(
	outputs []insight.TxOutput,
	utxoSet []insight.UtxoSet,
	feePerByte int,
	feeOutput int,
	feeOnly bool,
) (BTCPaymentResult, error) {

	var (
		outsJson, _ = json.Marshal(outputs)
		utxoJson, _ = json.Marshal(utxoSet)
		outs64      = base64.StdEncoding.EncodeToString(outsJson)
		utxo64      = base64.StdEncoding.EncodeToString(utxoJson)
		result      = BTCPaymentResult{}
	)

	// println(
	// 	"node",
	// 	"nodejs/build_transaction_bitcoinjs.js",
	// 	"--utxos", utxo64,
	// 	"--outs", outs64,
	// 	"--feePerByte", strconv.Itoa(feePerByte),
	// 	"--feeOutput", strconv.Itoa(feeOutput),
	// 	"--feeOnly", strconv.FormatBool(feeOnly),
	// )

	txResult, err := exec.Command(
		"node",
		"nodejs/build_transaction_bitcoinjs.js",
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

func UpdateBTCTransactionFee() {
	feesResponse, err := GetRecommenedFee()
	if err != nil {
		return
	}
	BTC_FEE = feesResponse
}

/*
	Database Views
*/

func SetupViews() {
	db.Database.Exec("DROP VIEW IF EXISTS v_bitcoin_wallet_balances")
	db.Database.Exec(`
		CREATE VIEW v_bitcoin_wallet_balances AS
			WITH balances AS (
				SELECT * 
				FROM (
					SELECT DISTINCT ON (public_key) *
					FROM bitcoin_wallet_balances
					ORDER BY public_key, updated_at DESC, ID
				)  bcs
			)

			SELECT 
				balances.id, 
				balances.public_key, 
				balances.balance, 
				balances.balance_tx_apperances, 
				balances.unconfirmed_balance, 
				balances.unconfirmed_balance_tx_apperances, 
				bitcoin_wallets.type, 
				bitcoin_wallets.created_at, 
				balances.updated_at, 
				balances.deleted_at FROM balances
			JOIN bitcoin_wallets on bitcoin_wallets.public_key=balances.public_key
			ORDER BY type, balance DESC
	`)
}
