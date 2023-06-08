package marketplace

import (
	"math"
	"net/http"
	"strconv"

	"github.com/dchest/captcha"
	"github.com/gocraft/web"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ViewShowMessageboardImage(w web.ResponseWriter, r *web.Request) {
	size := "normal"
	if len(r.URL.Query()["size"]) > 0 {
		size = r.URL.Query()["size"][0]
	}
	util.ServeImage(r.PathParams["uuid"], size, w, r)
}

func (c *Context) ShowThread(w web.ResponseWriter, r *web.Request) {

	if c.ViewUser == nil {
		redirectUrl := "/auth/register"
		http.Redirect(w, r.Request, redirectUrl, 302)
		return
	}

	thread, err := GetMessageboardThread(r.PathParams["uuid"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	viewThread := thread.ViewThread(c.ViewUser.Language, c.ViewUser.User)
	c.ViewThread = &viewThread
	c.NumberOfPages = int(math.Ceil(float64(len(c.ViewThread.Messages)) / 50.0))

	if len(r.URL.Query()["page"]) > 0 {
		strPage := r.URL.Query()["page"][0]
		page, err := strconv.ParseInt(strPage, 10, 32)
		if err != nil || page < 0 {
			http.NotFound(w, r.Request)
			return
		}
		c.Page = int(page) - 1
	}
	// paging
	for i := 0; i < c.NumberOfPages; i++ {
		c.Pages = append(c.Pages, i+1)
	}

	c.ViewThread.Messages = c.ViewThread.Messages[c.Page*50 : int(math.Min(float64(len(c.ViewThread.Messages)), float64(c.Page*50+50)))]
	c.Page = c.Page + 1
	c.CaptchaId = captcha.New()

	UpdateThreadPerusalStatus(thread.Uuid, c.ViewUser.Uuid)

	util.RenderTemplate(w, "board/thread", c)
}
