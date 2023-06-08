package marketplace

import (
	"errors"
	"github.com/jinzhu/gorm"
)

type ShippingOption struct {
	gorm.Model 

	Name     string  `json:"name"`
	PriceUSD float64 `json:"price_usd"`
	PriceRUB float64 `json:"price_rub"`
	PriceGBP float64 `json:"price_gbp"`
	PriceEUR float64 `json:"price_eur"`
	PriceAUD float64 `json:"price_aud"`

	// UserUuid string `json:"user_uuid" sql:"index"`
	// User User `json:"-"`

	// Converted to stores
	StoreUuid string `json:store_uuid" sql:"index"`
	Store     Store  `json:"-"`
}

/*
	Model Interface Implementation
*/

func (r ShippingOption) Validate() error {
	if r.Name == "" {
		return errors.New("Empty name")
	}
	if r.PriceUSD <= 0.0 {
		return errors.New("Price must be positive")
	}
	return nil
}

func (i ShippingOption) Remove() error {
	return database.Delete(&i).Error
}

func (itm ShippingOption) Save() error {
	err := itm.Validate()
	if err != nil {
		return err
	}
	return itm.SaveToDatabase()
}

func (itm ShippingOption) SaveToDatabase() error {
	if existing, _ := FindShippingOptionById(itm.ID); existing == nil {
		return database.Create(&itm).Error
	}
	return database.Save(&itm).Error
}

/*
	Queries
*/

func GetAllShippingOptions() []ShippingOption {
	shippingOption := []ShippingOption{}
	database.Find(&shippingOption)
	return shippingOption
}

func FindShippingOptionById(id uint) (*ShippingOption, error) {
	var item ShippingOption
	err := database.
		Preload("Store").
		First(&item, "id = ?", id).
		Error
	if err != nil {
		return nil, err
	}
	return &item, err
}

func FindShippingOptionsByStoreUuid(storeUuid string) []ShippingOption {
	shippingOption := []ShippingOption{}
	database.
		Where(ShippingOption{StoreUuid: storeUuid}).
		Find(&shippingOption)
	return shippingOption
}
