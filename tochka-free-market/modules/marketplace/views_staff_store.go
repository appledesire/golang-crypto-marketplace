package marketplace

import (
	"net/http"

	"github.com/dchest/captcha"
	"github.com/gocraft/web"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

/*
	Staff Store Views
*/

func (c *Context) ViewStaffListVendors(w web.ResponseWriter, r *web.Request) {
	stores := FindValidStoreVerificationRequests()
	c.ViewStores = stores.ViewStores(c.ViewUser.Language)
	util.RenderTemplate(w, "staff/vendors", c)
}

func (c *Context) ViewStaffVendorVerificationThreadGET(w web.ResponseWriter, r *web.Request) {
	user, err := c.getUserForTrustPage(r)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	store := user.Store()
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	thread, err := GetStoreVerificationThread(*store, true)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	c.CaptchaId = captcha.New()
	viewThread := thread.ViewThread(c.ViewUser.Language, c.ViewUser.User)
	c.ViewThread = &viewThread
	vs := store.ViewStore(c.ViewUser.Language)
	c.ViewStore = &vs
	util.RenderTemplate(w, "staff/vendors_verification_thread", c)
}

func (c *Context) ViewStaffVendorVerificationThreadPOST(w web.ResponseWriter, r *web.Request) {

	isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha")) || c.ViewUser.IsStaff || c.ViewUser.IsAdmin
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.ViewVerificationThreadGET(w, r)
		return
	}

	user, err := c.getUserForTrustPage(r)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	store := user.Store()
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	thread, err := GetStoreVerificationThread(*store, false)
	if err != nil {
		c.Error = err.Error()
		c.ViewVerificationThreadGET(w, r)
		return
	}
	message, err := CreateMessage(r.FormValue("text"), *thread, *c.ViewUser.User)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ViewVerificationThreadGET(w, r)
		return
	}

	err = message.AddImage(r)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ViewVerificationThreadGET(w, r)
		return
	}

	EventNewTrustedStoreVerificationThreadPost(*c.ViewUser.User, *store, *message)
	c.ViewStaffVendorVerificationThreadGET(w, r)
}

func (c *Context) ViewStaffStorePayments(w web.ResponseWriter, r *web.Request) {
	store, err := FindStoreByStorename(r.PathParams["storename"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	vs := store.ViewStore(c.ViewUser.Language)
	c.ViewStore = &vs

	vts := FindCurrentTransactionStatusesForStore(store.Uuid, c.SelectedStatus, "", false, 0, 100).
		ViewCurrentTransactionStatuses(c.ViewUser.Language)
	c.ViewCurrentTransactionStatuses = vts
	util.RenderTemplate(w, "staff/stores_store_payments", c)
}

func (c *Context) ViewStaffStoreAdminActions(w web.ResponseWriter, r *web.Request) {
	store, err := FindStoreByStorename(r.PathParams["storename"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	vs := store.ViewStore(c.ViewUser.Language)
	c.ViewStore = &vs

	util.RenderTemplate(w, "staff/stores_store_admin_actions", c)
}

func (c *Context) ViewStaffStoreToggleGoldAccount(w web.ResponseWriter, r *web.Request) {
	store, _ := FindStoreByStorename(r.PathParams["storename"])
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	store.IsGoldAccount = !store.IsGoldAccount
	store.Save()
	http.Redirect(w, r.Request, "/store/"+store.Storename, 302)
}

func (c *Context) ViewStaffStoreToggleSilverAccount(w web.ResponseWriter, r *web.Request) {
	store, _ := FindStoreByStorename(r.PathParams["storename"])
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	store.IsSilverAccount = !store.IsSilverAccount
	store.Save()
	http.Redirect(w, r.Request, "/store/"+store.Storename, 302)
}

func (c *Context) ViewStaffStoreToggleBronzeAccount(w web.ResponseWriter, r *web.Request) {
	store, _ := FindStoreByStorename(r.PathParams["storename"])
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	store.IsBronzeAccount = !store.IsBronzeAccount
	store.Save()
	http.Redirect(w, r.Request, "/store/"+store.Storename, 302)
}

func (c *Context) ViewStaffStoreToggleFreeAccount(w web.ResponseWriter, r *web.Request) {
	store, _ := FindStoreByStorename(r.PathParams["storename"])
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	store.IsFreeAccount = !store.IsFreeAccount
	store.Save()
	http.Redirect(w, r.Request, "/store/"+store.Storename, 302)
}

func (c *Context) ViewStaffStoreToggleSuspend(w web.ResponseWriter, r *web.Request) {
	store, _ := FindStoreByStorename(r.PathParams["storename"])
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	store.IsSuspended = !store.IsSuspended
	store.Save()
	http.Redirect(w, r.Request, "/store/"+store.Storename, 302)
}

func (c *Context) ViewStaffStoreToggleAllowToSell(w web.ResponseWriter, r *web.Request) {
	store, _ := FindStoreByStorename(r.PathParams["storename"])
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	store.IsAllowedToSell = !store.IsAllowedToSell
	store.Save()
	http.Redirect(w, r.Request, "/store/"+store.Storename, 302)
}

func (c *Context) ViewStaffStoreToggleTrusted(w web.ResponseWriter, r *web.Request) {
	store, _ := FindStoreByStorename(r.PathParams["storename"])
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	store.IsTrusted = !store.IsTrusted
	store.Save()
	http.Redirect(w, r.Request, "/store/"+store.Storename, 302)
}
