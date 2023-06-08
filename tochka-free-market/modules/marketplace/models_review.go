package marketplace

import (
	"sort"
	"time"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

/*
	Models
*/

type RatingReview struct {
	Uuid            string `json:"-" gorm:"primary_key"`
	UserUuid        string `json:"-" sql:"index"`
	StoreUuid       string `json:"-" sql:"index"`
	ItemUuid        string `json:"-" sql:"index"`
	TransactionUuid string `json:"-" sql:"index"`

	ItemScore         int    `json:"item_score"`
	ItemReview        string `json:"item_review"`
	SellerScore       int    `json:"seller_score"`
	SellerReview      string `json:"seller_review"`
	MarketplaceScore  int    `json:"marketplace_score"`
	MarketplaceReview string `json:"marketplace_review"`

	User        User        `json:"user"`
	Store       Store       `json:"-" gorm:"ForeignKey:StoreUuid"`
	Item        Item        `json:"-"`
	Transaction Transaction `json:"-"`

	// ORM timestamps
	CreatedAt *time.Time `json:"created_at"`
	UpdatedAt *time.Time `json:"-"`
	DeletedAt *time.Time `json:"-"`
}

type RatingReviews []RatingReview

type ViewRatingReview struct {
	RatingReview
	TransactionAmount string    `json:"-"`
	CreatedAtStr      string    `json:"-"`
	ViewItem          ViewItem  `json:"-"`
	ViewStore         ViewStore `json:"-"`
}

/*
	Model Interface Implementation
*/

func (rr RatingReviews) ViewRatingReviews(lang string) []ViewRatingReview {
	rrs := []ViewRatingReview{}

	for _, r := range rr {
		vr := r.ViewRatingReview(lang)
		rrs = append(rrs, vr)
	}

	sort.Slice(rrs, func(i, j int) bool {
		return rrs[i].CreatedAt.After(*rrs[j].CreatedAt)
	})

	return rrs
}

func (r RatingReview) ViewRatingReview(lang string) ViewRatingReview {
	vr := ViewRatingReview{
		RatingReview: r,
		ViewItem:     r.Item.ViewItem(lang),
		CreatedAtStr: util.HumanizeTime(*r.CreatedAt, lang),
		ViewStore:    r.Store.ViewStore(lang),
	}

	usdAmount := r.Transaction.TransactionAmount() * GetCurrencyRate(r.Transaction.TransactionCurrency(), "USD")

	if usdAmount <= 10 {
		vr.TransactionAmount = "SMALL"
	} else if usdAmount <= 100 {
		vr.TransactionAmount = "MEDIUM"
	} else if usdAmount <= 500 {
		vr.TransactionAmount = "LARGE"
	} else if usdAmount <= 500 {
		vr.TransactionAmount = "BULK"
	}

	if vr.ItemReview == "" {
		vr.ItemReview = "-"
	}

	if vr.SellerReview == "" {
		vr.SellerReview = "-"
	}

	return vr
}

func (r RatingReview) Validate() error {
	return nil
}

func (i RatingReview) Remove() error {
	return database.Delete(&i).Error
}

func (itm RatingReview) Save() error {
	err := itm.Validate()
	if err != nil {
		return err
	}
	return itm.SaveToDatabase()
}

func (itm RatingReview) SaveToDatabase() error {
	if existing, _ := FindRatingReviewByUuid(itm.Uuid); existing == nil {
		return database.Create(&itm).Error
	}
	return database.Save(&itm).Error
}

/*
	Queries
*/

func GetAllRatingReviews() []RatingReview {
	var items []RatingReview
	database.Find(&items)
	return items
}

func FindRatingReviewByUuid(uuid string) (*RatingReview, error) {
	var item RatingReview
	err := database.
		Where("uuid=?", uuid).
		// Preload("Item").
		// Preload("User").
		// Preload("Store").
		// Preload("Transcation").
		// Preload("Transcation.BitcoinTransaction").
		// Preload("Transcation.BitcoinCashTransaction").
		// Preload("Transcation.EthereumTransaction").
		// Preload("Transaction").
		First(&item).
		Error
	if err != nil {
		return nil, err
	}
	return &item, err
}

func FindRatingReviewsForStore(uuid string) []RatingReview {
	var items []RatingReview

	database.
		Where(&RatingReview{StoreUuid: uuid}).
		Preload("Item").
		Preload("User").
		Preload("Store").
		Preload("Transcation").
		Preload("Transcation.BitcoinTransaction").
		Preload("Transcation.BitcoinCashTransaction").
		Preload("Transcation.EthereumTransaction").
		Preload("Transaction").
		Find(&items)

	return items
}

func CountRatingReviewsForStore(storeUuid string) int {
	var count int
	database.
		Table("rating_reviews").
		Where("store_uuid = ?", storeUuid).
		Count(&count)
	return count
}

func CountPositiveRatingReviewsForStore(storeUuid string) int {
	var count int
	database.
		Table("rating_reviews").
		Where("store_uuid = ?", storeUuid).
		Where("seller_score >= ?", 4).
		Count(&count)
	return count
}

func CountNeutralRatingReviewsForStore(storeUuid string) int {
	var count int
	database.
		Table("rating_reviews").
		Where("store_uuid = ?", storeUuid).
		Where("seller_score = ?", 3).
		Count(&count)
	return count
}

func CountNegativeRatingReviewsForStore(storeUuid string) int {
	var count int
	database.
		Table("rating_reviews").
		Where("store_uuid = ?", storeUuid).
		Where("seller_score <= ?", 2).
		Count(&count)
	return count
}

func FindRatingReviewByTransactionUuid(uuid string) (*RatingReview, error) {
	var item RatingReview
	err := database.
		Where("transaction_uuid=?", uuid).
		First(&item).
		Error
	if err != nil {
		return nil, err
	}
	return &item, err
}
