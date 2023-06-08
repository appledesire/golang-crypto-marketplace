package marketplace

import (
	"errors"
	"time"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

type Advertising struct {
	Uuid    string `json:"uuid" gorm:"primary_key"`
	Status  bool   `json:"status"`
	Comment string `gorm:"type:varchar(50);unique" json:"comment"`

	DateStart   time.Time `json:"date_start"`
	DateEnd     time.Time `json:"date_end"`
	DateCreated time.Time `json:"created_at"`

	CountImpressions        int `json:"count_impressions"`
	CurrentCountImpressions int `json:"current_count_impressions"`

	ItemUuid string `json:"item_uuid" sql:"index"`
	Item     Item   `json:"-"`
}

type Advertisings []Advertising

/*
	Model Methods
*/

func (ad Advertising) Validate() error {
	if ad.Comment == "" {
		return errors.New("Text is limited to 50 symbols.")
	}
	if ad.Uuid == "" {
		return errors.New("Uuid is empty.")
	}
	return nil
}

func (ad Advertising) Save() error {
	err := ad.Validate()
	if err != nil {
		return err
	}
	return ad.SaveToDatabase()
}

func (ad *Advertising) SaveToDatabase() error {
	if existing, _ := FindAdvertisingByUuid(ad.Uuid); existing == nil {
		return database.Create(ad).Error
	}
	return database.Save(ad).Error
}

func (ad *Advertising) AddImpressions() error {
	ad.CurrentCountImpressions++
	if ad.CurrentCountImpressions >= ad.CountImpressions {
		ad.Status = false
		ad.DateEnd = time.Now()
		return database.Save(&ad).Error
	}

	return database.
		Model(&ad).
		UpdateColumn("CurrentCountImpressions", ad.CurrentCountImpressions).
		Error
}

func CreateAdvertising(comment string, count int, itemUuid string) error {

	ad := Advertising{
		Uuid:                    util.GenerateUuid(),
		DateCreated:             time.Now(),
		Comment:                 comment,
		DateStart:               time.Now(),
		Status:                  true,
		CountImpressions:        count,
		CurrentCountImpressions: 0,
		ItemUuid:                itemUuid,
	}

	err := ad.Validate()
	if err != nil {
		return err
	}

	return ad.Save()
}

/*
	Queries
*/

func FindAllAdvertising() (Advertisings, error) {
	var ads Advertisings
	err := database.
		Table("v_advertisings").
		Order("date_created ASC").
		Preload("Item").
		Preload("Item.Store").
		Order("date_start ASC").
		Find(&ads).Error
	if err != nil {
		return nil, err
	}
	return ads, err
}

func FindAllActiveAdvertisings() Advertisings {
	var ads Advertisings
	database.
		Table("v_advertisings").
		Preload("Item").
		Preload("Item.Store").
		Find(&ads)
	return ads
}

func FindRandomActiveAdvertisings(limit int) Advertisings {
	var ads []Advertising
	database.
		Table("v_advertisings").
		Order("random()").
		Limit(limit).
		Preload("Item").
		Preload("Item.Store").
		Find(&ads)
	return ads
}

func FindAdvertisingByUuid(uuid string) (*Advertising, error) {
	var ad Advertising
	err := database.
		Where("advertisings.item_uuid = ? and advertisings.status = true", uuid).
		Preload("Item").
		Preload("Item.Store").
		Last(&ad).Error
	if err != nil {
		return nil, err
	}
	return &ad, err
}

func FindAdvertisingByStore(uuid string) Advertisings {
	var ads Advertisings

	database.
		Table("advertisings").
		Joins("join items on items.uuid = advertisings.item_uuid").
		Where("items.store_uuid = ?", uuid).
		Preload("Item").
		Preload("Item.Store").
		Find(&ads)

	return ads
}

func FindAdvertisingByItem(uuid string) (*Advertising, error) {
	var ad Advertising
	err := database.
		Where(&Advertising{ItemUuid: uuid}).
		Preload("Item").
		Preload("Item.Store").
		First(&ad).Error
	if err != nil {
		return nil, err
	}
	return &ad, err
}

func GetAdvertisings(limit int) Advertisings {
	ads := FindRandomActiveAdvertisings(limit)
	for i := range ads {
		ads[i].AddImpressions()
	}
	return ads
}

/*
	Database Views
*/

func setupAdvertisingViews() {
	database.Exec("DROP VIEW IF EXISTS v_advertisings CASCADE;")
	database.Exec(`
		CREATE VIEW v_advertisings AS (
			select 
				a.* 
			from 
				advertisings a
			join
				stores s on s.uuid=a.store_uuid
			join
				items i on i.uuid=a.item_uuid
			where
				a.status = true and
				s.is_suspended = false and
				i.deleted_at IS NULL
	);`)
}
