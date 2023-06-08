package marketplace

import (
	"fmt"
	"github.com/gocraft/web"
	"net/http"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ViewListAdvertisings(w web.ResponseWriter, r *web.Request) {
	c.Advertisings = FindAdvertisingByStore(c.ViewUserStore.Uuid)
	println("!!!")
	println(len(c.Advertisings))
	c.AdvertisingCost = MARKETPLACE_SETTINGS.AdvertisingCost
	items := FindItemsForStore(c.ViewUserStore.Uuid)
	c.ViewItems = items.ViewItems(c.ViewUser.Language)

	c.USDBTCRate = GetCurrencyRate("BTC", "USD")

	util.RenderTemplate(w, "advertising/list", c)
}

func (c *Context) AddAdvertisingsPOST(w web.ResponseWriter, r *web.Request) {

	var (
		count    = 1000
		comment  = r.FormValue("text")
		itemUuid = r.FormValue("item")
		priceUSD = MARKETPLACE_SETTINGS.AdvertisingCost
	)

	c.USDBTCRate = GetCurrencyRate("BTC", "USD")

	price := priceUSD / c.USDBTCRate

	userWallets := c.ViewUser.User.FindUserBitcoinWallets()
	if userWallets.Balance().Balance < price {
		c.Error = fmt.Sprintf("Please deposit %f BTC to your onsite wallet.", price)
		c.ViewListAdvertisings(w, r)
		return
	}

	addr, err := apis.GenerateBTCAddress("advertising")
	if err != nil {
		c.Error = err.Error()
		c.ViewListAdvertisings(w, r)
		return
	}

	_, err = userWallets.Send(addr, price)
	if err != nil {
		c.Error = err.Error()
		c.ViewListAdvertisings(w, r)
		return
	}

	err = CreateAdvertising(comment, count, itemUuid)
	if err != nil {
		c.Error = err.Error()
		c.ViewListAdvertisings(w, r)
		return
	}

	http.Redirect(
		w,
		r.Request,
		"/store-admin/"+c.ViewStore.Storename+"/advertisings",
		302,
	)

}
