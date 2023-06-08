package marketplace

import (
	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ViewAdminListReferralPayments(w web.ResponseWriter, r *web.Request) {
	c.ReferralPayments = FindReferralPayments()
	util.RenderTemplate(w, "referral/admin/payments", c)
}
