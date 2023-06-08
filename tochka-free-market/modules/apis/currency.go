package apis

import (
	"encoding/json"
	"fmt"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func GetCurrencyRates(baseCurrency string) (map[string]float64, error) {
	rates := map[string]float64{}

	apiEndpoint := fmt.Sprintf("%s/currency/%s", APPLICATION_SETTINGS.PaymentGate, baseCurrency)
	response, err := util.DirectGET(apiEndpoint)
	if err != nil {
		return rates, err
	}

	err = json.Unmarshal([]byte(response), &rates)
	return rates, err
}
