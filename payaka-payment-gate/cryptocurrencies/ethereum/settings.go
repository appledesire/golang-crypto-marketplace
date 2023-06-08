package ethereum

import (
	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/settings"
)

var (
	PAYMENT_GATE_SETTINGS = settings.LoadPaymentGateSettings()
	WEI_IN_ETH            = float64(1e18)
)
