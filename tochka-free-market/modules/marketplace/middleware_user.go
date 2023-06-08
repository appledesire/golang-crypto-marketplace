package marketplace

import (
	"net/http"

	"github.com/gocraft/web"
)

// PublicStoreMiddleware populates all views and relations to display a store
func (c *Context) UserMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {
	user, _ := FindUserByUsername(r.PathParams["username"])
	if user == nil {
		http.NotFound(w, r.Request)
		return
	}

	if user.Banned {
		http.NotFound(w, r.Request)
		return
	}

	vu := user.ViewUser(c.ViewUser.Language)
	c.ViewMarketplaceUser = &vu
	next(w, r)
}
