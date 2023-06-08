package marketplace

import (
	"errors"
	"math"
	"time"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

/*
	Models
*/

type Deposit struct {
	Uuid      string `json:"uuid" gorm:"primary_key"`
	StoreUuid string `json:"store_uuid,omitempty"`

	Currency     string  `json:"currency,omitempty"`
	CurrencyRate float64 `json:"currency_rate,omitempty"`
	FiatValue    float64 `json:"value,omitempty"`

	Crypto      string  `json:"crypto,omitempty"`
	Address     string  `json:"address,omitempty"`
	CryptoValue float64 `json:"crypto_value,omitempty"`

	CreatedAt *time.Time `json:"created_at,omitempty"`
	UpdatedAt *time.Time `json:"updated_at,omitempty"`
	DeletedAt *time.Time `json:"deleted_at,omitempty"`

	History []DepositHistory `json:"-"`
	Store   Store            `json:"-"`
}

type DepositHistory struct {
	Uuid        string `json:"uuid" gorm:"primary_key"`
	DepositUuid string `json:"deposit_uuid,omitempty"`

	Action string  `json:"currency,omitempty"`
	Value  float64 `json:"amount,omitempty"`

	CreatedAt *time.Time `json:"created_at,omitempty"`
	UpdatedAt *time.Time `json:"updated_at,omitempty"`
	DeletedAt *time.Time `json:"deleted_at,omitempty"`
}

type Deposits []Deposit

type DepositsSummary map[string]float64

/*
	Model methods
*/

func (deposits Deposits) DepositsSummary() DepositsSummary {
	summary := DepositsSummary{}

	for _, currency := range FIAT_CURRENCIES {
		summary[currency] = 0.0
	}

	for _, currency := range CRYPTO_CURRENCIES {
		summary[currency] = 0.0
	}

	for _, deposit := range deposits {
		for _, currency := range FIAT_CURRENCIES {
			if len(deposit.History) == 0 {
				summary[currency] += deposit.FiatValue * GetCurrencyRate(deposit.Currency, currency)
			}
		}
	}

	for key, value := range summary {
		if !inSet(key, CRYPTO_CURRENCIES) {
			summary[key] = math.Ceil(value)
		}
	}

	return summary
}

func (d Deposit) Update() error {
	switch d.Crypto {
	case "BTC":
		balance, err := apis.GetAmountOnBTCAddress(d.Address)
		if err != nil {
			return err
		}
		if balance.Balance == 0.0 {
			CreateDepositHistoryRecord(d.Uuid, balance.Balance, "Deposit withdrawn")
		}
	case "BCH":
		balance, err := apis.GetAmountOnBCHAddress(d.Address)
		if err != nil {
			return err
		}
		if balance.Balance == 0.0 {
			CreateDepositHistoryRecord(d.Uuid, balance.Balance, "Deposit withdrawn")
		}
	case "ETH":
		balance, err := apis.GetAmountOnETHAddress(d.Address)
		if err != nil {
			return err
		}
		if balance.Balance == 0.0 {
			CreateDepositHistoryRecord(d.Uuid, balance.Balance, "Deposit withdrawn")
		}
	}

	_, err := CreateDepositHistoryRecord(d.Uuid, 0.0, "Deposit Withdrawn")
	return err
}

func (d Deposit) Withdraw() error {
	storeAdmin := d.Store.AdminUser()

	switch d.Crypto {
	case "BTC":
		adminWallet := storeAdmin.BitcoinAddress()
		_, err := apis.SendBTCFromSingleWalletWithPercentSplit(d.Address, []apis.BTCPayment{
			apis.BTCPayment{
				Percent: 1.0,
				Address: adminWallet,
			},
		})
		return err

	case "BCH":
		adminWallet := storeAdmin.BitcoinCashAddress()
		_, err := apis.SendBCHFromSingleWalletWithPercentSplit(d.Address, []apis.BCHPayment{
			apis.BCHPayment{
				Percent: 1.0,
				Address: adminWallet,
			},
		})
		return err

	case "ETH":
		adminWallet := storeAdmin.EthereumAddress()
		_, err := apis.SendETH(d.Address, []apis.ETHPayment{
			apis.ETHPayment{
				Percent: 1.0,
				Address: adminWallet,
			},
		})
		return err
	}
	return nil
}

func (d Deposit) CurrentCryptoValue() float64 {
	if len(d.History) == 0 {
		return d.CryptoValue
	}
	return d.History[len(d.History)-1].Value
}

/*
	Database methods
*/

func (d Deposit) Validate() error {
	if d.Address == "" {
		return errors.New("Wrong wallet")
	}
	if d.Crypto == "" {
		return errors.New("Wrong crypto")
	}
	if d.Currency == "" {
		return errors.New("Wrong currency")
	}
	if d.StoreUuid == "" {
		return errors.New("Wrong user uuid")
	}
	if d.Uuid == "" {
		return errors.New("Wrong uuid")
	}
	if d.FiatValue == 0.0 {
		return errors.New("Wrong value")
	}
	if d.CryptoValue == 0.0 {
		return errors.New("Wrong crypto value")
	}
	if d.CurrencyRate == 0.0 {
		return errors.New("Wrong currency rate")
	}
	if d.CreatedAt == nil {
		return errors.New("Wrong craeated at date")
	}
	return nil
}

func (d Deposit) Save() error {
	err := d.Validate()
	if err != nil {
		return err
	}
	return d.SaveToDatabase()
}

func (d Deposit) Remove() error {
	return database.Delete(d).Error
}

func (d Deposit) SaveToDatabase() error {
	if existing, _ := FindDepositByUuid(d.Uuid); existing == nil {
		return database.Create(&d).Error
	}
	return database.Save(&d).Error
}

func (d DepositHistory) Validate() error {
	if d.Uuid == "" {
		return errors.New("Wrong uuid")
	}
	if d.DepositUuid == "" {
		return errors.New("Wrong deposit uuid")
	}
	if d.Action == "" {
		return errors.New("Wrong action")
	}
	if d.CreatedAt == nil {
		return errors.New("Wrong craeated at date")
	}
	return nil
}

func (d DepositHistory) Save() error {
	err := d.Validate()
	if err != nil {
		return err
	}
	return d.SaveToDatabase()
}

func (d DepositHistory) Remove() error {
	return database.Delete(d).Error
}

func (d DepositHistory) SaveToDatabase() error {
	return database.Create(&d).Error
}

/*
	Database queries
*/

func FindDepositByUuid(uuid string) (*Deposit, error) {
	var deposit Deposit
	err := database.
		Preload("Store").
		Preload("History").
		First(&deposit, "uuid = ?", uuid).
		Error
	return &deposit, err
}

func FindDepositByAddress(address string) (*Deposit, error) {
	var deposit Deposit
	err := database.
		Preload("Store").
		Preload("History").
		First(&deposit, "address = ?", address).
		Error
	return &deposit, err
}

func CreateDeposit(storeUuid string,
	currency string, value float64,
	crypto string, cryptoValue float64, currencyRate float64, address string,
) (Deposit, error) {
	now := time.Now()
	deposit := Deposit{
		Uuid:         util.GenerateUuid(),
		StoreUuid:    storeUuid,
		Currency:     currency,
		CurrencyRate: currencyRate,
		FiatValue:    value,
		Crypto:       crypto,
		CryptoValue:  cryptoValue,
		Address:      address,
		CreatedAt:    &now,
	}
	return deposit, deposit.Save()
}

func CreateDepositHistoryRecord(depositUuid string, value float64, action string) (DepositHistory, error) {
	now := time.Now()
	history := DepositHistory{
		Uuid:        util.GenerateUuid(),
		Value:       value,
		Action:      action,
		DepositUuid: depositUuid,
		CreatedAt:   &now,
	}
	return history, history.Save()
}

func FindDepositsByStoreUuid(uuid string) Deposits {
	var deposits Deposits
	database.
		Preload("Store").
		Preload("History").
		Find(&deposits, "store_uuid = ?", uuid)
	return deposits
}

func FindAllDeposits() Deposits {
	var deposits Deposits
	database.
		Preload("Store").
		Preload("History").
		Order("created_at DESC").
		Find(&deposits)

	return deposits
}
