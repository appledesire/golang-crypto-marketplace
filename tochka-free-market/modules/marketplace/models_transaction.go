package marketplace

import (
	"errors"
	"fmt"
	"sort"
	"time"

	"github.com/jinzhu/gorm"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
)

var (
	completedDuration, _ = time.ParseDuration(MARKETPLACE_SETTINGS.CompletedDuration)
	pendingDuration, _   = time.ParseDuration(MARKETPLACE_SETTINGS.PendingDuration)
)

/*
	Models
*/

type Transaction struct {
	Uuid        string `json:"uuid" gorm:"primary_key"`
	Type        string `json:"type" sql:"index"`
	Description string `json:"description"`

	PackageUuid string `json:"-" sql:"index"`
	StoreUuid   string `json:"-" sql:"index"`
	BuyerUuid   string `json:"-" sql:"index"`
	DisputeUuid string `json:"dispute_uuid" sql:"index"`

	Status         []TransactionStatus `json:"transaction_status"`
	ShippingStatus []ShippingStatus    `json:"shipping_status"`
	Package        Package             `json:"-"`
	Buyer          User                `json:"-"  gorm:"foreignkey:buyer_uuid"`
	Store          Store               `json:"-"`
	Dispute        Dispute             `json:"-"`

	BitcoinTransaction     *BitcoinTransaction     `json:"bitcoin_transcation,omitempty" gorm:"foreignkey:uuid"`
	EthereumTransaction    *EthereumTransaction    `json:"ethereum_transcation,omitempty" gorm:"foreignkey:uuid"`
	BitcoinCashTransaction *BitcoinCashTransaction `json:"bitcoin_cash_transcation,omitempty" gorm:"foreignkey:uuid"`
}

type TransactionStatus struct {
	gorm.Model
	Time               time.Time `json:"time" sql:"index"`
	Amount             float64   `json:"amount"`
	Status             string    `json:"status" sql:"index"`
	Comment            string    `json:"comment"`
	UserUuid           string    `json:"-" sql:"index"`
	TransactionUuid    string    `json:"-" sql:"index"`
	PaymentReceiptUuid string    `json:"-" sql:"index" sql:"index"`

	PaymentReceipt *PaymentReceipt `json:"payment_receipt,omitempty"`
}

type ViewTransactionStatus struct {
	Time    string  `json:"time"`
	Amount  float64 `json:"amount"`
	Status  string  `json:"status"`
	Comment string  `json:"comment"`

	BTCPaymentResult *apis.BTCPaymentResult `json:"btc_payment_result,omitempty"`
	BCHPaymentResult *apis.BCHPaymentResult `json:"bch_payment_result,omitempty"`
	ETHPaymentResult *apis.ETHPaymentResult `json:"eth_payment_result,omitempty"`
}

type ShippingStatus struct {
	gorm.Model
	Time            time.Time `json:"time" sql:"index"`
	Status          string    `json:"status"`
	Comment         string    `json:"comment"`
	UserUuid        string    `json:"user_uuid" sql:"index"`
	TransactionUuid string    `json:"transaction_uuid" sql:"index"`
}

type ViewShippingStatus struct {
	Time    string `json:"time"`
	Status  string `json:"status"`
	Comment string `json:"comment"`
}

func (t Transaction) String() string {
	return t.Uuid
}

type Transactions []Transaction

/*
	Model Methods
*/

func (t Transaction) CommissionPercent() float64 {
	if t.Store.IsGoldAccount {
		return MARKETPLACE_SETTINGS.GoldAccountCommission
	}
	if t.Store.IsSilverAccount {
		return MARKETPLACE_SETTINGS.SilverAccountCommission
	}
	if t.Store.IsBronzeAccount {
		return MARKETPLACE_SETTINGS.BronzeAccountCommission
	}
	return MARKETPLACE_SETTINGS.FreeAccountCommission
}

func (t Transaction) NumberOfMessages() int {
	tr, err := GetTransactionThread(t, "")
	if err != nil {
		return 0
	} else {
		return len(tr.Messages("ASC"))
	}
}

func (t Transaction) StatusSortedByTime() []TransactionStatus {
	status := t.Status
	sort.Slice(status, func(i, j int) bool {
		return status[i].CreatedAt.Before(status[j].CreatedAt)
	})
	return status
}

func (t Transaction) CurrentShippingStatus() string {
	if len(t.ShippingStatus) == 0 {
		return "DISPATCH PENDING"
	}
	return t.ShippingStatus[len(t.ShippingStatus)-1].Status
}

func (t Transaction) CurrentAmountPaid() float64 {
	status := t.StatusSortedByTime()
	if len(status) == 0 {
		return float64(0.0)
	}
	return status[len(status)-1].Amount
}

func (t Transaction) TransactionAmount() float64 {
	switch t.Type {
	case "bitcoin":
		return t.BitcoinTransaction.Amount
	case "bitcoin_cash":
		return t.BitcoinCashTransaction.Amount
	case "ethereum":
		return t.EthereumTransaction.Amount
	default:
		return float64(0.0)
	}
}

func (t Transaction) TransactionCurrency() string {
	switch t.Type {
	case "bitcoin":
		return "BTC"
	case "bitcoin_cash":
		return "BCH"
	case "ethereum":
		return "ETH"
	default:
		return ""
	}
}

/*
	Update Tx Statuses
*/

func (t *Transaction) SetShippingStatus(statusString string, comment, userUuid string) {
	status := ShippingStatus{
		Time:     time.Now(),
		Status:   statusString,
		Comment:  comment,
		UserUuid: userUuid,
	}
	t.ShippingStatus = append(t.ShippingStatus, status)
	t.Save()
}

func (t *Transaction) SetTransactionStatus(
	statusString string,
	newAmount float64,
	comment,
	userUuid string,
	receipt *PaymentReceipt,
) error {
	status := TransactionStatus{
		Time:     time.Now(),
		Amount:   newAmount,
		Status:   statusString,
		Comment:  comment,
		UserUuid: userUuid,
	}
	if receipt != nil {
		status.PaymentReceiptUuid = receipt.Uuid
	}
	t.Status = append(t.Status, status)

	EventTransactionUpdate(*t)
	return t.Save()
}

func (t Transaction) UpdateTransactionStatus() error {

	switch t.Type {
	case "bitcoin":
		return t.BitcoinTransaction.UpdateTransactionStatus(t)
	case "bitcoin_cash":
		return t.BitcoinCashTransaction.UpdateTransactionStatus(t)
	case "ethereum":
		return t.EthereumTransaction.UpdateTransactionStatus(t)
	}

	return nil
}

func (t Transaction) Release(comment, userUuid string) error {

	switch t.Type {
	case "bitcoin":
		return t.BitcoinTransaction.Release(t, comment, userUuid)
	case "bitcoin_cash":
		return t.BitcoinCashTransaction.Release(t, comment, userUuid)
	case "ethereum":
		return t.EthereumTransaction.Release(t, comment, userUuid)
	}

	return nil

}

func (t Transaction) Cancel(comment, userUuid string) error {

	switch t.Type {
	case "bitcoin":
		return t.BitcoinTransaction.Cancel(t, comment, userUuid)
	case "bitcoin_cash":
		return t.BitcoinCashTransaction.Cancel(t, comment, userUuid)
	case "ethereum":
		return t.EthereumTransaction.Cancel(t, comment, userUuid)
	}

	return nil
}

// For now it assumes that users hold only 1 wallets of each CC
func (t Transaction) FundFromUserWallets(user User) (PaymentReceipt, error) {
	var (
		err     error
		amount  float64
		fee     float64
		receipt PaymentReceipt
	)
	switch t.Type {
	case "bitcoin":
		bitcoinWallet := user.FindRecentBitcoinWallet()
		balance, _ := bitcoinWallet.UpdateBalance(true)
		wallets := UserBitcoinWallets{bitcoinWallet}
		fee, _, err = wallets.EstimateFee(t.Uuid, amount)
		if err != nil {
			break
		}
		amount := t.BitcoinTransaction.Amount
		if balance.Balance >= amount+fee {
			receipt, err = wallets.Send(t.Uuid, amount+fee)
			if err != nil {
				break
			}
		} else {
			err = errors.New("Not enough coins in wallet")
		}
	case "bitcoin_cash":
		bitcoinWallet := user.FindRecentBitcoinCashWallet()
		balance, _ := bitcoinWallet.UpdateBalance(true)
		wallets := UserBitcoinCashWallets{bitcoinWallet}
		fee, _, err = wallets.EstimateFee(t.Uuid, amount)
		if err != nil {
			break
		}
		amount := t.BitcoinCashTransaction.Amount
		if balance.Balance >= amount+fee {
			receipt, err = wallets.Send(t.Uuid, amount+fee)
			if err != nil {
				break
			}
		} else {
			err = errors.New("Not enough coins in wallet")
		}
	case "ethereum":
		ethereumWallet := user.FindRecentEthereumWallet()
		balance, _ := ethereumWallet.UpdateBalance(true)
		amount := t.EthereumTransaction.Amount
		if balance.Balance >= amount {
			receipt, err = ethereumWallet.Send(t.Uuid, amount)
		} else {
			err = errors.New("Not enough coins in wallet")
		}
	}
	if err == nil {
		return receipt, t.SetTransactionStatus(
			"PENDING",
			amount,
			"Transaction paid from user wallet",
			user.Uuid,
			&receipt,
		)
	}
	return receipt, err
}

func (t Transaction) Complete(comment, userUuid string) error {
	t.SetTransactionStatus(
		"COMPLETED",
		t.CurrentAmountPaid(),
		comment,
		userUuid,
		nil,
	)
	return nil
}

func (t Transaction) MakePending(comment, userUuid string) error {
	t.SetTransactionStatus(
		"PENDING",
		t.CurrentAmountPaid(),
		comment,
		userUuid,
		nil,
	)
	return nil
}

func (t Transaction) Fail(comment, userUuid string) error {
	if t.CurrentAmountPaid() != float64(0.0) {
		t.Cancel("Transaction has been cancelled due to insufficient funding", t.Buyer.Uuid)
	}
	t.SetTransactionStatus(
		"FAILED",
		t.CurrentAmountPaid(),
		comment,
		userUuid,
		nil,
	)
	return nil
}

func (t Transaction) Freeze(comment, userUuid string) error {
	t.SetTransactionStatus(
		"FROZEN",
		t.CurrentAmountPaid(),
		comment,
		userUuid,
		nil,
	)
	return nil
}

/*
	Tx Statuses
*/

func (t Transaction) StatusTime(statusString string) *time.Time {
	for _, status := range t.Status {
		if status.Status == statusString {
			return &status.Time
		}
	}
	return nil
}

func (t Transaction) CurrentPaymentStatus() string {
	status := t.StatusSortedByTime()
	if len(status) == 0 {
		return "NEW"
	}
	return status[len(status)-1].Status
}

func (t Transaction) CreatedAt() time.Time {
	if len(t.Status) == 0 {
		return time.Now()
	} else {
		return t.Status[0].Time
	}
}
func (t Transaction) CompletedAt() *time.Time { return t.StatusTime("COMPLETED") }
func (t Transaction) ReleasedAt() *time.Time  { return t.StatusTime("RELEASED") }
func (t Transaction) FrozenAt() *time.Time    { return t.StatusTime("FROZEN") }
func (t Transaction) CancelledAt() *time.Time { return t.StatusTime("CANCELLED") }
func (t Transaction) IsCompleted() bool       { return t.CurrentPaymentStatus() == "COMPLETED" }
func (t Transaction) IsReleased() bool        { return t.CurrentPaymentStatus() == "RELEASED" }
func (t Transaction) IsFrozen() bool          { return t.CurrentPaymentStatus() == "FROZEN" }
func (t Transaction) IsFailed() bool          { return t.CurrentPaymentStatus() == "FAILED" }
func (t Transaction) IsCancelled() bool       { return t.CurrentPaymentStatus() == "CANCELLED" }
func (t Transaction) IsPending() bool         { return t.CurrentPaymentStatus() == "PENDING" }
func (t Transaction) IsShipped() bool         { return t.CurrentShippingStatus() == "SHIPPED" }
func (t Transaction) IsDispatched() bool      { return t.CurrentShippingStatus() == "DISPATCHED" }

/*
	Database methods
*/

func (t Transaction) Remove() error {
	return database.Delete(t).Error
}

func (t Transaction) Save() error {
	if existing, _ := FindTransactionByUuid(t.Uuid); existing == nil {
		return database.Create(&t).Error
	}
	return database.Save(&t).Error
}

func (ts TransactionStatus) Save() error {
	return database.Create(&ts).Error
}

func (ss ShippingStatus) Save() error {
	return database.Create(&ss).Error
}

/*
	Queries
*/

func CreateTransactionForPackage(
	itemPackage Package,
	buyer User,
	tp string,
	quantity int,
	shippingOption *ShippingOption,
	shippingAddress string,
) (*Transaction, error) {

	var (
		status        = []TransactionStatus{{Time: time.Now(), Amount: 0, Status: "PENDING"}}
		item          = itemPackage.Item
		shippingPrice = 0.0
		transaction   = Transaction{
			PackageUuid: itemPackage.Uuid,
			Buyer:       buyer,
			BuyerUuid:   buyer.Uuid,
			Description: fmt.Sprintf("%s :: %s x %d", item.Name, itemPackage.Name, quantity),
			StoreUuid:   item.StoreUuid,
			Status:      status,
		}
	)

	// Adjust shipping price
	if shippingOption != nil {
		transaction.Description += " | Shipping " + shippingOption.Name
		shippingPrice = shippingOption.PriceUSD
	}

	if quantity < 0 {
		return nil, errors.New("Wrong Quantity")
	}

	switch tp {
	case "bitcoin", "bitcoin_multisig":
		btTx, err := CreateBitcoinTransaction(itemPackage, buyer, tp, quantity, shippingPrice/GetCurrencyRate("BTC", "USD"))
		if err != nil {
			return nil, err
		}
		transaction.Type = "bitcoin"
		transaction.Uuid = btTx.Uuid
		// transaction.BitcoinTransactionUuid = btTx.Uuid
		transaction.BitcoinTransaction = &btTx
	case "bitcoin_cash", "bitcoin_cash_multisig":
		btTx, err := CreateBitcoinCashTransaction(itemPackage, buyer, tp, quantity, shippingPrice/GetCurrencyRate("BCH", "USD"))
		if err != nil {
			return nil, err
		}
		transaction.Type = "bitcoin_cash"
		transaction.Uuid = btTx.Uuid
		// transaction.BitcoinCashTransactionUuid = btTx.Uuid
		transaction.BitcoinCashTransaction = &btTx
	case "ethereum":
		ethTx, err := CreateEthereumTransaction(itemPackage, buyer, tp, quantity, shippingPrice/GetCurrencyRate("ETH", "USD"))
		if err != nil {
			return nil, err
		}
		transaction.Type = "ethereum"
		transaction.Uuid = ethTx.Uuid
		// transaction.EthereumTransactionUuid = ethTx.Uuid
		transaction.EthereumTransaction = &ethTx
	}

	thread, _ := GetTransactionThread(transaction, "")
	if shippingAddress != "" {
		_, err := CreateMessage(shippingAddress, *thread, buyer)
		if err != nil {
			return nil, err
		}
	}

	if itemPackage.Type == "drop" {
		_, err := CreateReservation(itemPackage, transaction)
		if err != nil {
			return nil, err
		}
	}

	EventTransactionUpdate(transaction)
	return &transaction, transaction.Save()
}

func getTransactionQuery() *gorm.DB {
	return database.
		Preload("Buyer").
		Preload("Status").
		Preload("Status.PaymentReceipt").
		Preload("Dispute").
		Preload("Package").
		Preload("Package.Item").
		Preload("ShippingStatus").
		Preload("BitcoinTransaction").
		Preload("BitcoinCashTransaction").
		Preload("EthereumTransaction").
		Preload("Store").
		Preload("Store.StoreUsers").
		Preload("Store.StoreUsers.User")
}

func FindTransactionByUuid(uuid string) (*Transaction, error) {
	var item Transaction
	err := getTransactionQuery().Where(&Transaction{Uuid: uuid}).First(&item).Error
	if err != nil {
		return nil, err
	}
	return &item, err
}

func FindTransactionByDisputeUuid(uuid string) (*Transaction, error) {
	var item Transaction
	err := getTransactionQuery().Where(&Transaction{DisputeUuid: uuid}).First(&item).Error
	if err != nil {
		return nil, err
	}
	return &item, err
}

func GetDisputedTransactionsPaged(page, pagesize int, resolverUuid, status string) []Transaction {
	var transactions []Transaction

	qry := database.
		Table("v_current_cummulative_transaction_statuses").
		Joins("JOIN disputes on disputes.uuid=v_current_cummulative_transaction_statuses.dispute_uuid")

	if resolverUuid != "" {
		qry = qry.Where(
			"disputes.resolver_user_uuid = ? OR disputes.resolver_user_uuid=?",
			resolverUuid,
			"",
		)
	}

	if status != "" {
		switch status {
		case "open":
			status = "OPEN"
		case "closed":
			status = "CLOSED"
		case "buyer":
			status = "RESOLVED TO BUYER"
		case "vendor":
			status = "RESOLVED TO VENDOR"
		}
		qry = qry.Where("disputes.status=?", status)
	}

	qry.
		Preload("Buyer").
		Preload("Status").
		Preload("Status.PaymentReceipt").
		Preload("Dispute").
		Preload("Package").
		Preload("Package.Item").
		Preload("ShippingStatus").
		Preload("BitcoinTransaction").
		Preload("BitcoinCashTransaction").
		Preload("EthereumTransaction").
		Preload("Store").
		Order("disputes.created_at DESC").
		Offset(pagesize * page).
		Limit(page).
		Find(&transactions)

	return transactions
}

func FindDisputedTransactionsForUser(userUuid string) Transactions {
	var transactions Transactions
	database.
		Table("v_current_cummulative_transaction_statuses").
		Joins("JOIN disputes on disputes.uuid=v_current_cummulative_transaction_statuses.dispute_uuid").
		Where("(store_uuid=? OR buyer_uuid=?)", userUuid, userUuid).
		Preload("Buyer").
		Preload("Status").
		Preload("Status.PaymentReceipt").
		Preload("Dispute").
		Preload("Package").
		Preload("Package.Item").
		Preload("ShippingStatus").
		Preload("BitcoinTransaction").
		Preload("BitcoinCashTransaction").
		Preload("EthereumTransaction").
		Preload("Store").
		Order("disputes.created_at DESC").
		Find(&transactions)

	return transactions
}

func FindTransactionsForBuyer(userUuid string) []Transaction {
	var transactions []Transaction
	database.
		Table("v_current_cummulative_transaction_statuses").
		Where("buyer_uuid=?", userUuid).
		Preload("Buyer").
		Preload("Status").
		Preload("Status.PaymentReceipt").
		Preload("Dispute").
		Preload("Package").
		Preload("Package.Item").
		Preload("ShippingStatus").
		Preload("BitcoinTransaction").
		Preload("BitcoinCashTransaction").
		Preload("EthereumTransaction").
		Preload("Store").
		Find(&transactions)
	return transactions
}

func FindTransactionsForStore(userUuid string) []Transaction {
	var transactions []Transaction
	database.
		Table("v_current_cummulative_transaction_statuses").
		Where("store_uuid=?", userUuid).
		Preload("Buyer").
		Preload("Status").
		Preload("Status.PaymentReceipt").
		Preload("Dispute").
		Preload("Package").
		Preload("Package.Item").
		Preload("ShippingStatus").
		Preload("BitcoinTransaction").
		Preload("BitcoinCashTransaction").
		Preload("EthereumTransaction").
		Preload("Store").
		Find(&transactions)
	return transactions
}

func CountPayedTransactionsForBuyerAndSeller(buyerUuid, sellerUuid string) int {
	// TODO: check correctness
	var count int
	database.
		Table("v_current_cummulative_transaction_statuses").
		Where("(buyer_uuid=? and store_uuid=?)", buyerUuid, sellerUuid).
		Where("current_status NOT IN (?)", []string{"FAILED", "PENDING"}).
		Count(&count)
	return count
}

func CountTransactions(status string) int {
	var count int

	qry := database.Table("v_current_cummulative_transaction_statuses")
	if status != "" {
		qry = qry.Where("current_status=?", status)
	}

	qry.Count(&count)

	return count
}

func CountDisputedTransactions(resolverUuid, status string) int {
	var (
		count int
		qry   = database.
			Table("vm_current_cummulative_transaction_statuses").
			Joins("JOIN disputes on disputes.uuid=vm_current_cummulative_transaction_statuses.dispute_uuid")
	)
	if resolverUuid != "" {
		qry = qry.Where(
			"disputes.resolver_user_uuid = ? OR disputes.resolver_user_uuid=?",
			resolverUuid,
			"",
		)
	}
	if status != "" {
		switch status {
		case "open":
			status = "OPEN"
		case "closed":
			status = "CLOSED"
		case "buyer":
			status = "RESOLVED TO BUYER"
		case "vendor":
			status = "RESOLVED TO VENDOR"
		}
		qry = qry.Where("disputes.status=?", status)
	}

	qry.Count(&count)
	return count
}

/*
	Tx Stats
*/

type TxStats struct {
	TxNumber int
	TxVolume float64
}

/*
	Utility methods for finding transacations

	PENDING -> COMPLETED -> RELEASED
			|            |
			-> FAILED	 -> FROZEN
						 |
						 -> CANCELLED

1M4b4n1a1tQjrRyrHNK5WBjyJbyF5X5kUA

*/

func loadTransactionsByUuid(uuids []string) []Transaction {
	var transactions []Transaction
	database.
		Table("transactions").
		Where("uuid in (?)", uuids).
		Preload("Buyer").
		Preload("Status").
		Preload("Status.PaymentReceipt").
		Preload("Dispute").
		Preload("Package").
		Preload("Package.Item").
		Preload("ShippingStatus").
		Preload("BitcoinTransaction").
		Preload("BitcoinCashTransaction").
		Preload("EthereumTransaction").
		Preload("Store").
		Find(&transactions)

	sort.Slice(transactions, func(i, j int) bool {
		return transactions[i].CreatedAt().Before(transactions[j].CreatedAt())
	})

	return transactions
}

func findTransactionsWithCurrentStatus(status string) []Transaction {
	var uuids []string
	database.
		Table("v_current_cummulative_transaction_statuses").
		Where("current_status=?", status).
		Order("created_at ASC").
		Pluck("uuid", &uuids)
	return loadTransactionsByUuid(uuids)
}

func findTransactionsWithCurrentStatusAndTimestamp(status string, ts time.Time) []Transaction {
	var uuids []string
	database.
		Table("v_current_cummulative_transaction_statuses").
		Where("current_status=? and updated_at <= ?", status, ts).
		Order("created_at ASC").
		Pluck("uuid", &uuids)
	return loadTransactionsByUuid(uuids)
}

func findTransactionsWithCurrentStatusAndCreatedTimestamp(status string, ts time.Time) []Transaction {
	var uuids []string
	database.
		Table("v_current_cummulative_transaction_statuses").
		Where("current_status=? and created_at <= ?", status, ts).
		Order("created_at ASC").
		Pluck("uuid", &uuids)
	return loadTransactionsByUuid(uuids)
}

func findFailedPendingTransactionsCreatedGteTimestamp(ts time.Time) []Transaction {
	var uuids []string
	database.
		Table("v_current_cummulative_transaction_statuses").
		Where("type='bitcoin' and current_status IN ('FAILED', 'PENDING', 'COMPLETED') and created_at >= ?", ts).
		Order("created_at ASC").
		Pluck("uuid", &uuids)
	return loadTransactionsByUuid(uuids)
}

func findReleasedTransactionsCreatedGteTimestamp(ts time.Time) []Transaction {
	var uuids []string
	database.
		Table("v_current_cummulative_transaction_statuses").
		Where("current_status IN ('RELEASED') and created_at >= ?", ts).
		Order("created_at ASC").
		Pluck("uuid", &uuids)
	return loadTransactionsByUuid(uuids)
}

func FindReleasedAndCancelledTransactionsWithNonZeroAmount() []Transaction {
	var uuids []string
	database.
		Table("v_current_cummulative_transaction_statuses").
		Where("current_status IN ('RELEASED', 'CANCELLED') and current_amount <> 0").
		Order("created_at ASC").
		Pluck("uuid", &uuids)
	return loadTransactionsByUuid(uuids)
}

func FindRecentlyCancelledAndReleasedTransactions() []Transaction {
	var uuids []string
	var ts = time.Now().AddDate(0, 0, -30)
	database.
		Table("v_current_cummulative_transaction_statuses").
		Where("current_status IN ('CANCELLED', 'RELEASED') and created_at >= ?", ts).
		Order("created_at ASC").
		Pluck("uuid", &uuids)
	return loadTransactionsByUuid(uuids)
}

func FindPendingTransactions() []Transaction {
	return findTransactionsWithCurrentStatus("PENDING")
}

func FindCompletedTransactions() []Transaction {
	return findTransactionsWithCurrentStatus("COMPLETED")
}

func FindReleasedTransactions() []Transaction {
	return findTransactionsWithCurrentStatus("RELEASED")
}

func FindOldFailedTransactions() []Transaction {
	return findTransactionsWithCurrentStatusAndTimestamp("FAILED", time.Now().AddDate(0, 0, -1))
}

func FindOldReleasedTransactions() []Transaction {
	return findTransactionsWithCurrentStatusAndTimestamp("RELEASED", time.Now().AddDate(0, 0, -10))
}

func FindOldCompletedTransactions() []Transaction {
	return findTransactionsWithCurrentStatusAndCreatedTimestamp("COMPLETED", time.Now().AddDate(0, 0, -10))
}

func FindOldPendingTransactions() []Transaction {
	return findTransactionsWithCurrentStatusAndTimestamp("PENDING", time.Now().Add(-pendingDuration))
}

func FindStalledCompletedTransactions() []Transaction {
	return findTransactionsWithCurrentStatusAndTimestamp("COMPLETED", time.Now().AddDate(0, 0, -30))
}
