package marketplace

import (
	"github.com/gocraft/web"
	"net/http"
	"strconv"
)

func (c *Context) SaveShippingOption(w web.ResponseWriter, r *web.Request) {

	var (
		name        = r.FormValue("name")
		priceUsdStr = r.FormValue("price")
	)

	priceFloat, err := strconv.ParseFloat(priceUsdStr, 64)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	shippingOption := ShippingOption{
		Name:      name,
		PriceUSD:  priceFloat,
		StoreUuid: c.ViewUserStore.Uuid,
	}

	err = shippingOption.Save()
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	http.Redirect(w, r.Request, "/settings/store?section=vendor", 302)
}

func (c *Context) DeleteShippingOption(w web.ResponseWriter, r *web.Request) {

	idint, err := strconv.ParseInt(r.FormValue("id"), 10, 64)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	option, err := FindShippingOptionById(uint(idint))
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	if option.StoreUuid != c.ViewUserStore.Uuid && !c.ViewUser.IsAdmin && !c.ViewUser.IsStaff {
		http.NotFound(w, r.Request)
		return
	}

	err = option.Remove()
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	http.Redirect(w, r.Request, "/settings/store?section=vendor", 302)
}
