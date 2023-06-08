package etherscan

import (
	"errors"
	"fmt"

	"encoding/json"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/apis"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/settings"
)

type EtherscanPushTransactionResponse struct {
	Error *struct {
		Code    int    `json:"code"`
		Message string `json:"message"`
	} `json:"error"`
	Result *string `json:"result"`
}

func PushEtherscanTransacation(rawtx string) (string, error) {
	var (
		etherscanURL = fmt.Sprintf(
			"https://api.etherscan.io/api?module=proxy&action=eth_sendRawTransaction&hex=%s&apikey=%s",
			rawtx,
			settings.PAYMENT_GATE_SETTINGS.EtherscanAPIKey,
		)
		result = EtherscanPushTransactionResponse{}
	)

	response, err := apis.TorGET(etherscanURL)
	if err != nil {
		return response, err
	}

	err = json.Unmarshal([]byte(response), &result)
	if err != nil {
		return response, err
	}

	if result.Error != nil {
		return response, errors.New(result.Error.Message)
	}

	if result.Result != nil {
		return *result.Result, nil
	}

	return "", errors.New("Unexpected result")
}
