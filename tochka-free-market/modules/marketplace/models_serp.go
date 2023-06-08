package marketplace

import (
	"fmt"
	"github.com/lib/pq"
	"math"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
	"sort"
	"time"
)

/*
	Models
*/

type SerpItem struct {
	ItemUuid string `json:"item_uuid"`

	// Vendor details
	StoreUuid        string `json:"-"`
	Storename        string `json:"storename"`
	StoreDescription string `json:"store_description"`

	// Store conditions
	StoreIsSuspended     bool `json:"store_is_suspended"`
	StoreIsTrusted       bool `json:"store_is_trusted"`
	StoreIsAllowedToSell bool `json:"store_is_allowed_to_sell"`

	// Account types
	StoreIsFreeAccount   bool `json:"store_is_free_account"`
	StoreIsBronzeAccount bool `json:"store_is_bronze_account"`
	StoreIsSilverAccount bool `json:"store_is_silver_account"`
	StoreIsGoldAccount   bool `json:"store_is_gold_account"`

	// Dates
	StoreLastLoginDate    time.Time `json:"store_last_login_date"`
	StoreRegistrationDate time.Time `json:"store_registraion_date"`

	// Warnings
	NumberOfRedWarnings    int    `json:"number_of_red_warnings"`
	NumberOfGreenWarnings  int    `json:"number_of_green_warnings"`
	NumberOfYellowWarnings int    `json:"number_of_yellow_warnings"`
	ReviewedByUserUuid     string `json:"-"`

	// Item details
	ItemCreatedAt              time.Time `json:"item_created_at"`
	ItemName                   string    `json:"item_name"`
	ItemDescription            string    `json:"item_description"`
	ItemCategoryId             int       `json:"item_category_id"`
	ParentItemCategoryId       int       `json:"item_parent_category_id"`
	ParentParentItemCategoryId int       `json:"item_parent_parent_category_id"`

	// ItemCategory details: These fields are only available when
	// SQL JOINing in these fields -> Not used everywhere
	// At time of writing, this is only used in models_frontpage.go
	ItemCategoryNameEn             string `json:"item_category_name_en"`
	ItemCategoryNameRu             string `json:"item_category_name_ru"`
	ParentItemCategoryNameEn       string `json:"parent_item_category_name_en"`
	ParentItemCategoryNameRu       string `json:"parent_item_category_name_ru"`
	ParentParentItemCategoryNameEn string `json:"parent_parent_item_category_name_en"`
	ParentParentItemCategoryNameRu string `json:"parent_parent_item_category_name_ru"`

	// Price details
	MinPrice float64 `json:"max_price"`
	MaxPrice float64 `json:"min_price"`
	Currency string  `json:"currency"`

	// Scores
	StoreScore      float64 `json:"store_score"`
	StoreScoreCount int     `json:"-"`
	ItemScore       float64 `json:"item_score"`
	ItemScoreCount  int     `json:"-"`

	// Bitcoin transaction statistics
	StoreBitcoinTxNumber float64 `json:"-"`
	StoreBitcoinTxVolume float64 `json:"-"`
	ItemBitcoinTxNumber  float64 `json:"-"`
	ItemBitcoinTxVolume  float64 `json:"-"`

	// Bitcoin Cash transaction statistics
	StoreBitcoinCashTxNumber float64 `json:"-"`
	StoreBitcoinCashTxVolume float64 `json:"-"`
	ItemBitcoinCashTxNumber  float64 `json:"-"`
	ItemBitcoinCashTxVolume  float64 `json:"-"`

	// Ethereum transaction statistics
	StoreEthereumTxNumber  float64 `json:"-"`
	StorerEthereumTxVolume float64 `json:"-"`
	ItemEthereumTxNumber   float64 `json:"-"`
	ItemEthereumTxVolume   float64 `json:"-"`

	// Shipping and delivery details
	Type                      string `json:"type"`
	CountryNameEnShippingFrom string `json:"country_shipping_from"`
	CountryNameEnShippingTo   string `json:"country_shipping_to"`
	DropCityId                int    `json:"geoname_id"`

	// Price mappings
	Price map[string][2]float64 `json:"-"`

	// Vendor levels
	StoreLevel int `json:"store_level"`

	// Geobase fiels
	GeoCity        City    `gorm:"ForeignKey:DropCityId" json:"-"`
	GeoCountryFrom Country `gorm:"ForeignKey:CountryNameEnShippingFrom" json:"-"`
	GeoCountryTo   Country `gorm:"ForeignKey:CountryNameEnShippingTo" json:"-"`

	// Used in /front page
	CategoriesNameEn pq.StringArray `gorm:"type:varchar(100)[]" json:"categories_name_en"`
}

type SerpStore struct {
	// Basic info
	Storename        string `json:"storename"`
	ShortDescription string `json:"store_description"`

	// Dates
	LastLoginDate    time.Time `json:"last_login_date"`
	RegistrationDate time.Time `json:"registration_date"`

	// Financials
	BitcoinTxNumber     float64 `json:"-"`
	BitcoinTxVolume     float64 `json:"-"`
	BitcoinCashTxNumber float64 `json:"-"`
	BitcoinCashTxVolume float64 `json:"-"`
	EthereumTxNumber    float64 `json:"-"`
	EthereumTxVolume    float64 `json:"-"`

	// Levels
	Score float64 `json:"vendor_score"`
	Level int     `json:"vendor_level"`

	// Account types
	IsFreeAccount   bool `json:"vendor_is_free_account"`
	IsGoldAccount   bool `json:"vendor_is_gold_account"`
	IsSilverAccount bool `json:"vendor_is_silver_account"`
	IsBronzeAccount bool `json:"vendor_is_bronze_account"`

	// Misc info
	IsTrusted     bool `json:"vendor_is_trusted"`
	AllowedToSell bool `json:"-"`

	// Used in /front page
	CategoriesNameEn pq.StringArray `gorm:"type:varchar(100)[]" json:"categories_name_en"`
	ScoreString      string         `json:"-"`
}

type SerpStores []SerpStore

/*
	Model Methods
*/

func (ai SerpItem) USDVolume() float64 {
	return ai.ItemBitcoinTxVolume*GetCurrencyRate("BTC", "USD") +
		ai.ItemBitcoinCashTxVolume*GetCurrencyRate("BCH", "USD") +
		ai.ItemEthereumTxVolume*GetCurrencyRate("ETH", "USD")
}

/*
	Currency Rates
*/

func (ai SerpItem) GetPrice(currency string) [2]float64 {
	return [2]float64{
		ai.MinPrice / GetCurrencyRate(currency, ai.Currency),
		ai.MaxPrice / GetCurrencyRate(currency, ai.Currency),
	}
}

/*
	View Item
*/

type ViewSerpItem struct {
	*SerpItem
	IsOnline            bool      `json:"vendor_is_online"`
	LastLoginDateStr    string    `json:"vendor_last_login_date"`
	RegistrationDateStr string    `json:"vendor_registration_date"`
	PriceRangeStr       [2]string `json:"price_range"`
	PriceStr            string    `json:"price"`
}

func (ai SerpItem) ViewSerpItem(lang, currency string) ViewSerpItem {

	if currency == "" {
		currency = "USD"
	}

	price := ai.Price[currency]

	vai := ViewSerpItem{
		SerpItem:            &ai,
		LastLoginDateStr:    util.HumanizeTime(ai.StoreLastLoginDate, lang),
		PriceRangeStr:       [2]string{fmt.Sprintf("%d", int(math.Ceil(price[0]))), fmt.Sprintf("%d", int(math.Ceil(price[1])))},
		RegistrationDateStr: util.HumanizeTime(ai.StoreRegistrationDate, lang),
	}

	if currency == "BTC" || currency == "ETH" || currency == "BCH" {
		vai.PriceRangeStr = [2]string{
			fmt.Sprintf("%f", price[0]),
			fmt.Sprintf("%f", price[1]),
		}
	}

	if price[0] == price[1] {
		vai.PriceStr = vai.PriceRangeStr[0]
	}

	return vai
}

type ViewSerpStore struct {
	*SerpStore
	IsOnline            bool
	VendorScoreStr      string
	LastLoginDateStr    string
	RegistrationDateStr string
}

func (v SerpStore) ViewSerpStore(lang string) ViewSerpStore {
	return ViewSerpStore{
		SerpStore:           &v,
		LastLoginDateStr:    util.HumanizeTime(v.LastLoginDate, lang),
		RegistrationDateStr: util.HumanizeTime(v.RegistrationDate, lang),
	}
}

type SerpItems []SerpItem

func (ais SerpItems) ViewSerpItems(lang, currency string) []ViewSerpItem {
	var vais []ViewSerpItem
	for _, ai := range ais {
		vai := ai.ViewSerpItem(lang, currency)
		vais = append(vais, vai)
	}
	return vais
}

func (vs SerpStores) ViewSerpStores(lang string) []ViewSerpStore {
	var vvs []ViewSerpStore
	for _, v := range vs {
		vv := v.ViewSerpStore(lang)
		vvs = append(vvs, vv)
	}
	return vvs
}

/*
	Collection Fields
*/

func (ais SerpItems) Sort(sortyBy string) SerpItems {

	var sortByFunc func(int, int) bool

	switch sortyBy {
	case "date_logged_in":
		sortByFunc = func(i, j int) bool {
			return ais[i].StoreLastLoginDate.After(ais[j].StoreLastLoginDate)
		}
	case "price":
		sortByFunc = func(i, j int) bool {

			if ais[i].StoreIsGoldAccount != ais[j].StoreIsGoldAccount { // GOLD
				return ais[i].StoreIsGoldAccount
			} else if ais[i].StoreIsSilverAccount != ais[j].StoreIsSilverAccount { // SILVER
				return ais[i].StoreIsSilverAccount
			} else if ais[i].StoreIsBronzeAccount != ais[j].StoreIsBronzeAccount { // BRONZE
				return ais[i].StoreIsBronzeAccount
			} else { // by price
				return ais[i].MinPrice < ais[j].MaxPrice
			}
		}
	case "popularity":
		sortByFunc = func(i, j int) bool {

			if ais[i].StoreIsGoldAccount != ais[j].StoreIsGoldAccount { // GOLD
				return ais[i].StoreIsGoldAccount
			} else if ais[i].StoreIsSilverAccount != ais[j].StoreIsSilverAccount { // SILVER
				return ais[i].StoreIsSilverAccount
			} else if ais[i].StoreIsBronzeAccount != ais[j].StoreIsBronzeAccount { // BRONZE
				return ais[i].StoreIsBronzeAccount
			} else { // by price
				return ais[i].USDVolume() > ais[j].USDVolume()
			}

		}
	case "date_added":
		sortByFunc = func(i, j int) bool {
			return ais[i].ItemCreatedAt.After(ais[j].ItemCreatedAt)
		}
	case "rating":
		sortByFunc = func(i, j int) bool {
			return ais[i].ItemScore > ais[j].ItemScore
		}
	default:
		sortByFunc = func(i, j int) bool { return true }
	}

	sort.Slice(ais, sortByFunc)
	return ais
}

func (ais SerpItems) Where(predicate func(SerpItem) bool) SerpItems {
	newAis := SerpItems{}
	for i := range ais {
		if predicate(ais[i]) {
			newAis = append(newAis, ais[i])
		}
	}
	return newAis
}

func (ais SerpItems) Filter(
	category, dropCityId int,
	packageType, query, to, from, accountType string,
	domestic bool, mobileAppVersion bool) SerpItems {

	categoryPredicate := func(ai SerpItem) bool {
		if category != 0 {
			return ai.ItemCategoryId == category || ai.ParentItemCategoryId == category || ai.ParentParentItemCategoryId == category
		}
		return true
	}

	accountTypePredicate := func(ai SerpItem) bool {
		switch accountType {
		case "gold":
			return ai.StoreIsGoldAccount
		case "silver":
			return ai.StoreIsSilverAccount
		case "bronze":
			return ai.StoreIsBronzeAccount
		case "free":
			return ai.StoreIsFreeAccount
		default:
			return true
		}
	}

	typePredicate := func(ai SerpItem) bool {
		if packageType != "all" {
			return ai.Type == packageType
		}
		return true
	}

	shipingToPredicate := func(ai SerpItem) bool {
		if to == "" {
			return true
		}
		if mobileAppVersion {
			return (ai.CountryNameEnShippingTo == "Worldwide" || ai.CountryNameEnShippingTo == to)
		}

		return ai.CountryNameEnShippingTo == to
	}

	shipingFromPredicate := func(ai SerpItem) bool {
		if from == "" {
			return true
		}
		return ai.CountryNameEnShippingFrom == from
	}

	cityPredicate := func(ai SerpItem) bool {
		if dropCityId == 0 {
			return true
		}
		return ai.DropCityId == dropCityId
	}

	domesticPredicate := func(ai SerpItem) bool {
		if !domestic {
			return true
		}
		return ai.CountryNameEnShippingFrom == ai.CountryNameEnShippingTo
	}

	filteredSerpItems := ais.
		Where(typePredicate).
		Where(categoryPredicate).
		Where(shipingToPredicate).
		Where(shipingFromPredicate).
		Where(cityPredicate).
		Where(accountTypePredicate).
		Where(domesticPredicate)

	return filteredSerpItems
}

func (ais SerpItems) DropCitiesList() []City {
	locationMap := map[int]City{}
	for _, a := range ais {
		locationMap[a.DropCityId] = a.GeoCity
	}
	locations := []City{}
	for _, city := range locationMap {
		locations = append(locations, city)
	}
	return locations
}

func (ais SerpItems) ShippingToList() []string {
	locationMap := map[string]bool{}
	for _, a := range ais {
		locationMap[a.CountryNameEnShippingTo] = true
	}
	locations := []string{}
	for l := range locationMap {
		locations = append(locations, l)
	}
	sort.Strings(locations)
	return locations
}

func (ais SerpItems) ShippingFromList() []string {
	locationMap := map[string]bool{}
	for _, a := range ais {
		locationMap[a.CountryNameEnShippingFrom] = true
	}
	locations := []string{}
	for l := range locationMap {
		locations = append(locations, l)
	}
	sort.Strings(locations)
	return locations
}

func (ais SerpItems) SerpStores() SerpStores {
	vendorsMap := map[string]SerpStore{}
	for _, a := range ais {

		storeLevel := CalculateStoreLevel(
			StoreStats{
				NumberOfReleasedTransactions: int(a.StoreBitcoinTxNumber + a.StoreBitcoinCashTxNumber + a.StoreEthereumTxNumber),
			},
			a.StoreRegistrationDate,
		)

		vendorsMap[a.Storename] = SerpStore{

			// Basic info
			Storename:        a.Storename,
			LastLoginDate:    a.StoreLastLoginDate,
			RegistrationDate: a.StoreRegistrationDate,
			ShortDescription: a.StoreDescription,
			IsTrusted:        a.StoreIsTrusted,

			// Numerical characteristics
			Level: storeLevel,
			Score: a.StoreScore,

			// Account Type
			IsFreeAccount:   a.StoreIsFreeAccount,
			IsGoldAccount:   a.StoreIsGoldAccount,
			IsSilverAccount: a.StoreIsSilverAccount,
			IsBronzeAccount: a.StoreIsBronzeAccount,

			// Tx Stats
			BitcoinTxNumber:     a.StoreBitcoinTxNumber,
			BitcoinTxVolume:     a.StoreBitcoinTxVolume,
			BitcoinCashTxNumber: a.StoreBitcoinCashTxNumber,
			BitcoinCashTxVolume: a.StoreBitcoinCashTxVolume,
			EthereumTxNumber:    a.StoreEthereumTxNumber,
			EthereumTxVolume:    a.StorerEthereumTxVolume,

			CategoriesNameEn: a.CategoriesNameEn, // Used in /front page
		}
	}

	stores := SerpStores{}
	for _, v := range vendorsMap {
		stores = append(stores, v)
	}

	return stores
}

func (vvs SerpStores) Sort(sortyBy string) SerpStores {

	var sortByFunc func(int, int) bool

	switch sortyBy {
	case "new":
		sortByFunc = func(i, j int) bool {
			return vvs[i].RegistrationDate.After(vvs[j].RegistrationDate)
		}
	case "date_logged_in":
		sortByFunc = func(i, j int) bool {
			return vvs[i].LastLoginDate.After(vvs[j].LastLoginDate)
		}
	case "popularity":
		sortByFunc = func(i, j int) bool {
			return int(vvs[i].Level) > int(vvs[j].Level)
		}
	case "date_added":
		sortByFunc = func(i, j int) bool {
			return vvs[i].RegistrationDate.After(vvs[j].RegistrationDate)
		}
	case "rating":
		sortByFunc = func(i, j int) bool {
			return vvs[i].Score > vvs[j].Score
		}
	default:
		sortByFunc = func(i, j int) bool { return true }
	}

	sort.Slice(vvs, sortByFunc)
	return vvs
}

/*
	Database Queries
*/

func PriceInCurrencies(items []SerpItem) {
	for i := range items {
		items[i].Price = map[string][2]float64{
			"AUD": items[i].GetPrice("AUD"),
			"BCH": items[i].GetPrice("BCH"),
			"BTC": items[i].GetPrice("BTC"),
			"ETH": items[i].GetPrice("ETH"),
			"EUR": items[i].GetPrice("EUR"),
			"GBP": items[i].GetPrice("GBP"),
			"RUB": items[i].GetPrice("RUB"),
			"USD": items[i].GetPrice("USD"),
		}
	}
}

func SetStoreValues(items []SerpItem) {
	for i := range items {
		items[i].StoreLevel = CalculateStoreLevel(StoreStats{
			NumberOfReleasedTransactions: int(
				items[i].StoreBitcoinTxNumber +
					items[i].StoreBitcoinCashTxNumber +
					items[i].StoreEthereumTxNumber),
		}, items[i].StoreRegistrationDate)
		items[i].StoreScore = float64(int(items[i].StoreScore*100)) / float64(100.0)
		items[i].ItemScore = float64(int(items[i].ItemScore*100)) / float64(100.0)

	}

}

func FindSerpItems() SerpItems {

	items := []SerpItem{}
	database.
		Table("vm_available_items").
		Preload("GeoCity").
		Find(&items)

	PriceInCurrencies(items)
	SetStoreValues(items)

	return SerpItems(items)
}

func FindFilteredSerpItems(query string) SerpItems {

	items := []SerpItem{}
	searchResults := SearchItems(query)
	database.Raw(`
		     SELECT c.* FROM
		     vm_available_items c 
		     JOIN (  
		       SELECT * FROM
				     unnest(
				       array[?]) with ordinality
		     ) as x 
		     (item_uuid, ordering) 
		     ON c.item_uuid = x.item_uuid 
		     ORDER BY x.ordering
		     `, searchResults).Scan(&items)
	PriceInCurrencies(items)
	SetStoreValues(items)

	return SerpItems(items)
}

/*
	Utils
*/

func inSet(s string, ss []string) bool {
	for _, i := range ss {
		if i == s {
			return true
		}
	}
	return false
}

/*
	Database Views
*/

func setupSerpItemsView() {

	database.Exec("DROP VIEW IF EXISTS v_available_items CASCADE;")

	query := fmt.Sprintf(`
		CREATE VIEW v_available_items AS (
		  SELECT * FROM
			(
				select 
					v_packages.item_uuid,
					v_packages.drop_city_id,
					v_packages.country_name_en_shipping_from,
					v_packages.country_name_en_shipping_to,
					v_packages.currency,
					v_packages.type,
					
					min(v_packages.price) as min_price,
					max(v_packages.price) as max_price,
					
					stores.uuid as store_uuid,
					stores.short_description as store_description,
					stores.storename as storename,
					stores.is_free_account as store_is_free_account,
					stores.is_gold_account as store_is_gold_account,
					stores.is_silver_account as store_is_silver_account,
					stores.is_bronze_account as store_is_bronze_account,
					stores.is_suspended as store_is_suspended,
					stores.is_trusted as store_is_trusted,
					stores.is_allowed_to_sell as store_is_allowed_to_sell,
					stores.last_login_date as store_last_login_date,
					stores.registration_date as store_registration_date,
					
					items.created_at as item_created_at, 
					items.name as item_name,
					items.description as item_description,
					items.item_category_id,
					items.reviewed_by_user_uuid,
					
					ic_parent.id as parent_item_category_id,
					ic_parent.parent_id as parent_parent_item_category_id,
					
					COALESCE(avg(store_rating.seller_score), 0) as store_score,
					COALESCE(count(store_rating.seller_score), 0) as store_score_count,
					
					COALESCE(avg(item_rating.item_score), 0) as item_score,
					COALESCE(count(item_rating.item_score), 0) as item_score_count,
					
					AVG(COALESCE(v_store_bitcoin_tx_stats.tx_number, 0)) as store_bitcoin_tx_number, 
					AVG(COALESCE(v_store_bitcoin_tx_stats.tx_volume, 0)) as store_bitcoin_tx_volume,
					AVG(COALESCE(v_store_bitcoin_cash_tx_stats.tx_number, 0)) as store_bitcoin_cash_tx_number, 
					AVG(COALESCE(v_store_bitcoin_cash_tx_stats.tx_volume, 0)) as store_bitcoin_cash_tx_volume,
					AVG(COALESCE(v_store_ethereum_tx_stats.tx_number, 0)) as store_ethereum_tx_number, 
					AVG(COALESCE(v_store_ethereum_tx_stats.tx_volume, 0)) as store_ethereum_tx_volume,
					
					AVG(COALESCE(v_item_bitcoin_tx_stats.tx_number, 0)) as item_bitcoin_tx_number,
					AVG(COALESCE(v_item_bitcoin_tx_stats.tx_volume, 0)) as item_bitcoin_tx_volume,
					AVG(COALESCE(v_item_bitcoin_cash_tx_stats.tx_number, 0)) as item_bitcoin_cash_tx_number,
					AVG(COALESCE(v_item_bitcoin_cash_tx_stats.tx_volume, 0)) as item_bitcoin_cash_tx_volume,
					AVG(COALESCE(v_item_ethereum_tx_stats.tx_number, 0)) as item_ethereum_tx_number,
					AVG(COALESCE(v_item_ethereum_tx_stats.tx_volume, 0)) as item_ethereum_tx_volume,
					
					(select count(*) from store_warnings uw where uw.store_uuid=stores.uuid and severety='GREEN' and deleted_at IS NULL and is_approved=true and uw.created_at >= now() - interval '%d hours') as number_of_green_warnings,
					(select count(*) from store_warnings uw where uw.store_uuid=stores.uuid and severety='YELLOW' and deleted_at IS NULL and is_approved=true and uw.created_at >= now() - interval '%d hours') as number_of_yellow_warnings,
					(select count(*) from store_warnings uw where uw.store_uuid=stores.uuid and severety='RED' and deleted_at IS NULL and is_approved=true and uw.created_at >= (now() - interval '%d hours')) as number_of_red_warnings
				
				FROM v_packages 
					join items on items.uuid = v_packages.item_uuid
					left join v_store_bitcoin_tx_stats on v_store_bitcoin_tx_stats.store_uuid = items.store_uuid
					left join v_store_bitcoin_cash_tx_stats on v_store_bitcoin_cash_tx_stats.store_uuid = items.store_uuid
					left join v_store_ethereum_tx_stats on v_store_ethereum_tx_stats.store_uuid = items.store_uuid
					left join v_item_bitcoin_tx_stats on v_item_bitcoin_tx_stats.item_uuid = items.uuid
					left join v_item_bitcoin_cash_tx_stats on v_item_bitcoin_cash_tx_stats.item_uuid = items.uuid
					left join v_item_ethereum_tx_stats on v_item_ethereum_tx_stats.item_uuid = items.uuid
					join stores on stores.uuid = items.store_uuid
					left join item_categories ic on ic.id = items.item_category_id
					left join item_categories ic_parent on ic_parent.id = ic.parent_id
					left join rating_reviews store_rating on store_rating.store_uuid = items.store_uuid
					left join rating_reviews item_rating on item_rating.item_uuid = v_packages.item_uuid
				
				WHERE 
					items.deleted_at IS NULL AND 
					stores.is_suspended = false AND
					stores.is_on_vacation = false AND
					ic.hidden = false
				
				GROUP BY 
					stores.uuid,
					stores.storename, 
					stores.is_gold_account,
					stores.is_silver_account,
					stores.is_bronze_account,
					stores.is_free_account,
					stores.is_suspended,
					stores.is_trusted,
					stores.is_allowed_to_sell, 
					stores.registration_date,
					v_packages.item_uuid, 
					v_packages.drop_city_id,
					v_packages.country_name_en_shipping_from,
					v_packages.country_name_en_shipping_to,
					v_packages.currency,
					v_packages.type,
					store_rating.store_uuid, 
					item_rating.item_uuid,  
					items.created_at,
					items.name, 
					items.description,
					items.item_category_id,
					items.reviewed_by_user_uuid,
					parent_item_category_id,
					parent_parent_item_category_id
		) ais
		WHERE 
			number_of_red_warnings=0 AND 
			number_of_yellow_warnings < 3 AND
			number_of_green_warnings < 6 AND
			store_is_suspended=false
	);`, int(GREEN_WARNING_DURATION.Hours()), int(YELLOW_WARNING_DURATION.Hours()), int(RED_WARNING_DURATION.Hours()))

	database.Exec(query)

	database.Exec("DROP MATERIALIZED VIEW IF EXISTS vm_available_items CASCADE;")
	database.Exec(`
		CREATE MATERIALIZED VIEW vm_available_items AS (
			SELECT 
				* 
			FROM 
				v_available_items
	);`)

	database.Exec("CREATE UNIQUE INDEX idx_vm_available_items ON vm_available_items (item_uuid, drop_city_id,country_name_en_shipping_from,country_name_en_shipping_to,currency,min_price,max_price);")

}

func RefreshSerpItemsMaterializedView() {
	database.Exec("REFRESH MATERIALIZED VIEW CONCURRENTLY vm_available_items;")
}
