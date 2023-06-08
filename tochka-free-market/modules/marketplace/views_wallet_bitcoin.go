package marketplace

import (
	_ "math"
	"net/http"
	"strconv"
	"strings"

	btcqr "github.com/GeertJohan/go.btcqr"
	"github.com/dchest/captcha"
	"github.com/gocraft/web"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) BitcoinWalletRecieve(w web.ResponseWriter, r *web.Request) {
	util.RenderTemplate(w, "wallet/bitcoin/recieve", c)
}

func (c *Context) BitcoinWalletSendStep1GET(w web.ResponseWriter, r *web.Request) {
	c.CaptchaId = captcha.New()
	util.RenderTemplate(w, "wallet/bitcoin/send_step_1", c)
}

func (c *Context) BitcoinWalletSendStep2GET(w web.ResponseWriter, r *web.Request) {
	var err error
	var withdraw bool = (r.FormValue("withdraw") == "1")
	c.BTCFee, c.Description, err = c.UserBitcoinWallets.EstimateFee(c.Address, c.Amount)
	if err != nil {
		c.Error = err.Error()
		c.BitcoinWalletSendStep1GET(w, r)
		return
	}
	if withdraw {
		c.Amount = c.UserBitcoinBalance.Balance
	}
	if c.UserBitcoinBalance.Balance < c.BTCFee {
		c.Error = "Amount + Fee is greater than balance of your wallet"
	}
	c.CaptchaId = captcha.New()
	util.RenderTemplate(w, "wallet/bitcoin/send_step_2", c)
}

func (c *Context) BitcoinWalletSendPOST(w web.ResponseWriter, r *web.Request) {
	switch r.FormValue("step") {
	case "1":
		c.BitcoinWalletSendStep1POST(w, r)
		break
	case "2":
		c.BitcoinWalletSendStep2POST(w, r)
		break
	default:
		http.NotFound(w, r.Request)
		return
	}
}

func (c *Context) BitcoinWalletSendStep1POST(w web.ResponseWriter, r *web.Request) {
	c.Address = strings.Trim(r.FormValue("address"), " ")
	amountStr := r.FormValue("amount")

	// TODO: Reimplement for Store model
	// if c.ViewUser.NumberOfYellowWarnings >= 3 || c.ViewUser.NumberOfRedWarnings >= 1 {
	// 	c.Error = "You can't withdraw funds until have active YELLOW or RED warnings"
	// 	c.BitcoinWalletSendStep1GET(w, r)
	// 	return
	// }

	if !bitcoinRegexp.MatchString(c.Address) {
		c.Error = "Wrong BTC address"
		c.BitcoinWalletSendStep1GET(w, r)
		return
	}

	var err error
	if r.FormValue("withdraw") != "1" {
		c.Amount, err = strconv.ParseFloat(amountStr, 64)
		if err != nil {
			c.Error = "Wrong amount"
			c.BitcoinWalletSendStep1GET(w, r)
			return
		}
	}

	c.BitcoinWalletSendStep2GET(w, r)
}

func (c *Context) BitcoinWalletSendStep2POST(w web.ResponseWriter, r *web.Request) {

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

	// TODO: Reimplement for Store model
	// if c.ViewUser.NumberOfYellowWarnings >= 1 || c.ViewUser.NumberOfRedWarnings >= 1 {
	// 	c.Error = "You can't withdraw funds until have active YELLOW or RED warnings"
	// 	c.BitcoinWalletSendStep1GET(w, r)
	// 	return
	// }

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
	util.RenderTemplate(w, "wallet/bitcoin/send_step_3", c)
}

func (c *Context) BitcoinWalletImage(w web.ResponseWriter, r *web.Request) {
	req := &btcqr.Request{
		Address: r.PathParams["address"],
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

func (c *Context) BitcoinWalletActions(w web.ResponseWriter, r *web.Request) {
	c.UserBitcoinWalletActions = FindUserBitcoinWalletActionsForUser(c.ViewUser.Uuid)
	util.RenderTemplate(w, "wallet/bitcoin/actions", c)
}
