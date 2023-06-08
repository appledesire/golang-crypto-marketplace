package insight

import (
	"encoding/json"
	"math"
	"net/url"

	"go.uber.org/ratelimit"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/apis"
)

/*
	Models
*/

type InsightAPI struct {
	APIEndpoint string
	Proxified   bool
	rl          ratelimit.Limiter
}

/*
	Proxy / Direct HTTP Handles
*/

func (api InsightAPI) GetHTTPGetMethod() func(string) (string, error) {
	if api.Proxified {
		return apis.TorGET
	} else {
		return apis.DirectGET
	}
}

func (api InsightAPI) GetHTTPPostMethod() func(string, url.Values) (string, error) {
	if api.Proxified {
		return apis.TorPOST
	} else {
		return apis.DirectPOST
	}
}

/*
	API Methods
*/

func (api InsightAPI) GetInsightAddressResponse(publicKey string) (WalletBalance, error) {
	api.rl.Take()
	addr := api.APIEndpoint + "/addr/" + publicKey + "/?noTxList=1"
	response, err := api.GetHTTPGetMethod()(addr)
	if err != nil {
		return WalletBalance{}, err
	}
	wb := WalletBalance{PublicKey: publicKey}
	err = json.Unmarshal([]byte(response), &wb)
	if err != nil {
		return WalletBalance{}, err
	}
	return wb, nil
}

func (api InsightAPI) GetInsightUnspentTxResponse(publicKey string) ([]Tx, error) {
	api.rl.Take()
	utxo := []Tx{}
	addr := api.APIEndpoint + "/addr/" + publicKey + "/utxo?noCache=1"
	response, err := api.GetHTTPGetMethod()(addr)
	if err != nil {
		return utxo, err
	}
	err = json.Unmarshal([]byte(response), &utxo)
	return utxo, err
}

func (api InsightAPI) EstimateFee() (int, error) {
	api.rl.Take()
	addr := api.APIEndpoint + "/utils/estimatefee?nbBlocks=6"
	response, err := api.GetHTTPGetMethod()(addr)
	if err != nil {
		return 0, err
	}
	fees := map[string]float64{}
	err = json.Unmarshal([]byte(response), &fees)
	if err != nil {
		return 0, err
	}
	if result, ok := fees["6"]; ok {
		return int(math.Max(result/1024*1e8, 1.0)), nil
	}
	return 0, nil
}

func (api InsightAPI) PushInsightTransacation(rawtx string) error {
	api.rl.Take()
	insightUrl := api.APIEndpoint + "/tx/send"
	params := url.Values{}
	params.Set("rawtx", rawtx)
	_, err := api.GetHTTPPostMethod()(insightUrl, params)
	return err
}

/*
	Constructor
*/

func NewAPI(endpoint string, proxified bool, rateLimit int) InsightAPI {
	return InsightAPI{
		APIEndpoint: endpoint,
		Proxified:   proxified,
		rl:          ratelimit.New(rateLimit),
	}
}
