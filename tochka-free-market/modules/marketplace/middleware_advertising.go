package marketplace

import (
	"github.com/gocraft/web"
)

func (c *Context) AdvertisingMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {
	c.Advertisings = GetAdvertisings(1)
	next(w, r)
}
