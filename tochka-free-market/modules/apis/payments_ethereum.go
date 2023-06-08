package apis

import (
	"encoding/json"
	"fmt"
	"net/url"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

type ETHPayment struct {
	Address string  `json:"address"`
	Percent float64 `json:"percent,omitempty"`
	Amount  float64 `json:"amount,omitempty"`
}

type ETHWalletBalance struct {
	Balance float64 `json:"balance"`
}

type ETHPaymentResult struct {
	Hash           string `json:"hash"`
	RawTx          string `json:"rawTransaction"`
	WalletFrom     string `json:"wallet_from"`
	WalletTo       string `json:"wallet_to"`
	Cost           int64  `json:"cost"`
	Amount         int64  `json:"amount"`
	Contract       string `json:"contract,omitempty"`
	ContractMethod string `json:"contract_method,omitempty"`
}

func GenerateETHAddress(walletType string) (string, error) {
	apiEndpoint := fmt.Sprintf("%s/ethereum/wallets/new", APPLICATION_SETTINGS.PaymentGate)

	response, err := util.DirectPOST(apiEndpoint, url.Values{"type": {walletType}})
	if err != nil {
		return "", err
	}

	var dat map[string]interface{}
	err = json.Unmarshal([]byte(response), &dat)
	if err != nil {
		return "", err
	}

	address := dat["address"].(string)
	return address, nil
}

func GetAmountOnETHAddress(address string) (ETHWalletBalance, error) {
	apiEndpoint := fmt.Sprintf("%s/ethereum/wallets/%s", APPLICATION_SETTINGS.PaymentGate, address)

	walletBalance := ETHWalletBalance{}

	body, err := util.DirectGET(apiEndpoint)
	if err != nil {
		return walletBalance, err
	}

	var dat map[string]interface{}
	err = json.Unmarshal([]byte(body), &dat)
	if err != nil {
		return walletBalance, err
	}

	var balance float64
	if dat["balance"] != nil {
		balance = dat["balance"].(float64)
	} else {
		balance = 0.0
	}

	walletBalance.Balance = balance

	return walletBalance, nil
}

func SendETH(addressFrom string, btcPayments []ETHPayment) (ETHPaymentResult, error) {
	var (
		apiEndpoint = fmt.Sprintf("%s/ethereum/wallets/%s/send", APPLICATION_SETTINGS.PaymentGate, addressFrom)
		result      = ETHPaymentResult{}
	)

	paymentsJSON, err := json.Marshal(btcPayments)
	if err != nil {
		return result, err
	}

	response, err := util.DirectPOST(
		apiEndpoint,
		url.Values{
			"payments": {string(paymentsJSON)},
		},
	)
	if err != nil {
		return result, err
	}

	err = json.Unmarshal([]byte(response), &result)
	return result, err
}
