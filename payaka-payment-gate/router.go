package main

import (
	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/cryptocurrencies"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/cryptocurrencies/bitcoin"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/cryptocurrencies/bitcoincash"
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/cryptocurrencies/ethereum"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/exchange"
)

func ConfigureRouter(router *web.Router) *web.Router {

	bitcoinRouter := router.Subrouter(Context{}, "/bitcoin")
	bitcoin.ConfigureRouter(bitcoinRouter)

	bitcoinCashRouter := router.Subrouter(Context{}, "/bitcoin_cash")
	bitcoincash.ConfigureRouter(bitcoinCashRouter)

	ethereumRouter := router.Subrouter(Context{}, "/ethereum")
	ethereum.ConfigureRouter(ethereumRouter)

	// Exchange
	exchangeRouter := router.Subrouter(Context{}, "/exchange")
	exchange.ConfigureRouter(exchangeRouter)

	// Currency
	router.Get("/currency/:base_currency", cryptocurrencies.ViewShowCurrency)
	return router
}
