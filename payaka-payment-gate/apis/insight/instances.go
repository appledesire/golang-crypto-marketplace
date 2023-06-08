package insight

import (
	"math/rand"
	"time"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/settings"
)

/*
	Bitcoin
*/

var (
	localInsightAPI = NewAPI(settings.PAYMENT_GATE_SETTINGS.BitcoinInsightAPIURL, false, 100)
	// bitaccessInsightAPI    = NewAPI("https://search.bitaccess.co/insight-api", true, 5)
	bitpayInsightAPI       = NewAPI("https://insight.bitpay.com/api", false, 5)
	localBitcoinInsightAPI = NewAPI("https://localbitcoinschain.com/api", false, 5)
)

func multiplyAPIs(api InsightAPI, numInstances int) []InsightAPI {
	apiSet := []InsightAPI{}
	for i := 0; i < numInstances; i += 1 {
		apiSet = append(apiSet, api)
	}
	return apiSet
}

func GetRandomBitcoinInsightAPI() InsightAPI {

	apiSet := []InsightAPI{}
	// apiSet = append(apiSet, multiplyAPIs(bitaccessInsightAPI, 5)...)
	// apiSet = append(apiSet, multiplyAPIs(bitpayInsightAPI, 5)...)
	// apiSet = append(apiSet, multiplyAPIs(localBitcoinInsightAPI, 5)...)
	apiSet = append(apiSet, multiplyAPIs(localInsightAPI, 5)...)

	rand.Seed(time.Now().Unix())
	return apiSet[rand.Intn(len(apiSet))]
}

func GetAnonymizedInsightAPI() InsightAPI {
	return bitpayInsightAPI
}

/*
	Bitcoin Cash
*/

func GetBlockdozerBitcoinCashInsightAPI() InsightAPI {
	return NewAPI("https://blockdozer.com/api", false, 5)
}
