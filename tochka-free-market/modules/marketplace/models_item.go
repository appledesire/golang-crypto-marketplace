package marketplace

import (
	"encoding/base32"
	"errors"
	"fmt"
	"html/template"
	"io/ioutil"
	"math"
	"time"

	"github.com/dustin/go-humanize"
	"github.com/russross/blackfriday"
)

/*
	Models
*/

type Item struct {
	Uuid           string `json:"uuid" gorm:"primary_key"`
	Name           string `json:"name"`
	Description    string `json:"description" sql:"size:4096"`
	ItemCategoryID int    `json:"category_id" gorm:"index"`
	NumberOfSales  int    `json:"number_of_sales" gorm:"index"`
	NumberOfViews  int    `json:"number_of_views" gorm:"index"`

	ReviewerUser  User           `json:"-" gorm:"ForeignKey:ReviewedByUserUuid"`
	ItemCategory  ItemCategory   `json:"-"`
	Packages      []Package      `json:"-"`
	RatingReviews []RatingReview `json:"-"`

	ReviewedByUserUuid string     `json:"-"`
	ReviewedAt         *time.Time `json:"-"`

	// Converted to Stores
	StoreUuid string `json:"-"`
	Store     Store  `json:"-"`

	CreatedAt *time.Time `json:"-" gorm:"index"`
	UpdatedAt *time.Time `json:"-" gorm:"index"`
	DeletedAt *time.Time `json:"-" gorm:"index"`
}

type ItemWithCategory struct {
	Item
	ParentCategoryEn string `json:"parent_category_en"`
	CategoryEn       string `json:"category_en"`
}

type Items []Item

/*
	Model Methods
*/

func (itms Items) Where(fnc func(Item) bool) Items {
	filtered := Items{}
	for _, i := range itms {
		if fnc(i) {
			filtered = append(filtered, i)
		}
	}
	return filtered
}

func (item Item) ImageBase32() string {
	content, err := ioutil.ReadFile("./data/images/" + item.Uuid + "_200x200.jpeg")
	if err != nil {
		return ""
	}
	return "image/jpeg;base32," + base32.StdEncoding.EncodeToString(content)
}

func (i Item) CalculateScore() float64 {
	score := float64(0.0)
	for _, r := range i.RatingReviews {
		score += float64(r.ItemScore)
	}
	if len(i.RatingReviews) > 0 {
		score /= float64(len(i.RatingReviews))
	}
	return math.Ceil(score*100) / float64(100.0)
}

func (i *Item) Validate() error {
	if i.Name == "" {
		return errors.New("Name is not valid")
	}
	if i.Description == "" {
		return errors.New("Description is not valid")
	}
	if i.StoreUuid == "" {
		return errors.New("StoreUuid is not valid")
	}

	return nil
}

/*
	Database methods
*/

func (i Item) Remove() error {
	go BleveIndex.Delete(i.Uuid)
	return database.Delete(&i).Error
}

func (itm Item) Save() error {
	err := itm.Validate()
	if err != nil {
		return err
	}
	go itm.Index()
	return itm.SaveToDatabase()
}

func (itm Item) SaveToDatabase() error {
	if existing, _ := FindItemByUuid(itm.Uuid); existing == nil {
		return database.Create(&itm).Error
	}
	return database.Save(&itm).Error
}

func (i Item) Index() error {
	itemWithCategory := ItemWithCategory{
		Item: i,
	}

	parentCategoryId := i.ItemCategory.ParentID
	database.Raw(`
		     SELECT name_en as parent_category_en 
		     FROM "item_categories"
		     WHERE ("id" IN (?)) 
		     ORDER BY "item_categories"."id" ASC;
		     `, parentCategoryId).Scan(&itemWithCategory)
	itemWithCategory.CategoryEn = i.ItemCategory.NameEn
	
	return BleveIndex.Index(itemWithCategory.Uuid, itemWithCategory)
}

/*
	Relations
*/

func (item Item) PackagesWithoutReservation() Packages {
	predicate := func(a Package) bool {
		return a.Reservation() == nil
	}
	for i := range item.Packages {
		item.Packages[i].Item = item
	}
	return Packages(item.Packages).Where(predicate)
}

/*
	Queries
*/

func CountItems() int {
	var count int
	database.Table("items").Count(&count)
	return count
}

func GetItemsForIndexing() Items {
       var items []Item
	database.
		Preload("ItemCategory").
		Where("deleted_at IS NULL").
		Where("items.reviewed_by_user_uuid <> ''").
		Find(&items)
       return Items(items)
}

func FindItemByUuid(uuid string) (*Item, error) {
	var item Item
	err := database.
		Preload("Packages").
		Preload("Packages.CityMetroStation").
		Preload("Packages.PackagePrice").
		Preload("Packages.GeoCity").
		Preload("Packages.GeoCountryFrom").
		Preload("Packages.GeoCountryTo").
		Preload("Store").
		Preload("ReviewerUser").
		Preload("RatingReviews").
		Preload("RatingReviews.Transaction").
		Preload("RatingReviews.Transaction.BitcoinTransaction").
		Preload("RatingReviews.Transaction.BitcoinCashTransaction").
		Preload("RatingReviews.Transaction.EthereumTransaction").
		Preload("RatingReviews.User").
		Preload("ItemCategory").
		First(&item, "uuid = ?", uuid).
		Error
	if err != nil {
		return nil, err
	}

	return &item, err
}

func FindItemsForStore(uuid string) Items {
	var items []Item
	database.
		Where(&Item{StoreUuid: uuid}).
		Preload("Store").
		Preload("RatingReviews").
		Preload("ItemCategory").
		Preload("ReviewerUser").
		Preload("Packages").
		Preload("Packages.PackagePrice").
		Preload("Packages.GeoCity").
		Preload("Packages.GeoCountryFrom").
		Preload("Packages.GeoCountryTo").
		Find(&items)
	return Items(items)
}

func FindUnreviewedItems(page, pageSize int) Items {
	var items []Item
	database.
		Table("items").
		Joins("join stores on stores.uuid=items.store_uuid").
		Where(`stores.is_suspended=false AND 
		(stores.is_gold_account OR stores.is_silver_account OR stores.is_bronze_account OR stores.is_free_account) AND
		(stores.is_allowed_to_sell=true)`).
		Where("reviewed_by_user_uuid is null or reviewed_by_user_uuid=''").
		Preload("Store").
		Preload("ItemCategory").
		Preload("Packages").
		Preload("Packages.PackagePrice").
		Preload("Packages.GeoCity").
		Preload("Packages.GeoCountryFrom").
		Preload("Packages.GeoCountryTo").
		Order("updated_at DESC").
		Limit(pageSize).
		Offset(page * pageSize).
		Find(&items)
	return Items(items)
}

/*
	View models
*/

type ViewItem struct {
	*Item
	DescriptionHTML      template.HTML  `json:"description_html"`
	ShortDescriptionHTML template.HTML  `json:"short_description_html"`
	GroupPackages        []GroupPackage `json:"packages"`

	MaxPriceBTCStr   string  `json:"-"`
	MaxPriceBTCFloat float64 `json:"-"`
	MinPriceBTCStr   string  `json:"-"`
	MinPriceBTCFloat float64 `json:"-"`

	MaxPriceBCHStr   string  `json:"-"`
	MaxPriceBCHFloat float64 `json:"-"`
	MinPriceBCHStr   string  `json:"-"`
	MinPriceBCHFloat float64 `json:"-"`

	MaxPriceETHStr   string  `json:"-"`
	MaxPriceETHFloat float64 `json:"-"`
	MinPriceETHStr   string  `json:"-"`
	MinPriceETHFloat float64 `json:"-"`

	MaxPriceUSDStr   string  `json:"-"`
	MaxPriceUSDFloat float64 `json:"-"`
	MinPriceUSDStr   string  `json:"-"`
	MinPriceUSDFloat float64 `json:"-"`

	MaxPriceEURStr   string  `json:"-"`
	MaxPriceEURFloat float64 `json:"-"`
	MinPriceEURStr   string  `json:"-"`
	MinPriceEURFloat float64 `json:"-"`

	MaxPriceGBPStr   string  `json:"-"`
	MaxPriceGBPFloat float64 `json:"-"`
	MinPriceGBPStr   string  `json:"-"`
	MinPriceGBPFloat float64 `json:"-"`

	MaxPriceAUDStr   string  `json:"-"`
	MaxPriceAUDFloat float64 `json:"-"`
	MinPriceAUDStr   string  `json:"-"`
	MinPriceAUDFloat float64 `json:"-"`

	MaxPriceRUBStr   string  `json:"-"`
	MaxPriceRUBFloat float64 `json:"-"`
	MinPriceRUBStr   string  `json:"-"`
	MinPriceRUBFloat float64 `json:"-"`

	MedPriceBTCFloat float64 `json:"-"`

	// ViewUser ViewUser `json:"-"`
	ViewStore         ViewStore          `json:"-"`
	ViewPackages      []ViewPackage      `json:"-"`
	ViewRatingReviews []ViewRatingReview `json:"rating_reviews,omitempty"`
	ViewItemCategory  ViewItemCategory   `json:"item_category"`

	Score float64 `json:"score"`
}

type ViewItems []ViewItem

func (item Item) ViewItem(lang string) ViewItem {
	itemPackages := Packages(item.Packages)
	score := item.CalculateScore()

	pckgs, _ := Packages(item.Packages).GroupsTable().GetPackagesPage(0, 5)

	vi := ViewItem{
		Item:            &item,
		DescriptionHTML: template.HTML(userHtmlPolicy.Sanitize(string(blackfriday.MarkdownCommon([]byte(item.Description))))),
		ShortDescriptionHTML: template.HTML(
			userHtmlPolicy.Sanitize(
				string(
					blackfriday.MarkdownCommon(
						[]byte(
							item.Description[0:int(
								math.Min(
									float64(len(item.Description)),
									float64(1024),
								),
							)],
						),
					),
				),
			),
		),

		ViewStore:    item.Store.ViewStore(lang),
		ViewPackages: itemPackages.ViewPackages(),

		MinPriceBTCFloat: itemPackages.MinPrice("BTC"),
		MaxPriceBTCFloat: itemPackages.MaxPrice("BTC"),
		MinPriceBTCStr:   humanize.Ftoa(itemPackages.MinPrice("BTC")),
		MaxPriceBTCStr:   humanize.Ftoa(itemPackages.MaxPrice("BTC")),

		MinPriceBCHFloat: itemPackages.MinPrice("BCH"),
		MaxPriceBCHFloat: itemPackages.MaxPrice("BCH"),
		MinPriceBCHStr:   humanize.Ftoa(itemPackages.MinPrice("BCH")),
		MaxPriceBCHStr:   humanize.Ftoa(itemPackages.MaxPrice("BCH")),

		MinPriceETHFloat: itemPackages.MinPrice("ETH"),
		MaxPriceETHFloat: itemPackages.MaxPrice("ETH"),
		MinPriceETHStr:   humanize.Ftoa(itemPackages.MinPrice("ETH")),
		MaxPriceETHStr:   humanize.Ftoa(itemPackages.MaxPrice("ETH")),

		MinPriceUSDFloat: itemPackages.MinPrice("USD"),
		MaxPriceUSDFloat: itemPackages.MaxPrice("USD"),
		MinPriceUSDStr:   fmt.Sprintf("%d", int(math.Ceil(itemPackages.MinPrice("USD")))),
		MaxPriceUSDStr:   fmt.Sprintf("%d", int(math.Ceil(itemPackages.MaxPrice("USD")))),

		MinPriceRUBFloat: itemPackages.MinPrice("RUB"),
		MaxPriceRUBFloat: itemPackages.MaxPrice("RUB"),
		MinPriceRUBStr:   fmt.Sprintf("%d", int(math.Ceil(itemPackages.MinPrice("RUB")))),
		MaxPriceRUBStr:   fmt.Sprintf("%d", int(math.Ceil(itemPackages.MaxPrice("RUB")))),

		MinPriceAUDFloat: itemPackages.MinPrice("AUD"),
		MaxPriceAUDFloat: itemPackages.MaxPrice("AUD"),
		MinPriceAUDStr:   fmt.Sprintf("%d", int(math.Ceil(itemPackages.MinPrice("AUD")))),
		MaxPriceAUDStr:   fmt.Sprintf("%d", int(math.Ceil(itemPackages.MaxPrice("AUD")))),

		MinPriceGBPFloat: itemPackages.MinPrice("GBP"),
		MaxPriceGBPFloat: itemPackages.MaxPrice("GBP"),
		MinPriceGBPStr:   fmt.Sprintf("%d", int(math.Ceil(itemPackages.MinPrice("GBP")))),
		MaxPriceGBPStr:   fmt.Sprintf("%d", int(math.Ceil(itemPackages.MaxPrice("GBP")))),

		MinPriceEURFloat: itemPackages.MinPrice("EUR"),
		MaxPriceEURFloat: itemPackages.MaxPrice("EUR"),
		MinPriceEURStr:   fmt.Sprintf("%d", int(math.Ceil(itemPackages.MinPrice("EUR")))),
		MaxPriceEURStr:   fmt.Sprintf("%d", int(math.Ceil(itemPackages.MaxPrice("EUR")))),

		MedPriceBTCFloat: (itemPackages.MinPrice("BTC") + itemPackages.MaxPrice("BTC")) / 2,

		ViewItemCategory: item.ItemCategory.ViewItemCategory(lang),

		Score:         score,
		GroupPackages: pckgs,
	}

	for _, review := range vi.RatingReviews {
		if review.ItemReview == "" {
			continue
		}
		vi.ViewRatingReviews = append(vi.ViewRatingReviews, review.ViewRatingReview(lang))
	}

	return vi
}

func (items Items) ViewItems(lang string) []ViewItem {
	viewItems := []ViewItem{}
	for _, item := range items {
		viewItem := item.ViewItem(lang)
		viewItems = append(viewItems, viewItem)
	}
	return viewItems
}

func (vi ViewItem) DBModel() Item {
	if vi.Item != nil {
		return *vi.Item
	}
	return Item{}
}

func (i Item) Url() string {
	return fmt.Sprintf("/store/%s/item/%s/", i.Store.Storename, i.Uuid)
}
