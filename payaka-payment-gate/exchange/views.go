package exchange

import (
	"encoding/json"
	"net/http"

	"github.com/gocraft/web"
)

func ViewSendBitcoinCashToBitcoin(w web.ResponseWriter, r *web.Request) {
	var (
		bchWalletPK = r.FormValue("bch_address")
		btcWalletPK = r.FormValue("btc_address")
	)

	paymentResult, err := TransferBitcoinCashToBitcoin(bchWalletPK, btcWalletPK)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	jsPaymentResult, err := json.MarshalIndent(paymentResult, "", "  ")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsPaymentResult)
}
