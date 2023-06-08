package marketplace

import (
	"errors"
	"github.com/jinzhu/gorm"
)

type ReferralPayment struct {
	gorm.Model

	ReferralPercent    float64
	ReferralPaymentBCH float64
	ReferralPaymentBTC float64
	ReferralPaymentETH float64
	ReferralPaymentUSD float64

	IsBuyerReferral bool

	UserUuid string `json:"user_uuid" sql:"index"`
	User     User   `json:"-"`

	TransactionUuid string      `json:"transaction_uuid" sql:"index"`
	Transaction     Transaction `json:"-"`
}

/*
	Model Interface Implementation
*/

func (r ReferralPayment) Validate() error {

	if r.ReferralPercent <= 0.0 {
		return errors.New("Percent must be positive")
	}
	if r.ReferralPaymentBTC <= 0.0 {
		return errors.New("BTC payment must be positive")
	}
	if r.ReferralPaymentUSD <= 0.0 {
		return errors.New("USD payment must be positive")
	}
	if r.TransactionUuid == "" {
		return errors.New("Transaction UUID must be present")
	}

	return nil
}

func (i ReferralPayment) Remove() error {
	return database.Delete(&i).Error
}

func (itm ReferralPayment) Save() error {
	err := itm.Validate()
	if err != nil {
		return err
	}
	return itm.SaveToDatabase()
}

func (itm ReferralPayment) SaveToDatabase() error {
	return database.Create(&itm).Error
}

/*
	Queries
*/

func FindReferralPaymentsForUser(uuid string) []ReferralPayment {
	var payments []ReferralPayment

	database.
		Where("user_uuid=?", uuid).
		Preload("Transaction").
		Preload("User").
		Find(&payments)

	return payments
}

func FindReferralPayments() []ReferralPayment {
	var payments []ReferralPayment

	database.
		Preload("Transaction").
		Preload("User").
		Find(&payments)

	return payments
}
