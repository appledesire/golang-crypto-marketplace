package ethereum

import (
	"github.com/gocraft/web"
)

func ConfigureRouter(router *web.Router) {
	router.Get("/wallets", ViewListEthereumWalletsWithPositiveBalance)
	router.Get("/wallets_plain", ViewTableListEthereumWalletsWithPositiveBalance)
	router.Get("/wallets/:address", ViewShowEthereumWallet)
	router.Post("/wallets/:address_from/send", ViewSendFromEthereumWallet)
	router.Post("/wallets/new", ViewCreateEthereumWallet)

	router.Get("/eth-rpc", ViewCreateEthereumWallet)
	router.Post("/eth-rpc", ViewCreateEthereumWallet)
}
