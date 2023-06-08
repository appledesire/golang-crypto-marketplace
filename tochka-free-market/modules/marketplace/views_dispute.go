package marketplace

import (
	"fmt"
	"net/http"

	"github.com/dchest/captcha"
	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ViewDisputeStart(w web.ResponseWriter, r *web.Request) {
	transaction, err := FindTransactionByUuid(r.PathParams["transaction_uuid"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	if transaction.BuyerUuid != c.ViewUser.Uuid && !c.ViewUser.IsAdmin {
		http.NotFound(w, r.Request)
		return
	}

	disputeClaim := r.FormValue("dispute_claim")
	if disputeClaim == "" {
		http.NotFound(w, r.Request)
		return
	}
	dispute, err := transaction.CreateDispute(disputeClaim)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	redirectUrl := "/dispute/" + dispute.Uuid
	http.Redirect(w, r.Request, redirectUrl, 302)
}

func (c *Context) ViewDispute(w web.ResponseWriter, r *web.Request) {
	if len(c.Dispute.DisputeClaims) == 0 {
		http.NotFound(w, r.Request)
		return
	}
	c.DisputeClaim = c.Dispute.DisputeClaims[0]
	redirectUrl := fmt.Sprintf("/dispute/%s/%d", c.Dispute.Uuid, c.DisputeClaim.ID)
	http.Redirect(w, r.Request, redirectUrl, 302)
}

func (c *Context) ViewDisputeClaimGET(w web.ResponseWriter, r *web.Request) {
	c.CaptchaId = captcha.New()
	util.RenderTemplate(w, "dispute/show", c)
}

func (c *Context) ViewDisputeClaimPOST(w web.ResponseWriter, r *web.Request) {

	// set dispute claim resolution status
	// only admins and staff can do that
	if r.FormValue("resolution_status") != "" {
		if !c.ViewUser.IsAdmin {
			http.NotFound(w, r.Request)
			return
		}

		resolutionStatus := r.FormValue("resolution_status")
		var err error = nil
		if resolutionStatus == "open" {
			err = c.DisputeClaim.Open()
		} else if resolutionStatus == "closed" {
			err = c.DisputeClaim.Close()
		} else if resolutionStatus == "vendor" {
			err = c.DisputeClaim.ResolveToVendor()
		} else if resolutionStatus == "buyer" {
			err = c.DisputeClaim.ResolveToBuyer()
		} else {
			http.NotFound(w, r.Request)
			return
		}
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}

		redirectUrl := fmt.Sprintf("/dispute/%s/%d", c.Dispute.Uuid, c.DisputeClaim.ID)
		http.Redirect(w, r.Request, redirectUrl, 302)
		return

	}

	// c.ReadOnlyThread == c.Dispute.Status != "OPEN")

	if c.DisputeClaim.Status != "OPEN" {
		http.NotFound(w, r.Request)
		return
	}

	// reply to resolution claim chat
	isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha")) || c.ViewUser.IsAdmin || c.ViewUser.IsStaff
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.ViewDisputeClaimGET(w, r)
		return
	}

	message, err := CreateMessage(r.FormValue("text"), c.Thread, *c.ViewUser.User)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ViewDisputeClaimGET(w, r)
		return
	}

	err = message.AddImage(r)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ViewDisputeClaimGET(w, r)
		return
	}

	if c.ViewUser.IsStaff || c.ViewUser.IsAdmin {
		c.Dispute.ResolverUserUuid = c.ViewUser.Uuid
		c.Dispute.Save()
	}

	EventDisputeNewMessage(c.Dispute, *message)
	redirectUrl := fmt.Sprintf("/dispute/%s/%d", c.Dispute.Uuid, c.DisputeClaim.ID)
	http.Redirect(w, r.Request, redirectUrl, 302)
}

func (c *Context) ViewDisputeList(w web.ResponseWriter, r *web.Request) {
	c.ViewTransactions = FindDisputedTransactionsForUser(c.ViewUser.Uuid).ViewTransactions()
	if c.ViewUserStore != nil {
		vts := FindDisputedTransactionsForUser(c.ViewUserStore.Uuid).ViewTransactions()
		c.ViewTransactions = append(c.ViewTransactions, vts...)
	}
	util.RenderTemplate(w, "dispute/list", c)
}

func (c *Context) ViewDisputeSetStatus(w web.ResponseWriter, r *web.Request) {

	if !c.ViewUser.IsAdmin && !c.ViewUser.IsStaff {
		http.NotFound(w, r.Request)
		return
	}

	resolutionStatus := r.FormValue("resolution_status")
	var err error = nil
	if resolutionStatus == "open" {
		err = c.Dispute.Open(c.ViewUser.Uuid)
	} else if resolutionStatus == "closed" {
		err = c.Dispute.Close(c.ViewUser.Uuid)
	} else if resolutionStatus == "vendor" {
		err = c.Dispute.ResolveToVendor(c.ViewUser.Uuid)
	} else if resolutionStatus == "buyer" {
		err = c.Dispute.ResolveToBuyer(c.ViewUser.Uuid)
	} else {
		http.NotFound(w, r.Request)
		return
	}
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	if c.ViewUser.IsStaff {
		CreateFeedItem(c.ViewUser.Uuid, "staff_resolve_dispute", "resolved dispute", c.Dispute.Uuid)
	}

	redirectUrl := fmt.Sprintf("/dispute/%s", c.Dispute.Uuid)
	http.Redirect(w, r.Request, redirectUrl, 302)
	return
}

func (c *Context) ViewDisputeClaimAdd(w web.ResponseWriter, r *web.Request) {
	if !c.ViewUser.IsAdmin && !c.ViewUser.IsStaff {
		http.NotFound(w, r.Request)
		return
	}

	resolutionStatus := r.FormValue("claim")
	_, err := CreateDisputeClaim(c.Dispute, resolutionStatus)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	redirectUrl := fmt.Sprintf("/dispute/%s", c.Dispute.Uuid)
	http.Redirect(w, r.Request, redirectUrl, 302)
	return
}
