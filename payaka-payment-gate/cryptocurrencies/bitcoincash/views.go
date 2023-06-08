package bitcoincash

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/gocraft/web"
)

type ViewListBitcoinCashWalletsWithPositiveBalanceResponse struct {
	DisplayBitcoinCashWallets []DisplayBitcoinCashWallet `json:"wallets"`
	SummaryBalance            float64                    `json:"balance"`
}

func ViewListBitcoinCashWalletsWithPositiveBalance(w web.ResponseWriter, r *web.Request) {
	walletsResponse := ViewListBitcoinCashWalletsWithPositiveBalanceResponse{}
	wallets, err := FindBitcoinCashWalletsWithNonZeroBalance()

	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	for _, wallet := range wallets {
		ds := wallet.DisplayBitcoinCashWallet()
		walletsResponse.DisplayBitcoinCashWallets = append(walletsResponse.DisplayBitcoinCashWallets, ds)
		walletsResponse.SummaryBalance += ds.Balance
	}

	jsonBitcoinCashWallets, err := json.MarshalIndent(walletsResponse, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsonBitcoinCashWallets)
}

func ViewTableListBitcoinCashWalletsWithPositiveBalance(w web.ResponseWriter, r *web.Request) {
	walletsResponse := ViewListBitcoinCashWalletsWithPositiveBalanceResponse{}
	wallets, err := FindBitcoinCashWalletsWithNonZeroBalance()

	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	output := ""
	for _, wallet := range wallets {
		ds := wallet.DisplayBitcoinCashWallet()
		walletsResponse.DisplayBitcoinCashWallets = append(walletsResponse.DisplayBitcoinCashWallets, ds)
		walletsResponse.SummaryBalance += ds.Balance

		output += fmt.Sprintf("%s\t%f\t%f\t%s\n", wallet.PublicKey, wallet.Balance, wallet.UnconfirmedBalance, wallet.BitcoinCashWallet.Type)
	}

	w.Header().Set("Content-Type", "text/plain")
	w.Write([]byte(output))
}

func ViewCreateBitcoinCashWallet(w web.ResponseWriter, r *web.Request) {

	err := r.ParseForm()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	walletType := "escrow"
	if r.FormValue("type") != "" {
		walletType = r.FormValue("type")
	}

	wallet, err := CreateBitcoinCashWallet(walletType)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	jsBitcoinCashWallet, err := json.MarshalIndent(wallet, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsBitcoinCashWallet)
}

func ViewCreateMultisigBitcoinCashWallet(w web.ResponseWriter, r *web.Request) {

	err := r.ParseForm()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	if r.FormValue("buyer_public_key") == "" || r.FormValue("seller_public_key") == "" {
		http.Error(w, "Supply buyer_public_key and seller_public_key", 500)
		return
	}

	var (
		buyerPublicKey  = r.FormValue("buyer_public_key")
		sellerPublicKey = r.FormValue("seller_public_key")
	)

	wallet, err := CreateMultisigBitcoinCashWallet(buyerPublicKey, sellerPublicKey)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	jsBitcoinCashWallet, err := json.MarshalIndent(wallet, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsBitcoinCashWallet)
}

func ViewShowBitcoinCashWallet(w web.ResponseWriter, r *web.Request) {

	wallet, err := FindBitcoinCashWalletByPublicKey(r.PathParams["address"])
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	wb, err := wallet.UpdateBalance()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	ds := wb.DisplayBitcoinCashWallet()
	jsBitcoinCashWallet, err := json.MarshalIndent(ds, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsBitcoinCashWallet)
}

func ViewSendFromSingleBitcoinCashWalletWithPercentSplit(w web.ResponseWriter, r *web.Request) {

	err := r.ParseForm()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	var (
		addressFrom  = r.PathParams["address_from"]
		paymentsForm = r.FormValue("payments")
		payments     = []BCHPayment{}
	)

	err = json.Unmarshal([]byte(paymentsForm), &payments)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	wallet, err := FindBitcoinCashWalletByPublicKey(addressFrom)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	result, err := wallet.SendWithPercentSplit(payments)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	jsResp, err := json.MarshalIndent(result, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsResp)
}

func ViewSendFromMultipleBitcoinCashWalletsWithAmountSplit(w web.ResponseWriter, r *web.Request) {

	err := r.ParseForm()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	var (
		addressesForm = r.FormValue("addresses")
		paymentsForm  = r.FormValue("payments")
		payments      = []BCHPayment{}
		addresses     = []string{}
	)

	err = json.Unmarshal([]byte(paymentsForm), &payments)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	err = json.Unmarshal([]byte(addressesForm), &addresses)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	wallets := BitcoinCashWallets{}

	for _, addressFrom := range addresses {
		wallet, err := FindBitcoinCashWalletByPublicKey(addressFrom)
		if err != nil {
			http.Error(w, err.Error(), 500)
			return
		}
		wallets = append(wallets, *wallet)
	}

	result, err := wallets.SendWithAmountSplit(payments)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	jsResp, err := json.MarshalIndent(result, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsResp)
}

func ViewEstimateFeeFromMultipleBitcoinCashWalletsWithAmountSplit(w web.ResponseWriter, r *web.Request) {

	err := r.ParseForm()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	var (
		addressesForm = r.FormValue("addresses")
		paymentsForm  = r.FormValue("payments")
		payments      = []BCHPayment{}
		addresses     = []string{}
	)

	err = json.Unmarshal([]byte(paymentsForm), &payments)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	err = json.Unmarshal([]byte(addressesForm), &addresses)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	wallets := BitcoinCashWallets{}

	for _, addressFrom := range addresses {
		wallet, err := FindBitcoinCashWalletByPublicKey(addressFrom)
		if err != nil {
			http.Error(w, err.Error(), 500)
			return
		}
		wallets = append(wallets, *wallet)
	}

	result, err := wallets.BuildTransactionWithAmountSplit(payments, true)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	jsResp, err := json.MarshalIndent(result, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsResp)
}

func ViewUpdateBitcoinCashWallets(w web.ResponseWriter, r *web.Request) {
	go UpdateBitcoinCashWalletBalances()
}
