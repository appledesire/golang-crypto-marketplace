package marketplace

import (
	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) AdminReviews(w web.ResponseWriter, r *web.Request) {
	// c.Reviews = GetAllReviews()
	util.RenderTemplate(w, "reviews/admin/reviews", c)
}
