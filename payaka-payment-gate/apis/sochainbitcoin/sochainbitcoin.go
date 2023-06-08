package sochainbitcoin

import (
	"encoding/json"
	"errors"

	"go.uber.org/ratelimit"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/apis"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/apis/insight"
)

/*
	Globals
*/
var (
	api = SoChainBitcoinAPI{Proxified: true, rl: ratelimit.New(5)}
)

/*
	API Definition
*/

type SoChainBitcoinAPI struct {
	Proxified bool
	rl        ratelimit.Limiter
}

/*
	Models
*/

type WalletBalance struct {
	Network            string  `json:"network"`
	Address            string  `json:"address"`
	ConfirmedBalance   float64 `json:"confirmed_balance,string"`
	UnconfirmedBalance float64 `json:"unconfirmed_balance,string"`
}

type Tx struct {
	TxID          string  `json:"txid"`
	OutputNo      uint64  `json:"output_no"`
	ScriptAsm     string  `json:"script_asm"`
	ScriptHex     string  `json:"script_hex"`
	Value         float64 `json:"value,string"`
	Confirmations uint64  `json:"confirmations"`
	Time          uint64  `json:"time"`
}

/*
	Responses
*/

type WalletBalanceResponse struct {
	Status string         `json:"status"`
	Data   *WalletBalance `json:"data"`
}

type UtxoResponse struct {
	Status string `json:"status"`
	Data   *struct {
		Network string `json:"network"`
		Address string `json:"address"`
		Txs     []Tx   `json:"txs"`
	} `json:"data"`
}

/*
	Proxy / Direct HTTP Handles
*/

func (api SoChainBitcoinAPI) GetHTTPGetMethod() func(string) (string, error) {
	if api.Proxified {
		return apis.TorGET
	} else {
		return apis.DirectGET
	}
}

// func (api SoChainBitcoinAPI) GetHTTPPostMethod() func(string, url.Values) (string, error) {
// 	if api.Proxified {
// 		return apis.TorPOST
// 	} else {
// 		return apis.DirectPOST
// 	}
// }

/*
	Methods
*/

func (api SoChainBitcoinAPI) GetWalletBalance(publicKey string) (insight.WalletBalance, error) {
	api.rl.Take()
	addr := "https://chain.so/api/v2/get_address_balance/BTC/" + publicKey
	response, err := api.GetHTTPGetMethod()(addr)
	if err != nil {
		return insight.WalletBalance{}, err
	}
	wbr := WalletBalanceResponse{}
	err = json.Unmarshal([]byte(response), &wbr)
	if err != nil {
		return insight.WalletBalance{}, err
	}
	if wbr.Status != "success" || wbr.Data == nil {
		return insight.WalletBalance{}, errors.New("Status != success")
	}
	return wbr.Data.ConvertToInsightWalletBalance(), nil
}

func (api SoChainBitcoinAPI) GetUTXO(publicKey string) ([]insight.Tx, error) {
	api.rl.Take()
	addr := "https://chain.so/api/v2/get_tx_unspent/BTC/" + publicKey
	response, err := api.GetHTTPGetMethod()(addr)
	if err != nil {
		return []insight.Tx{}, err
	}
	wbr := UtxoResponse{}
	err = json.Unmarshal([]byte(response), &wbr)
	if err != nil {
		return []insight.Tx{}, err
	}
	if wbr.Status != "success" || wbr.Data == nil {
		return []insight.Tx{}, errors.New("Status != success")
	}

	itxs := []insight.Tx{}
	for i, _ := range wbr.Data.Txs {
		itxs = append(itxs, wbr.Data.Txs[i].ConvertToInsightTx(publicKey))
	}

	return itxs, nil
}

/*
	Conversions
*/

func (tx Tx) ConvertToInsightTx(address string) insight.Tx {
	return insight.Tx{
		PublicKey:       address,
		TxID:            tx.TxID,
		Vout:            tx.OutputNo,
		ScriptPublicKey: tx.ScriptHex,
		Amount:          tx.Value,
		Confirmations:   tx.Confirmations,
	}
}

func (wb WalletBalance) ConvertToInsightWalletBalance() insight.WalletBalance {
	return insight.WalletBalance{
		PublicKey:          wb.Address,
		Balance:            wb.ConfirmedBalance,
		UnconfirmedBalance: wb.UnconfirmedBalance,
	}
}

/*
	API Constructors
*/

func GetSoChainBitcoinAPI() SoChainBitcoinAPI {
	return api
}
