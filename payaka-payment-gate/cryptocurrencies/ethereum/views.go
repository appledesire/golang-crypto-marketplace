package ethereum

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/gocraft/web"
)

func ViewCreateEthereumWallet(w web.ResponseWriter, r *web.Request) {

	err := r.ParseForm()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	walletType := "escrow"
	if r.FormValue("type") != "" {
		walletType = r.FormValue("type")
	}

	wallet, err := CreateEthereumWallet(walletType)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	balance, err := wallet.UpdateBalance()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	displayWallet := balance.DisplayEthereumWallet()

	jsonEthereumWallet, err := json.MarshalIndent(displayWallet, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsonEthereumWallet)
}

func ViewShowEthereumWallet(w web.ResponseWriter, r *web.Request) {

	wallet, err := FindEthereumWalletByPublicKey(r.PathParams["address"])
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	wb, err := wallet.UpdateBalance()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	ds := wb.DisplayEthereumWallet()
	jsEthereumWallet, err := json.MarshalIndent(ds, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsEthereumWallet)
}

type ViewListEthereumWalletsWithPositiveBalanceResponse struct {
	DisplayEthereumWallets []DisplayEthereumWallet `json:"wallets"`
	SummaryBalance         float64                 `json:"balance"`
}

func ViewListEthereumWalletsWithPositiveBalance(w web.ResponseWriter, r *web.Request) {
	walletsResponse := ViewListEthereumWalletsWithPositiveBalanceResponse{}
	wallets, err := FindEthereumWalletsWithNonZeroBalance()

	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	for _, wallet := range wallets {
		ds := wallet.DisplayEthereumWallet()
		walletsResponse.DisplayEthereumWallets = append(walletsResponse.DisplayEthereumWallets, ds)
		walletsResponse.SummaryBalance += ds.Balance
	}

	jsonEthereumWallets, err := json.MarshalIndent(walletsResponse, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsonEthereumWallets)
}

func ViewTableListEthereumWalletsWithPositiveBalance(w web.ResponseWriter, r *web.Request) {
	walletsResponse := ViewListEthereumWalletsWithPositiveBalanceResponse{}
	wallets, err := FindEthereumWalletsWithNonZeroBalance()

	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	output := ""
	for _, wallet := range wallets {
		ds := wallet.DisplayEthereumWallet()
		walletsResponse.DisplayEthereumWallets = append(walletsResponse.DisplayEthereumWallets, ds)
		walletsResponse.SummaryBalance += ds.Balance

		output += fmt.Sprintf("%s\t%f\t%s\n", ds.PublicKey, ds.Balance, ds.Type)
	}

	w.Header().Set("Content-Type", "text/plain")
	w.Write([]byte(output))
}

func ViewSendFromEthereumWallet(w web.ResponseWriter, r *web.Request) {

	err := r.ParseForm()
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	var (
		addressFrom  = r.PathParams["address_from"]
		paymentsForm = r.FormValue("payments")
		payments     = []ETHPayment{}
	)

	err = json.Unmarshal([]byte(paymentsForm), &payments)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	wallet, err := FindEthereumWalletByPublicKey(addressFrom)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	results, err := wallet.Transfer(payments)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	jsonResult, err := json.MarshalIndent(results, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsonResult)
}

func ViewEthRPCGet(w web.ResponseWriter, r *web.Request) {
}
