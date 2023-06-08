package marketplace

import (
	"net/http"
	"strconv"

	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ActiveReservation(w web.ResponseWriter, r *web.Request) {
	http.NotFound(w, r.Request)
}

func (c *Context) PreBookPackage(w web.ResponseWriter, r *web.Request) {
	reservations := FindActiveReservationsForBuyer(c.ViewUser.Uuid)
	if len(reservations) > 10 {
		redirectUrl := "/user/active_reservation"
		http.Redirect(w, r.Request, redirectUrl, 302)
		return
	}
	groups := c.ViewItem.Item.PackagesWithoutReservation().GroupsTable()
	for group := range groups {
		if group.Sha256() == r.PathParams["hash"] {
			c.GroupAvailability = &group
			util.RenderTemplate(w, "reservation/pre_book", c)
			return
		}
	}
	http.NotFound(w, r.Request)
}

func (c *Context) BookPackage(w web.ResponseWriter, r *web.Request) {
	transactionCount := 0
	for _, t := range FindTransactionsForBuyer(c.ViewUser.Uuid) {
		if t.CurrentPaymentStatus() == "PENDING" {
			transactionCount += 1
		}
	}
	if transactionCount > 10 {
		redirectUrl := "/user/active_reservation"
		http.Redirect(w, r.Request, redirectUrl, 302)
		return
	}
	shippingId, _ := strconv.ParseInt(r.FormValue("shipping_id"), 10, 64)
	shippingOption, _ := FindShippingOptionById(uint(shippingId))
	quantity, err := strconv.ParseInt(r.FormValue("quantity"), 10, 64)
	if err != nil {
		quantity = int64(1)
	}
	groups := c.ViewItem.PackagesWithoutReservation().GroupsTable()
	itemPackage, err := groups.GetPackageByHash(r.PathParams["hash"])
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}
	transaction, err := CreateTransactionForPackage(
		*itemPackage,
		*c.ViewUser.User,
		r.FormValue("type"),
		int(quantity),
		shippingOption,
		r.FormValue("shipping_address"),
	)
	if err != nil {
		c.Error = "Unable to perform reservation"
		c.PreBookPackage(w, r)
		return
	}
	transaction.FundFromUserWallets(*c.ViewUser.User)
	http.Redirect(w, r.Request, "/payments/"+transaction.Uuid, 302)
}
