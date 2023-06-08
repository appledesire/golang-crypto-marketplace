package marketplace

import (
	"math"
	"net/http"
	"strconv"

	"github.com/gocraft/web"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ViewStaffListSupportTickets(w web.ResponseWriter, r *web.Request) {
	var (
		err          error
		pageSize     int = 50
		selectedPage int = 0
	)

	c.SelectedSection = "new-open"
	if len(r.URL.Query()["section"]) > 0 {
		c.SelectedSection = r.URL.Query()["section"][0]
	}

	if len(r.URL.Query()["page"]) > 0 {
		selectedPageStr := r.URL.Query()["page"][0]
		page, err := strconv.Atoi(selectedPageStr)
		if err == nil {
			selectedPage = page - 1
		}
	}

	numberOfPages := int(math.Ceil(float64(CountSupportTicketsByStatus(c.SelectedSection)) / float64(pageSize)))
	for i := 0; i < numberOfPages; i++ {
		c.Pages = append(c.Pages, i+1)
	}

	tickets, err := FindSupportTicketsByStatus(c.SelectedSection, selectedPage, pageSize)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	c.ViewSupportTickets = tickets.ViewSupportTickets(c.ViewUser.Language)
	c.SelectedPage = selectedPage + 1
	util.RenderTemplate(w, "staff/users_support_tickets", c)
}

func (c *Context) ViewStaffUserFinance(w web.ResponseWriter, r *web.Request) {

	// TODO: reimplement

	user, err := FindUserByUsername(r.PathParams["username"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	vu := user.ViewUser(c.ViewUser.Language)
	c.ViewMarketplaceUser = &vu

	c.ViewMarketplaceUser.BitcoinWallets = c.ViewMarketplaceUser.FindUserBitcoinWallets()
	c.ViewMarketplaceUser.EthereumWallets = c.ViewMarketplaceUser.FindUserEthereumWallets()
	c.ViewMarketplaceUser.BitcoinCashWallets = c.ViewMarketplaceUser.FindUserBitcoinCashWallets()

	for _, w := range c.ViewMarketplaceUser.BitcoinWallets {
		w.UpdateBalance(false)
	}

	for _, w := range c.ViewMarketplaceUser.EthereumWallets {
		w.UpdateBalance(false)
	}

	for _, w := range c.ViewMarketplaceUser.BitcoinCashWallets {
		w.UpdateBalance(false)
	}

	c.ViewMarketplaceUser.BitcoinBalance = c.ViewMarketplaceUser.BitcoinWallets.Balance()
	c.ViewMarketplaceUser.EthereumBalance.Balance = c.ViewMarketplaceUser.EthereumWallets.Balance().Balance
	c.ViewMarketplaceUser.BitcoinCashBalance = c.ViewMarketplaceUser.BitcoinCashWallets.Balance()

	c.ViewMarketplaceUser.BitcoinWallet = c.ViewMarketplaceUser.BitcoinWallets[0]
	c.ViewMarketplaceUser.EthereumWallet = c.ViewMarketplaceUser.EthereumWallets[0]
	c.ViewMarketplaceUser.BitcoinCashWallet = c.ViewMarketplaceUser.BitcoinCashWallets[0]

	// c.UserSettingsHistory = SettingsChangeHistoryByUser(user.Uuid)

	util.RenderTemplate(w, "staff/users_user_finance", c)
}

func (c *Context) ViewStaffUserTickets(w web.ResponseWriter, r *web.Request) {

	user, err := FindUserByUsername(r.PathParams["username"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	vu := user.ViewUser(c.ViewUser.Language)
	c.ViewMarketplaceUser = &vu

	tickets, err := FindSupportTicketsForUser(*user)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	c.ViewSupportTickets = tickets.ViewSupportTickets(c.ViewUser.Language)
	util.RenderTemplate(w, "staff/users_user_tickets", c)
}

func (c *Context) ViewStaffUserPayments(w web.ResponseWriter, r *web.Request) {
	user, err := FindUserByUsername(r.PathParams["username"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	vu := user.ViewUser(c.ViewUser.Language)
	c.ViewMarketplaceUser = &vu

	c.ViewCurrentTransactionStatuses = FindCurrentTransactionStatusesForBuyer(
		user.Uuid, c.SelectedStatus, false, 0, 100).
		ViewCurrentTransactionStatuses(c.ViewUser.Language)

	store := user.Store()
	if store != nil {
		vts := FindCurrentTransactionStatusesForStore(store.Uuid, c.SelectedStatus, "", false, 0, 100).
			ViewCurrentTransactionStatuses(c.ViewUser.Language)

		c.ViewCurrentTransactionStatuses = append(c.ViewCurrentTransactionStatuses, vts...)
	}

	util.RenderTemplate(w, "staff/users_user_payments", c)
}

func (c *Context) ViewStaffUserAdminActions(w web.ResponseWriter, r *web.Request) {
	user, err := FindUserByUsername(r.PathParams["username"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	vu := user.ViewUser(c.ViewUser.Language)
	c.ViewMarketplaceUser = &vu
	util.RenderTemplate(w, "staff/users_user_admin_actions", c)
}
