package bitcoin

import (
	"github.com/gocraft/web"
)

func ConfigureRouter(router *web.Router) {
	router.Get("/update", ViewUpdateBitcoinWallets)
	router.Get("/update/premium", ViewUpdatePremiumBitcoinWallets)
	router.Get("/wallets", ViewListBitcoinWalletsWithPositiveBalance)
	router.Get("/wallets_plain", ViewTableListBitcoinWalletsWithPositiveBalance)
	router.Get("/wallets/:address", ViewShowBitcoinWallet)
	router.Post("/wallets/:address_from/send", ViewSendFromSingleBitcoinWalletWithPercentSplit)
	router.Post("/wallets/send", ViewSendFromMultipleBitcoinWalletsWithAmountSplit)
	router.Post("/wallets/send/fee", ViewEstimateFeeFromMultipleBitcoinWalletsWithAmountSplit)
	router.Post("/wallets/new", ViewCreateBitcoinWallet)
	router.Post("/wallets/new_multisig", ViewCreateMultisigBitcoinWallet)
}
