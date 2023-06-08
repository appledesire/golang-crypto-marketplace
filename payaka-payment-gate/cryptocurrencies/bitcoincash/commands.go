package bitcoincash

import (
	"github.com/helloyi/go-waitgroup"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/db"
)

func UpdateBitcoinCashWalletBalances() {
	println("UpdateBitcoinCashWalletBalances start")

	wg := waitgroup.Create(16)
	wallets, err := FindAllBitcoinCashWallets()
	if err != nil {
		println(err.Error())
		return
	}
	for _, wallet := range wallets {
		wg.BlockAdd()
		go func(wallet BitcoinCashWallet) {
			defer wg.Done()
			wallet.UpdateBalance()
		}(wallet)
	}
	wg.Wait()

	println("UpdateBitcoinCashWalletBalances done")
}

func SweepBitcoinCashWallet(addressFrom string, addressTo string) {
	w, err := FindBitcoinCashWalletByPublicKey(addressFrom)
	if err != nil {
		println(err.Error())
		return
	}

	payments := []BCHPayment{
		{Address: addressTo, Percent: 1.0},
	}

	_, err = w.SendWithPercentSplit(payments)
	if err != nil {
		println(err.Error())
		return
	}
}

func SweepCommissionAndPremiumBitcoinCashWallets(addressTo string) {
	wp, err := FindBitcoinCashWalletsWithNonZeroBalanceByType("premium")
	if err != nil {
		println(err.Error())
		return
	}

	wc, err := FindBitcoinCashWalletsWithNonZeroBalanceByType("commission")
	if err != nil {
		println(err.Error())
		return
	}

	wallets := BitcoinCashWallets{}
	for _, wb := range wp {
		wallets = append(wallets, wb.BitcoinCashWallet)
	}
	for _, wb := range wc {
		wallets = append(wallets, wb.BitcoinCashWallet)
	}

	// if len(wallets) >  {
	// 	wallets = wallets[0:3]
	// }

	payments := []BCHPayment{
		{Address: addressTo, Percent: 1.0},
	}

	_, err = wallets.SendWithPercentSplit(payments)
	if err != nil {
		println(err.Error())
		return
	}
}

func MigrateBTCToBCH() {
	println("SweepMultipleWallets start")

	type Result struct {
		BitcoinWallet     string
		BitcoincashWallet string
	}

	results := []Result{}

	query := `
select 
    ubw.public_key as bitcoin_wallet,
    ubcw.public_key as bch_wallet
from users u 
join 
	user_bitcoin_wallets ubw on ubw.user_uuid=u.uuid
join
	user_bitcoin_cash_wallets ubcw on u.uuid=ubcw.user_uuid 
where ubw.public_key <> ubcw.public_key;
`
	db.TDatabase.Raw(query).Scan(&results)

	println(len(results))

	wg := waitgroup.Create(128)
	for i, r := range results {
		println("progress:", i, "\t", len(results), int(100.0*float64(i)/float64(len(results))))
		wg.BlockAdd()
		go func(r Result) {
			defer wg.Done()
			SweepBitcoinCashWallet(r.BitcoinWallet, r.BitcoincashWallet)
		}(r)
	}
	wg.Wait()

	println("SweepMultipleWallets done")
}
