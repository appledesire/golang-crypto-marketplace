package marketplace

import (
	"encoding/json"
	"errors"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
)

/*
	Models
*/

type PaymentReceipt struct {
	Uuid           string `json:"uuid" gorm:"primary_key" sql:"size:1024"`
	Type           string `json:"type" sql:"index"`
	SerializedData string `json:"serialized_data"`
	Version        int    `json:"receipt_version"`

	BTCPaymentResultItem *apis.BTCPaymentResult `json:"btc_payment_result,omitempty"`
	BCHPaymentResultItem *apis.BCHPaymentResult `json:"bch_payment_result,omitempty"`
	ETHPaymentResultItem *apis.ETHPaymentResult `json:"eth_payment_results,omitempty"`
}

/*
	Model Interface Implementation
*/

func (r PaymentReceipt) Validate() error {
	if r.Uuid == "" {
		return errors.New("Uuid can't be empty")
	}
	if r.Type == "" {
		return errors.New("Type can not be empty")
	}
	if r.SerializedData == "" {
		return errors.New("Serialized data can not be empty")
	}
	return nil
}

/*
	Database Methods
*/

func (i PaymentReceipt) Remove() error {
	return database.Delete(&i).Error
}

func (itm PaymentReceipt) Save() error {
	if err := itm.Validate(); err != nil {
		return err
	}
	return itm.SaveToDatabase()
}

func (itm PaymentReceipt) SaveToDatabase() error {
	return database.Create(&itm).Error
}

/*
	Cryptocurrency-Specific Methods
*/

func (i PaymentReceipt) BTCPaymentResult() (apis.BTCPaymentResult, error) {
	pr := apis.BTCPaymentResult{}
	err := json.Unmarshal([]byte(i.SerializedData), &pr)
	return pr, err
}

func (i PaymentReceipt) BCHPaymentResult() (apis.BCHPaymentResult, error) {
	pr := apis.BCHPaymentResult{}
	err := json.Unmarshal([]byte(i.SerializedData), &pr)
	return pr, err
}

func (i PaymentReceipt) ETHPaymentResult() (apis.ETHPaymentResult, error) {
	pr := apis.ETHPaymentResult{}

	switch i.Version {
	case 0:
		prs := []apis.ETHPaymentResult{}
		err := json.Unmarshal([]byte(i.SerializedData), &prs)
		if err != nil {
			return pr, err
		}
		if len(prs) == 0 {
			return pr, errors.New("Zero length of serialized data")
		}
		return prs[0], nil
	case 2:
		err := json.Unmarshal([]byte(i.SerializedData), &pr)
		return pr, err
	default:
		return pr, errors.New("Wrong version of receipt")
	}
}

/*
	Factory Methods
*/

func CreateBTCPaymentReceipt(transactionResult apis.BTCPaymentResult) (PaymentReceipt, error) {
	txResultJSON, err := json.Marshal(transactionResult)
	if err != nil {
		return PaymentReceipt{}, err
	}
	receipt := PaymentReceipt{
		Uuid:           transactionResult.Hash,
		Type:           "bitcoin",
		SerializedData: string(txResultJSON),
	}
	return receipt, receipt.Save()
}

func CreateBCHPaymentReceipt(transactionResult apis.BCHPaymentResult) (PaymentReceipt, error) {
	txResultJSON, err := json.Marshal(transactionResult)
	if err != nil {
		return PaymentReceipt{}, err
	}

	receipt := PaymentReceipt{
		Uuid:           transactionResult.Hash,
		Type:           "bitcoin_cash",
		SerializedData: string(txResultJSON),
	}
	return receipt, receipt.Save()
}

func CreateETHPaymentReceipt(transactionResult apis.ETHPaymentResult) (PaymentReceipt, error) {
	txResultJSON, err := json.Marshal(transactionResult)
	if err != nil {
		return PaymentReceipt{}, err
	}

	receipt := PaymentReceipt{
		Uuid:           transactionResult.Hash,
		Type:           "ethereum",
		Version:        2,
		SerializedData: string(txResultJSON),
	}
	return receipt, receipt.Save()
}

/*
	Queries
*/

func FindPaymentReceiptByUuid(uuid string) []ReferralPayment {
	var payments []ReferralPayment

	database.
		Where("uuid=?", uuid).
		Find(&payments)

	return payments
}
