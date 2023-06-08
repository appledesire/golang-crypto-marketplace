package ethereum

import (
	"bytes"
	"context"
	"crypto/ecdsa"
	"errors"
	"fmt"
	"math/big"
	"strconv"

	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/ethereum/go-ethereum/crypto"
	"github.com/onrik/ethrpc"

	"qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate/apis/etherscan"
	contract_registry "qxklmrhx7qkzais6.onion/Tochka/tochka-ethereum-contracts/contracts/golang/registry"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-ethereum-contracts/contracts/golang/tochka_escrow_payment"
)

/*
	Globals
*/

var (
	ethereumAPI = ethrpc.NewEthRPC(PAYMENT_GATE_SETTINGS.EthereumAPIURL)
)

func (w EthereumWallet) Transfer(payments []ETHPayment) (ETHPaymentResult, error) {

	_, err := w.UpdateBalance()
	if err != nil {
		return ETHPaymentResult{}, err
	}

	// send amount to a single wallet -- basic transfer in Ethereum
	if len(payments) == 1 {
		var amount uint64
		if payments[0].Amount > 0 {
			amount = uint64(payments[0].Amount * WEI_IN_ETH)
		} else if payments[0].Percent > 0 {
			balance, err := w.CurrentBalance()
			if err == nil {
				amount = uint64(balance.BalanceETH * WEI_IN_ETH * payments[0].Percent)
			}
		}
		return w.transfer(payments[0].Address, amount)
	}

	// send amount to multiple wallets -- via a deployed smart contract
	var (
		_addresses = []common.Address{}
		_percents  = []*big.Int{}
	)

	for _, payment := range payments {
		address := common.HexToAddress(payment.Address)
		percent := big.NewInt(int64(payment.Percent * 100))

		_addresses = append(_addresses, address)
		_percents = append(_percents, percent)
	}

	return w.multitransfer(_addresses, _percents)
}

/*
	Ethereum Basic Transfer
*/

func (w EthereumWallet) transfer(to string, value uint64) (ETHPaymentResult, error) {

	var (
		buff          bytes.Buffer
		chainId       = big.NewInt(1)
		recipientAddr = common.HexToAddress(to)
		gasLimit      = uint64(21000)
		amount        *big.Int //  big.NewInt(value)
		ok            bool
		etx           = ETHPaymentResult{
			WalletFrom: w.PublicKey,
			WalletTo:   to,
			Amount:     value,
		}
	)

	// hacky way to convert uint64 to big.Int since straight type conv adds unnessesary sign
	amount, ok = new(big.Int).SetString(strconv.FormatUint(value, 10), 0)
	if !ok {
		return etx, errors.New("Couldn't convert uint64 value to big.Int")
	}

	senderPrivKey, err := crypto.HexToECDSA(w.PrivateKey[2:])
	if err != nil {
		return etx, err
	}

	tcount, err := ethereumAPI.EthGetTransactionCount(w.PublicKey, "latest")
	if err != nil {
		return etx, err
	}

	gasPrice, err := ethClient.SuggestGasPrice(context.Background())
	if err != nil {
		return etx, err
	}

	cost, err := ethereumAPI.EthEstimateGas(ethrpc.T{
		From:     w.PublicKey,
		To:       to,
		Value:    amount,
		GasPrice: gasPrice,
		Nonce:    tcount,
	})

	if err != nil {
		return etx, err
	}

	var (
		nonce       = uint64(tcount)
		valueUint64 = value - gasPrice.Uint64()*uint64(cost)
		txAmount    *big.Int
		signer      = types.NewEIP155Signer(chainId)
	)

	txAmount, ok = new(big.Int).SetString(strconv.FormatUint(valueUint64, 10), 0)
	if !ok {
		return etx, errors.New("Couldn't convert uint64 valueUint64 to big.Int")
	}

	tx := types.NewTransaction(nonce, recipientAddr, txAmount, gasLimit, gasPrice, nil)

	signedTx, err := types.SignTx(tx, signer, senderPrivKey)
	if err != nil {
		return etx, err
	}

	signedTx.EncodeRLP(&buff)

	etx.RawTx = fmt.Sprintf("0x%x", buff.Bytes())
	hash, err := etherscan.PushEtherscanTransacation(etx.RawTx)
	if err != nil {
		return etx, err
	}
	etx.Amount = txAmount.Uint64()
	etx.Hash = hash
	etx.Cost = gasPrice.Uint64() * uint64(cost)

	return etx, err
}

/*
	Smart Contract Multitransfer
*/

func (w EthereumWallet) multitransfer(_addresses []common.Address, _percents []*big.Int) (ETHPaymentResult, error) {

	ethPaymentResult := ETHPaymentResult{
		WalletFrom:     w.PublicKey,
		WalletTo:       contract_registry.TOCHKA_ESCROW_PAYMENT_ADDRESS,
		Contract:       "TochkaEscrowPayment",
		ContractMethod: "multitransfer",
	}

	if len(_addresses) != len(_percents) {
		return ethPaymentResult, errors.New("len(_addresses) should be equal to len(_percents)")
	}

	var cost = uint64(100000)

	// Smart Contract
	address := common.HexToAddress(contract_registry.TOCHKA_ESCROW_PAYMENT_ADDRESS)
	tochkaEscrowPayment, err := tochka_escrow_payment.NewTochkaEscrowPayment(address, ethClient)
	if err != nil {
		return ethPaymentResult, err
	}

	// Transactor
	privateKey, err := crypto.HexToECDSA(w.PrivateKey[2:])
	if err != nil {
		return ethPaymentResult, err
	}

	publicKey := privateKey.Public()
	publicKeyECDSA, ok := publicKey.(*ecdsa.PublicKey)
	if !ok {
		return ethPaymentResult, errors.New("error casting public key to ECDSA")
	}

	fromAddress := crypto.PubkeyToAddress(*publicKeyECDSA)
	nonce, err := ethClient.PendingNonceAt(context.Background(), fromAddress)
	if err != nil {
		return ethPaymentResult, err
	}

	gasPrice, err := ethClient.SuggestGasPrice(context.Background())
	if err != nil {
		return ethPaymentResult, err
	}

	balance, err := w.CurrentBalance()
	if err != nil {
		return ethPaymentResult, err
	}

	var (
		transactionCost = cost * gasPrice.Uint64()
		amount          = uint64(balance.BalanceETH*WEI_IN_ETH) - transactionCost
		value           *big.Int
	)

	value, ok = new(big.Int).SetString(strconv.FormatUint(amount, 10), 0)
	if !ok {
		return ethPaymentResult, errors.New("Couldn't convert uint64 amount to big.Int")
	}

	if transactionCost >= amount {
		return ethPaymentResult, errors.New("transaction cost >= transaction value")
	}

	auth := bind.NewKeyedTransactor(privateKey)
	session := &tochka_escrow_payment.TochkaEscrowPaymentSession{
		Contract: tochkaEscrowPayment,
		CallOpts: bind.CallOpts{
			Pending: true,
		},
		TransactOpts: bind.TransactOpts{
			From:     auth.From,
			Signer:   auth.Signer,
			Value:    value,
			GasLimit: uint64(cost),
			GasPrice: gasPrice,
			Nonce:    big.NewInt(int64(nonce)),
		},
	}

	tx, err := session.Mulitransfer(_addresses, _percents)
	if err != nil {
		return ethPaymentResult, err
	}

	ethPaymentResult.Cost = transactionCost
	acualCost := tx.Cost()
	if acualCost != nil {
		ethPaymentResult.Cost = acualCost.Uint64()
	}
	ethPaymentResult.Amount = amount
	// ethPaymentResult.RawTx =
	ethPaymentResult.Hash = fmt.Sprintf("0x%x", tx.Hash())

	w.Type += "_dust"
	return ethPaymentResult, w.Save()
}
