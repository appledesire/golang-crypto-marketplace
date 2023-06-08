package marketplace

import (
	"net/http"

	"github.com/gocraft/web"
)

func (c *Context) TransactionStatsMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {
	if c.ViewUser != nil {
		c.NumberOfTransactions += CountCurrentTransactionStatusesForBuyer(c.ViewUser.Uuid, "", "", true)
	}
	if c.ViewUserStore != nil {
		c.NumberOfTransactions += CountCurrentTransactionStatusesForStore(c.ViewUserStore.Uuid, "", "", true)
	}
	next(w, r)
}

func (c *Context) TransactionMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {
	transaction, _ := FindTransactionByUuid(r.PathParams["transaction"])
	if transaction == nil {
		http.NotFound(w, r.Request)
		return
	}

	if !c.ViewUser.IsAdmin && !c.ViewUser.IsStaff && (transaction.BuyerUuid != c.ViewUser.Uuid && (c.ViewUserStore != nil && transaction.StoreUuid != c.ViewUserStore.Uuid)) {
		http.NotFound(w, r.Request)
		return
	}

	c.ViewPackage = transaction.Package.ViewPackage()

	viewTransaction := transaction.ViewTransaction()
	c.ViewTransaction = &viewTransaction

	thread, err := GetTransactionThread(*transaction, "")
	if err == nil {
		c.Thread = *thread
		viewThread := thread.ViewThread(c.ViewUser.User.Language, c.ViewUser.User)
		c.ViewThread = &viewThread
	}

	next(w, r)
}
