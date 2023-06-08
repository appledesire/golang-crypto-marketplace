package marketplace

import (
	"encoding/json"
	"io/ioutil"
	"strings"
	"time"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

var localizationMap map[string]Localization
var vendorshipAgreementMap map[string]string

type LocalizationLayout struct {
	BTCRates     string `json:"btcrates"`
	BuyerGuide   string `json:"buyerguide"`
	Help         string `json:"help"`
	Language     string `json:"language"`
	Login        string `json:"login"`
	Marketplace  string `json:"marketplace"`
	Messageboard string `json:"messageboard"`
	MyProfile    string `json:"myprofile"`
	PremiumAd    string `json:"premiumad"`
	Register     string `json:"register"`
	Rules        string `json:"rules"`
	Sections     string `json:"sections"`
	Settings     string `json:"settings"`
	Support      string `json:"support"`
	Tochka       string `json:"tochka"`
	VendorGuide  string `json:"vendorguide"`
	Vendors      string `json:"vendors"`
	Wallet       string `json:"wallet"`
}

type LocaliztionUserCard struct {
	Registred       string `json:"registred"`
	LastSeen        string `json:"lastseen"`
	PossibleScammer string `json:"possiblescammer"`
	Staff           string `json:"staff"`
	Vendor          string `json:"vendor"`
	PremiumVendor   string `json:"premiumvendor"`
	TrustedSeller   string `json:"trustedseller"`
	Tester          string `json:"tester"`
	Buyer           string `json:"buyer"`
	NoReviewsYet    string `json:"noreviewsyet"`
}

type LocalizationLeftMenu struct {
	About       string `json:"about"`
	Account     string `json:"account"`
	Board       string `json:"board"`
	Feed        string `json:"feed"`
	News        string `json:"news"`
	Invitations string `json:"invitations"`
	Items       string `json:"items"`
	Orders      string `json:"orders"`
	PM          string `json:"pm"`
	PMs         string `json:"pms"`
	Referrals   string `json:"referrals"`
	Reviews     string `json:"reviews"`
	Support     string `json:"support"`
	VendorInfo  string `json:"vendorinfo"`
	SignOut     string `json:"signout"`
	Shoutbox    string `json:"shoutbox"`
	Disputes    string `json:"disputes"`
	Warnings    string `json:"warnings"`
}

type LocalizationFeed struct {
	FullDiscussion string `json:"fulldiscussion"`
	All            string `json:"all"`
}

type LocalizationOrders struct {
	Amount                 string `json:"amount"`
	BTCAddress             string `json:"btcaddress"`
	Buyer                  string `json:"buyer"`
	BuyerPublicKey         string `json:"buyerpublickey"`
	Cancel                 string `json:"cancel"`
	CancelDescription      string `json:"canceldescription"`
	Comment                string `json:"comment"`
	CreatedAt              string `json:"createdat"`
	Currency               string `json:"currency"`
	CurrentAmount          string `json:"currentamount"`
	CurrentStatus          string `json:"currentstatus"`
	Date                   string `json:"date"`
	Description            string `json:"description"`
	Dispute                string `json:"dispute"`
	DisputeReason          string `json:"disputereason"`
	DropCoordinates        string `json:"dropcoordinates"`
	FEDescription          string `json:"fedescription"`
	Finalize               string `json:"finalize"`
	FundsWillBeReleased    string `json:"fundswillbereleased"`
	Image                  string `json:"image"`
	IsReviewed             string `json:"isreviewed"`
	Item                   string `json:"item"`
	MarkDispatched         string `json:"markdispatched"`
	MarketPrivateKey       string `json:"marketprivatekey"`
	MarketPublicKey        string `json:"marketpublickey"`
	MarkShipped            string `json:"markshipped"`
	Next                   string `json:"next"`
	NoOrders               string `json:"noorders"`
	NoOrdersDescription    string `json:"noordersdescription"`
	NumberOfMessages       string `json:"numberofmessages"`
	Package                string `json:"package"`
	PaymentDetails         string `json:"paymentdetails"`
	PayViaEscrow           string `json:"payviaescrow"`
	PayViaMultisig         string `json:"payviamultisig"`
	PurchaseDetails        string `json:"purchasedetails"`
	QRCode                 string `json:"qrcode"`
	SellerPublicKey        string `json:"sellerpublickey"`
	ShippingDetails        string `json:"shippingdetails"`
	StartDispute           string `json:"startdispute"`
	Status                 string `json:"status"`
	StatusHistory          string `json:"statushistory"`
	TransactionIsCancelled string `json:"transactioniscancelled"`
	Vendor                 string `json:"vendor"`
}

type LocalizationMessageboard struct {
	BackToAll             string `json:"backtoall"`
	Captcha               string `json:"captcha"`
	Chat                  string `json:"chat"`
	CreatedBy             string `json:"createdby"`
	CreateNewThread       string `json:"createnewthread"`
	Error                 string `json:"error"`
	General               string `json:"general"`
	Image                 string `json:"image"`
	LastUpdated           string `json:"lastupdated"`
	Message               string `json:"message"`
	NoMessages            string `json:"nomessages"`
	NoMessagesDescription string `json:"nomessagesdescription"`
	NumberOfMessages      string `json:"numberofmessages"`
	Reply                 string `json:"reply"`
	Sections              string `json:"sections"`
	Support               string `json:"support"`
	Vendors               string `json:"vendors"`
	Section               string `json:"section"`
	Title                 string `json:"title"`
	Text                  string `json:"text"`
	Save                  string `json:"save"`
	NewThread             string `json:"newthread"`
	EditThread            string `json:"editthread"`
	FixProblem            string `json:"fixproblem"`
}

type LocalizationRating struct {
	Error             string `json:"error"`
	Review            string `json:"review"`
	Header            string `json:"header"`
	ItemRating        string `json:"itemrating"`
	ItemReview        string `json:"itemreview"`
	MarketplaceRating string `json:"marketplacerating"`
	MarketplaceReview string `json:"marketplacereview"`
	SellerRating      string `json:"sellerrating"`
	SellerReview      string `json:"sellerreview"`
	Save              string `json:"save"`
}

type LocalizationReferrals struct {
	ReferralLink         string `json:"referrallink"`
	NumberOfInvitedUsers string `json:"numberofinvitedusers"`
}

type LocalizationAboutStore struct {
	Staff                 string `json:"staff"`
	About                 string `json:"about"`
	Statistics            string `json:"statistics"`
	Agreement             string `json:"agreement"`
	ContactInformation    string `json:"contactinformation"`
	AboutEmpty            string `json:"aboutempty"`
	AboutEmptyDescription string `json:"aboutemptydescription"`
	ShippingOptions       string `json:"shippingoptions"`
	Name                  string `json:"name"`
	PriceUSD              string `json:"priceusd"`
}

type LocalizationAboutUser struct {
	About                 string `json:"about"`
	Statistics            string `json:"statistics"`
	ContactInformation    string `json:"contactinformation"`
	AboutEmpty            string `json:"aboutempty"`
	AboutEmptyDescription string `json:"aboutemptydescription"`
}

type LocalizationAuth struct {
	Username                    string `json:"username"`
	Passphrase                  string `json:"passphrase"`
	RepeatPassphrase            string `json:"repeatpassphrase"`
	InviteCode                  string `json:"invitecode"`
	InviteCodeDescription       string `json:"invitecodedescription"`
	Buyer                       string `json:"buyer"`
	Vendor                      string `json:"vendor"`
	Captcha                     string `json:"captcha"`
	Login                       string `json:"login"`
	Register                    string `json:"register"`
	LoginWithPGP                string `json:"loginwithpgp"`
	Error                       string `json:"error"`
	EncryptedMessage            string `json:"encryptedmessage"`
	EncryptedMessageDescription string `json:"encryptedmessagedescription"`
	DecryptedMessage            string `json:"decryptedmessage"`
	UsernameDescription         string `json:"usernamedescription"`
	PassphraseDescription       string `json:"passphrasedescription"`
	VerifyAccount               string `json:"verifyaccount"`
	MyAccount                   string `json:"myaccount"`
}

type LocalizationItems struct {
	About        string `json:"about"`
	AddItem      string `json:"additem"`
	AddPackage   string `json:"addpackage"`
	AllCountries string `json:"allcountries"`
	AllTypes     string `json:"alltypes"`
	Categories   string `json:"categories"`
	Category     string `json:"category"`
	City         string `json:"city"`
	Currency     string `json:"currency"`
	DateAdded    string `json:"dateadded"`
	Delete       string `json:"delete"`
	DeleteItem   string `json:"deleteitem"`
	DeliveryType string `json:"deliverytype"`
	Description  string `json:"description"`
	Digital      string `json:"digital"`
	Drop         string `json:"drop"`
	DropPreorder string `json:"droppreorder"`
	Duplicate    string `json:"duplicate"`
	Edit         string `json:"edit"`
	EditItem     string `json:"edititem"`
	EditPackages string `json:"editpackages"`
	Error        string `json:"error"`
	Filters      string `json:"filters"`
	ResetFilters string `json:"ResetFilters"`
	Image        string `json:"image"`
	LookingFor   string `json:"lookingfor"`
	Mail         string `json:"mail"`
	Name         string `json:"name"`
	Next         string `json:"next"`
	NoItems      string `json:"noitems"`
	NoReviews    string `json:"noreviews"`
	OutOfStock   string `json:"outofstock"`
	PackageName  string `json:"packagename"`
	Popularity   string `json:"popularity"`
	Price        string `json:"price"`
	PriceBTC     string `json:"pricebtc"`
	Purchase     string `json:"purchase"`
	Rating       string `json:"rating"`
	Reviews      string `json:"reviews"`
	Save         string `json:"save"`
	Search       string `json:"search"`
	ShippingFrom string `json:"shippingfrom"`
	ShippingTo   string `json:"shippingto"`
	SortBy       string `json:"sortby"`
	Subcategory  string `json:"subcategory"`
	Type         string `json:"type"`
	SalesAmount  string `json:"salesamount"`
	SalesVolume  string `json:"salesvolume"`
}

type LocalizationSettings struct {
	About                              string `json:"about"`
	Account                            string `json:"account"`
	AboutDescription                   string `json:"aboutdescription"`
	Avatar                             string `json:"avatar"`
	AvatarDescription                  string `json:"avatardescription"`
	BTCAddressChangeHistory            string `json:"btcaddresschangehistory"`
	BTCWallet                          string `json:"btcwallet"`
	BTCWalletDescription               string `json:"btcwalletdescription"`
	BTCMultisigPublicKey               string `json:"btcmultisigpublickey"`
	BTCMultisigPublicKeyDescription    string `json:"btcmultisigpublickeydescription"`
	Contacts                           string `json:"contacts"`
	DecriptedText                      string `json:"decriptedtext"`
	DecriptText                        string `json:"decripttext"`
	Enable2FA                          string `json:"enable2fa"`
	Encryption                         string `json:"encryption"`
	Error                              string `json:"error"`
	Off                                string `json:"off"`
	On                                 string `json:"on"`
	Payments                           string `json:"payments"`
	PGPPublicKey                       string `json:"pgppublickey"`
	Profile                            string `json:"profile"`
	Save                               string `json:"save"`
	SetupPGPKey                        string `json:"setuppgpkey"`
	ShortDescription                   string `json:"shortdescription"`
	ShortDescriptionDescription        string `json:"shortdescriptiondescription"`
	TwoFactorAuthentication            string `json:"twofactorauthentication"`
	TwoFactorAuthenticationDescription string `json:"twofactorauthenticationdescription"`
	Username                           string `json:"username"`
	VendorSettings                     string `json:"vendorsettings"`
	ShippingSettings                   string `json:"shippingsettings"`
	Name                               string `json:"name"`
	Price                              string `json:"price"`
	Add                                string `json:"add"`
	VacationMode                       string `json:"vacationmode"`
	VacationModeDescription            string `json:"vacationmodedescription"`
	Password                           string `json:"password"`
	ChangePassword                     string `json:"changepassword"`
	OldPassword                        string `json:"oldpassword"`
	NewPassword                        string `json:"newpassword"`
	RepeatNewPassword                  string `json:"repeatnewpassword"`
}

type LocalizationWallet struct {
	RecieveBitcoins    string `json:"recievebitcoins"`
	SendBitcoins       string `json:"sendbitcoins"`
	BTCAddress         string `json:"btcaddress"`
	QRCode             string `json:"qrcode"`
	Balance            string `json:"balance"`
	AmountToSend       string `json:"amounttosend"`
	Send               string `json:"send"`
	UnconfirmedBalance string `json:"unconfirmedbalance"`
	Time               string `json:"time"`
	Action             string `json:"action"`
	Address            string `json:"address"`
	Actions            string `json:"actions"`
}

type LocalizationIndex struct {
	WelcomeToTochka              string `json:"welcometotochka"`
	WelcomeToTochkaDescription   string `json:"welcometotochkadescription"`
	EscrowAndMultisig            string `json:"escrowandmultisig"`
	EscrowAndMultisigDescription string `json:"escrowandmultisigdescription"`
	ActiveCommunity              string `json:"activecommunity"`
	ActiveCommunityDescription   string `json:"activecommunitydescription"`
	Support                      string `json:"support"`
	SupportDescription           string `json:"supportdescription"`
	Vendors                      string `json:"vendors"`
	VendorsDescription           string `json:"vendorsdescription"`
	Referrals                    string `json:"referrals"`
	ReferralsDescription         string `json:"referralsdescription"`
}

type LocalizationDispute struct {
	AddClaim              string `json:"addclaim"`
	Claim                 string `json:"claim"`
	Claims                string `json:"claims"`
	Dispute               string `json:"dispute"`
	Disputes              string `json:"disputes"`
	NoDisputes            string `json:"nodisputes"`
	NoDisputesDescription string `json:"nodisputesdescription"`
}

type LocalizationStaff struct {
	Staff        string `json:"staff"`
	Support      string `json:"support"`
	Items        string `json:"items"`
	Disputes     string `json:"disputes"`
	Messageboard string `json:"messageboard"`
	Actions      string `json:"actions"`
	Statistics   string `json:"statistics"`
}

type Localization struct {
	AboutStore    LocalizationAboutStore   `json:"aboutstore"`
	AboutUser     LocalizationAboutUser    `json:"aboutuser"`
	Auth          LocalizationAuth         `json:"auth"`
	Feed          LocalizationFeed         `json:"feed"`
	Items         LocalizationItems        `json:"items"`
	Layout        LocalizationLayout       `json:"layout"`
	LeftMenu      LocalizationLeftMenu     `json:"leftmenu"`
	Messageboard  LocalizationMessageboard `json:"messageboard"`
	Orders        LocalizationOrders       `json:"orders"`
	Rating        LocalizationRating       `json:"rating"`
	Referrals     LocalizationReferrals    `json:"referrals"`
	Settings      LocalizationSettings     `json:"settings"`
	UserCard      LocaliztionUserCard      `json:"usercard"`
	Wallet        LocalizationWallet       `json:"wallet"`
	Index         LocalizationIndex        `json:"index"`
	Dispute       LocalizationDispute      `json:"dispute"`
	Staff         LocalizationStaff        `json:"staff"`
	Verification  LocalizationVerification `json:"verification"`
	Greeting      string                   `json:"greeting"`
	TrustedVendor string                   `json:"trustedvendor"`
}

type LocalizationVerification struct {
	Encryption                      string
	EncryptionDescription           string
	VendorshipAgreement             string
	VendorshipAgreementDescription  string
	VendorshipAgreementInstructions string
	MembershipPlans                 string
	MembershipPlansDescription      string
	Verification                    string
	VerificationDescription         string
	VerificationInstructions        string
	AgreementText                   string
	SignedAgreement                 string
}

func TranslateFeedActions(str, lang string) string {
	if lang == "ru" {
		if str == "added new item" {
			str = "добавил новый товар"
		}
		if str == "created new thread" {
			str = "создал новую тему"
		}
	}
	if lang == "de" {
		if str == "added new item" {
			str = "erstellt"
		}
		if str == "created new thread" {
			str = "erstellt einen neuen thread"
		}
	}
	if lang == "es" {
		if str == "added new item" {
			str = "nuevo elemento creado"
		}
		if str == "created new thread" {
			str = "creado un nuevo hilo"
		}
	}
	if lang == "fr" {
		if str == "added new item" {
			str = "créé un nouvel élément"
		}
		if str == "created new thread" {
			str = "créé un nouveau fil"
		}
	}
	return str
}

func GetLocalization(lang string) Localization {
	if l, ok := localizationMap[lang]; ok {
		return l
	} else {
		return localizationMap["en"]
	}
}

func ReadLocalizationFile(file string) Localization {
	l := Localization{}
	path := util.GetFileAbsolutePath("./data/i18n/" + file)
	raw, err := ioutil.ReadFile(path)
	if err != nil {
		panic(err)
	}
	json.Unmarshal(raw, &l)

	return l
}

func ReadVendorshipAgreement(language string) string {
	path := util.GetFileAbsolutePath("./data/i18n/" + language + "_vendorship_agreement.txt")
	raw, err := ioutil.ReadFile(path)
	if err != nil {
		panic(err)
	}
	return string(raw[:])
}

func GetVendorshipAgreement(lang string, user User, dt time.Time) string {
	agreement := vendorshipAgreementMap["en"]
	agreement = strings.Replace(agreement, "{fingerprint}", user.Fingerprint(), -1)
	agreement = strings.Replace(agreement, "{username}", user.Username, -1)
	agreement = strings.Replace(agreement, "{date}", dt.Format("2006-01-02"), -1)
	return agreement
}

func init() {
	localizationMap = map[string]Localization{
		"rs": ReadLocalizationFile("RS.json"),
		"ru": ReadLocalizationFile("RU.json"),
		"fr": ReadLocalizationFile("FR.json"),
		"de": ReadLocalizationFile("DE.json"),
		"es": ReadLocalizationFile("ES.json"),
		"en": ReadLocalizationFile("EN.json"),
		"tr": ReadLocalizationFile("TR.json"),
		"it": ReadLocalizationFile("IT.json"),
	}
	vendorshipAgreementMap = map[string]string{
		"en": ReadVendorshipAgreement("EN"),
	}
}
