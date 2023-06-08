package apis

import (
	"encoding/json"
	"fmt"
	"net/url"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

type BCHPayment struct {
	Address string  `json:"address"`
	Percent float64 `json:"percent,omitempty"`
	Amount  float64 `json:"amount,omitempty"`
}

type BCHWalletBalance struct {
	Balance            float64 `json:"balance"`
	UnconfirmedBalance float64 `json:"unconfirmed_balance"`
}

type BCHTxOutput struct {
	PublicKey string `json:"address"`
	Satoshis  int    `json:"satoshis"`
}

type BCHPaymentResult struct {
	Fee            int           `json:"fee"`
	Description    string        `json:"description"`
	Hash           string        `json:"hash"`
	RawTransaction string        `json:"rawTransaction"`
	Outputs        []BCHTxOutput `json:"outputs"`
	Error          *string       `json:"error"`
}

func GenerateBCHAddress(walletType string) (string, error) {

	apiEndpoint := fmt.Sprintf("%s/bitcoin_cash/wallets/new", APPLICATION_SETTINGS.PaymentGate)

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

func GenerateBCHMultisigAddress(buyerPublicKey, sellerPublicKey string) (string, string, string, error) {
	apiEndpoint := fmt.Sprintf("%s/bitcoin_cash/wallets/new_multisig", APPLICATION_SETTINGS.PaymentGate)
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

func GetAmountOnBCHAddress(address string) (BCHWalletBalance, error) {
	apiEndpoint := fmt.Sprintf("%s/bitcoin_cash/wallets/%s", APPLICATION_SETTINGS.PaymentGate, address)

	walletBalance := BCHWalletBalance{}

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

func SendBCHFromSingleWalletWithPercentSplit(addressFrom string, btcPayments []BCHPayment) (BCHPaymentResult, error) {
	var (
		paymentsJSON, _ = json.Marshal(btcPayments)
		apiEndpoint     = fmt.Sprintf("%s/bitcoin_cash/wallets/%s/send", APPLICATION_SETTINGS.PaymentGate, addressFrom)
		result          = BCHPaymentResult{}
	)
	response, err := util.DirectPOST(apiEndpoint, url.Values{"payments": {string(paymentsJSON)}})
	if err != nil {
		return result, err
	}

	err = json.Unmarshal([]byte(response), &result)
	return result, err
}

func SendBCHFromMultipleWalletsWithAmountSplit(addressFrom []string, btcPayments []BCHPayment) (BCHPaymentResult, error) {
	var (
		apiEndpoint = fmt.Sprintf("%s/bitcoin_cash/wallets/send", APPLICATION_SETTINGS.PaymentGate)
		result      = BCHPaymentResult{}
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

func EstimateBCHFeeFromMultipleWalletsWithAmountSplit(
	addressFrom []string,
	btcPayments []BCHPayment,
) (BCHPaymentResult, error) {
	var (
		apiEndpoint = fmt.Sprintf("%s/bitcoin_cash/wallets/send/fee", APPLICATION_SETTINGS.PaymentGate)
		result      = BCHPaymentResult{}
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

func SendBCHToBTC(bchAddress, btcAddress string) (BTCPaymentResult, error) {
	var (
		apiEndpoint = fmt.Sprintf("%s/exchange/bch2btc", APPLICATION_SETTINGS.PaymentGate)
		result      = BTCPaymentResult{}
	)

	response, err := util.DirectPOST(
		apiEndpoint,
		url.Values{
			"bch_address": {string(bchAddress)},
			"btc_address": {string(btcAddress)},
		},
	)
	if err != nil {
		return result, err
	}

	err = json.Unmarshal([]byte(response), &result)
	return result, err
}
