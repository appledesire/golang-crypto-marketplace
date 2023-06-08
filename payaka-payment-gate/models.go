package main

import (
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/cryptocurrencies/bitcoin"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/cryptocurrencies/bitcoincash"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/cryptocurrencies/ethereum"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/db"
)

func SyncDatabase() {
	db.Database.AutoMigrate(
		&bitcoin.BitcoinWallet{},
		&bitcoin.BitcoinWalletBalance{},

		&bitcoincash.BitcoinCashWallet{},
		&bitcoincash.BitcoinCashWalletBalance{},

		&ethereum.EthereumWallet{},
		&ethereum.EthereumWalletBalance{},
	)

	ethereum.SetupViews()
	bitcoin.SetupViews()
	bitcoincash.SetupViews()
}
