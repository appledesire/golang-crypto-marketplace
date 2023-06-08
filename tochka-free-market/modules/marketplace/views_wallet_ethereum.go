package marketplace

import (
	"net/http"
	"strconv"

	btcqr "github.com/GeertJohan/go.btcqr"
	"github.com/dchest/captcha"
	"github.com/gocraft/web"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) EthereumWalletRecieve(w web.ResponseWriter, r *web.Request) {
	util.RenderTemplate(w, "wallet/ethereum/recieve", c)
}

func (c *Context) EthereumWalletSendGET(w web.ResponseWriter, r *web.Request) {
	c.CaptchaId = captcha.New()
	util.RenderTemplate(w, "wallet/ethereum/send", c)
}

func (c *Context) EthereumWalletSendPOST(w web.ResponseWriter, r *web.Request) {

	isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha"))
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.EthereumWalletSendGET(w, r)
		return
	}

	// TODO: Reimplement for Store model
	// if c.ViewUser.NumberOfYellowWarnings >= 3 || c.ViewUser.NumberOfRedWarnings >= 1 {
	// 	c.Error = "You can't withdraw funds until have active YELLOW or RED warnings"
	// 	c.EthereumWalletSendGET(w, r)
	// 	return
	// }

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
	util.RenderTemplate(w, "wallet/ethereum/send_receipt", c)
}

func (c *Context) EthereumWalletImage(w web.ResponseWriter, r *web.Request) {
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

func (c *Context) EthereumWalletActions(w web.ResponseWriter, r *web.Request) {
	c.UserEthereumWalletActions = FindUserEthereumWalletActionsForUser(c.ViewUser.Uuid)
	util.RenderTemplate(w, "wallet/ethereum/actions", c)
}
