package bitcoincash

import (
	"github.com/gocraft/web"
)

func ConfigureRouter(router *web.Router) {
	router.Get("/update", ViewUpdateBitcoinCashWallets)
	router.Get("/wallets", ViewListBitcoinCashWalletsWithPositiveBalance)
	router.Get("/wallets_plain", ViewTableListBitcoinCashWalletsWithPositiveBalance)
	router.Get("/wallets/:address", ViewShowBitcoinCashWallet)
	router.Post("/wallets/:address_from/send", ViewSendFromSingleBitcoinCashWalletWithPercentSplit)
	router.Post("/wallets/send", ViewSendFromMultipleBitcoinCashWalletsWithAmountSplit)
	router.Post("/wallets/send/fee", ViewEstimateFeeFromMultipleBitcoinCashWalletsWithAmountSplit)
	router.Post("/wallets/new", ViewCreateBitcoinCashWallet)
	router.Post("/wallets/new_multisig", ViewCreateMultisigBitcoinCashWallet)
}
