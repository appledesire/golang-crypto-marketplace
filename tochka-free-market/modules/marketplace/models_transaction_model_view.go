package marketplace

import (
	"fmt"
	"time"

	"github.com/dustin/go-humanize"
)

type ViewTransaction struct {
	*Transaction
	RatingReview          RatingReview `json:"-"`
	Amount                string       `json:"amount,omitempty"`
	AmountToPay           string       `json:"amount_to_pay,omitempty"`
	CurrentAmountPaid     string       `json:"current_amount_paid,omitempty"`
	CompletedAt           string       `json:"completed_at_string,omitempty"`
	ConfirmedAt           string       `json:"confirmed_at_string,omitempty"`
	CreatedAt             string       `json:"created_at_string,omitempty"`
	CurrentPaymentStatus  string       `json:"current_payment_status,omitempty"`
	CurrentShippingStatus string       `json:"current_shipping_status,omitempty"`
	NextStatusTime        string       `json:"next_status_time_string,omitempty"`
	NextStatusPercent     float64      `json:"next_status_percent,omitempty"`

	FEAllowed     bool `json:"fe_allowed,omitempty"`
	CancelAllowed bool `json:"cancel_allowed,omitempty"`
	IsCompleted   bool `json:"is_completed,omitempty"`
	IsReleased    bool `json:"is_released,omitempty"`
	IsFrozen      bool `json:"is_frozen,omitempty"`
	IsCancelled   bool `json:"is_cancelled,omitempty"`
	IsPending     bool `json:"is_pending,omitempty"`
	IsFailed      bool `json:"is_failed,omitempty"`
	IsDispatched  bool `json:"is_dispatched,omitempty"`
	IsShipped     bool `json:"is_shipped,omitempty"`
	IsReviewed    bool `json:"is_reviewed,omitempty"`
	IsDisputed    bool `json:"is_disputed,omitempty"`

	NumberOfMessages int `json:"number_of_messages,omitempty"`

	ViewTransactionStatus []ViewTransactionStatus `json:"transaction_status_list,omitempty"`
	ViewShippingStatus    []ViewShippingStatus    `json:"shipping_status_list,omitempty"`
}

func (t Transaction) ViewTransaction() ViewTransaction {

	store := t.Store

	completedAt := t.CompletedAt()
	completedAtStr := ""
	if completedAt != nil {
		completedAtStr = completedAt.Format("02.01.2006 15:04")
	}

	vt := ViewTransaction{
		Transaction: &t,

		CompletedAt:           completedAtStr,
		CreatedAt:             t.CreatedAt().Format("02.01.2006 15:04"),
		CurrentAmountPaid:     humanize.Ftoa(t.CurrentAmountPaid()),
		CurrentPaymentStatus:  t.CurrentPaymentStatus(),
		CurrentShippingStatus: t.CurrentShippingStatus(),
		FEAllowed:             store.IsAllowedToSell && store.CalculateLevel() >= 10,
		CancelAllowed:         t.IsCompleted() && !t.IsDispatched() && !t.IsShipped() && t.Package.Type != "digital" && t.Package.Type != "drop",

		NumberOfMessages: t.NumberOfMessages(),

		IsCancelled:  t.IsCancelled(),
		IsCompleted:  t.IsCompleted(),
		IsDispatched: t.IsDispatched(),
		IsDisputed:   t.DisputeUuid != "",
		IsFailed:     t.IsFailed(),
		IsFrozen:     t.IsFrozen(),
		IsPending:    t.IsPending(),
		IsReleased:   t.IsReleased(),
		IsShipped:    t.IsShipped(),
		// Buyer:        t.Buyer,
	}

	switch t.Type {
	case "bitcoin":
		if t.BitcoinTransaction != nil {
			vt.Amount = humanize.Ftoa(t.BitcoinTransaction.Amount)
			vt.AmountToPay = humanize.Ftoa(t.BitcoinTransaction.Amount - t.CurrentAmountPaid())
		}
	case "bitcoin_cash":
		if t.BitcoinCashTransaction != nil {
			vt.Amount = humanize.Ftoa(t.BitcoinCashTransaction.Amount)
			vt.AmountToPay = humanize.Ftoa(t.BitcoinCashTransaction.Amount - t.CurrentAmountPaid())
		}
	case "ethereum":
		if t.EthereumTransaction != nil {
			vt.Amount = humanize.Ftoa(t.EthereumTransaction.Amount)
			vt.AmountToPay = humanize.Ftoa(t.EthereumTransaction.Amount - t.CurrentAmountPaid())
		}
	}

	review, _ := FindRatingReviewByTransactionUuid(t.Uuid)
	if review != nil {
		vt.RatingReview = *review
		vt.IsReviewed = true
	}

	vtss := []ViewTransactionStatus{}
	for _, ts := range t.Status {
		vts := ViewTransactionStatus{
			Amount:  ts.Amount,
			Time:    humanize.Time(ts.Time),
			Comment: ts.Comment,
			Status:  ts.Status,
		}
		if ts.PaymentReceipt != nil {
			switch t.Type {
			case "bitcoin":
				pr, err := ts.PaymentReceipt.BTCPaymentResult()
				if err == nil {
					vts.BTCPaymentResult = &pr
				}
			case "bitcoin_cash":
				pr, err := ts.PaymentReceipt.BCHPaymentResult()
				if err == nil {
					vts.BCHPaymentResult = &pr
				}
			case "ethereum":
				pr, err := ts.PaymentReceipt.ETHPaymentResult()
				if err == nil {
					vts.ETHPaymentResult = &pr
				}
			}
		}
		vtss = append(vtss, vts)
	}
	vt.ViewTransactionStatus = vtss

	vsss := []ViewShippingStatus{}
	for _, ts := range t.ShippingStatus {
		vts := ViewShippingStatus{
			Time:    humanize.Time(ts.Time),
			Comment: ts.Comment,
			Status:  ts.Status,
		}
		vsss = append(vsss, vts)
	}
	vt.ViewShippingStatus = vsss

	if vt.IsPending {
		now := time.Now()
		minutesLeft := int(t.CreatedAt().Add(pendingDuration).Sub(now).Minutes())
		vt.NextStatusTime = fmt.Sprintf("%d minutes", minutesLeft)
		vt.NextStatusPercent = float64(int(float64(minutesLeft) / pendingDuration.Minutes() * 100))
	}

	if vt.IsCompleted {
		now := time.Now()
		minutesLeft := int(t.CreatedAt().Add(completedDuration).Sub(now).Hours())
		vt.NextStatusTime = fmt.Sprintf("%d hours", int(minutesLeft))
		vt.NextStatusPercent = float64(int(float64(minutesLeft) / completedDuration.Minutes() * 100))
	}

	return vt
}

func (ts Transactions) ViewTransactions() []ViewTransaction {
	vts := []ViewTransaction{}
	for _, t := range ts {
		vts = append(vts, t.ViewTransaction())
	}
	return vts
}

func (vt ViewTransaction) DBModel() Transaction {
	if vt.Transaction != nil {
		return *vt.Transaction
	}
	return Transaction{}
}
