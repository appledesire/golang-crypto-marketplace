package marketplace

import (
	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ViewAboutUser(w web.ResponseWriter, r *web.Request) {
	c.SelectedSection = "info"
	if len(r.URL.Query()["section"]) > 0 {
		c.SelectedSection = r.URL.Query()["section"][0]
	}
	util.RenderTemplate(w, "user/about", c)
}
