package settings

import (
	"encoding/json"
	"io/ioutil"
	"os"
	"path"
)

type MarketplaceSettings struct {
	CompletedDuration                    string  `json:"completed_duration"`
	CookieEncryptionSalt                 string  `json:"cookie_encryption_salt"`
	CooloffPeriod                        int     `json:"cooloff_period"`
	FeedSize                             int     `json:"feed_size"`
	FreeCommission                       float64 `json:"free_commission"`
	GRAMSApiKey                          string  `json:"grams_api_key"`
	ItemsPerPage                         int     `json:"items_per_page"`
	MattermostIncomingHookSupport        string  `json:"mattermost_incoming_hook_support"`
	MattermostIncomingHookAuthentication string  `json:"mattermost_incoming_hook_authentication"`
	MattermostIncomingHookMessageboard   string  `json:"mattermost_incoming_hook_messageboard"`
	MattermostIncomingHookTrustedVendors string  `json:"mattermost_incoming_hook_trusted_vendors"`
	MattermostIncomingHookTransactions   string  `json:"mattermost_incoming_hook_transactions"`
	MattermostIncomingHookShoutbox       string  `json:"mattermost_incoming_hook_shoutbox"`
	MattermostIncomingHookItems          string  `json:"mattermost_incoming_hook_items"`
	MattermostIncomingHookDisputes       string  `json:"mattermost_incoming_hook_disputes"`
	MattermostIncomingHookStatsDaily     string  `json:"mattermost_incoming_hook_stats_daily"`
	MattermostIncomingHookStatsHourly    string  `json:"mattermost_incoming_hook_stats_hourly"`
	MattermostIncomingHookStatsWeekly    string  `json:"mattermost_incoming_hook_stats_weekly"`
	MattermostIncomingHookSubscriptions  string  `json:"mattermost_incoming_hook_subscriptions"`
	MattermostIncomingHookWarnings       string  `json:"mattermost_incoming_hook_warnings"`
	MattermostIncomingHookStaffActions   string  `json:"mattermost_incoming_hook_staff_actions"`
	OnlineDuration                       string  `json:"online_duration"`
	PendingDuration                      string  `json:"pending_duration"`
	PostgresConnectionString             string  `json:"postgres_connection_string"`
	AdvertisingCost                      float64 `json:"advertising_cost"`
	SiteURL                              string  `json:"siteurl"`
	SiteName                             string  `json:"sitename"`
	Host                                 string  `json:"host"`
	Port                                 string  `json:"port"`
	PaymentGate                          string  `json:"paymentgate"`
	Debug                                bool    `json:"debug"`
	BotCheck                             bool    `json:"bot_check"`
	SingleMode                           bool    `json:"single_mode"`
	CSRFEncryption                       string  `json:"csrf_encryption"`
	InsuredCategories                    []int   `json:"insured_categories"`
	// Account type settings
	GoldAccountCommission            float64 `json:"gold_account_commission"`
	SilverAccountCommission          float64 `json:"silver_account_commission"`
	BronzeAccountCommission          float64 `json:"bronze_account_commission"`
	FreeAccountCommission            float64 `json:"free_account_commission"`
	GoldAccountReferralPercent       float64 `json:"gold_account_referral_percent"`
	SilverAccountPlusReferralPercent float64 `json:"silver_account_referral_percent"`
	BronzeAccountPlusReferralPercent float64 `json:"bronze_account_referral_percent"`
	FreeAccountReferralPercent       float64 `json:"free_account_referral_percent"`
	// Financial
	EthereumCommissionWallet string `json:"ethereum_commission_wallet"`
}

var (
	settings MarketplaceSettings
)

func GetSettings() MarketplaceSettings {

	settings = loadMarketplaceSettings()

	if settings.Host == "" {
		settings.Host = "127.0.0.1"
	}

	if settings.Port == "" {
		settings.Port = "8081"
	}

	if settings.PaymentGate == "" {
		settings.PaymentGate = "http://127.0.0.1:8083"
	}

	return settings
}

func loadMarketplaceSettings() MarketplaceSettings {

	settingPath := GetFileAbsolutePath("settings.json")

	file, err := ioutil.ReadFile(settingPath)
	if err != nil {
		panic(err)
	}

	err = json.Unmarshal(file, &settings)
	if err != nil {
		panic(err)
	}

	return settings
}

func GetFileAbsolutePath(relativePath string) string {
	projectDirectory, exists := os.LookupEnv("TOCHKA_HOME")
	if !exists {
		return relativePath
	}
	return path.Join(projectDirectory, relativePath)
}

