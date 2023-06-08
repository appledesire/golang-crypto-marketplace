package marketplace

import (
	"math"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/dchest/captcha"
	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ViewAPILogin(user User, w web.ResponseWriter, r *web.Request) {
	var err error
	c.APISession, err = CreateAPISession(user)
	if err != nil {
		c.Error = err.Error()
		util.APIResponse(w, r, c)
		return
	}

	user.LastLoginDate = time.Now()
	user.Save()

	EventUserLoggedIn(user)
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPILoginRegisterGET(w web.ResponseWriter, r *web.Request) {
	if c.ViewUser != nil {
		http.NotFound(w, r.Request)
		return
	}
	c.CaptchaId = captcha.New()
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIUserByToken(w web.ResponseWriter, r *web.Request) {
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPILoginPOST(w web.ResponseWriter, r *web.Request) {
	if r.FormValue("decryptedmessage") == "" {
		var (
			isCaptchaValid    = captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha"))
			user, _           = FindUserByUsername(r.FormValue("username"))
			isLoginSuccessful = isCaptchaValid && (user != nil) && user.CheckPassphrase(r.FormValue("passphrase"))
		)
		if !isCaptchaValid {
			c.Error = "Invalid captcha"
			c.ViewAPILoginRegisterGET(w, r)
			return
		}
		if user == nil || !isLoginSuccessful {
			c.Error = "Failed to authenticate"
			c.ViewAPILoginRegisterGET(w, r)
			return
		}
		if user.TwoFactorAuthentication {
			session, _ := CreateAPISession(*user)
			c.APISession = session
			c.APISession.SecondFactorSecretText = util.GenerateUuid()
			c.APISession.Save()

			c.SecretText, _ = util.EncryptText(c.APISession.SecondFactorSecretText, user.Pgp)
			util.APIResponse(w, r, c)
		} else {
			c.ViewAPILogin(*user, w, r)
		}
	} else {
		var (
			secretText       = c.APISession.SecondFactorSecretText
			decryptedmessage = strings.Trim(r.FormValue("decryptedmessage"), "\n ")
		)
		if decryptedmessage == secretText {
			c.ViewAPILogin(c.APISession.User, w, r)
			return
		} else {
			c.Error = "Could not authenticate"
			c.ViewAPILoginRegisterGET(w, r)
			return
		}
	}
}

func (c *Context) ViewAPIRegisterPOST(w web.ResponseWriter, r *web.Request) {
	if c.ViewUser != nil {
		http.NotFound(w, r.Request)
		return
	}
	isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha"))
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.ViewAPILoginRegisterGET(w, r)
		return
	}
	if r.FormValue("passphrase_1") != r.FormValue("passphrase_2") {
		c.Error = "Passphrases do not match"
		c.ViewAPILoginRegisterGET(w, r)
		return
	}

	user, err := CreateUser(r.FormValue("username"), r.FormValue("passphrase_1"), r.FormValue("invite_code"))
	if err != nil {
		c.Error = err.Error()
		c.ViewAPILoginRegisterGET(w, r)
		return
	}

	c.APISession, err = CreateAPISession(*user)
	if err != nil {
		c.Error = err.Error()
		c.ViewAPILoginRegisterGET(w, r)
		return
	}

	EventUserRegistred(*user)
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPISERP(w web.ResponseWriter, r *web.Request) {
	c.listAvailableItems(w, r, MARKETPLACE_SETTINGS.ItemsPerPage, true)
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIHotDeals(w web.ResponseWriter, r *web.Request) {
	c.listHotDeals(w, r)
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIListCountries(w web.ResponseWriter, r *web.Request) {
	c.Countries = GetAllCountries()
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIListStores(w web.ResponseWriter, r *web.Request) {
	c.listSerpVendors(w, r)
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPICategories(w web.ResponseWriter, r *web.Request) {
	c.listCategories(w, r, true)
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIShowItem(w web.ResponseWriter, r *web.Request) {
	c.viewShowItem(w, r)
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIShowStore(w web.ResponseWriter, r *web.Request) {
	c.viewShowStore(w, r)
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIBookPackage(w web.ResponseWriter, r *web.Request) {
	transactionCount := 0
	for _, t := range FindTransactionsForBuyer(c.ViewUser.Uuid) {
		if t.CurrentPaymentStatus() == "PENDING" {
			transactionCount += 1
		}
	}
	if transactionCount > 10 {
		c.Error = "You have more than 10 active reservations"
		util.APIResponse(w, r, c)
		return
	}
	shippingId, _ := strconv.ParseInt(r.FormValue("shipping_id"), 10, 64)
	shippingOption, _ := FindShippingOptionById(uint(shippingId))
	quantity, err := strconv.ParseInt(r.FormValue("quantity"), 10, 64)
	if err != nil {
		quantity = int64(1)
	}
	groups := c.ViewItem.PackagesWithoutReservation().GroupsTable()
	itemPackage, err := groups.GetPackageByHash(r.PathParams["hash"])
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}
	transaction, err := CreateTransactionForPackage(
		*itemPackage,
		*c.ViewUser.User,
		r.FormValue("type"),
		int(quantity),
		shippingOption,
		r.FormValue("shipping_address"),
	)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}
	transaction.FundFromUserWallets(*c.ViewUser.User)
	viewTransaction := transaction.ViewTransaction()
	c.ViewTransaction = &viewTransaction
	util.APIResponse(w, r, c)
	return
}

func (c *Context) ViewAPIListCurrentTransactionStatuses(w web.ResponseWriter, r *web.Request) {
	pageSize := 20
	if len(r.URL.Query()["status"]) > 0 {
		c.SelectedStatus = r.URL.Query()["status"][0]
	}
	c.NumberOfTransactions = CountCurrentTransactionStatusesForBuyer(c.ViewUser.Uuid, c.SelectedStatus, "", false)
	c.NumberOfPages = int(math.Ceil(float64(c.NumberOfTransactions) / float64(pageSize)))
	for i := 0; i < c.NumberOfPages; i++ { // paging
		c.Pages = append(c.Pages, i+1)
	}
	c.ViewCurrentTransactionStatuses = FindCurrentTransactionStatusesForBuyer(
		c.ViewUser.Uuid, c.SelectedStatus, false, c.Page, pageSize).
		ViewCurrentTransactionStatuses(c.ViewUser.Language)
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIShowTransactionGET(w web.ResponseWriter, r *web.Request) {
	review, _ := FindRatingReviewByTransactionUuid(c.ViewTransaction.Uuid)
	if review != nil {
		c.RatingReview = *review
	}
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIShowTransactionPOST(w web.ResponseWriter, r *web.Request) {
	message, err := CreateMessage(r.FormValue("text"), c.Thread, *c.ViewUser.User)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ViewAPIShowTransactionGET(w, r)
		return
	}

	err = message.AddImage(r)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ViewAPIShowTransactionGET(w, r)
		return
	}

	c.TransactionMiddleware(w, r, c.ViewAPIShowTransactionGET)
}

func (c *Context) ViewAPIShowTransactionShippedPOST(w web.ResponseWriter, r *web.Request) {

	currentShippingStatus := c.ViewTransaction.CurrentShippingStatus
	currentPaymentStatus := c.ViewTransaction.CurrentPaymentStatus

	if currentShippingStatus == "DISPATCHED" && (currentPaymentStatus == "COMPLETED" || currentPaymentStatus == "RELEASED") {
		c.ViewTransaction.Transaction.SetShippingStatus("SHIPPED", "User marked transaction as shipped", c.ViewUser.Uuid)
	}

	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIShowTransactionCancelPOST(w web.ResponseWriter, r *web.Request) {

	currentShippingStatus := c.ViewTransaction.CurrentShippingStatus
	currentPaymentStatus := c.ViewTransaction.CurrentPaymentStatus

	if currentShippingStatus != "DISPATCHED" && (currentPaymentStatus == "COMPLETED") {
		c.ViewTransaction.Transaction.Cancel("User cancelled transacction", c.ViewUser.Uuid)
	}

	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIShowTransactionReleasePOST(w web.ResponseWriter, r *web.Request) {

	currentPaymentStatus := c.ViewTransaction.CurrentPaymentStatus

	if currentPaymentStatus == "COMPLETED" {
		c.ViewTransaction.Transaction.Release("User cancelled transacction", c.ViewUser.Uuid)
	}

	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIWallet(w web.ResponseWriter, r *web.Request) {
	c.CaptchaId = captcha.New()
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIBitcoinWalletPOST(w web.ResponseWriter, r *web.Request) {

	var (
		amountStr      = r.FormValue("amount")
		isCaptchaValid = captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha"))
		err            error
	)

	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.BitcoinWalletSendStep2GET(w, r)
		return
	}

	c.Address = strings.Trim(r.FormValue("address"), " ")
	if !bitcoinRegexp.MatchString(c.Address) {
		c.Error = "Wrong BTC address **"
		c.BitcoinWalletSendStep2GET(w, r)
		return
	}
	c.Amount, err = strconv.ParseFloat(amountStr, 64)
	if err != nil {
		c.Error = "Wrong amount"
		c.BitcoinWalletSendStep2GET(w, r)
		return
	}
	receipt, err := c.UserBitcoinWallets.Send(c.Address, c.Amount)
	if err != nil {
		c.Error = err.Error()
		c.BitcoinWalletSendStep2GET(w, r)
		return
	}
	paymentReceipt, err := receipt.BTCPaymentResult()
	if err == nil {
		c.BTCPaymentResult = &paymentReceipt
	}
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPIEthereumWalletPOST(w web.ResponseWriter, r *web.Request) {

	isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha"))
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.EthereumWalletSendGET(w, r)
		return
	}

	var (
		address   = r.FormValue("address")
		amountStr = r.FormValue("amount")
	)

	if !ethereumRegexp.MatchString(address) {
		c.Error = "Wrong ETH address"
		c.EthereumWalletSendGET(w, r)
		return
	}

	amount, err := strconv.ParseFloat(amountStr, 64)
	if err != nil {
		c.Error = "Wrong amount"
		c.EthereumWalletSendGET(w, r)
		return
	}

	results, err := c.UserEthereumWallet.Send(address, amount)
	if err != nil {
		c.Error = err.Error()
		c.EthereumWalletSendGET(w, r)
		return
	}

	ethPaymentResult, err := results.ETHPaymentResult()
	if err == nil {
		c.ETHPaymentResult = &ethPaymentResult
	}
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPISetupPGPViaDecryptionStep1POST(w web.ResponseWriter, r *web.Request) {
	pgp := r.FormValue("pgp_public_key")
	uuid := util.GenerateUuid()

	encryptedPgp, err := util.EncryptText(uuid, pgp)
	if err != nil {
		c.Error = err.Error()
		util.APIResponse(w, r, c)
		return
	}
	c.SecretText = encryptedPgp

	session := sessionStore.Load(r.Request)
	session.PutString(w, "uuid", uuid)
	redirect := ""
	if len(r.URL.Query()["redirect"]) > 0 {
		redirect = r.URL.Query()["redirect"][0]
	}
	session.PutString(w, "pgp-redirect", redirect)
	c.Pgp = pgp
	util.APIResponse(w, r, c)
}

func (c *Context) ViewAPISetupPGPViaDecryptionStep2POST(w web.ResponseWriter, r *web.Request) {
	decryptedText := r.FormValue("secret_text")

	session := sessionStore.Load(r.Request)

	secretText, _ := session.GetString("uuid")
	pgp := r.FormValue("pgp_public_key")

	if decryptedText == secretText {
		c.ViewUser.User.Pgp = strings.Trim(pgp, "\n ")
		c.ViewUser.User.Save()

		store := c.ViewUser.Store()
		if store != nil && store.AdminUser().Uuid == c.ViewUser.Uuid {
			store.PGP = c.ViewUser.Pgp
			store.Save()
		}
		return
	} else {
		c.Error = "Decrypted message isn't correct"
		return
	}

	util.APIResponse(w, r, c)
}
