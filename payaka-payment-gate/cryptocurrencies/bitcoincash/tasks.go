package bitcoincash

import (
	"time"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/settings"
)

func TaskUpdateBitcoinCashWalletBalances() {
	c := time.Tick(24 * time.Hour)
	for range c {
		UpdateBitcoinCashWalletBalances()
	}
}

func TaskUpdateBitcoinCashTransactionFee() {
	UpdateBCHTransactionFee()
	c := time.Tick(1 * time.Minute)
	for range c {
		UpdateBCHTransactionFee()
	}
}

func init() {
	if !settings.APPLICATION_SETTINGS.Debug {
		go TaskUpdateBitcoinCashTransactionFee()
	}
}
