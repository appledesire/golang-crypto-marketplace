package marketplace

import (
	"time"

	"github.com/gocraft/web"
)

func (c *Context) PerformanceMeasureMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {
	c.PageRenderStart = time.Now()

	next(w, r)
}
