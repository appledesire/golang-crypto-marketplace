package marketplace

import (
	"github.com/gocraft/web"
	"math"
	"net/http"
	"strconv"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) AdminDisputeList(w web.ResponseWriter, r *web.Request) {
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
	c.NumberOfTransactions = CountDisputedTransactions("", c.SelectedStatus)
	c.NumberOfPages = int(math.Ceil(float64(c.NumberOfTransactions) / float64(pageSize)))
	for i := 0; i < c.NumberOfPages; i++ { // paging
		c.Pages = append(c.Pages, i+1)
	}

	transactions := Transactions(GetDisputedTransactionsPaged(pageSize, c.Page-1, "", c.SelectedStatus))
	c.ViewTransactions = transactions.ViewTransactions()
	util.RenderTemplate(w, "dispute/admin/list", c)
}
