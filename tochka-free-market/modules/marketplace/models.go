package marketplace

import (
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
	// "github.com/wantedly/gorm-zap"
	// "go.uber.org/zap"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/settings"
)

var (
	database *gorm.DB
)

func SyncModels() {
	database.AutoMigrate(
		&Advertising{},
		&APISession{},
		&BitcoinCashTransaction{},
		&BitcoinTransaction{},
		&CityMetroStation{},
		&City{},
		&Country{},
		&DepositHistory{},
		&Deposit{},
		&DisputeClaim{},
		&Dispute{},
		&EthereumTransaction{},
		&FeedItem{},
		&ItemCategory{},
		&Item{},
		// &MessageboardSection{},
		&Message{},
		&PackagePrice{},
		&Package{},
		&PaymentReceipt{},
		&RatingReview{},
		&ReferralPayment{},
		&Reservation{},
		&ShippingOption{},
		&ShippingStatus{},
		&StoreUser{},
		&Store{},
		&SupportTicketStatus{},
		&SupportTicket{},
		&ThreadPerusalStatus{},
		&TransactionStatus{},
		&Transaction{},
		&UserBitcoinCashWalletAction{},
		&UserBitcoinCashWalletBalance{},
		&UserBitcoinCashWallet{},
		&UserBitcoinWalletAction{},
		&UserBitcoinWalletBalance{},
		&UserBitcoinWallet{},
		&UserEthereumWalletAction{},
		&UserEthereumWalletBalance{},
		&UserEthereumWallet{},
		&UserSettingsHistory{},
		&StoreWarning{},
		&User{},
	)
}

func SyncDatabaseViews() {

	// drop all views and triggers

	database.Exec(`
		CREATE OR REPLACE FUNCTION strip_all_triggers() RETURNS text AS $$ DECLARE
	    triggNameRecord RECORD;
	    triggTableRecord RECORD;
	BEGIN
	    FOR triggNameRecord IN select distinct(trigger_name) from information_schema.triggers where trigger_schema = 'public' LOOP
	        FOR triggTableRecord IN SELECT distinct(event_object_table) from information_schema.triggers where trigger_name = triggNameRecord.trigger_name LOOP
	            RAISE NOTICE 'Dropping trigger: % on table: %', triggNameRecord.trigger_name, triggTableRecord.event_object_table;
	            EXECUTE 'DROP TRIGGER ' || triggNameRecord.trigger_name || ' ON ' || triggTableRecord.event_object_table || ';';
	        END LOOP;
	    END LOOP;

	    RETURN 'done';
	END;
	$$ LANGUAGE plpgsql SECURITY DEFINER;
	`)

	database.Exec(`
		select strip_all_triggers();
	`)

	database.Exec(`
	SELECT 
	'DROP VIEW ' || table_name || ';'
	FROM information_schema.views
	WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
	AND table_name !~ '^pg_';
	`)

	// wallets & balances
	setupUserBitcoinBalanceViews()
	setupUserBitcoinCashBalanceViews()
	setupUserEthereumBalanceViews()

	// messageboard & messages
	setupThreadsViews()
	setupMessageboardThreadsViews()
	setupPrivateThreadsFunctions()
	setupVendorVerificationThreadsFunctions()
	// setupMessageboardCategoriesViews()

	// transcations
	setupTransactionStatusesView()

	// users
	setupUserViews()
	setupVendorTxStatsViews()
	setupItemTxStatsViews()

	// items & packages, categories
	// setupCategoriesViews()
	setupPackagesView()
	setupSerpItemsView()
	setupFrontPageItemsViews()

	// tickets
	setupSupportTicketViews()

	// advertisings
	setupAdvertisingViews()
}

func init() {
	var err error

	database, err = gorm.Open("postgres", MARKETPLACE_SETTINGS.PostgresConnectionString)
	if err != nil {
		panic(err)
	}
	database.DB().SetMaxOpenConns(30)
	database.DB().Ping()

	if settings.GetSettings().Debug {

		// logger, err := zap.NewProduction()
		// if err != nil {
		// 	panic(err)
		// }

		database.LogMode(true)
		// database.SetLogger(gormzap.New(logger))
	}
}
