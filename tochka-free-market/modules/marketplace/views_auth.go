package marketplace

import (
	"errors"
	"fmt"
	"math"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/dchest/captcha"
	"github.com/gocraft/web"
	"github.com/mojocn/base64Captcha"
	"github.com/skip2/go-qrcode"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) UserAvatar(w web.ResponseWriter, r *web.Request) {
	size := "normal"
	if len(r.URL.Query()["size"]) > 0 {
		size = r.URL.Query()["size"][0]
	}

	username := r.PathParams["user"]
	userUuid := CacheGetUserUuid(username)
	if userUuid != "" {
		err := util.ServeImage(userUuid+"_av", size, w, r)
		if err != nil {
			user, _ := FindUserByUsername(username)
			user.GenerateAvatar()

			util.ServeImage(userUuid+"_av", size, w, r)
		}
	} else {
		http.NotFound(w, r.Request)
		return
	}
}

func (c *Context) Login(user User, w web.ResponseWriter, r *web.Request) {

	if c.ViewUser != nil && !c.ViewUser.IsAdmin {
		http.NotFound(w, r.Request)
		return
	}

	session := sessionStore.Load(r.Request)
	session.PutString(w, "UserUuid", user.Uuid)

	user.LastLoginDate = time.Now()
	user.Save()

	redirectUrl := "/"
	EventUserLoggedIn(user)
	http.Redirect(w, r.Request, redirectUrl, 302)
}

func (c *Context) RegisterGET(w web.ResponseWriter, r *web.Request) {

	if c.ViewUser != nil {
		http.NotFound(w, r.Request)
		return
	}

	if r.PathParams["invite_code"] != "" {
		c.InviteCode = r.PathParams["invite_code"]
		user, _ := FindUserByInviteCode(r.PathParams["invite_code"])
		if user != nil {
			// TODO: check migration
			// viewSeller := user.ViewUser(c.ViewUser.User.Language)
			// c.ViewSeller = &viewSeller
		} else {
			c.Error = "Invite code is invalid"
		}
	}

	c.SelectedSection = "register"
	c.CaptchaId = captcha.New()
	util.RenderTemplate(w, "auth/register", c)
}

func (c *Context) ViewRecoverGET(w web.ResponseWriter, r *web.Request) {
	if c.ViewUser != nil {
		http.NotFound(w, r.Request)
		return
	}

	c.CaptchaId = captcha.New()

	util.RenderTemplate(w, "auth/recovery_step_1", c)
}

func (c *Context) ViewRecoverPOST(w web.ResponseWriter, r *web.Request) {

	c.CaptchaId = captcha.New()
	session := sessionStore.Load(r.Request)

	setEncryptedText := func(user *User) {
		secretText := util.GenerateUuid()

		session.PutString(w, "2FactorUserUuid", user.Uuid)
		session.PutString(w, "secrettext", secretText)

		c.SecretText, _ = util.EncryptText(secretText, user.Pgp)
	}

	switch r.FormValue("step") {
	case "1":
		isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha"))
		if !isCaptchaValid {
			c.Error = "Invalid captcha"
			util.RenderTemplate(w, "auth/recovery_step_1", c)
			return
		}

		user, err := FindUserByUsername(r.FormValue("username"))
		if err != nil {
			c.Error = "User not found"
			util.RenderTemplate(w, "auth/recovery_step_1", c)
			break
		}

		if user.Pgp == "" {
			c.Error = "User doesn't have PGP set up"
			util.RenderTemplate(w, "auth/recovery_step_1", c)
			break
		}

		setEncryptedText(user)
		util.RenderTemplate(w, "auth/recovery_step_2", c)
		break

	case "2":
		var (
			secretText, _    = session.GetString("secrettext")
			userId, _        = session.GetString("2FactorUserUuid")
			decryptedmessage = strings.Trim(r.FormValue("secret_text"), "\n ")
		)

		user, _ := FindUserByUuid(userId)
		if user == nil {
			c.Error = "Could not find user"
			util.RenderTemplate(w, "auth/recovery_step_2", c)
			return
		}

		if decryptedmessage == secretText {
			session.PutString(w, "UserUuid", user.Uuid)
			util.RenderTemplate(w, "auth/recovery_step_3", c)
			return
		} else {
			c.Error = "Could not authenticate"
			setEncryptedText(user)
			util.RenderTemplate(w, "auth/recovery_step_2", c)
			return
		}
		break

	case "3":
		var (
			userId, _ = session.GetString("UserUuid")
			user, _   = FindUserByUuid(userId)
		)

		if user == nil || userId == "" {
			c.Error = "Could not find user"
			util.RenderTemplate(w, "auth/recovery_step_3", c)
			return
		}

		if r.FormValue("passphrase") != r.FormValue("passphrase_2") {
			c.Error = "Passphrases do not match"
			util.RenderTemplate(w, "auth/recovery_step_3", c)
			return
		}

		user.PassphraseHash = util.PasswordHashV1(user.Username, r.FormValue("passphrase"))
		user.Save()

		http.Redirect(w, r.Request, "/", 302)
		break

	default:
		http.NotFound(w, r.Request)
		return
	}

}

func (c *Context) RegisterPOST(w web.ResponseWriter, r *web.Request) {
	if c.ViewUser != nil {
		http.NotFound(w, r.Request)
		return
	}
	isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha"))
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.RegisterGET(w, r)
		return
	}
	if r.FormValue("passphrase") != r.FormValue("passphrase_2") {
		c.Error = "Passphrases do not match"
		c.RegisterGET(w, r)
		return
	}

	user, validationError := CreateUser(r.FormValue("username"), r.FormValue("passphrase"), r.FormValue("invite_code"))
	if validationError != nil {
		c.Error = validationError.Error()
		c.RegisterGET(w, r)
		return
	}

	if user.Language == "" {
		lang := "en"
		if c.Language != "" {
			lang = c.Language
		}
		user.Language = lang
	}

	session := sessionStore.Load(r.Request)
	session.PutString(w, "UserUuid", user.Uuid)

	if r.FormValue("role") == "seller" {
		_, err := CreateStore(user.Username, user.Uuid)
		if err != nil {
			c.Error = err.Error()
			c.RegisterGET(w, r)
			return
		}
	}

	EventUserRegistred(*user)
	http.Redirect(w, r.Request, "/", 302)
}

func (c *Context) ViewsAuthMobileAuthImage(w web.ResponseWriter, r *web.Request) {

	newSession := func() {
		session, _ := CreateAPISession(*c.ViewUser.User)
		image := generateImage(session.Token)
		w.Header().Set("Content-type", "image/png")
		w.Write(image)
	}

	session, _ := FindAPISessionByUserUuid(c.ViewUser.Uuid)
	if session == nil {
		newSession()
		return
	}

	if !session.IsActive() {
		newSession()
		return
	}

	image := generateImage(session.Token)
	w.Header().Set("Content-type", "image/png")
	w.Write(image)

	return

}

func generateImage(text string) []byte {
	png, _ := qrcode.Encode(text, qrcode.Medium, 256)
	return png
}

func (c *Context) BotCheckGET(w web.ResponseWriter, r *web.Request) {
	c.CaptchaId = captcha.New()
	util.RenderTemplate(w, "auth/botcheck", c)
}

func (c *Context) BotCheckPOST(w web.ResponseWriter, r *web.Request) {

	isCaptchaValid := base64Captcha.VerifyCaptcha(r.FormValue("captcha_id"), r.FormValue("captcha"))
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.BotCheckGET(w, r)
		return
	}

	session := sessionStore.Load(r.Request)
	uuid := util.GenerateUuid()
	session.PutString(w, "BotCheckUuid", uuid)
	botCheckUuids.Store(uuid, true)

	if redirect := r.Request.URL.Query().Get("redirect"); redirect != "" {
		http.Redirect(w, r.Request, redirect, 302)
	} else {
		http.Redirect(w, r.Request, "/", 302)
	}
}

func (c *Context) LoginGET(w web.ResponseWriter, r *web.Request) {

	if c.ViewUser != nil {
		http.NotFound(w, r.Request)
		return
	}
	c.SelectedSection = "login"

	c.CaptchaId = captcha.New()
	util.RenderTemplate(w, "auth/login", c)
}

func (c *Context) ViewVerificationPlanGET(w web.ResponseWriter, r *web.Request) {
	// c.ViewSeller = &c.ViewUser //Seller{c.ViewUser.User}.ViewSeller(c.ViewUser.User.Language) //@
	c.USDBTCRate = GetCurrencyRate("BTC", "USD")
	util.RenderTemplate(w, "store/verification_account", c)
}

func (c *Context) ViewVerificationPlanPurchaseGET(w web.ResponseWriter, r *web.Request) {
	accounts := map[string]float64{
		"gold":   300.0,
		"silver": 200.0,
		"bronze": 100.0,
	}

	c.Account = r.PathParams["account"]

	if _, ok := accounts[c.Account]; !ok {
		http.NotFound(w, r.Request)
		return
	}

	c.PriceUSD = accounts[c.Account]

	if c.Account == "bronze" && (c.ViewUserStore.IsGoldAccount || c.ViewUserStore.IsSilverAccount) {
		c.Error = "You already hold next account"
	}
	if c.Account == "silver" && c.ViewUserStore.IsGoldAccount {
		c.Error = "You already hold next account"
	}

	if c.ViewUserStore.IsBronzeAccount && (c.Account == "silver" || c.Account == "gold") {
		c.PriceUSD -= 100
	}

	if c.ViewUser.IsSilverAccount && c.Account == "gold" {
		c.PriceUSD -= 200
	}

	c.PriceBCH = c.PriceUSD * GetCurrencyRate("USD", "BCH")
	c.PriceBTC = c.PriceUSD * GetCurrencyRate("USD", "BTC")
	c.PriceETH = c.PriceUSD * GetCurrencyRate("USD", "ETH")

	util.RenderTemplate(w, "store/verification_account_purchase", c)
}

func (c *Context) ViewVerificationPlanPurchasePOST(w web.ResponseWriter, r *web.Request) {

	var (
		address string
		err     error
	)

	accounts := map[string]float64{
		"gold":   300.0,
		"silver": 200.0,
		"bronze": 100.0,
	}
	currencies := map[string]bool{
		"btc": true,
		"bch": true,
		"eth": true,
	}

	err = r.ParseForm()
	if err != nil {
		c.Error = err.Error()
		c.ViewVerificationPlanPurchaseGET(w, r)
		return
	}

	c.Account = r.PathParams["account"]
	c.Currency = r.FormValue("currency")

	if _, ok := accounts[c.Account]; !ok {
		c.Error = "No such Membership Type"
		c.ViewVerificationPlanPurchaseGET(w, r)
		return
	}

	if _, ok := currencies[c.Currency]; !ok {
		c.Error = "Unsupported currency"
		c.ViewVerificationPlanPurchaseGET(w, r)
		return
	}

	c.PriceUSD = accounts[c.Account]

	if c.Account == "bronze" && (c.ViewUser.IsGoldAccount || c.ViewUser.IsSilverAccount) {
		c.Error = "You already hold next account"
	}
	if c.Account == "silver" && c.ViewUser.IsGoldAccount {
		c.Error = "You already hold next account"
	}

	if c.ViewUserStore.IsBronzeAccount && (c.Account == "silver" || c.Account == "gold") {
		c.PriceUSD -= 100
	}

	if c.ViewUserStore.IsSilverAccount && c.Account == "gold" {
		c.PriceUSD -= 200
	}

	c.PriceBCH = c.PriceUSD * GetCurrencyRate("USD", "BCH")
	c.PriceBTC = c.PriceUSD * GetCurrencyRate("USD", "BTC")
	c.PriceETH = c.PriceUSD * GetCurrencyRate("USD", "ETH")

	switch c.Currency {
	case "btc":
		userWallets := c.ViewUser.User.FindUserBitcoinWallets()
		if userWallets.Balance().Balance < c.PriceBTC {
			c.Error = fmt.Sprintf("Please deposit %f BTC to your onsite wallet.", c.PriceBTC)
			c.ViewVerificationPlanPurchaseGET(w, r)
			return
		}

		address, err = apis.GenerateBTCAddress("premium")
		if err != nil {
			c.Error = err.Error()
			c.ViewVerificationPlanPurchaseGET(w, r)
			return
		}

		_, err = userWallets.Send(address, c.PriceBTC)
		if err != nil {
			c.Error = err.Error()
			c.ViewVerificationPlanPurchaseGET(w, r)
			return
		}
	case "bch":
		userWallets := c.ViewUser.User.FindUserBitcoinCashWallets()
		if userWallets.Balance().Balance < c.PriceBCH {
			c.Error = fmt.Sprintf("Please deposit %f BCH to your onsite wallet.", c.PriceBCH)
			c.ViewVerificationPlanPurchaseGET(w, r)
			return
		}

		address, err = apis.GenerateBCHAddress("premium")
		if err != nil {
			c.Error = err.Error()
			c.ViewVerificationPlanPurchaseGET(w, r)
			return
		}

		_, err = userWallets.Send(address, c.PriceBCH)
		if err != nil {
			c.Error = err.Error()
			c.ViewVerificationPlanPurchaseGET(w, r)
			return
		}
	case "eth":
		userWallets := c.ViewUser.User.FindUserEthereumWallets()
		if userWallets.Balance().Balance < c.PriceETH {
			c.Error = fmt.Sprintf("Please deposit %f ETH to your onsite wallet.", c.PriceETH)
			c.ViewVerificationPlanPurchaseGET(w, r)
			return
		}

		address, err = apis.GenerateETHAddress("premium")
		if err != nil {
			c.Error = err.Error()
			c.ViewVerificationPlanPurchaseGET(w, r)
			return
		}

		_, err = userWallets[0].Send(address, c.PriceETH)
		if err != nil {
			c.Error = err.Error()
			c.ViewVerificationPlanPurchaseGET(w, r)
			return
		}
	}

	switch c.Account {
	case "gold":
		c.ViewUserStore.Store.IsGoldAccount = true
		c.ViewUserStore.Store.IsSilverAccount = false
		c.ViewUserStore.Store.IsBronzeAccount = false
		c.ViewUserStore.Store.IsFreeAccount = false
	case "silver":
		c.ViewUserStore.Store.IsGoldAccount = false
		c.ViewUserStore.Store.IsSilverAccount = true
		c.ViewUserStore.Store.IsBronzeAccount = false
		c.ViewUserStore.Store.IsFreeAccount = false
	case "bronze":
		c.ViewUserStore.Store.IsGoldAccount = false
		c.ViewUserStore.Store.IsSilverAccount = false
		c.ViewUserStore.Store.IsBronzeAccount = true
		c.ViewUserStore.Store.IsFreeAccount = false
	}

	c.ViewUserStore.Store.Save()
	EventUserSubscription(*c.ViewUser.User, c.Account, c.Currency, address)
	http.Redirect(w, r.Request, "/verification/plan", 302)
}

func (c *Context) getUserForTrustPage(r *web.Request) (User, error) {
	user := *c.ViewUser.User
	if r.PathParams["username"] != "" && !(c.ViewUser.IsStaff || c.ViewUser.IsAdmin) {
		return User{}, errors.New("Wrong request")
	}
	if r.PathParams["username"] != "" && (c.ViewUser.IsStaff || c.ViewUser.IsAdmin) {
		u, err := FindUserByUsername(r.PathParams["username"])
		if err != nil {
			return User{}, errors.New("Wrong request")
		}
		user = *u
	}
	return user, nil
}

func (c *Context) ViewVerificationEncryptionGET(w web.ResponseWriter, r *web.Request) {
	util.RenderTemplate(w, "store/verification_encryption", c)
}

func (c *Context) ViewVerificationAgreementGET(w web.ResponseWriter, r *web.Request) {
	c.Description = GetVendorshipAgreement("en", *c.ViewUser.User, time.Now())
	util.RenderTemplate(w, "store/verification_agreement", c)
}

// TODO: reimplement for Store model
func (c *Context) ViewVerificationAgreementPOST(w web.ResponseWriter, r *web.Request) {
	agreement := GetVendorshipAgreement("en", *c.ViewUser.User, time.Now())
	signedAgreement := strings.Replace(strings.Trim(r.FormValue("signed_agreement"), "\n\r"), "`", "'", -1)
	isSignatureCorrect, err := util.CheckSignature(signedAgreement, agreement, c.ViewUser.Pgp)
	if !isSignatureCorrect || err != nil {
		c.Error = "Signature is not valid"
		if err != nil {
			c.Error = err.Error()
		}
	} else {
		now := time.Now()
		c.ViewUserStore.Store.VendorshipAgreementText = signedAgreement
		c.ViewUserStore.Store.VendorshipAgreementSignatureDate = &now
		c.ViewUserStore.Store.Save()
	}

	c.ViewVerificationAgreementGET(w, r)
}

func (c *Context) ViewVerificationThreadGET(w web.ResponseWriter, r *web.Request) {
	user, err := c.getUserForTrustPage(r)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	store := user.Store()
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	thread, err := GetStoreVerificationThread(*store, true)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	c.CaptchaId = captcha.New()
	viewThread := thread.ViewThread(c.ViewUser.Language, c.ViewUser.User)
	c.ViewThread = &viewThread
	util.RenderTemplate(w, "store/verification_thread", c)
}

// TODO: reimplement for a Store model
func (c *Context) ViewVerificationThreadPOST(w web.ResponseWriter, r *web.Request) {

	if r.FormValue("request_trusted_vendor") != "" {
		now := time.Now()
		c.ViewUserStore.Store.HasRequestedVerification = true
		c.ViewUserStore.Store.VerificationRequestDate = &now
		c.ViewUserStore.Store.Save()
		c.ViewVerificationThreadGET(w, r)
		return
	}

	isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha"))
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.ViewVerificationThreadGET(w, r)
		return
	}

	user, err := c.getUserForTrustPage(r)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	store := user.Store()
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	thread, err := GetStoreVerificationThread(*store, false)
	if err != nil {
		c.Error = err.Error()
		c.ViewVerificationThreadGET(w, r)
		return
	}
	message, err := CreateMessage(r.FormValue("text"), *thread, *c.ViewUser.User)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ViewVerificationThreadGET(w, r)
		return
	}

	err = message.AddImage(r)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ViewVerificationThreadGET(w, r)
		return
	}

	EventNewTrustedStoreVerificationThreadPost(*c.ViewUser.User, *c.ViewUserStore.Store, *message)
	c.ViewVerificationThreadGET(w, r)
}

func (c *Context) Referrals(w web.ResponseWriter, r *web.Request) {
	if c.ViewUser.InviteCode == "" {
		c.ViewUser.User.InviteCode = util.GenerateUuid()
		c.ViewUser.User.Save()
	}

	c.SelectedSection = "users"
	if len(r.URL.Query()["section"]) > 0 {
		c.SelectedSection = r.URL.Query()["section"][0]
	}

	// paging
	pageSize := 50
	selectedPage := 0
	if len(r.URL.Query()["page"]) > 0 {
		selectedPageStr := r.URL.Query()["page"][0]
		page, err := strconv.Atoi(selectedPageStr)
		if err == nil {
			selectedPage = page - 1
		}
	}
	numberOfPages := int(math.Ceil(float64(c.NumberOfInvitedUsers) / float64(pageSize)))
	for i := 0; i < numberOfPages; i++ {
		c.Pages = append(c.Pages, i+1)
	}

	usersPage := GetInvitedUserPage(c.ViewUser.Uuid, selectedPage, pageSize)
	c.ExtendedUsers = usersPage
	c.ReferralPayments = FindReferralPaymentsForUser(c.ViewUser.User.Uuid)
	c.NumberOfInvitedUsers = c.ViewUser.NumberOfInvitedUsers()

	util.RenderTemplate(w, "auth/referrals", c)
}

func (c *Context) Banned(w web.ResponseWriter, r *web.Request) {
	util.RenderTemplate(w, "auth/banned", c)
}

func (c *Context) FreeRestrictions(w web.ResponseWriter, r *web.Request) {
	util.RenderTemplate(w, "free_restrictions", c)
}

func (c *Context) Logout(w web.ResponseWriter, r *web.Request) {
	session := sessionStore.Load(r.Request)
	session.Remove(w, "UserUuid")
	http.Redirect(w, r.Request, "/", 302)
}

func (c *Context) LoginPOST(w web.ResponseWriter, r *web.Request) {
	if r.FormValue("decryptedmessage") == "" {
		c.Login1FactorPOST(w, r)
	} else {
		c.Login2FactorPOST(w, r)
	}
}

func (c *Context) Login1FactorPOST(w web.ResponseWriter, r *web.Request) {
	isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha"))
	user, _ := FindUserByUsername(r.FormValue("username"))
	isLoginSuccessful := isCaptchaValid && (user != nil) && user.CheckPassphrase(r.FormValue("passphrase_"))
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.LoginGET(w, r)
		return
	}
	if user == nil {
		c.Error = "No such user"
		c.LoginGET(w, r)
		return
	}
	if !isLoginSuccessful {
		c.Error = "Wrong captcha or login and password"
		c.LoginGET(w, r)
		return
	}
	if user.TwoFactorAuthentication {
		// session := sessionStore.Load(r.Request)
		c.LoginPGPGet(w, r, user.Uuid)
	} else {
		c.Login(*user, w, r)
	}
}

func (c *Context) Login2FactorPOST(w web.ResponseWriter, r *web.Request) {
	session := sessionStore.Load(r.Request)

	secretText, _ := session.GetString("secrettext")
	userId, _ := session.GetString("2FactorUserUuid")
	decryptedmessage := strings.Trim(r.FormValue("decryptedmessage"), "\n ")

	user, _ := FindUserByUuid(userId)
	if user == nil {
		c.Error = "No such user"
		c.LoginPGPGet(w, r, "")
		return
	}

	isSingatureCorrect := decryptedmessage == secretText
	if isSingatureCorrect {
		c.Login(*user, w, r)
		return
	} else {
		c.Error = "Invalid secret text"
		c.LoginPGPGet(w, r, user.Uuid)
		return
	}
}

func (c *Context) LoginPGPGet(w web.ResponseWriter, r *web.Request, userUuid string) {

	session := sessionStore.Load(r.Request)

	user, _ := FindUserByUuid(userUuid)
	if user == nil {
		c.Error = "No such user"
		c.LoginGET(w, r)
		return
	}

	secretText := util.GenerateUuid()
	session.PutString(w, "secrettext", secretText)
	session.PutString(w, "2FactorUserUuid", user.Uuid)

	c.SecretText, _ = util.EncryptText(secretText, user.Pgp)
	util.RenderTemplate(w, "auth/pgplogin", c)
}

func (c *Context) ViewUserSettingsGET(w web.ResponseWriter, r *web.Request) {
	if len(r.URL.Query()["section"]) > 0 {
		section := r.URL.Query()["section"][0]
		c.SelectedSection = section
	} else {
		c.SelectedSection = "profile"
	}
	secretText := util.GenerateUuid()
	session := sessionStore.Load(r.Request)
	session.PutString(w, "secrettext", secretText)

	c.SecretText = secretText

	c.UserSettingsHistory = SettingsChangeHistoryByUser(c.ViewUser.User.Uuid)

	util.RenderTemplate(w, "auth/settings-user", c)
}

func (c *Context) ViewStoreSettingsGET(w web.ResponseWriter, r *web.Request) {
	if !c.ViewUser.IsStore {
		http.NotFound(w, r.Request)
		return
	}
	if len(r.URL.Query()["section"]) > 0 {
		section := r.URL.Query()["section"][0]
		c.SelectedSection = section
	} else {
		c.SelectedSection = "profile"
	}
	secretText := util.GenerateUuid()
	session := sessionStore.Load(r.Request)
	session.PutString(w, "secrettext", secretText)

	c.SecretText = secretText

	c.UserSettingsHistory = SettingsChangeHistoryByUser(c.ViewUser.User.Uuid)

	util.RenderTemplate(w, "auth/settings-store", c)
}

func (c *Context) ViewUserSettingsPOST(w web.ResponseWriter, r *web.Request) {

	var (
		previousBTCAddress = c.ViewUser.User.Bitcoin
		previousBCHAddress = c.ViewUser.User.BitcoinCash
		previousETHAddress = c.ViewUser.User.Ethereum
		btcAddress         = r.FormValue("bitcoin")
		bchAddress         = r.FormValue("bitcoin_cash")
		ethereumAddress    = r.FormValue("ethereum")
	)

	if r.FormValue("description") != "" {
		c.ViewUser.User.Description = r.FormValue("description")
	}
	if r.FormValue("long_description") != "" {
		c.ViewUser.User.LongDescription = r.FormValue("long_description")
	}

	if btcAddress != "" && !bitcoinRegexp.MatchString(btcAddress) {
		c.Error = "Wrong Bitcoin Address"
	} else {
		c.ViewUser.User.Bitcoin = btcAddress
	}

	if bchAddress != "" && !bitcoinRegexp.MatchString(bchAddress) {
		c.Error = "Wrong Bitcoin Cash Address"
	} else {
		c.ViewUser.User.BitcoinCash = bchAddress
	}

	if ethereumAddress != "" && !ethereumRegexp.MatchString(ethereumAddress) {
		c.Error = "Wrong Ethereum"
	} else {
		c.ViewUser.User.Ethereum = ethereumAddress
	}

	if r.FormValue("bitcoin_multisig") != "" {
		c.ViewUser.User.BitcoinMultisigPublicKey = r.FormValue("bitcoin_multisig")
	}
	if r.FormValue("bitmessage") != "" {
		c.ViewUser.User.Bitmessage = r.FormValue("bitmessage")
	}
	if r.FormValue("tox") != "" {
		c.ViewUser.User.Tox = r.FormValue("tox")
	}
	if r.FormValue("email") != "" {
		c.ViewUser.User.Email = r.FormValue("email")
	}
	if r.FormValue("2fa") != "" {
		if r.FormValue("2fa") == "1" {
			c.ViewUser.User.TwoFactorAuthentication = true
		} else if r.FormValue("2fa") == "0" {
			c.ViewUser.User.TwoFactorAuthentication = false
		}
	}

	if r.FormValue("old_password") != "" {
		oldPassword := r.FormValue("old_password")
		hashV1 := util.PasswordHashV1(c.ViewUser.User.Username, oldPassword)
		if c.ViewUser.User.PassphraseHash != hashV1 {
			c.Error = "Invalid worng password"
			c.ViewUserSettingsGET(w, r)
			return
		}

		newPassword := r.FormValue("new_password")
		repeatNewPassword := r.FormValue("repeat_new_password")

		if newPassword != repeatNewPassword {
			c.Error = "New password and repeat new password does not match"
			c.ViewUserSettingsGET(w, r)
			return
		}

		newHash := util.PasswordHashV1(c.ViewUser.User.Username, newPassword)
		c.ViewUser.User.PassphraseHash = newHash
		c.ViewUser.User.Save()

	}
	if validationError := c.ViewUser.User.Validate(); validationError != nil {
		c.Error = validationError.Error()
		c.ViewUserSettingsGET(w, r)
		return
	}

	avatarError := util.SaveImage(r, "avatar_image", 300, c.ViewUser.User.Uuid+"_av")
	if avatarError == nil {
		c.ViewUser.User.HasAvatar = true
	}

	c.ViewUser.User.Save()

	if previousBTCAddress != c.ViewUser.User.Bitcoin {
		historyEvent := UserSettingsHistory{
			UserUuid: c.ViewUser.User.Uuid,
			Action:   "Bitcoin address changed to " + c.ViewUser.User.Bitcoin,
			Datetime: time.Now(),
			Type:     "bitcoin",
		}
		if c.ViewUser.User.Bitcoin == "" {
			historyEvent.Action = "Bitcoin address deleted"
		}
		historyEvent.Save()
	}

	if previousBCHAddress != c.ViewUser.User.BitcoinCash {
		historyEvent := UserSettingsHistory{
			UserUuid: c.ViewUser.User.Uuid,
			Action:   "BitcoinCash address changed to " + c.ViewUser.User.BitcoinCash,
			Datetime: time.Now(),
			Type:     "bitcoin_cash",
		}
		if c.ViewUser.User.BitcoinCash == "" {
			historyEvent.Action = "Bitcoin Cash address deleted"
		}
		historyEvent.Save()
	}

	if previousETHAddress != c.ViewUser.User.Ethereum {
		historyEvent := UserSettingsHistory{
			UserUuid: c.ViewUser.User.Uuid,
			Action:   "Ethereum address changed to " + c.ViewUser.User.Ethereum,
			Datetime: time.Now(),
			Type:     "ethereum",
		}
		if c.ViewUser.User.Ethereum == "" {
			historyEvent.Action = "Ethereum address deleted"
		}
		historyEvent.Save()
	}

	c.ViewUserSettingsGET(w, r)
}

func (c *Context) ViewStoreSettingsPOST(w web.ResponseWriter, r *web.Request) {

	if !c.ViewUser.IsStore {
		http.NotFound(w, r.Request)
		return
	}

	if r.FormValue("description") != "" {
		c.ViewUserStore.Store.ShortDescription = r.FormValue("description")
	}
	if r.FormValue("long_description") != "" {
		c.ViewUserStore.Store.Description = r.FormValue("long_description")
	}

	if r.FormValue("vm") != "" {
		c.ViewUserStore.Store.IsOnVacation = r.FormValue("vm") == "1"
	}

	if validationError := c.ViewUserStore.Store.Validate(); validationError != nil {
		c.Error = validationError.Error()
		c.ViewStoreSettingsGET(w, r)
		return
	}
	avatarError := util.SaveImage(r, "avatar_image", 300, c.ViewUserStore.Store.Uuid+"_av")
	if avatarError == nil {
		c.ViewUserStore.Store.HasAvatar = true
	}

	c.ViewUserStore.Store.Save()

	c.ViewStoreSettingsGET(w, r)
}

func (c *Context) SetupPGPViaDecryptionStep1GET(w web.ResponseWriter, r *web.Request) {
	util.RenderTemplate(w, "auth/settings_pgp_signature_step_1", c)
}

func (c *Context) SetupPGPViaDecryptionStep1POST(w web.ResponseWriter, r *web.Request) {
	pgp := r.FormValue("pgp_public_key")
	uuid := util.GenerateUuid()

	encryptedPgp, err := util.EncryptText(uuid, pgp)
	if err != nil {
		c.Error = err.Error()
		c.SetupPGPViaDecryptionStep1GET(w, r)
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
	util.RenderTemplate(w, "auth/settings_pgp_signature_step_2", c)
}

func (c *Context) SetupPGPViaDecryptionStep2POST(w web.ResponseWriter, r *web.Request) {
	decryptedText := r.FormValue("secret_text")

	session := sessionStore.Load(r.Request)

	secretText, _ := session.GetString("uuid")
	redirect, _ := session.GetString("pgp-redirect")
	pgp := r.FormValue("pgp")

	if decryptedText == secretText {
		c.ViewUser.User.Pgp = strings.Trim(pgp, "\n ")
		c.ViewUser.User.Save()

		store := c.ViewUser.Store()
		if store != nil && store.AdminUser().Uuid == c.ViewUser.Uuid {
			store.PGP = c.ViewUser.Pgp
			store.Save()
		}

		redirectUrl := "/settings/user?section=system"
		if redirect == "verification" {
			redirectUrl = "/verification/encryption"
		}

		http.Redirect(w, r.Request, redirectUrl, 302)
		return
	} else {
		c.Error = "Decrypted message isn't correct"
		c.SetupPGPViaDecryptionStep1GET(w, r)
		return
	}
}

func (c *Context) SetCurrency(w web.ResponseWriter, r *web.Request) {
	currency := r.PathParams["currency"]

	allowedCurrencies := map[string]bool{
		"AUD": true,
		"BTC": true,
		"ETH": true,
		"EUR": true,
		"GBP": true,
		"RUB": true,
		"USD": true,
	}

	if _, ok := allowedCurrencies[currency]; ok {
		c.ViewUser.User.Currency = currency
		c.ViewUser.User.Save()
	}

	redirectUrl := r.Referer()
	http.Redirect(w, r.Request, redirectUrl, 302)
}

func (c *Context) SetLanguage(w web.ResponseWriter, r *web.Request) {
	language := r.PathParams["language"]

	if _, ok := localizationMap[language]; ok {
		c.ViewUser.User.Language = language
		c.ViewUser.User.Save()
	}

	http.Redirect(w, r.Request, "/", 302)
}
