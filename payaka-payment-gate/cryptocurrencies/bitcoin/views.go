package bitcoin

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/gocraft/web"
)

type ViewListBitcoinWalletsWithPositiveBalanceResponse struct {
	DisplayBitcoinWallets []DisplayBitcoinWallet `json:"wallets"`
	SummaryBalance        float64                `json:"balance"`
}

func ViewListBitcoinWalletsWithPositiveBalance(w web.ResponseWriter, r *web.Request) {
	walletsResponse := ViewListBitcoinWalletsWithPositiveBalanceResponse{}
	wallets, err := FindBitcoinWalletsWithNonZeroBalance()

	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	for _, wallet := range wallets {
		ds := wallet.DisplayBitcoinWallet()
		walletsResponse.DisplayBitcoinWallets = append(walletsResponse.DisplayBitcoinWallets, ds)
		walletsResponse.SummaryBalance += ds.Balance
	}

	jsonBitcoinWallets, err := json.MarshalIndent(walletsResponse, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsonBitcoinWallets)
}

func ViewTableListBitcoinWalletsWithPositiveBalance(w web.ResponseWriter, r *web.Request) {
	walletsResponse := ViewListBitcoinWalletsWithPositiveBalanceResponse{}
	wallets, err := FindBitcoinWalletsWithNonZeroBalance()

	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	output := ""
	for _, wallet := range wallets {
		ds := wallet.DisplayBitcoinWallet()
		walletsResponse.DisplayBitcoinWallets = append(walletsResponse.DisplayBitcoinWallets, ds)
		walletsResponse.SummaryBalance += ds.Balance

		output += fmt.Sprintf("%s\t%f\t%f\t%s\n", wallet.PublicKey, wallet.Balance, wallet.UnconfirmedBalance, wallet.BitcoinWallet.Type)
	}

	w.Header().Set("Content-Type", "text/plain")
	w.Write([]byte(output))
}

func ViewCreateBitcoinWallet(w web.ResponseWriter, r *web.Request) {

	err := r.ParseForm()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	walletType := "escrow"
	if r.FormValue("type") != "" {
		walletType = r.FormValue("type")
	}

	wallet, err := CreateBitcoinWallet(walletType)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	jsBitcoinWallet, err := json.MarshalIndent(wallet, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsBitcoinWallet)
}

func ViewCreateMultisigBitcoinWallet(w web.ResponseWriter, r *web.Request) {

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

	wallet, err := CreateMultisigBitcoinWallet(buyerPublicKey, sellerPublicKey)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	wallet.PrivateKey = wallet.WIFC

	jsBitcoinWallet, err := json.MarshalIndent(wallet, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsBitcoinWallet)
}

func ViewShowBitcoinWallet(w web.ResponseWriter, r *web.Request) {

	wallet, err := FindBitcoinWalletByPublicKey(r.PathParams["address"])
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	wb, err := wallet.UpdateBalance()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	ds := wb.DisplayBitcoinWallet()
	ds.Type = wallet.Type
	ds.CreatedAt = wallet.CreatedAt
	jsBitcoinWallet, err := json.MarshalIndent(ds, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsBitcoinWallet)
}

func ViewSendFromSingleBitcoinWalletWithPercentSplit(w web.ResponseWriter, r *web.Request) {

	err := r.ParseForm()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	var (
		addressFrom  = r.PathParams["address_from"]
		paymentsForm = r.FormValue("payments")
		payments     = []BTCPayment{}
	)

	err = json.Unmarshal([]byte(paymentsForm), &payments)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	wallet, err := FindBitcoinWalletByPublicKey(addressFrom)
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

func ViewSendFromMultipleBitcoinWalletsWithAmountSplit(w web.ResponseWriter, r *web.Request) {

	err := r.ParseForm()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	var (
		addressesForm = r.FormValue("addresses")
		paymentsForm  = r.FormValue("payments")
		payments      = []BTCPayment{}
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

	wallets := BitcoinWallets{}

	for _, addressFrom := range addresses {
		wallet, err := FindBitcoinWalletByPublicKey(addressFrom)
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

func ViewEstimateFeeFromMultipleBitcoinWalletsWithAmountSplit(w web.ResponseWriter, r *web.Request) {

	err := r.ParseForm()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	var (
		addressesForm = r.FormValue("addresses")
		paymentsForm  = r.FormValue("payments")
		payments      = []BTCPayment{}
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

	wallets := BitcoinWallets{}

	for _, addressFrom := range addresses {
		wallet, err := FindBitcoinWalletByPublicKey(addressFrom)
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

func ViewUpdateBitcoinWallets(w web.ResponseWriter, r *web.Request) {
	go UpdateBitcoinWalletBalances()
}

func ViewUpdatePremiumBitcoinWallets(w web.ResponseWriter, r *web.Request) {
	go UpdatePremiumBitcoinWalletBalances()
}
