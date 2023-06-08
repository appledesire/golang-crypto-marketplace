package marketplace

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/dchest/captcha"
	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ViewShowDeposit(w web.ResponseWriter, r *web.Request) {
	c.Deposits = FindDepositsByStoreUuid(c.ViewStore.Uuid)
	c.DepositsSummary = c.Deposits.DepositsSummary()
	util.RenderTemplate(w, "deposit/show", c)
}

func (c *Context) ViewShowDepositAddGET(w web.ResponseWriter, r *web.Request) {
	c.CaptchaId = captcha.New()
	util.RenderTemplate(w, "deposit/add", c)
}

func (c *Context) ViewShowDepositAddPOST(w web.ResponseWriter, r *web.Request) {

	var (
		currency       = r.FormValue("currency")
		amountString   = r.FormValue("amount")
		crypto         = r.FormValue("crypto")
		isCaptchaValid = captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha"))

		amount  float64
		address string
		err     error
	)

	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.ViewShowDepositAddGET(w, r)
		return
	}

	if !inSet(crypto, CRYPTO_CURRENCIES) {
		c.Error = "Invalid crypto"
		c.ViewShowDepositAddGET(w, r)
		return
	}

	if !inSet(currency, FIAT_CURRENCIES) {
		c.Error = "Invalid currency"
		c.ViewShowDepositAddGET(w, r)
		return
	}

	amount, err = strconv.ParseFloat(amountString, 64)
	if err != nil || amount < 0 {
		c.Error = "Invalid amount"
		c.ViewShowDepositAddGET(w, r)
		return
	}

	currencyRate := GetCurrencyRate(currency, crypto)
	cryptoAmount := amount * currencyRate
	switch crypto {
	case "BTC":
		userWallets := c.ViewUser.User.FindUserBitcoinWallets()
		if userWallets.Balance().Balance < cryptoAmount {
			c.Error = fmt.Sprintf("Please deposit %f BTC to your onsite wallet.", cryptoAmount)
			c.ViewShowDepositAddGET(w, r)
			return
		}

		address, err = apis.GenerateBTCAddress("deposit")
		if err != nil {
			c.Error = err.Error()
			c.ViewShowDepositAddGET(w, r)
			return
		}

		_, err = userWallets.Send(address, cryptoAmount)
		if err != nil {
			c.Error = err.Error()
			c.ViewShowDepositAddGET(w, r)
			return
		}
	case "BCH":
		userWallets := c.ViewUser.User.FindUserBitcoinCashWallets()
		if userWallets.Balance().Balance < cryptoAmount {
			c.Error = fmt.Sprintf("Please deposit %f BCH to your onsite bitcoin wallet.", cryptoAmount)
			c.ViewShowDepositAddGET(w, r)
			return
		}

		address, err = apis.GenerateBCHAddress("deposit")
		if err != nil {
			c.Error = err.Error()
			c.ViewShowDepositAddGET(w, r)
			return
		}

		_, err = userWallets.Send(address, cryptoAmount)
		if err != nil {
			c.Error = err.Error()
			c.ViewShowDepositAddGET(w, r)
			return
		}
	case "ETH":
		userWallets := c.ViewUser.User.FindUserEthereumWallets()
		if userWallets.Balance().Balance < cryptoAmount {
			c.Error = fmt.Sprintf("Please deposit %f ETH to your onsite wallet.", cryptoAmount)
			c.ViewShowDepositAddGET(w, r)
			return
		}

		address, err = apis.GenerateETHAddress("deposit")
		if err != nil {
			c.Error = err.Error()
			c.ViewShowDepositAddGET(w, r)
			return
		}

		_, err = userWallets[0].Send(address, cryptoAmount)
		if err != nil {
			c.Error = err.Error()
			c.ViewShowDepositAddGET(w, r)
			return
		}
	default:
		c.Error = "Wrong currency " + crypto
		c.ViewShowDepositAddGET(w, r)
		return
	}

	_, err = CreateDeposit(c.ViewUserStore.Uuid, currency, amount, crypto, cryptoAmount, currencyRate, address)
	if err != nil {
		c.Error = err.Error()
		c.ViewShowDepositAddGET(w, r)
		return
	}

	redirectUrl := "/store-admin/" + c.ViewUserStore.Storename + "/deposits"
	http.Redirect(w, r.Request, redirectUrl, 302)
}

func (c *Context) ViewWithdrawDepositGET(w web.ResponseWriter, r *web.Request) {
	deposit, err := FindDepositByAddress(r.PathParams["deposit_uuid"])
	if err != nil {
		c.Error = err.Error()
		c.ViewWithdrawDepositGET(w, r)
		return
	}
	if deposit.StoreUuid != c.ViewUserStore.Uuid {
		c.Error = "Deposit does not belong to this user"
		c.ViewWithdrawDepositGET(w, r)
		return
	}
	c.Deposit = deposit
	util.RenderTemplate(w, "deposit/withdraw", c)
}

func (c *Context) ViewWithdrawDepositPOST(w web.ResponseWriter, r *web.Request) {
	deposit, err := FindDepositByAddress(r.PathParams["deposit_uuid"])
	if err != nil {
		c.Error = err.Error()
		c.ViewWithdrawDepositGET(w, r)
		return
	}
	if deposit.StoreUuid != c.ViewUserStore.Uuid {
		c.Error = "Deposit does not belong to this user"
		c.ViewWithdrawDepositGET(w, r)
		return
	}
	err = deposit.Withdraw()
	redirectUrl := "/store-admin/" + c.ViewUserStore.Storename + "/deposits"
	http.Redirect(w, r.Request, redirectUrl, 302)
}
