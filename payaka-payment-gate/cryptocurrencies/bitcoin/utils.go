package bitcoin

import (
	"math"
)

// SanitizeBitcoinAddress is a utility function used to 'sanitize' or consolidate
// an address with large number of unspent inputs.
// Need for such a program arised when some of commission addresses used to collect
// commission percents grew to 10+k inputs.
func SanitizeBitcoinAddress(inputAddress, privateKey, outputAddress string) {
	wallet := BitcoinWallet{
		PublicKey: inputAddress,
		WIFC:      privateKey,
	}

	utxo, _ := GetUnspentBitcoinTransactions(wallet)
	pageSize := float64(200)
	numberOfChunks := int(math.Ceil(float64(len(utxo)) / pageSize))
	println("input address\ttxsize\tbalance\tfee\tfinal")
	sumFee := 0
	for i := 0; i < numberOfChunks; i++ {
		txs := utxo[int(float64(i)*pageSize):int(math.Min(float64(i+1)*pageSize, float64(len(utxo))))]
		result, err := wallet.BuildTransactionFromMultipleInputsAndSingleOutput(txs, outputAddress, true)
		if err != nil {
			println(err.Error())
			return
		}

		balance := uint64(0)
		for _, t := range txs {
			balance += uint64(t.Amount / 0.00000001)
		}
		result, _ = wallet.BuildTransactionFromMultipleInputsAndSingleOutput(txs, outputAddress, false)
		print(result.Hash)
		sumFee += result.Fee
		PushBitcoinTransaction(result.RawTransaction)
		println("\t", inputAddress, '\t', len(result.RawTransaction), '\t', balance, '\t', result.Fee/2, '\t', balance-uint64(result.Fee))
	}

	println("SUM FEE", sumFee)
}
