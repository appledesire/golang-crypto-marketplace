package cryptocurrencies

import (
	"encoding/json"
	"net/http"

	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/apis/cryptocompare"
)

type ViewShowCurrencyResponse struct {
	USD float64
	EUR float64
	GBP float64
	AUD float64
	RUB float64
}

func ViewShowCurrency(w web.ResponseWriter, r *web.Request) {

	baseCurrency := r.PathParams["base_currency"]

	resp, err := cryptocompare.GetCryptocompareCurrencyResponse(baseCurrency)

	jsResp, err := json.MarshalIndent(resp, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsResp)
}
