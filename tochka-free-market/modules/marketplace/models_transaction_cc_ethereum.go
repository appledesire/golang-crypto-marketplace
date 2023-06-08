package marketplace

import (
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
)

type EthereumTransaction struct {
	Uuid   string  `json:"uuid" gorm:"primary_key"`
	Amount float64 `json:"amount"`
}

/*
	Database Methods
*/

func (t EthereumTransaction) Save() error {
	if existing, _ := FindEthereumTransactionByUuid(t.Uuid); existing == nil {
		return database.Create(&t).Error
	}
	return database.Save(&t).Error
}

func FindEthereumTransactionByUuid(uuid string) (*EthereumTransaction, error) {
	var item EthereumTransaction
	err := database.
		Where(&EthereumTransaction{Uuid: uuid}).
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

func (bt EthereumTransaction) UpdateTransactionStatus(t Transaction) error {
	newAmount, err := apis.GetAmountOnETHAddress(t.Uuid)
	if err != nil {
		return err
	}
	if t.CurrentAmountPaid() == newAmount.Balance {
		return nil
	}
	if t.IsPending() {
		if (bt.Amount - newAmount.Balance) <= bt.Amount*0.05 {
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

func (bt EthereumTransaction) Release(t Transaction, comment, userUuid string) error {

	var (
		addressFrom           = t.Uuid
		buyer                 = t.Buyer
		buyerReferralPayment  *ReferralPayment
		commission            = t.CommissionPercent()
		payments              = []apis.ETHPayment{}
		usdRate               = GetCurrencyRate("ETH", "USD")
		store                 = t.Store
		vendorReferralPayment *ReferralPayment
		err                   error
		// vendorAddress         = vendor.Ethereum
	)

	// Vendor address
	addressTo := store.EthereumAddress()

	payments = []apis.ETHPayment{
		{
			Address: addressTo,
			Percent: 1. - commission,
		},
	}

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

		inviterWallet := buyerInviter.Ethereum
		if inviterWallet == "" {
			inviterWallet = buyerInviter.FindRecentEthereumWallet().PublicKey
		}

		payments = append(payments, apis.ETHPayment{
			Address: inviterWallet,
			Percent: commission * inviterPercent,
		})

		buyerReferralPayment = &ReferralPayment{
			TransactionUuid:    t.Uuid,
			ReferralPercent:    inviterPercent,
			ReferralPaymentBTC: commission * inviterPercent * bt.Amount,
			ReferralPaymentUSD: commission * inviterPercent * bt.Amount * usdRate,
			UserUuid:           buyer.InviterUuid,
			IsBuyerReferral:    true,
		}
	}

	// TODO: add Store referrals
	// Buyer Inviter commission address
	// vendorInviter := vendor.Iniviter()
	// if vendorInviter != nil {
	// 	inviterPercent := MARKETPLACE_SETTINGS.FreeAccountReferralPercent
	// 	if vendorInviter.IsGoldAccount {
	// 		inviterPercent = MARKETPLACE_SETTINGS.GoldAccountCommission
	// 	}
	// 	if vendorInviter.IsSilverAccount {
	// 		inviterPercent = MARKETPLACE_SETTINGS.SilverAccountCommission
	// 	}
	// 	if vendorInviter.IsBronzeAccount {
	// 		inviterPercent = MARKETPLACE_SETTINGS.BronzeAccountCommission
	// 	}

	// 	inviterWallet := vendorInviter.Ethereum
	// 	if inviterWallet == "" {
	// 		inviterWallet = vendorInviter.FindRecentEthereumWallet().PublicKey
	// 	}

	// 	payments = append(payments, apis.ETHPayment{
	// 		Address: inviterWallet,
	// 		Percent: commission * inviterPercent,
	// 	})

	// 	vendorReferralPayment = &ReferralPayment{
	// 		TransactionUuid:    t.Uuid,
	// 		ReferralPercent:    inviterPercent,
	// 		ReferralPaymentBTC: commission * inviterPercent * bt.Amount,
	// 		ReferralPaymentUSD: commission * inviterPercent * bt.Amount * usdRate,
	// 		UserUuid:           vendor.InviterUuid,
	// 		IsBuyerReferral:    false,
	// 	}
	// }

	// Calculate commission percent and add it to the rest of payments
	// Note, Commission wallet is defined here and not in payment gate as in case with BTC
	// because Ethereum has no concept of change address and commission payment has to be explicit

	commisionPercent := 1.0
	for _, p := range payments {
		commisionPercent -= p.Percent
	}

	payments = append(payments, apis.ETHPayment{
		Address: MARKETPLACE_SETTINGS.EthereumCommissionWallet,
		Percent: commisionPercent,
	})

	results, err := apis.SendETH(addressFrom, payments)
	if err != nil {
		return err
	}

	receipt, err := CreateETHPaymentReceipt(results)
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
		if vendorReferralPayment != nil {
			vendorReferralPayment.Save()
		}
	}

	return nil
}

func (bt EthereumTransaction) Cancel(t Transaction, comment, userUuid string) error {

	buyer, err := FindUserByUuid(t.BuyerUuid)
	if err != nil {
		return err
	}

	var (
		addressFrom = t.Uuid
		buyerWallet = buyer.FindRecentEthereumWallet()
		addressTo   = buyerWallet.PublicKey
	)

	payments := []apis.ETHPayment{
		{Address: addressTo, Percent: 1.0},
	}

	results, err := apis.SendETH(addressFrom, payments)
	if err != nil {
		return err
	}

	receipt, err := CreateETHPaymentReceipt(results)
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

func CreateEthereumTransaction(
	itemPackage Package,
	buyer User,
	tp string,
	quantity int,
	shippingPrice float64,
) (EthereumTransaction, error) {
	wallet, err := apis.GenerateETHAddress("escrow")
	if err != nil {
		return EthereumTransaction{}, err
	}

	ethereumTransaction := EthereumTransaction{
		Uuid:   wallet,
		Amount: itemPackage.GetPrice("ETH")*float64(quantity) + shippingPrice,
	}

	return ethereumTransaction, ethereumTransaction.Save()
}

/*
	Tx Stats
*/

func GetEthereumTxStatsForVendor(uuid string) TxStats {
	var stats TxStats

	database.
		Table("v_current_bitcoin_transaction_statuses").
		Select("count(*) as tx_number, sum(amount) as tx_volume").
		Where("store_uuid = ?", uuid).
		Where("current_status NOT IN ('CANCELLED', 'FAILED', 'PENDING')").
		First(&stats)

	return stats
}

func GetEthereumTxStatsForBuyer(uuid string) TxStats {
	var stats TxStats

	database.
		Table("v_current_bitcoin_transaction_statuses").
		Select("count(*) as tx_count, sum(amount) as tx_volume").
		Where("buyer_uuid = ?", uuid).
		Where("current_status NOT IN ('CANCELLED', 'FAILED', 'PENDING')").
		First(&stats)

	return stats
}
