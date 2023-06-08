package marketplace

import (
	"github.com/gocraft/web"
	"net/http"
)

func (c *Context) Index(w web.ResponseWriter, r *web.Request) {
	redirectUrl := "/marketplace"
	http.Redirect(w, r.Request, redirectUrl, 302)
}
