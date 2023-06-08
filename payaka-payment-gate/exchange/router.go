package exchange

import (
	"github.com/gocraft/web"
)

func ConfigureRouter(router *web.Router) {
	router.Post("/bch2btc", ViewSendBitcoinCashToBitcoin)
}
