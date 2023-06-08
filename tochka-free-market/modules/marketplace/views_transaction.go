package marketplace

import (
	"math"
	"net/http"
	"strconv"

	btcqr "github.com/GeertJohan/go.btcqr"
	"github.com/dchest/captcha"
	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ShowTransaction(w web.ResponseWriter, r *web.Request) {
	c.CaptchaId = captcha.New()
	review, _ := FindRatingReviewByTransactionUuid(c.ViewTransaction.Uuid)
	if review != nil {
		c.RatingReview = *review
	}
	if len(r.URL.Query()["section"]) > 0 {
		section := r.URL.Query()["section"][0]
		c.SelectedSection = section
	} else {
		c.SelectedSection = "payment"
	}
	util.RenderTemplate(w, "transaction/show", c)
}

func (c *Context) ShowTransactionPOST(w web.ResponseWriter, r *web.Request) {
	isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha"))
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.ShowTransaction(w, r)
		return
	}
	message, err := CreateMessage(r.FormValue("text"), c.Thread, *c.ViewUser.User)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ShowTransaction(w, r)
		return
	}
	err = message.AddImage(r)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ShowTransaction(w, r)
		return
	}

	c.TransactionMiddleware(w, r, c.ShowTransaction)
}

func (c *Context) UpdateTransaction(w web.ResponseWriter, r *web.Request) {
	transaction, _ := FindTransactionByUuid(r.PathParams["transaction"])
	if transaction == nil {
		http.NotFound(w, r.Request)
		return
	}
	transaction.UpdateTransactionStatus()
	viewTransaction := transaction.ViewTransaction()
	c.ViewTransaction = &viewTransaction
	c.ShowTransaction(w, r)
}

func (c *Context) ListCurrentTransactionStatuses(w web.ResponseWriter, r *web.Request) {
	pageSize := 20
	if len(r.URL.Query()["status"]) > 0 {
		c.SelectedStatus = r.URL.Query()["status"][0]
		if c.SelectedStatus == "DISPATCH PENDING" {
			c.SelectedShippingStatus = c.SelectedStatus
			c.SelectedStatus = ""
		}
	}
	c.Page = 1
	if len(r.URL.Query()["page"]) > 0 {
		page, err := strconv.ParseInt(r.URL.Query()["page"][0], 10, 32)
		if err != nil || page < 0 {
			http.NotFound(w, r.Request)
			return
		}
		c.Page = int(page)
	}

	c.NumberOfTransactions = CountCurrentTransactionStatusesForBuyer(c.ViewUser.Uuid, c.SelectedStatus, c.SelectedShippingStatus, false)
	c.ViewCurrentTransactionStatuses = FindCurrentTransactionStatusesForBuyer(
		c.ViewUser.Uuid, c.SelectedStatus, false, c.Page-1, pageSize).
		ViewCurrentTransactionStatuses(c.ViewUser.Language)

	if c.ViewUserStore != nil {
		c.NumberOfTransactions += CountCurrentTransactionStatusesForStore(c.ViewUserStore.Uuid, c.SelectedStatus, c.SelectedShippingStatus, false)
		transactions := FindCurrentTransactionStatusesForStore(
			c.ViewUserStore.Uuid, c.SelectedStatus, c.SelectedShippingStatus, false, c.Page-1, pageSize).
			ViewCurrentTransactionStatuses(c.ViewUser.Language)
		c.ViewCurrentTransactionStatuses = append(c.ViewCurrentTransactionStatuses, transactions...)
	}

	c.NumberOfPages = int(math.Ceil(float64(c.NumberOfTransactions) / float64(pageSize)))
	for i := 0; i < c.NumberOfPages; i++ { // paging
		c.Pages = append(c.Pages, i+1)
	}
	util.RenderTemplate(w, "transaction/list", c)
}

func (c *Context) TransactionImage(w web.ResponseWriter, r *web.Request) {
	btcqr.DefaultConfig.Scheme = "bitcoin"

	var amount float64
	if c.ViewTransaction.Type == "bitcoin" {
		amount = c.ViewTransaction.BitcoinTransaction.Amount
	}
	if c.ViewTransaction.Type == "bitcoin_cash" {
		amount = c.ViewTransaction.BitcoinCashTransaction.Amount
	}

	req := &btcqr.Request{
		Address: c.ViewTransaction.Uuid,
		Amount:  amount,
		Label:   c.ViewTransaction.Description,
		Message: "",
	}
	code, err := req.GenerateQR()
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	png := code.PNG()
	w.Header().Set("Content-type", "image/png")
	w.Write(png)
}

func (c *Context) CompleteTransactionPOST(w web.ResponseWriter, r *web.Request) {

	// Review
	review, _ := FindRatingReviewByTransactionUuid(c.ViewTransaction.Uuid)
	if review == nil {
		review = &RatingReview{
			Uuid: util.GenerateUuid(),
		}

		CreateFeedItem(c.ViewTransaction.BuyerUuid, "new_review", "added new review", review.Uuid)
	}

	// quality
	itemQuality, err := strconv.Atoi(r.FormValue("item_quality"))
	if err != nil || itemQuality < 0 || itemQuality > 5 {
		c.Error = "Wrong input for item quality"
		http.NotFound(w, r.Request)
		return
	}
	itemReview := r.FormValue("item_review")
	if len(itemReview) > 255 {
		itemReview = itemReview[0:255]
	}
	// package
	marketplaceQuality, err := strconv.Atoi(r.FormValue("marketplace_quality"))
	if err != nil || marketplaceQuality < 0 || marketplaceQuality > 5 {
		c.Error = "Wrong input for marketplace quality"
		http.NotFound(w, r.Request)
		return
	}
	marketplaceReview := r.FormValue("marketplace_review")
	if len(marketplaceReview) > 255 {
		marketplaceReview = marketplaceReview[0:255]
	}
	// seller
	sellerQuality, err := strconv.Atoi(r.FormValue("seller_quality"))
	if err != nil || sellerQuality < 0 || sellerQuality > 5 {
		c.Error = "Wrong input for seller quality"
		http.NotFound(w, r.Request)
		return
	}
	sellerReview := r.FormValue("seller_review")
	if len(sellerReview) > 255 {
		sellerReview = sellerReview[0:255]
	}

	pkg, _ := FindPackageByUuid(c.ViewTransaction.PackageUuid)
	if pkg != nil {
		review.ItemUuid = pkg.ItemUuid
	}

	review.ItemReview = itemReview
	review.ItemScore = itemQuality
	review.MarketplaceReview = marketplaceReview
	review.MarketplaceScore = marketplaceQuality
	review.SellerReview = sellerReview
	review.SellerScore = sellerQuality
	review.TransactionUuid = c.ViewTransaction.Uuid
	review.StoreUuid = c.ViewTransaction.StoreUuid
	review.UserUuid = c.ViewTransaction.BuyerUuid

	review.Save()

	http.Redirect(w, r.Request, "/payments/"+c.ViewTransaction.Uuid+"?section=review", 302)
}

func (c *Context) SetTransactionShippingStatus(w web.ResponseWriter, r *web.Request) {
	status := r.FormValue("shipping_status")
	if !(status == "DISPATCHED" || status == "SHIPPED") {
		http.NotFound(w, r.Request)
		return
	}
	c.ViewTransaction.SetShippingStatus(status, "Shipping status changed to "+status, c.ViewUser.Uuid)
	redirectUrl := "/payments/" + c.ViewTransaction.Uuid
	http.Redirect(w, r.Request, redirectUrl, 302)
}

func (c *Context) ReleaseTransaction(w web.ResponseWriter, r *web.Request) {
	if !c.ViewTransaction.Store.UserIsAdministration(c.ViewUser.Uuid) {
		model := c.ViewTransaction.DBModel()

		err := model.Release("User released transaction", c.ViewUser.Uuid)
		if err != nil {
			model.SetTransactionStatus(
				model.CurrentPaymentStatus(),
				model.CurrentAmountPaid(),
				"Failed to release transaction",
				c.ViewUser.Uuid,
				nil,
			)
		}
	}
	http.Redirect(w, r.Request, "/payments/"+c.ViewTransaction.Uuid, 302)
}

func (c *Context) CancelTransaction(w web.ResponseWriter, r *web.Request) {
	model := c.ViewTransaction.DBModel()
	if model.IsCompleted() && !model.IsDispatched() && !model.IsShipped() {
		err := model.Cancel("User cancelled transaction", c.ViewUser.Uuid)
		if err != nil {
			model.SetTransactionStatus(
				model.CurrentPaymentStatus(),
				model.CurrentAmountPaid(),
				"Failed to cancel transaction",
				c.ViewUser.Uuid,
				nil,
			)
		}
	}
	http.Redirect(w, r.Request, "/payments/"+c.ViewTransaction.Uuid, 302)
}
