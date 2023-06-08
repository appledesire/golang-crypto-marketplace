package apis

import (
	"encoding/json"
	"fmt"
	"net/url"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

type BTCPayment struct {
	Address string  `json:"address"`
	Percent float64 `json:"percent,omitempty"`
	Amount  float64 `json:"amount,omitempty"`
	Fee     bool    `json:"fee,omitempty"`
}

type BTCWalletBalance struct {
	Balance            float64 `json:"balance"`
	UnconfirmedBalance float64 `json:"unconfirmed_balance"`
}

type BTCTxOutput struct {
	PublicKey string `json:"address"`
	Satoshis  int    `json:"satoshis"`
}

type BTCPaymentResult struct {
	Fee            int           `json:"fee"`
	Description    string        `json:"description"`
	Hash           string        `json:"hash"`
	RawTransaction string        `json:"rawTransaction"`
	Outputs        []BTCTxOutput `json:"outputs"`
	Error          *string       `json:"error"`
}

func GenerateBTCAddress(walletType string) (string, error) {

	apiEndpoint := fmt.Sprintf("%s/bitcoin/wallets/new", APPLICATION_SETTINGS.PaymentGate)

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

func GenerateBTCMultisigAddress(buyerPublicKey, sellerPublicKey string) (string, string, string, error) {
	apiEndpoint := fmt.Sprintf("%s/bitcoin/wallets/new_multisig", APPLICATION_SETTINGS.PaymentGate)
	body, err := util.DirectPOST(apiEndpoint, url.Values{
		"buyer_public_key":  {buyerPublicKey},
		"seller_public_key": {sellerPublicKey},
	})
	if err != nil {
		return "", "", "", err
	}

	var dat map[string]interface{}
	err = json.Unmarshal([]byte(body), &dat)
	if err != nil {
		return "", "", "", err
	}

	var (
		address    = dat["multisig_address"].(string)
		publicKey  = dat["multisig_public_key"].(string)
		privateKey = dat["private_key"].(string)
	)

	return address, publicKey, privateKey, nil
}

func GetAmountOnBTCAddress(address string) (BTCWalletBalance, error) {
	apiEndpoint := fmt.Sprintf("%s/bitcoin/wallets/%s", APPLICATION_SETTINGS.PaymentGate, address)

	walletBalance := BTCWalletBalance{}

	body, err := util.DirectGET(apiEndpoint)
	if err != nil {
		return walletBalance, err
	}

	var dat map[string]interface{}
	err = json.Unmarshal([]byte(body), &dat)
	if err != nil {
		return walletBalance, err
	}

	var balance, unconfirmedBalance float64
	if dat["balance"] != nil {
		balance = dat["balance"].(float64)
	} else {
		balance = 0.0
	}

	if dat["unconfirmed_balance"] != nil {
		unconfirmedBalance = dat["unconfirmed_balance"].(float64)
	} else {
		unconfirmedBalance = 0.0
	}

	walletBalance.Balance = balance
	walletBalance.UnconfirmedBalance = unconfirmedBalance

	return walletBalance, nil
}

func SendBTCFromSingleWalletWithPercentSplit(addressFrom string, btcPayments []BTCPayment) (BTCPaymentResult, error) {
	var (
		paymentsJSON, _ = json.Marshal(btcPayments)
		apiEndpoint     = fmt.Sprintf("%s/bitcoin/wallets/%s/send", APPLICATION_SETTINGS.PaymentGate, addressFrom)
		result          = BTCPaymentResult{}
	)
	response, err := util.DirectPOST(apiEndpoint, url.Values{"payments": {string(paymentsJSON)}})
	if err != nil {
		return result, err
	}

	println(
		fmt.Sprintf(
			"Sending request to payaka:\ncurl %s -d `payments=%s`",
			apiEndpoint,
			string(paymentsJSON),
		))

	err = json.Unmarshal([]byte(response), &result)
	return result, err
}

func SendBTCFromMultipleWalletsWithAmountSplit(addressFrom []string, btcPayments []BTCPayment) (BTCPaymentResult, error) {
	var (
		apiEndpoint = fmt.Sprintf("%s/bitcoin/wallets/send", APPLICATION_SETTINGS.PaymentGate)
		result      = BTCPaymentResult{}
	)

	paymentsJSON, err := json.Marshal(btcPayments)
	if err != nil {
		return result, err
	}

	addressesJSON, err := json.Marshal(addressFrom)
	if err != nil {
		return result, err
	}

	response, err := util.DirectPOST(
		apiEndpoint,
		url.Values{
			"addresses": {string(addressesJSON)},
			"payments":  {string(paymentsJSON)},
		},
	)
	if err != nil {
		return result, err
	}

	err = json.Unmarshal([]byte(response), &result)
	return result, err
}

func EstimateBTCFeeFromMultipleWalletsWithAmountSplit(addressFrom []string, btcPayments []BTCPayment) (BTCPaymentResult, error) {
	var (
		apiEndpoint = fmt.Sprintf("%s/bitcoin/wallets/send/fee", APPLICATION_SETTINGS.PaymentGate)
		result      = BTCPaymentResult{}
	)

	paymentsJSON, err := json.Marshal(btcPayments)
	if err != nil {
		return result, err
	}

	addressesJSON, err := json.Marshal(addressFrom)
	if err != nil {
		return result, err
	}

	response, err := util.DirectPOST(
		apiEndpoint,
		url.Values{
			"addresses": {string(addressesJSON)},
			"payments":  {string(paymentsJSON)},
		},
	)
	if err != nil {
		return result, err
	}

	err = json.Unmarshal([]byte(response), &result)
	return result, err
}
