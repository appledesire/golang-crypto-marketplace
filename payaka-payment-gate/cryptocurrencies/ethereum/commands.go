package ethereum

import (
	"fmt"
	"github.com/helloyi/go-waitgroup"
)

func UpdateEthereumWalletBalances() {
	wg := waitgroup.Create(48)
	wallets, err := GetAllEthereumWallets()
	if err != nil {
		panic(err)
	}
	for _, wallet := range wallets {
		wg.BlockAdd()
		go func(wallet EthereumWallet) {
			defer wg.Done()
			wallet.UpdateBalance()
		}(wallet)
	}
	wg.Wait()
}

func SweepEthereumWallet(addressFrom string, addressTo string) {
	w, err := FindEthereumWalletByPublicKey(addressFrom)
	if err != nil {
		panic(err)
	}

	balance, err := w.UpdateBalance()
	if err != nil {
		panic(err)
	}

	ethPayment := ETHPayment{
		Address: addressTo,
		Amount:  balance.BalanceETH,
	}

	result, err := w.Transfer([]ETHPayment{ethPayment})
	if err == nil {
		fmt.Printf("%+v", result)
	} else {
		fmt.Printf("Error, %s", err.Error())
	}
}
