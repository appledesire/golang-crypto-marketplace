package marketplace

import (
	"math"
	"net/http"
	"strconv"

	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) parseItemsQuery(w web.ResponseWriter, r *web.Request, mobbileAppVersion bool) {

	if len(r.URL.Query()["shipping-to"]) > 0 {
		c.ShippingTo = r.URL.Query()["shipping-to"][0]
	}
	if len(r.URL.Query()["shipping-from"]) > 0 {
		c.ShippingFrom = r.URL.Query()["shipping-from"][0]
	}

	if mobbileAppVersion && len(r.URL.Query()["category"]) == 0 {
		c.CategoryID = 1
	} else if len(r.URL.Query()["category"]) > 0 {
		cid, _ := strconv.ParseInt(r.URL.Query()["category"][0], 10, 64)
		c.CategoryID = int(cid)
	}

	if c.CategoryID != 0 {
		ic, err := FindCategoryByID(c.CategoryID)
		if err == nil {
			if ic.ParentCategory() != nil {
				if ic.ParentCategory().ParentCategory() != nil {
					c.Category = ic.ParentCategory().ParentCategory().NameEn
				} else {
					c.Category = ic.ParentCategory().NameEn
				}
				c.SubCategory = ic.NameEn
			} else {
				c.Category = ic.NameEn
			}
		}
	}

	if len(r.URL.Query()["city-id"]) > 0 {
		cityId, err := strconv.ParseInt(r.URL.Query()["city-id"][0], 10, 32)
		if err != nil || cityId < 0 {
			http.NotFound(w, r.Request)
			return
		}
		c.CityID = int(cityId)

		city, err := FindCityByID(c.CityID)
		if err == nil {
			c.City = city.NameEn
		} else {
			loc := GetLocalization(c.ViewUser.Language)
			c.City = loc.Items.AllCountries
		}
	} else {
		loc := GetLocalization(c.ViewUser.Language)
		c.City = loc.Items.AllCountries
	}

	if len(r.URL.Query()["page"]) > 0 {
		strPage := r.URL.Query()["page"][0]
		page, err := strconv.ParseInt(strPage, 10, 32)
		if err != nil || page < 0 {
			http.NotFound(w, r.Request)
			return
		}
		c.Page = int(page) - 1
	}

	if len(r.URL.Query()["query"]) > 0 {
		c.Query = r.URL.Query()["query"][0]
	}

	if len(r.URL.Query()["domestic"]) > 0 && r.URL.Query()["domestic"][0] == "1" {
		c.Domestic = true
	}

	if len(r.URL.Query()["sortby"]) > 0 {
		c.SortBy = r.URL.Query()["sortby"][0]
	} else {
		c.SortBy = "popularity"
	}

	if len(r.URL.Query()["account"]) > 0 {
		c.Account = r.URL.Query()["account"][0]
	} else {
		c.Account = "all"
	}

	if len(r.URL.Query()["shipping-from"]) > 0 {
		c.ShippingFrom = r.URL.Query()["shipping-from"][0]
	}

	if len(r.URL.Query()["shipping-to"]) > 0 {
		c.ShippingTo = r.URL.Query()["shipping-to"][0]
	}

	if mobbileAppVersion {
		c.SelectedPackageType = "mail"
	} else {
		c.SelectedPackageType = r.PathParams["package_type"]
		if c.SelectedPackageType == "" {
			c.SelectedPackageType = "all"
		}
	}

}

func (c *Context) listAvailableItems(w web.ResponseWriter, r *web.Request, itemsPerPage int, mobileAppVersion bool) {
	c.parseItemsQuery(w, r, mobileAppVersion)
	ais := SerpItems{}
	filteredSerpItems := SerpItems{}

	if c.Query != "" {
		ais = FindFilteredSerpItems(c.Query)
		filteredSerpItems = ais
	} else {
		ais = FindSerpItems()
		filteredSerpItems = ais.
			Filter(
				c.CategoryID,
				c.CityID,
				c.SelectedPackageType,
				c.Query,
				c.ShippingTo,
				c.ShippingFrom,
				c.Account,
				c.Domestic,
				mobileAppVersion,
			).
			Sort(c.SortBy)
	}

	menuFilteredItems := ais.Filter(
		c.CategoryID,
		0,
		c.SelectedPackageType,
		c.Query,
		c.ShippingTo,
		c.ShippingFrom,
		c.Account,
		c.Domestic,
		mobileAppVersion,
	)
	numberOfSerpItems := len(filteredSerpItems)

	start := c.Page * itemsPerPage
	if 0 > start {
		start = 0
	}

	finish := start + itemsPerPage
	if numberOfSerpItems < finish {
		finish = numberOfSerpItems
	}

	if finish > len(filteredSerpItems) {
		finish = len(filteredSerpItems) - 1
	}

	if start < 0 {
		http.NotFound(w, r.Request)
		return
	}

	if start > finish {
		http.NotFound(w, r.Request)
		return
	}

	pagedSerpItems := filteredSerpItems[start:finish]

	c.NumberOfPages = int(math.Ceil(float64(numberOfSerpItems) / float64(itemsPerPage)))
	c.ViewSerpItems = pagedSerpItems.ViewSerpItems(c.ViewUser.Language, c.ViewUser.Currency)
	itemCategories := CacheGetCategories(c.SelectedPackageType, c.ShippingTo, c.ShippingFrom, c.CityID)
	c.ViewItemCategories = itemCategories.ViewCategories(c.ViewUser.Language)

	c.ShippingToList = filteredSerpItems.ShippingToList()
	c.ShippingFromList = filteredSerpItems.ShippingFromList()
	c.GeoCities = menuFilteredItems.DropCitiesList()

	// paging
	for i := 0; i < c.NumberOfPages; i++ {
		c.Pages = append(c.Pages, i+1)
	}
	c.Page += 1
}

func (c *Context) listHotDeals(w web.ResponseWriter, r *web.Request) {
	c.parseItemsQuery(w, r, true)
	ais := SerpItems{}
	filteredSerpItems := SerpItems{}

	if c.Query != "" {
		ais = FindFilteredSerpItems(c.Query)
		filteredSerpItems = ais
	} else {
		ais = FindSerpItems()
		filteredSerpItems = ais.
			Filter(
				c.CategoryID,
				c.CityID,
				c.SelectedPackageType,
				c.Query,
				c.ShippingTo,
				c.ShippingFrom,
				c.Account,
				c.Domestic,
				true,
			).
			Sort(c.SortBy)
	}

	numberOfSerpItems := len(filteredSerpItems)

	itemsPerPage := 5

	start := c.Page * itemsPerPage
	if 0 > start {
		start = 0
	}

	finish := start + itemsPerPage
	if numberOfSerpItems < finish {
		finish = numberOfSerpItems
	}

	if finish > len(filteredSerpItems) {
		finish = len(filteredSerpItems) - 1
	}

	if start < 0 {
		http.NotFound(w, r.Request)
		return
	}

	if start > finish {
		http.NotFound(w, r.Request)
		return
	}

	pagedSerpItems := filteredSerpItems[start:finish]
	c.ViewSerpItems = pagedSerpItems.ViewSerpItems(c.ViewUser.Language, c.ViewUser.Currency)
}

func (c *Context) listCategories(w web.ResponseWriter, r *web.Request, mobileAppVersion bool) {
	c.parseItemsQuery(w, r, mobileAppVersion)

	// Mobile App API shows only mail delivery options
	if mobileAppVersion {
		c.SelectedPackageType = "mail"
	}

	itemCategories := CacheGetCategories(c.SelectedPackageType, c.ShippingTo, c.ShippingFrom, c.CityID)

	// Mobile App API shows only drug categories
	if mobileAppVersion {
		filteredCategories := ItemCategories{}
		for _, ic := range itemCategories {
			if ic.ID == 1 {
				filteredCategories = append(filteredCategories, ic)
			}
		}
		itemCategories = filteredCategories
	}

	c.ViewItemCategories = itemCategories.ViewCategories(c.ViewUser.Language)

	// c.ShippingToList = filteredSerpItems.ShippingToList()
	// c.ShippingFromList = filteredSerpItems.ShippingFromList()
	// c.GeoCities = menuFilteredItems.DropCitiesList()
}

func (c *Context) ListSerpItems(w web.ResponseWriter, r *web.Request) {

	c.Advertisings = GetAdvertisings(1)

	c.listAvailableItems(w, r, MARKETPLACE_SETTINGS.ItemsPerPage, false)
	util.RenderTemplate(w, "serp/list_items", c)
}

func (c *Context) listSerpVendors(w web.ResponseWriter, r *web.Request) {

	c.parseItemsQuery(w, r, false)

	ais := FindSerpItems()

	filteredSerpItems := ais.Filter(
		c.CategoryID,
		c.CityID,
		c.SelectedPackageType,
		c.Query,
		c.ShippingTo,
		c.ShippingFrom,
		c.Account,
		c.Domestic,
		false,
	)

	itemsPerPage := MARKETPLACE_SETTINGS.ItemsPerPage

	vendors := filteredSerpItems.SerpStores().Sort(c.SortBy)

	menuFilteredItems := ais.Filter(
		c.CategoryID,
		0,
		c.SelectedPackageType,
		c.Query,
		c.ShippingTo,
		c.ShippingTo,
		c.Account,
		c.Domestic,
		false,
	)
	numberOfSerpItems := len(vendors)

	start := c.Page * itemsPerPage
	if 0 > start {
		start = 0
	}

	finish := start + itemsPerPage
	if numberOfSerpItems < finish {
		finish = numberOfSerpItems
	}

	pagedVendors := vendors[start:finish]

	c.NumberOfPages = int(math.Ceil(float64(numberOfSerpItems) / float64(itemsPerPage)))
	c.ViewSerpStores = pagedVendors.ViewSerpStores(c.ViewUser.Language)
	itemCategories := CacheGetCategories(c.SelectedPackageType, c.ShippingTo, c.ShippingFrom, c.CityID)
	c.ViewItemCategories = itemCategories.ViewCategories(c.ViewUser.Language)

	c.ShippingToList = filteredSerpItems.ShippingToList()
	c.ShippingFromList = filteredSerpItems.ShippingFromList()
	c.GeoCities = menuFilteredItems.DropCitiesList()

	// paging
	for i := 0; i < c.NumberOfPages; i++ {
		c.Pages = append(c.Pages, i+1)
	}
	c.Page += 1
}

func (c *Context) ListSerpVendors(w web.ResponseWriter, r *web.Request) {
	c.listSerpVendors(w, r)
	// rendering
	util.RenderTemplate(w, "serp/list_vendors", c)
}
