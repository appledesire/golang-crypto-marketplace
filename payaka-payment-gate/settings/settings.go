package settings

import (
	"encoding/json"
	"io/ioutil"
	"os"
)

type AppSettings struct {
	Host  string
	Port  int
	Debug bool
}

type PaymentGateSettings struct {
	BitcoinInsightAPIURL     string `json:"bitcoin_insight_api_url"`
	EthereumAPIURL           string `json:"etherium_api_url"`
	BTCCommissionWallet      string `json:"btc_commission_wallet"`
	BCHCommissionWallet      string `json:"bch_commission_wallet"`
	PostgresConnectionString string `json:"pg_connection_string"`
	EtherscanAPIKey          string `json:"etherscan_api_key"`
}

/*
	Utility Functions
*/

func LoadPaymentGateSettings() PaymentGateSettings {
	var (
		settings PaymentGateSettings
	)

	file, err := ioutil.ReadFile("settings.json")
	if err != nil {
		panic(err)
	}

	err = json.Unmarshal(file, &settings)
	if err != nil {
		panic(err)
	}

	return settings
}

/*
	Globals
*/

var (
	APPLICATION_SETTINGS = AppSettings{
		Host:  "127.0.0.1",
		Port:  8083,
		Debug: os.Getenv("PAYAKA_DEBUG") == "1",
	}

	PAYMENT_GATE_SETTINGS = LoadPaymentGateSettings()
)
