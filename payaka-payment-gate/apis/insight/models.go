package insight

type Tx struct {
	PublicKey       string  `json:"address"`
	TxID            string  `json:"txid"`
	Vout            uint64  `json:"vout"`
	Ts              uint64  `json:"ts"`
	ScriptPublicKey string  `json:"scriptPubKey"`
	Amount          float64 `json:"amount"`
	Confirmations   uint64  `json:"confirmations"`
}

type UtxoSet struct {
	PrivateKey string `json:"private_key"`
	Utxo       []Tx   `json:"utxo"`
}

type TxOutput struct {
	PublicKey string `json:"address"`
	Satoshis  int    `json:"satoshis"`
}

type WalletBalance struct {
	PublicKey                      string  `json:"address"`
	Balance                        float64 `json:"balance"`
	BalanceTxApperances            int     `json:"txApperances"`
	UnconfirmedBalance             float64 `json:"unconfirmedBalance"`
	UnconfirmedBalanceTxApperances int     `json:"unconfirmedTxApperances"`
}
