package marketplace

import (
	"github.com/gocraft/web"
	"math/rand"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) listOfferItems(w web.ResponseWriter, r *web.Request) {
	c.parseItemsQuery(w, r, false)
	newArrivals := FindItemsNewArrivals()
	topOther := FindItemsTopOther()
	topDrugs := FindItemsTopDrugs()
	topVendors := FindVendorsTop()	
	newVendors := FindVendorsNew()
	
	i1 := rand.Intn(100)
	i2 := rand.Intn(100)
	i3 := rand.Intn(100)

	tempSerpItems := FindSerpItems().Sort("popularity")
	serpItems := SerpItems{tempSerpItems[i1], tempSerpItems[i2], tempSerpItems[i3]}

	c.OfferItemsFold1 = serpItems.ViewSerpItems(c.ViewUser.Language, c.ViewUser.Currency)
	c.OfferItemsFold2 = newArrivals.ViewSerpItems(c.ViewUser.Language, c.ViewUser.Currency)
	c.OfferItemsFold4 = topDrugs.ViewSerpItems(c.ViewUser.Language, c.ViewUser.Currency)
	c.OfferItemsFold5 = topOther.ViewSerpItems(c.ViewUser.Language, c.ViewUser.Currency)
	c.OfferTopVendors = topVendors.ViewSerpStores(c.ViewUser.Language)
	c.OfferNewVendors = newVendors.ViewSerpStores(c.ViewUser.Language)

	itemCategories := CacheGetCategories(c.SelectedPackageType, c.ShippingTo, c.ShippingFrom, c.CityID)
	c.ViewItemCategories = itemCategories.ViewCategories(c.ViewUser.Language)

	c.CountVendors = GetCountVendors()
	c.CountItems = GetCountItems()

	c.ShippingToList = CacheShippingToList()
}

/*
  Controllers
*/
func (c *Context) FrontPageItems(w web.ResponseWriter, r *web.Request) {
	c.listOfferItems(w, r)
	util.RenderTemplate(w, "front_page/front_page", c)
}
