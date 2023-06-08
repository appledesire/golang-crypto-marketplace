package marketplace

import (
	"errors"
	"html/template"
	"math"
	"time"

	"github.com/russross/blackfriday"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

/*
	Models
*/

type Store struct {
	Uuid      string `json:"-" gorm:"primary_key"`
	Storename string `json:"storename" gorm:"type:varchar(16);unique"`

	// Supplementary Fields
	ShortDescription                 string     `json:"short_description"`
	Description                      string     `json:"long_description"`
	PGP                              string     `json:"pgp"`
	VendorshipAgreementText          string     `json:"-"`
	VendorshipAgreementSignatureDate *time.Time `json:"-"`

	HasAvatar bool `json:"-"`

	// Additional fields
	IsSuspended     bool `json:"is_suspended"`
	IsTrusted       bool `json:"is_trusted"`
	IsAllowedToSell bool `json:"is_allowed_to_sell"`
	IsOnVacation    bool `json:"is_on_vacation"`

	// Account type
	IsGoldAccount   bool `json:"is_gold_account"`
	IsBronzeAccount bool `json:"is_bronze_account"`
	IsSilverAccount bool `json:"is_silver_account"`
	IsFreeAccount   bool `json:"is_free_account"`

	// Verification
	HasRequestedVerification bool       `json:"-"`
	VerificationRequestDate  *time.Time `json:"-"`

	// Relations
	StoreUsers      []StoreUser      `json:"users"`
	Items           Items            `json:"-"`
	Deposits        Deposits         `json:"-"`
	Warnings        StoreWarnings    `json:"warnings"`
	RatingReviews   RatingReviews    `json:"rating_reviews"`
	ShippingOptions []ShippingOption `json:"shipping_options"`

	// Timestamps
	LastLoginDate    time.Time `json:"last_login_date"`
	RegistrationDate time.Time `json:"registration_date"`

	// CRUD timestamps
	CreatedAt *time.Time `json:"-" gorm:"index"`
	UpdatedAt *time.Time `json:"-" gorm:"index"`
	DeletedAt *time.Time `json:"-" gorm:"index"`
}

type StoreUser struct {
	StoreUuid string `json:"-" gorm:"primary_key"`
	UserUuid  string `json:"-" gorm:"primary_key"`
	Role      string `json:"role" gorm:"primary_key"`

	Store Store `json:"-"`
	User  User  `json:"user"`
}

type Stores []Store

/*
	Model Methods
*/

// Store

func (s Store) Validate() error {
	if s.Uuid == "" {
		return errors.New("Empty UUID")
	}

	if s.Storename == "" {
		return errors.New("Empty store name")
	}

	return nil
}

func (u Store) Save() error {
	err := u.Validate()
	if err != nil {
		return err
	}
	return u.SaveToDatabase()
}

func (u Store) SaveToDatabase() error {
	if existing, _ := FindStoreByUuid(u.Uuid); existing == nil {
		return database.Create(&u).Error
	}
	return database.Save(&u).Error
}

// StoreUser

func (s StoreUser) Validate() error {
	if s.StoreUuid == "" {
		return errors.New("Empty StoreUuid")
	}

	if s.UserUuid == "" {
		return errors.New("Empty UserUuid")
	}

	if s.Role == "" {
		return errors.New("Empty Role")
	}

	return nil
}

func (u StoreUser) Save() error {
	err := u.Validate()
	if err != nil {
		return err
	}
	return u.SaveToDatabase()
}

func (u StoreUser) SaveToDatabase() error {
	if existing, _ := FindStoreUser(u.StoreUuid, u.UserUuid); existing == nil {
		return database.Create(&u).Error
	}
	return database.Save(&u).Error
}

func (s Store) ActivatedAccount() bool {
	return s.IsFreeAccount || s.IsBronzeAccount || s.IsSilverAccount || s.IsGoldAccount
}

func (s Store) HasSignedVendorshipAgreement() bool {
	// TODO: add signature check
	return s.VendorshipAgreementText != ""
}

/*
	Queries
*/

func FindStoreByUuid(uuid string) (*Store, error) {
	var store Store
	err := database.
		First(&store, "uuid = ?", uuid).
		Error
	if err != nil {
		return nil, err
	}
	return &store, err
}

func FindStoreUsersByStore(uuid string) []StoreUser {
	var storeUsers []StoreUser

	database.
		Table("store_users").
		Where("store_uuid=?", uuid).
		Preload("User").
		Find(&storeUsers)

	return storeUsers
}

func FindStoreByStorename(name string) (*Store, error) {
	var store Store
	err := database.
		Preload("Items").
		Preload("Deposits").
		Preload("ShippingOptions").
		Preload("StoreUsers").
		Preload("StoreUsers.User").
		Preload("RatingReviews").
		Preload("RatingReviews.User").
		Preload("RatingReviews.Transaction").
		Preload("RatingReviews.Transaction.BitcoinTransaction").
		Preload("RatingReviews.Transaction.BitcoinCashTransaction").
		Preload("RatingReviews.Transaction.EthereumTransaction").
		First(&store, "storename = ?", name).
		Error
	if err != nil {
		return nil, err
	}
	return &store, err
}

func FindStoreUser(storeUuid, userUuid string) (*StoreUser, error) {
	var store StoreUser
	err := database.
		First(&store, "store_uuid=? and user_uuid=?", storeUuid, userUuid).
		Error
	if err != nil {
		return nil, err
	}
	return &store, err
}

func FindStoreByUserUuid(userUuid string) (*Store, error) {
	var store Store
	err := database.
		Table("stores").
		Joins("join store_users on store_users.store_uuid=stores.uuid").
		Preload("StoreUsers").
		Preload("ShippingOptions").
		Preload("StoreUsers.User").
		Preload("RatingReviews").
		Preload("RatingReviews.User").
		Preload("RatingReviews.Transaction").
		Preload("RatingReviews.Transaction.BitcoinTransaction").
		Preload("RatingReviews.Transaction.BitcoinCashTransaction").
		Preload("RatingReviews.Transaction.EthereumTransaction").
		Preload("Items").
		Preload("Deposits").
		First(&store, "store_users.user_uuid=?", userUuid).
		Error
	if err != nil {
		return nil, err
	}
	return &store, err
}

func FindValidStoreVerificationRequests() Stores {
	var users Stores

	database.
		Table("stores").
		Joins("JOIN v_verification_threads on v_verification_threads.uuid='store-verification-'||stores.uuid").
		Where("v_verification_threads.last_message_by_staff=?", false).
		Where("pgp <> ?", "").
		Where("(is_gold_account=true OR is_silver_account=true OR is_bronze_account=true OR is_free_account=true)").
		Where("vendorship_agreement_text <> ?", "").
		Where("is_allowed_to_sell=?", false).
		Order("registration_date DESC").
		Find(&users)

	return users
}

/*
	Dangerous Methods
*/

func RemoveAllStores() {
	database.Unscoped().Delete(StoreUser{})
	database.Unscoped().Delete(Store{})
}

/*
	Constructor Methods
*/

func CreateStore(storeName, adminUuid string) (*Store, error) {
	store := Store{
		Uuid:             util.GenerateUuid(),
		Storename:        storeName,
		RegistrationDate: time.Now(),
	}
	err := store.Save()
	if err != nil {
		return nil, err
	}

	storeUser := StoreUser{
		StoreUuid: store.Uuid,
		UserUuid:  adminUuid,
		Role:      "admin",
	}
	err = storeUser.Save()
	return &store, err
}

func (u Store) UserIsAdministration(userUuid string) bool {
	for _, storeUser := range u.StoreUsers {
		if storeUser.UserUuid == userUuid {
			return true
		}
	}
	return false
}

func (s Store) GetStoreStats() StoreStats {
	return CacheGetStoreStats(s.Uuid)
}

func (s Store) CalculateLevel() int {
	return CalculateStoreLevel(s.GetStoreStats(), s.RegistrationDate)
}

func (s Store) CalculateScore() float64 {
	score := float64(0.0)
	for _, r := range s.RatingReviews {
		score += float64(r.SellerScore)
	}
	if len(s.RatingReviews) > 0 {
		score /= float64(len(s.RatingReviews))
	}
	return math.Ceil(score*100) / float64(100.0)
}

type ViewStore struct {
	*Store

	// View Models
	ViewRatingReviews []ViewRatingReview `json:"-"`
	ViewItemCategoies []ViewItemCategory `json:"-"`
	ViewItems         []ViewItem         `json:"-"`

	// Date markers
	RegistrationDateStr string `json:"-"`
	LastLoginDateStr    string `json:"-"`
	IsOnline            bool   `json:"-"`

	// Converted description
	DescriptionHTML template.HTML `json:"-"`

	// Verification
	VerificationRequired         bool
	HasSignedVendorshipAgreement bool
	ActivatedAccount             bool

	// Deposits
	HasDeposits     bool            `json:"has_deposits"`
	DepositsSummary DepositsSummary `json:"deposits_summary"`

	// Level, Score
	Level int     `json:"level"`
	Score float64 `json:"-"`

	ViewAdminUser ViewUser

	// Statistics
	Stats StoreStats
}

type ViewStores []ViewStore

/*
	Converting Store to UserStore
*/

func (ss Stores) ViewStores(lang string) []ViewStore {
	viewStores := []ViewStore{}
	for i, _ := range ss {
		vs := ss[i].ViewStore(lang)
		viewStores = append(viewStores, vs)
	}

	return viewStores
}

func (s Store) ViewStore(lang string) ViewStore {
	viewStore := ViewStore{
		Store:                        &s,
		ViewRatingReviews:            s.RatingReviews.ViewRatingReviews(lang),
		LastLoginDateStr:             util.HumanizeTime(s.LastLoginDate, lang),
		RegistrationDateStr:          util.HumanizeTime(s.RegistrationDate, lang),
		Level:                        s.CalculateLevel(),
		Score:                        s.CalculateScore(),
		Stats:                        s.GetStoreStats(),
		ActivatedAccount:             s.ActivatedAccount(),
		HasDeposits:                  len(s.Deposits) > 0,
		DepositsSummary:              s.Deposits.DepositsSummary(),
		HasSignedVendorshipAgreement: s.HasSignedVendorshipAgreement(),
		DescriptionHTML:              template.HTML(userHtmlPolicy.Sanitize(string(blackfriday.MarkdownCommon([]byte(s.Description))))),
		VerificationRequired:         !(s.PGP != "" && s.ActivatedAccount() && s.HasSignedVendorshipAgreement()), // && s.IsAllowedToSell),
		// ViewAdminUser:                s.StoreUsers[0].User.ViewUser(lang),
	}
	return viewStore
}

/*
	Financial Methods
*/

func (s Store) AdminUser() User {
	storeUsers := FindStoreUsersByStore(s.Uuid)
	if len(storeUsers) > 0 {
		return storeUsers[0].User
	}
	return User{}
}

// BitcoinAddress returns BTC address to send released coins to
func (s Store) BitcoinAddress() string {
	return s.AdminUser().BitcoinAddress()
}

// BitcoinAddress returns BTC address to send released coins to
func (u Store) BitcoinMultisigPublicKey() string {
	return u.AdminUser().BitcoinMultisigPublicKey
}

// BitcoinCasAddress returns BTC address to send released coins to
func (u Store) BitcoinCashMultisigPublicKey() string {
	// return u.AdminUser()BitcoinCashAddress()
	return ""
}

// BitcoinAddress returns BTC address to send released coins to
func (u Store) BitcoinCashAddress() string {
	return u.AdminUser().BitcoinCashAddress()
}

// Ethereum returns BTC address to send released coins to
func (u Store) EthereumAddress() string {
	return u.AdminUser().EthereumAddress()
}

/*
	Indirect Relations
*/

// InviterUser returns user who invited store
func (s Store) InviterUser() *User {
	return s.AdminUser().Iniviter()
}
