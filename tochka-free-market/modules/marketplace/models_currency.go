package marketplace

import (
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
)

/*
	Models
*/

var (
	CRYPTO_CURRENCIES = []string{"ETH", "BTC"}
	FIAT_CURRENCIES   = []string{"USD", "EUR", "AUD", "GBP", "RUB"}
	CURRENCY_RATES    = map[string]map[string]float64{}
)

func UpdateCurrencyRates() {
	for _, currency := range CRYPTO_CURRENCIES {
		rates, err := apis.GetCurrencyRates(currency)
		if err != nil {
			continue
		}
		CURRENCY_RATES[currency] = rates
	}

	for _, currency := range FIAT_CURRENCIES {
		rates, err := apis.GetCurrencyRates(currency)
		if err != nil {
			continue
		}
		CURRENCY_RATES[currency] = rates
	}
}

func GetCurrencyRate(baseCurrency, targetCurrency string) float64 {
	if rates, ok1 := CURRENCY_RATES[baseCurrency]; ok1 {
		if rate, ok2 := rates[targetCurrency]; ok2 {
			return rate
		}
	}
	return 1.0
}
