package marketplace

import (
	"crypto/sha256"
	"encoding/hex"
	"errors"
	"fmt"
	"math"
	"math/rand"
	"sort"
	"strings"
	"time"

	"github.com/dustin/go-humanize"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/settings"
)

/*
	Models
*/

type Package struct {
	Uuid        string `json:"uuid" gorm:"primary_key"`
	Name        string `json:"name"`
	Description string `json:"description"`
	Type        string `json:"type" gorm:"index"`
	ItemUuid    string `json:"item_uuid" gorm:"index"`
	StoreUuid   string `json:"store_uuid" gorm:"index"`
	// Drop
	Latitude  float64 `json:"latitude"`
	Longitude float64 `json:"longitude"`
	// New GEO
	CountryNameEnShippingFrom string `json:"country_name_en_shippinfg_from" gorm:"index"`
	CountryNameEnShippingTo   string `json:"country_name_en_shipping_to" gorm:"index"`
	DropCityId                int    `json:"drop_city_id" gorm:"index"`
	CityMetroStationUuid      string `json:"city_metro_station_uuid" gorm:"index"`
	// Associations
	Item             Item             `json:"-"`
	GeoCity          City             `gorm:"ForeignKey:DropCityId" json:"-"`
	Store            Store            `gorm:"ForeignKey:StoreUuid" json:"-"`
	CityMetroStation CityMetroStation `gorm:"ForeignKey:CityMetroStationUuid" json:"-"`
	GeoCountryFrom   Country          `gorm:"ForeignKey:CountryNameEnShippingFrom" json:"-"`
	GeoCountryTo     Country          `gorm:"ForeignKey:CountryNameEnShippingTo" json:"-"`
	PackagePrice     PackagePrice     `gorm:"ForeignKey:Uuid;AssociationForeignKey:Uuid" json:"price"`
	// TimeStamps
	CreatedAt *time.Time `json:"created_at" gorm:"index"`
	UpdatedAt *time.Time `json:"updated_at" gorm:"index"`
	DeletedAt *time.Time `json:"deleted_at" gorm:"index"`
}

type PackagePrice struct {
	Uuid     string  `json:"uuid" gorm:"primary_key"`
	Currency string  `json:"currency"`
	Price    float64 `json:"price"`
}

type Packages []Package

func (rcv Packages) MaxBy(less func(Package, Package) bool) (result Package, err error) {
	l := len(rcv)
	if l == 0 {
		err = errors.New("Cannot determine the MaxBy of an empty slice")
		return
	}
	m := 0
	for i := 1; i < l; i++ {
		if rcv[i].Uuid != rcv[m].Uuid && !less(rcv[i], rcv[m]) {
			m = i
		}
	}
	result = rcv[m]
	return
}

func (rcv Packages) MinBy(less func(Package, Package) bool) (result Package, err error) {
	l := len(rcv)
	if l == 0 {
		err = errors.New("Cannot determine the Min of an empty slice")
		return
	}
	m := 0
	for i := 1; i < l; i++ {
		if less(rcv[i], rcv[m]) {
			m = i
		}
	}
	result = rcv[m]
	return
}

func (itms Packages) Where(fnc func(Package) bool) Packages {
	filtered := Packages{}
	for _, i := range itms {
		if fnc(i) {
			filtered = append(filtered, i)
		}
	}
	return filtered
}

type Category struct {
	Name          string
	NameEncoded   string
	Count         int
	ID            string
	Subcategories []Category
}

type CaterogiesByCount []Category

func (s CaterogiesByCount) Len() int {
	return len(s)
}

func (s CaterogiesByCount) Swap(i, j int) {
	s[i], s[j] = s[j], s[i]
}

func (s CaterogiesByCount) Less(i, j int) bool {
	return s[i].Count > s[j].Count
}

/*
	Model Methods
*/

func isInsuranceRequired(itemUuid string, price float64, currency string) (bool, error) {
	item, err := FindItemByUuid(itemUuid)
	if err != nil {
		return false, err
	}

	insuredItem := false
	for _, cat := range MARKETPLACE_SETTINGS.InsuredCategories {
		var (
			category       = item.ItemCategory
			parentCategory = item.ItemCategory.ParentCategory()
		)
		if category.ID == cat || (parentCategory != nil && parentCategory.ID == cat) {
			insuredItem = true
		}
	}

	if !insuredItem {
		return false, nil
	}

	depositsSummary := FindDepositsByStoreUuid(item.StoreUuid).DepositsSummary()
	return depositsSummary[currency] < price, nil

}

func (a Package) PreValidate(step int) error {
	if a.Name == "" {
		return errors.New("Empty name")
	}

	if a.ItemUuid == "" {
		return errors.New("Invalid item UUID")
	}

	if a.PackagePrice.Currency == "" || a.PackagePrice.Price == 0.0 {
		return errors.New("Invalid package price")
	}

	insuranceRequired, err := isInsuranceRequired(a.ItemUuid, a.PackagePrice.Price, a.PackagePrice.Currency)
	if err != nil {
		return err
	}

	if insuranceRequired {
		return errors.New(fmt.Sprintf("You need to add insurance deposit %f %s to list this item", a.PackagePrice.Price, a.PackagePrice.Currency))
	}

	item, _ := FindItemByUuid(a.ItemUuid)
	if item == nil {
		return errors.New("No such item")
	}

	if step >= 2 {
		if a.Type == "digital" {
			if a.Description == "" {
				return errors.New("Empty description")
			}
		}
		if a.Type == "mail" {
			if a.CountryNameEnShippingTo == "" {
				return errors.New("Empty CountryNameEnShippingTo")
			}
			if a.CountryNameEnShippingFrom == "" {
				return errors.New("Empty CountryNameEnShippingFrom")
			}
		}
	}

	if step >= 3 {
		if a.Type == "drop" || a.Type == "drop preorder" {
			if a.Description == "" {
				return errors.New("Empty description")
			}
		}
		if a.Type == "drop" {
			if a.Longitude == 0.0 && a.Latitude == 0.0 {
				return errors.New("Wrong coordinates")
			}
		}
	}

	if step >= 4 {
		// nothing here
	}

	return nil
}

func (a Package) Validate() error {
	err := a.PreValidate(0)
	if err != nil {
		return err
	}

	if a.Uuid == "" {
		return errors.New("Empty UUID")
	}
	switch a.Type {
	case "drop", "drop preorder":
		if a.DropCityId == 0 {
			return errors.New("Empty drop city id")
		}
		if a.CountryNameEnShippingTo == "" {
			return errors.New("Empty CountryNameEnShippingTo")
		}
		if a.Description == "" {
			return errors.New("Empty description")
		}
		break
	case "mail":
		if a.CountryNameEnShippingTo == "" {
			return errors.New("Empty shipping to")
		}
		if a.CountryNameEnShippingFrom == "" {
			return errors.New("Empty shipping from")
		}
		break
	case "digital", "service":
		break
	default:
		return errors.New("Wrong package type")
	}
	return nil
}

func (a Package) GetPrice(currency string) float64 {
	return a.PackagePrice.Price / GetCurrencyRate(currency, a.PackagePrice.Currency)
}

func (as Packages) MinPrice(currency string) float64 {
	price := func(a, b Package) bool {
		return a.GetPrice(currency) < b.GetPrice(currency)
	}
	cheapest, _ := as.MinBy(price)
	return cheapest.GetPrice(currency)
}

func (as Packages) MaxPrice(currency string) float64 {
	price := func(a, b Package) bool {
		return a.GetPrice(currency) < b.GetPrice(currency)
	}
	dearest, _ := as.MaxBy(price)
	return dearest.GetPrice(currency)
}

func (packages Packages) ShippingFromList() []string {

	viewPackages := packages.ViewPackages()

	locationMap := map[string]bool{}
	for _, a := range viewPackages {
		locationMap[a.CountryNameEnShippingFrom] = true
	}

	locations := []string{}
	for l := range locationMap {
		locations = append(locations, l)
	}
	sort.Strings(locations)
	return locations
}

func (packages Packages) DropCitiesList() []City {

	viewPackages := packages.ViewPackages()

	locationMap := map[int]bool{}
	for _, a := range viewPackages {
		locationMap[a.DropCityId] = true
	}

	locations := []City{}
	for cityId := range locationMap {
		city, err := FindCityByID(cityId)
		if err == nil && city != nil {
			locations = append(locations, *city)
		}
	}
	return locations
}

func (packages Packages) ShippingToList() []string {

	viewPackages := packages.ViewPackages()

	locationMap := map[string]bool{}
	for _, a := range viewPackages {
		locationMap[a.CountryNameEnShippingTo] = true
	}

	locations := []string{}
	for l := range locationMap {
		locations = append(locations, l)
	}
	sort.Strings(locations)
	return locations
}

/*
	Database methods
*/

func (u Package) Save() error {
	err := u.Validate()
	if err != nil {
		return err
	}
	return u.SaveToDatabase()
}

func (u Package) SaveToDatabase() error {
	if existing, _ := FindPackageByUuid(u.Uuid); existing == nil {
		return database.Create(&u).Error
	}

	return database.Save(&u).Error
}

func (a Package) Remove() error {
	if a.Uuid == "" {
		return nil
	}
	return database.Delete(&a).Error
}

func (u PackagePrice) Save() error {
	if existing, _ := FindPackagePriceByUuid(u.Uuid); existing == nil {
		return database.Create(&u).Error
	}
	return database.Save(&u).Error
}

/*
	Relations
*/

func (a Package) Reservation() *Reservation {
	reservation, _ := FindReservationByUuid(a.Uuid)
	return reservation
}

func (a Package) Transaction() *Transaction {
	reservation := a.Reservation()
	if reservation == nil {
		return nil
	}
	return &reservation.Transaction
}

/*
	Queries
*/

func GetAllPackages() Packages {
	var packages []Package
	database.Find(&packages)
	return packages
}

func FindPackageByUuid(uuid string) (*Package, error) {
	var item Package
	err := database.
		Preload("Item").
		Preload("PackagePrice").
		Preload("GeoCity").
		Preload("CityMetroStation").
		Preload("GeoCountryFrom").
		Preload("GeoCountryTo").
		Preload("Item.ItemCategory").
		First(&item, "uuid = ?", uuid).
		Error
	if err != nil {
		return nil, err
	}
	return &item, err
}

func FindPackagePriceByUuid(uuid string) (*PackagePrice, error) {
	var packagePrice PackagePrice
	err := database.
		First(&packagePrice, "uuid = ?", uuid).
		Error
	if err != nil {
		return nil, err
	}
	return &packagePrice, err
}

func FindPackagesByItemUuid(uuid string) Packages {
	packages := []Package{}
	database.
		Joins("join items on items.uuid=packages.item_uuid").
		Where("items.uuid=?", uuid).
		Group("packages.uuid").
		Preload("Item").
		Preload("PackagePrice").
		Preload("GeoCity").
		Preload("CityMetroStation").
		Preload("GeoCountryFrom").
		Preload("GeoCountryTo").
		Preload("Item.ItemCategory").
		Find(&packages)
	return Packages(packages)
}

func FindPaidPackagesForBuyer(uuid string) Packages {
	pcks := Packages{}
	predicate := func(a Package) bool {
		reservation := a.Reservation()
		if reservation != nil {
			return (reservation.IsCompleted()) && (reservation.Transaction.BuyerUuid == uuid)
		}
		return false
	}
	for _, pckg := range GetAllPackages() {
		if predicate(pckg) {
			pcks = append(pcks, pckg)
		}
	}
	return pcks
}

/*
	View Model
*/

type ViewPackage struct {
	*Package
	CompletedAt string
	CreatedAt   string
	Item        Item
	PriceAUD    string
	PriceBTC    string
	PriceBCH    string
	PriceETH    string
	PriceEUR    string
	PriceGBP    string
	PriceRUB    string
	PriceUSD    string
	Currency    string
	// Seller          User
	Status          string
	TransactionUuid string
	Coordinates     string
	Type            string
}

func (a Package) ViewPackage() ViewPackage {

	item := a.Item

	vav := ViewPackage{
		Package:     &a,
		Item:        item,
		PriceAUD:    humanize.Ftoa(a.GetPrice("AUD")),
		PriceBTC:    humanize.Ftoa(a.GetPrice("BTC")),
		PriceBCH:    humanize.Ftoa(a.GetPrice("BCH")),
		PriceETH:    humanize.Ftoa(a.GetPrice("ETH")),
		PriceEUR:    humanize.Ftoa(a.GetPrice("EUR")),
		PriceGBP:    humanize.Ftoa(a.GetPrice("GBP")),
		PriceRUB:    humanize.Ftoa(a.GetPrice("RUB")),
		PriceUSD:    humanize.Ftoa(a.GetPrice("USD")),
		Coordinates: fmt.Sprintf("%f, %f", a.Latitude, a.Longitude),
		Type:        a.Type,
	}

	return vav
}

func (vp ViewPackage) DBModel() Package {
	if vp.Package != nil {
		return *vp.Package
	}
	return Package{}
}

func (avs Packages) ViewPackages() []ViewPackage {
	vavs := []ViewPackage{}
	for _, av := range avs {
		vav := av.ViewPackage()
		vavs = append(vavs, vav)
	}
	return vavs
}

type GroupPackage struct {
	PackageName string `json:"package_name"`

	CountryNameEnShippingFrom string           `json:"country_shipping_from"`
	CountryNameEnShippingTo   string           `json:"country_shipping_to"`
	DropCityId                int              `json:"drop_city_id"`
	GeoCity                   City             `json:"drop_city"`
	CityMetroStation          CityMetroStation `json:"metro_station"`

	PriceAUDStr string  `json:"price_aud"`
	PriceBTCStr string  `json:"price_btc"`
	PriceBCHStr string  `json:"price_bch"`
	PriceETHStr string  `json:"price_eth"`
	PriceEURStr string  `json:"price_eur"`
	PriceGBPStr string  `json:"price_gbp"`
	PriceRUBStr string  `json:"price_rub"`
	PriceUSDStr string  `json:"price_usd"`
	PriceBTC    float64 `json:"-"`
	Category    string  `json:"-"`
	Hash        string  `json:"hash"`
	ItemName    string  `json:"item_name"`
	ItemUuid    string  `json:"item_uuid"`
	Score       float64 `json:"score"`
	Type        string  `json:"type"`
	Storename   string  `json:"-"`
}

type GroupedPackages map[GroupPackage]Packages
type GroupPackagesByPrice []GroupPackage

func (a GroupPackagesByPrice) Len() int      { return len(a) }
func (a GroupPackagesByPrice) Swap(i, j int) { a[i], a[j] = a[j], a[i] }
func (a GroupPackagesByPrice) Less(i, j int) bool {
	if a[i].Score != a[j].Score { // by score
		return a[i].Score > a[j].Score
	} else { // by price
		return a[i].PriceBTC < a[j].PriceBTC
	}
}

func (avs Packages) GroupsTable() GroupedPackages {
	groups := GroupedPackages{}
	for i := range avs {
		var (
			av    = avs[i]
			item  = av.Item
			store = item.Store
			score = item.CalculateScore()
		)
		group := GroupPackage{
			CountryNameEnShippingTo:   av.CountryNameEnShippingTo,
			CountryNameEnShippingFrom: av.CountryNameEnShippingFrom,
			GeoCity:                   av.GeoCity,
			CityMetroStation:          av.CityMetroStation,
			DropCityId:                av.DropCityId,
			ItemName:                  item.Name,
			ItemUuid:                  item.Uuid,
			PackageName:               strings.ToLower(av.Name),
			Storename:                 store.Storename,
			Type:                      av.Type,
			Score:                     score,
			PriceBTC:                  av.GetPrice("BTC"),
			PriceBTCStr:               humanize.Ftoa(av.GetPrice("BTC")),
			PriceBCHStr:               humanize.Ftoa(av.GetPrice("BCH")),
			PriceETHStr:               humanize.Ftoa(av.GetPrice("ETH")),
			PriceUSDStr:               fmt.Sprintf("%d", int(math.Ceil(av.GetPrice("USD")))),
			PriceEURStr:               fmt.Sprintf("%d", int(math.Ceil(av.GetPrice("EUR")))),
			PriceRUBStr:               fmt.Sprintf("%d", int(math.Ceil(av.GetPrice("RUB")))),
			PriceAUDStr:               fmt.Sprintf("%d", int(math.Ceil(av.GetPrice("AUD")))),
			PriceGBPStr:               fmt.Sprintf("%d", int(math.Ceil(av.GetPrice("GBP")))),
		}
		group.Hash = group.Sha256()
		groups[group] = append(groups[group], av)
	}
	return groups
}

func (groups GroupedPackages) GetPackageByHash(hash string) (*Package, error) {
	for group, availabilities := range groups {
		if group.Sha256() == hash {
			radnomIndex := rand.New(rand.NewSource(time.Now().UnixNano())).Intn(len(availabilities))
			pckg := availabilities[radnomIndex]
			return &pckg, nil
		}
	}
	return nil, errors.New("Package not found")
}

func (gas GroupPackage) Sha256() string {
	hash := sha256.New()
	txt := fmt.Sprintf(
		"%s-%s-%s-%d-%s-%s-%s",
		gas.Type,
		gas.CountryNameEnShippingFrom,
		gas.CountryNameEnShippingTo,
		gas.DropCityId,
		gas.PackageName,
		gas.PriceUSDStr,
		gas.CityMetroStation.NameEn,
	)
	hash.Write([]byte(txt))
	md := hash.Sum(nil)
	return hex.EncodeToString(md)[0:10]
}

func (pcks GroupedPackages) GetPackagesPage(pagenumber, pagesize int) ([]GroupPackage, int) {

	var groups []GroupPackage
	for g := range pcks {
		groups = append(groups, g)
	}

	sort.Sort(GroupPackagesByPrice(groups))

	var numberOfPages = int(math.Ceil(float64(len(groups)) / float64(pagesize)))

	pagePackages := []GroupPackage{}

	for index, group := range groups {
		if index >= pagenumber*pagesize && index < (pagenumber+1)*pagesize {
			pagePackages = append(pagePackages, group)
		}
		index += 1
	}

	return pagePackages, numberOfPages
}

type GroupedPackageKey struct {
	Type                      string
	CountryNameEnShippingFrom string
	CountryNameEnShippingTo   string
	City                      string
	CityMetroStation          string
}

func (pcks GroupedPackages) GetGroupPackagesByTypeOriginDestination() map[GroupedPackageKey][]GroupPackage {

	gptod := map[GroupedPackageKey][]GroupPackage{}

	gps, _ := pcks.GetPackagesPage(0, 1024)

	for _, gp := range gps {

		gpk := GroupedPackageKey{
			Type:                      gp.Type,
			CountryNameEnShippingFrom: gp.CountryNameEnShippingFrom,
			CountryNameEnShippingTo:   gp.CountryNameEnShippingTo,
			City:                      gp.GeoCity.NameEn,
			CityMetroStation:          gp.CityMetroStation.NameEn,
		}

		if _, ok := gptod[gpk]; !ok {
			gptod[gpk] = []GroupPackage{}
		}
		gptod[gpk] = append(gptod[gpk], gp)
	}

	return gptod
}

// Create views and other representatives
func setupPackagesView() {
	database.Exec("DROP VIEW IF EXISTS v_packages")

	coolofPeriod := settings.GetSettings().CooloffPeriod
	query := fmt.Sprintf(`
		CREATE VIEW v_packages AS
			SELECT  packages.uuid, 
				packages.name, 
				packages.description,
				packages.type,
				package_prices.currency,
				package_prices.price,
				packages.item_uuid,
				packages.latitude,
				packages.longitude,
				packages.country_name_en_shipping_from,
				packages.country_name_en_shipping_to,
				packages.drop_city_id,
				packages.created_at,
				packages.updated_at,
				packages.deleted_at
			FROM 	packages
			JOIN 	items on items.uuid=packages.item_uuid
			JOIN	package_prices on package_prices.uuid = packages.uuid
			JOIN 	stores on stores.uuid=items.store_uuid
			LEFT OUTER JOIN reservations on reservations.uuid=packages.uuid
			WHERE 
				packages.deleted_at IS NULL
				AND stores.is_suspended = false
				AND stores.last_login_date >= (now() - interval '%d days')
				AND reservations.transaction_uuid IS NULL
			GROUP BY 
				stores.uuid, items.uuid, packages.uuid, package_prices.uuid, reservations.uuid
	`, coolofPeriod)
	database.Exec(query)
}
