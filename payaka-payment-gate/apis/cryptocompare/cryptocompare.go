package cryptocompare

import (
	"encoding/json"
	"strings"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/apis"
)

const CRYPTOCOMPARE_RATES_URL = "https://min-api.cryptocompare.com/data/price?fsym={base_currency}&tsyms=USD,RUB,EUR,GBP,AUD,ETH,BTC"

type CryptocompateCurrencyResponse struct {
	USD float64 `json:"USD"`
	RUB float64 `json:"RUB"`
	EUR float64 `json:"EUR"`
	AUD float64 `json:"AUD"`
	GBP float64 `json:"GBP"`
	ETH float64 `json:"ETH"`
	BTC float64 `json:"BTC"`
}

func GetCryptocompareCurrencyResponse(baseCurrency string) (CryptocompateCurrencyResponse, error) {
	currencyResponse := CryptocompateCurrencyResponse{}
	url := strings.Replace(CRYPTOCOMPARE_RATES_URL, "{base_currency}", baseCurrency, -1)
	response, err := apis.TorGET(url)
	if err != nil {
		return currencyResponse, err
	}
	currencyResponse.BTC = 1.0
	err = json.Unmarshal([]byte(response), &currencyResponse)
	return currencyResponse, err
}
