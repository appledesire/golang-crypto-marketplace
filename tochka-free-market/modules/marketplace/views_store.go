package marketplace

import (
	"net/http"

	"github.com/dchest/captcha"
	"github.com/gocraft/web"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) viewShowStore(w web.ResponseWriter, r *web.Request) {
	items := FindItemsForStore(c.ViewStore.Uuid)
	c.ViewItems = items.ViewItems(c.ViewUser.Language)
}

func (c *Context) ViewListStoreItems(w web.ResponseWriter, r *web.Request) {
	c.viewShowStore(w, r)
	util.RenderTemplate(w, "store/items", c)
}

func (c *Context) ViewAboutStore(w web.ResponseWriter, r *web.Request) {
	if c.ViewStore.IsTrusted {
		th, err := GetStoreVerificationThread(*c.ViewStore.Store, false)
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}
		viewThread := th.ViewThread(c.ViewUser.Language, c.ViewUser.User)
		c.ViewThread = &viewThread
	}
	c.SelectedSection = "info"
	if len(r.URL.Query()["section"]) > 0 {
		c.SelectedSection = r.URL.Query()["section"][0]
	}

	util.RenderTemplate(w, "store/about", c)
}

func (c *Context) ViewStoreWarningsGET(w web.ResponseWriter, r *web.Request) {
	c.CaptchaId = captcha.New()
	c.CanPostWarnings = CanUserReportStore(*c.ViewUser.User, *c.ViewStore.Store)
	util.RenderTemplate(w, "store/warnings", c)
}

func (c *Context) ViewStoreWarningsPOST(w web.ResponseWriter, r *web.Request) {
	isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha")) || c.ViewUser.IsAdmin || c.ViewUser.IsStaff
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.ViewStoreWarningsGET(w, r)
		return
	}

	warning, err := CreateStoreWarning(c.ViewStore.Uuid, c.ViewUser.Uuid, r.FormValue("text"))
	warning.Reporter = *c.ViewUser.User
	warning.Store = *c.ViewStore.Store
	EventNewWarning(warning)

	if err != nil {
		c.Error = err.Error()
		c.ViewStoreWarningsGET(w, r)
	} else {
		redirectUrl := "/store/" + c.ViewStore.Storename + "/warnings"
		http.Redirect(w, r.Request, redirectUrl, 302)
	}
}

func (c *Context) ViewStoreWarningUpdateStatusPOST(w web.ResponseWriter, r *web.Request) {

	isStaff := c.ViewUser.IsStaff || c.ViewUser.IsAdmin

	warning, err := FindStoreWarningByUuid(r.PathParams["uuid"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	isWarningAuthor := c.ViewUser.Uuid == warning.ReporterUuid
	if !isStaff && !isWarningAuthor {
		http.NotFound(w, r.Request)
		return
	}

	allowedValues := map[string]bool{
		"RED":     true,
		"YELLOW":  true,
		"GREEN":   true,
		"DISCARD": true,
	}

	severety := r.FormValue("severety")
	if _, ok := allowedValues[severety]; ok {
		if severety == "DISCARD" && (isStaff || isWarningAuthor) {
			warning.Remove()
		} else {
			warning.UpdateSeverety(r.FormValue("severety"))
		}
	}

	EventWarningStatsUpdate(*warning, *c.ViewUser.User)

	redirectUrl := "/store/" + warning.Store.Storename + "/warnings"
	http.Redirect(w, r.Request, redirectUrl, 302)
}

func (c *Context) ViewStoreReviews(w web.ResponseWriter, r *web.Request) {
	util.RenderTemplate(w, "store/reviews", c)
}
