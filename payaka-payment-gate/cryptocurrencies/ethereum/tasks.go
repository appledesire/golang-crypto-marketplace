package ethereum

import (
	"time"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/settings"
)

func TaskUpdateEthereumWalletBalances() {
	c := time.Tick(24 * time.Hour)
	for range c {
		UpdateEthereumWalletBalances()
	}
}

func init() {
	if !settings.APPLICATION_SETTINGS.Debug {
		go TaskUpdateEthereumWalletBalances()
	}
}
