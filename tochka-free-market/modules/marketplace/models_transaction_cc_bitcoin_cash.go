package marketplace

import (
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
)

type BitcoinCashTransaction struct {
	Uuid             string  `json:"uuid" gorm:"primary_key"`
	Amount           float64 `json:"amount"`
	IsMultisig       bool    `json:"is_multisig"`
	BuyerPublicKey   string  `json:"buyer_public_key"`
	SellerPublicKey  string  `json:"seller_public_key"`
	MarketPublicKey  string  `json:"market_public_key"`
	MarketPrivateKey string  `json:"market_private_key"`
}

/*
	Database Methods
*/

func (t BitcoinCashTransaction) Save() error {
	if existing, _ := FindBitcoinCashTransactionByUuid(t.Uuid); existing == nil {
		return database.Create(&t).Error
	}
	return database.Save(&t).Error
}

func FindBitcoinCashTransactionByUuid(uuid string) (*BitcoinCashTransaction, error) {
	var item BitcoinCashTransaction
	err := database.
		Where(&BitcoinCashTransaction{Uuid: uuid}).
		First(&item).
		Error
	if err != nil {
		return nil, err
	}
	return &item, err
}

/*
	Financial Methods
*/

func (bt BitcoinCashTransaction) UpdateTransactionStatus(t Transaction) error {
	newAmount, err := apis.GetAmountOnBCHAddress(t.Uuid)
	if err != nil {
		return err
	}
	if t.CurrentAmountPaid() == newAmount.Balance {
		return nil
	}
	if t.IsPending() {
		if (bt.Amount - newAmount.Balance) <= bt.Amount*0.01 {
			return t.SetTransactionStatus(
				"COMPLETED",
				newAmount.Balance,
				"Transaction funded",
				"",
				nil,
			)
		}
		return t.SetTransactionStatus(
			"PENDING",
			newAmount.Balance,
			"Transaction amount updated",
			"",
			nil,
		)
	}
	return t.SetTransactionStatus(
		t.CurrentPaymentStatus(),
		newAmount.Balance,
		"Transaction amount updated",
		"",
		nil,
	)
}

func (bt BitcoinCashTransaction) Release(t Transaction, comment, userUuid string) error {

	var (
		err         error
		addressFrom = t.Uuid
		commission  = t.CommissionPercent()
		payments    = []apis.BCHPayment{}
	)

	buyer, err := FindUserByUuid(t.BuyerUuid)
	if err != nil {
		return err
	}

	store, err := FindStoreByUuid(t.StoreUuid)
	if err != nil {
		return err
	}

	if bt.IsMultisig {
		t.SetTransactionStatus(
			"RELEASED",
			t.CurrentAmountPaid(),
			comment,
			userUuid,
			nil,
		)
		return nil
	}

	// Vendor address
	addressTo := store.BitcoinCashAddress()
	payments = []apis.BCHPayment{
		{
			Address: addressTo,
			Percent: 1. - commission,
		},
	}

	var buyerReferralPayment *ReferralPayment
	var sellerReferralPayment *ReferralPayment
	usdRate := GetCurrencyRate("BCH", "USD")

	// Buyer Inviter commission address
	buyerInviter := buyer.Iniviter()
	if buyerInviter != nil {
		inviterPercent := MARKETPLACE_SETTINGS.FreeAccountReferralPercent
		if buyerInviter.IsGoldAccount {
			inviterPercent = MARKETPLACE_SETTINGS.GoldAccountCommission
		}
		if buyerInviter.IsSilverAccount {
			inviterPercent = MARKETPLACE_SETTINGS.SilverAccountCommission
		}
		if buyerInviter.IsBronzeAccount {
			inviterPercent = MARKETPLACE_SETTINGS.BronzeAccountCommission
		}

		inviterWallet := buyerInviter.BitcoinCash
		if inviterWallet == "" {
			inviterWallet = buyerInviter.FindRecentBitcoinCashWallet().PublicKey
		}

		payments = append(payments, apis.BCHPayment{
			Address: inviterWallet,
			Percent: commission * inviterPercent,
		})

		buyerReferralPayment = &ReferralPayment{
			TransactionUuid:    t.Uuid,
			ReferralPercent:    inviterPercent,
			ReferralPaymentBCH: commission * inviterPercent * bt.Amount,
			ReferralPaymentUSD: commission * inviterPercent * bt.Amount * usdRate,
			UserUuid:           buyer.InviterUuid,
			IsBuyerReferral:    true,
		}
	}

	// Buyer Inviter commission address
	vendorInviter := store.InviterUser()
	if vendorInviter != nil {
		inviterPercent := MARKETPLACE_SETTINGS.FreeAccountReferralPercent
		if vendorInviter.IsGoldAccount {
			inviterPercent = MARKETPLACE_SETTINGS.GoldAccountCommission
		}
		if vendorInviter.IsSilverAccount {
			inviterPercent = MARKETPLACE_SETTINGS.SilverAccountCommission
		}
		if vendorInviter.IsBronzeAccount {
			inviterPercent = MARKETPLACE_SETTINGS.BronzeAccountCommission
		}

		inviterWallet := vendorInviter.BitcoinCash
		if inviterWallet == "" {
			inviterWallet = vendorInviter.FindRecentBitcoinCashWallet().PublicKey
		}

		payments = append(payments, apis.BCHPayment{
			Address: inviterWallet,
			Percent: commission * inviterPercent,
		})

		sellerReferralPayment = &ReferralPayment{
			TransactionUuid:    t.Uuid,
			ReferralPercent:    inviterPercent,
			ReferralPaymentBCH: commission * inviterPercent * bt.Amount,
			ReferralPaymentUSD: commission * inviterPercent * bt.Amount * usdRate,
			UserUuid:           vendorInviter.Uuid,
			IsBuyerReferral:    false,
		}
	}

	result, err := apis.SendBCHFromSingleWalletWithPercentSplit(addressFrom, payments)
	if err != nil {
		return err
	}

	receipt, err := CreateBCHPaymentReceipt(result)
	if err != nil {
		return err
	}

	if len(t.Status) > 0 && t.Status[(len(t.Status)-1)].Status != "RELEASED" {
		t.SetTransactionStatus(
			"RELEASED",
			t.CurrentAmountPaid(),
			comment,
			userUuid,
			&receipt,
		)
		if buyerReferralPayment != nil {
			buyerReferralPayment.Save()
		}
		if sellerReferralPayment != nil {
			sellerReferralPayment.Save()
		}
	}
	return nil
}

func (bt BitcoinCashTransaction) Cancel(t Transaction, comment, userUuid string) error {
	if bt.IsMultisig {
		t.SetTransactionStatus(
			"CANCELLED",
			t.CurrentAmountPaid(),
			comment,
			userUuid,
			nil,
		)
		return nil
	}
	buyer, err := FindUserByUuid(t.BuyerUuid)
	if err != nil {
		return err
	}
	var (
		addressFrom = t.Uuid
		buyerWallet = buyer.FindRecentBitcoinCashWallet()
		addressTo   = buyerWallet.PublicKey
	)
	payments := []apis.BCHPayment{
		{Address: addressTo, Percent: 1.},
	}

	result, err := apis.SendBCHFromSingleWalletWithPercentSplit(addressFrom, payments)
	if err != nil {
		return err
	}

	receipt, err := CreateBCHPaymentReceipt(result)
	if err != nil {
		return err
	}

	if len(t.Status) > 0 && t.Status[(len(t.Status)-1)].Status != "CANCELLED" {
		t.SetTransactionStatus(
			"CANCELLED",
			t.CurrentAmountPaid(),
			comment,
			userUuid,
			&receipt,
		)
	}
	return nil
}

func CreateBitcoinCashTransaction(
	itemPackage Package,
	buyer User,
	tp string,
	quantity int,
	shippingPrice float64,
) (BitcoinCashTransaction, error) {
	var bitcoinTransaction BitcoinCashTransaction

	wallet, err := apis.GenerateBCHAddress("escrow")
	if err != nil {
		return BitcoinCashTransaction{}, err
	}

	switch tp {
	case "bitcoin_cash_multisig":
		var (
			buyerPk  = buyer.BitcoinMultisigPublicKey
			sellerPk = itemPackage.Store.BitcoinCashMultisigPublicKey()
		)

		address, marketPublicKey, marketPrivateKey, err := apis.GenerateBCHMultisigAddress(buyerPk, sellerPk)
		if err != nil {
			return BitcoinCashTransaction{}, err
		}

		bitcoinTransaction = BitcoinCashTransaction{
			Uuid:             address,
			Amount:           itemPackage.GetPrice("BCH")*float64(quantity) + shippingPrice,
			IsMultisig:       true,
			SellerPublicKey:  sellerPk,
			BuyerPublicKey:   buyerPk,
			MarketPublicKey:  marketPublicKey,
			MarketPrivateKey: marketPrivateKey,
		}
	default:
		bitcoinTransaction = BitcoinCashTransaction{
			Uuid:   wallet,
			Amount: itemPackage.GetPrice("BCH")*float64(quantity) + shippingPrice,
		}
	}
	return bitcoinTransaction, bitcoinTransaction.Save()
}

/*
	Tx Stats
*/
func GetBitcoinCashTxStatsForVendor(uuid string) TxStats {
	var stats TxStats
	database.
		Table("v_current_bitcoin_cash_transaction_statuses").
		Select("count(*) as tx_number, sum(amount) as tx_volume").
		Where("store_uuid = ?", uuid).
		Where("current_status NOT IN ('CANCELLED', 'FAILED', 'PENDING')").
		First(&stats)
	return stats
}

func GetBitcoinCashTxStatsForBuyer(uuid string) TxStats {
	var stats TxStats
	database.
		Table("v_current_bitcoin_cash_transaction_statuses").
		Select("count(*) as tx_count, sum(amount) as tx_volume").
		Where("buyer_uuid = ?", uuid).
		Where("current_status NOT IN ('CANCELLED', 'FAILED', 'PENDING')").
		First(&stats)
	return stats
}
