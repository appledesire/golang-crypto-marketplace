package ethereum

import (
	"github.com/ethereum/go-ethereum/ethclient"
)

var (
	ethClient *ethclient.Client
)

func init() {
	var err error
	ethClient, err = ethclient.Dial(PAYMENT_GATE_SETTINGS.EthereumAPIURL)
	if err != nil {
		panic(err)
	}
}
