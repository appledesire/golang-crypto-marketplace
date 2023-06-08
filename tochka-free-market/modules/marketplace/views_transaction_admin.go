package marketplace

import (
	"github.com/gocraft/web"
	"math"
	"net/http"
	"strconv"
	"time"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) AdminListTransactions(w web.ResponseWriter, r *web.Request) {
	// transaction type
	if len(r.URL.Query()["status"]) > 0 {
		c.SelectedStatus = r.URL.Query()["status"][0]
	}
	// pages
	pageSize := 20
	if len(r.URL.Query()["page"]) > 0 {
		strPage := r.URL.Query()["page"][0]
		page, err := strconv.ParseInt(strPage, 10, 32)
		if err != nil || page < 0 {
			http.NotFound(w, r.Request)
			return
		}
		c.Page = int(page)
	} else {
		c.Page = 1
	}
	c.NumberOfTransactions = CountTransactions(c.SelectedStatus) // CountCurrentTransactionStatuses("", c.SelectedStatus, false)
	c.NumberOfPages = int(math.Ceil(float64(c.NumberOfTransactions) / float64(pageSize)))
	for i := 0; i < c.NumberOfPages; i++ { // paging
		c.Pages = append(c.Pages, i+1)
	}
	c.SelectedPage = c.Page
	c.ViewCurrentTransactionStatuses = FindCurrentTransactionStatusesForBuyer(
		"", c.SelectedStatus, false, c.Page-1, pageSize).
		ViewCurrentTransactionStatuses(c.ViewUser.Language)

	util.RenderTemplate(w, "transaction/admin/list", c)
}

func (c *Context) AdminTransactionComplete(w web.ResponseWriter, r *web.Request) {
	transaction, _ := FindTransactionByUuid(r.PathParams["transaction"])
	if transaction == nil {
		http.NotFound(w, r.Request)
		return
	}
	err := transaction.Complete("Transaction completed by staff", "")
	if err != nil {
		c.Error = err.Error()
	}
	http.Redirect(w, r.Request, "/payments/"+transaction.Uuid, 302)
}

func (c *Context) AdminTransactionFail(w web.ResponseWriter, r *web.Request) {
	transaction, _ := FindTransactionByUuid(r.PathParams["transaction"])
	if transaction == nil {
		http.NotFound(w, r.Request)
		return
	}
	err := transaction.Fail("Transaction failed by staff", "")
	if err != nil {
		c.Error = err.Error()
	}
	http.Redirect(w, r.Request, "/payments/"+transaction.Uuid, 302)
}

func (c *Context) AdminTransactionMakePending(w web.ResponseWriter, r *web.Request) {
	transaction, _ := FindTransactionByUuid(r.PathParams["transaction"])
	if transaction == nil {
		http.NotFound(w, r.Request)
		return
	}
	err := transaction.MakePending("Transaction made pending by staff", "")
	if err != nil {
		c.Error = err.Error()
	}
	http.Redirect(w, r.Request, "/payments/"+transaction.Uuid, 302)
}

func (c *Context) AdminTransactionCancel(w web.ResponseWriter, r *web.Request) {
	transaction, _ := FindTransactionByUuid(r.PathParams["transaction"])
	if transaction == nil {
		http.NotFound(w, r.Request)
		return
	}
	err := transaction.Cancel("Transaction cancelled by staff", "")
	if err != nil {
		c.Error = err.Error()
	}
	http.Redirect(w, r.Request, "/payments/"+transaction.Uuid, 302)
}

func (c *Context) AdminTransactionFreeze(w web.ResponseWriter, r *web.Request) {
	transaction, _ := FindTransactionByUuid(r.PathParams["transaction"])
	if transaction == nil {
		http.NotFound(w, r.Request)
		return
	}
	err := transaction.Freeze("Transaction frozen by staff", "")
	if err != nil {
		c.Error = err.Error()
	}
	http.Redirect(w, r.Request, "/payments/"+transaction.Uuid, 302)
}

func (c *Context) AdminTransactionRelease(w web.ResponseWriter, r *web.Request) {
	transaction, _ := FindTransactionByUuid(r.PathParams["transaction"])
	if transaction == nil {
		http.NotFound(w, r.Request)
		return
	}
	// transaction.SetTransactionStatus("RELEASED", transaction.CurrentAmountPaid(), "Funds released to vendor", "")
	err := transaction.Release("Funds released to vendor", "")
	if err != nil {
		c.Error = err.Error()
	}
	http.Redirect(w, r.Request, "/payments/"+transaction.Uuid, 302)
}

func (c *Context) AdminTransactionUpdateStatus(w web.ResponseWriter, r *web.Request) {
	transaction, _ := FindTransactionByUuid(r.PathParams["transaction"])
	if transaction == nil {
		http.NotFound(w, r.Request)
		return
	}
	transaction.UpdateTransactionStatus()
	http.Redirect(w, r.Request, "/payments/"+transaction.Uuid, 302)
}

func (c *Context) AdminTransactionsRelease(w web.ResponseWriter, r *web.Request) {
	transactions := FindReleasedTransactions()
	for _, t := range transactions {
		t.Release("Routine transaction update", "")
	}
	http.Redirect(w, r.Request, "/payments/admin/list", 302)
}

func (c *Context) AdminUpdateFailedTransactions(w web.ResponseWriter, r *web.Request) {
	transactions := findFailedPendingTransactionsCreatedGteTimestamp(time.Now().AddDate(0, 0, -30))
	for i := range transactions {
		t := transactions[i]
		t.UpdateTransactionStatus()
	}
	http.Redirect(w, r.Request, "/payments/admin/list", 302)
}
