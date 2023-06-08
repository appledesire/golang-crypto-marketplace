package marketplace

import (
	"github.com/gocraft/web"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ShowFeed(w web.ResponseWriter, r *web.Request) {
	if len(r.URL.Query()["section"]) > 0 {
		section := r.URL.Query()["section"][0]
		c.SelectedSection = section
	} else {
		c.SelectedSection = ""
	}
	feedItems := CacheGetPublicFeedItems()
	c.ViewFeedItems = feedItems.ViewFeedItems(c.ViewUser.Language, c.SelectedSection)
	util.RenderTemplate(w, "feed", c)
}
