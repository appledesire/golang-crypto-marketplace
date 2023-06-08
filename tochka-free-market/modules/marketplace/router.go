package marketplace

import (
	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/settings"
)

func ConfigureRouter(router *web.Router) *web.Router {

	// ----------
	// Middleware
	// ----------

	router.Middleware((*Context).PerformanceMeasureMiddleware)

	if !settings.GetSettings().Debug {
		router.Middleware((*Context).LoggerMiddleware)
	}

	if settings.GetSettings().BotCheck {
		router.Middleware((*Context).BotCheckMiddleware)
	}

	router.Middleware((*Context).SecurityHeadersMiddleware)
	router.Middleware((*Context).AuthMiddleware)
	router.Middleware((*Context).GlobalsMiddleware)
	router.Middleware((*Context).CurrencyMiddleware)

	// Images
	router.Get("/item-image/:item", (*Context).ViewItemImage)
	router.Get("/user-avatar/:user", (*Context).UserAvatar)
	router.Get("/item-category-image/:user", (*Context).ViewItemCategoryImage)

	// Index
	router.Get("/", (*Context).Index)

	// Captcha
	router.Get("/captcha/:captcha_id", (*Context).ViewCaptchaImage)
	router.Get("/captcha_v2/:captcha_id", (*Context).ViewCaptchaImageV2)

	// Bot Check
	router.Get("botcheck", (*Context).BotCheckGET)
	router.Post("botcheck", (*Context).BotCheckPOST)

	// ---
	// API
	// ---

	apiRouter := router.Subrouter(Context{}, "/api")
	apiRouter.Get("/auth/user", (*Context).ViewAPIUserByToken)
	apiRouter.Get("/auth/login", (*Context).ViewAPILoginRegisterGET)
	apiRouter.Post("/auth/login", (*Context).ViewAPILoginPOST)
	apiRouter.Get("/auth/register", (*Context).ViewAPILoginRegisterGET)
	apiRouter.Post("/auth/register", (*Context).ViewAPIRegisterPOST)
	apiRouter.Get("/serp", (*Context).ViewAPISERP)
	apiRouter.Get("/deals", (*Context).ViewAPIHotDeals)
	apiRouter.Get("/categories", (*Context).ViewAPICategories)
	apiRouter.Get("/countries", (*Context).ViewAPIListCountries)
	apiRouter.Get("/stores", (*Context).ViewAPIListStores)

	// Store
	apiStoreRouter := apiRouter.Subrouter(Context{}, "/store/:store")
	apiStoreRouter.Middleware((*Context).PublicStoreMiddleware)
	apiStoreRouter.Get("/", (*Context).ViewAPIShowStore)

	// Store item
	apiStoreItemRouter := apiStoreRouter.Subrouter(Context{}, "/item/:item")
	apiStoreItemRouter.Middleware((*Context).PublicStoreItemMiddleware)
	apiStoreItemRouter.Get("/", (*Context).ViewAPIShowItem)

	// Reserve item
	apiStoreItemRouter.Post("/package/:hash/book", (*Context).ViewAPIBookPackage)

	// Transactions
	apiTransactionRouter := apiRouter.Subrouter(Context{}, "/transactions")
	apiTransactionRouter.Get("/", (*Context).ViewAPIListCurrentTransactionStatuses)

	singleApiTransactionRouter := apiTransactionRouter.Subrouter(Context{}, "/:transaction")
	singleApiTransactionRouter.Middleware((*Context).TransactionMiddleware)
	singleApiTransactionRouter.Get("/", (*Context).ViewAPIShowTransactionGET)
	singleApiTransactionRouter.Post("/", (*Context).ViewAPIShowTransactionPOST)

	singleApiTransactionRouter.Post("/release", (*Context).ViewAPIShowTransactionReleasePOST)
	singleApiTransactionRouter.Post("/cancel", (*Context).ViewAPIShowTransactionCancelPOST)
	singleApiTransactionRouter.Post("/shipped", (*Context).ViewAPIShowTransactionShippedPOST)

	// Wallets
	apiWalletsMiddleware := apiRouter.Subrouter(Context{}, "/wallet")
	apiWalletsMiddleware.Middleware((*Context).BitcoinWalletMiddleware)
	apiWalletsMiddleware.Middleware((*Context).BitcoinCashWalletMiddleware)
	apiWalletsMiddleware.Middleware((*Context).EthereumWalletMiddleware)
	apiWalletsMiddleware.Middleware((*Context).WalletsMiddleware)

	apiWalletsMiddleware.Get("/", (*Context).ViewAPIWallet)
	apiWalletsMiddleware.Get("/bitcoin/send", (*Context).ViewAPIBitcoinWalletPOST)
	apiWalletsMiddleware.Get("/ethereum/send", (*Context).ViewAPIEthereumWalletPOST)

	// Settings
	apiSettingsRouter := apiRouter.Subrouter(Context{}, "/settings")
	apiSettingsRouter.Post("/", (*Context).ViewUserSettingsPOST)

	apiSettingsRouter.Post("/pgp/step1", (*Context).ViewAPISetupPGPViaDecryptionStep1POST)
	apiSettingsRouter.Post("/pgp/step2", (*Context).ViewAPISetupPGPViaDecryptionStep2POST)

	// --------------
	// HTTP Interface
	// --------------

	loggedInRouter := router.Subrouter(Context{}, "/")
	loggedInRouter.Middleware((*Context).MessageStatsMiddleware)
	loggedInRouter.Middleware((*Context).TransactionStatsMiddleware)
	loggedInRouter.Middleware((*Context).DisputeStatsMiddleware)
	loggedInRouter.Middleware((*Context).WalletsMiddleware)

	// Static
	staticRouter := loggedInRouter.Subrouter(Context{}, "/help")
	staticRouter.Get("/", (*Context).Help)
	staticRouter.Get("/:filename", (*Context).HelpItem)

	// SERP
	loggedInRouter.Get("/marketplace/", (*Context).ListSerpItems)
	loggedInRouter.Get("/marketplace/:package_type", (*Context).ListSerpItems)
	loggedInRouter.Get("/vendors/", (*Context).ListSerpVendors)
	loggedInRouter.Get("/vendors/:package_type", (*Context).ListSerpVendors)

	// Front Page
	loggedInRouter.Get("/front/", (*Context).FrontPageItems)

	// App landing page
	loggedInRouter.Get("/app/landing", (*Context).TargetWebUserPage)
	loggedInRouter.Get("/app/download", (*Context).DownloadApk)
	loggedInRouter.Get("/app/manifest.json", (*Context).DownloadApk)

	// Auth
	authRouter := loggedInRouter.Subrouter(Context{}, "/auth")
	authRouter.Get("/login", (*Context).LoginGET)
	authRouter.Post("/login", (*Context).LoginPOST)
	authRouter.Get("/recover", (*Context).ViewRecoverGET)
	authRouter.Post("/recover", (*Context).ViewRecoverPOST)
	authRouter.Get("/register", (*Context).RegisterGET)
	authRouter.Post("/register", (*Context).RegisterPOST)
	authRouter.Get("/register/:invite_code", (*Context).RegisterGET)
	authRouter.Post("/register/:invite_code", (*Context).RegisterPOST)
	authRouter.Get("/mobile_auth", (*Context).ViewsAuthMobileAuthImage)
	authRouter.Post("/logout", (*Context).Logout)

	// Main Page
	// shoutboxRouter := loggedInRouter.Subrouter(Context{}, "/shoutbox")
	// shoutboxRouter.Get("/", (*Context).ViewShoutboxGET)
	// shoutboxRouter.Post("/", (*Context).ViewShoutboxPOST)

	// Referral Admin
	referralAdminRouter := loggedInRouter.Subrouter(Context{}, "/referrals/admin")
	referralAdminRouter.Middleware((*Context).AdminMiddleware)
	referralAdminRouter.Get("/", (*Context).ViewAdminListReferralPayments)

	// Auth Admin
	authAdminRouter := authRouter.Subrouter(Context{}, "/admin")
	authAdminRouter.Middleware((*Context).AdminMiddleware)
	authAdminRouter.Get("/users", (*Context).AdminUsers)
	authAdminRouter.Post("/users/:user/login", (*Context).LoginAsUser)
	authAdminRouter.Post("/users/:user/ban", (*Context).BanUser)
	authAdminRouter.Post("/users/:user/staff", (*Context).GrantStaff)
	authAdminRouter.Post("/users/:user/seller", (*Context).GrantSeller)
	authAdminRouter.Get("/reviews", (*Context).AdminReviews)

	// Staff
	staffRouter := loggedInRouter.Subrouter(Context{}, "/staff")
	staffRouter.Middleware((*Context).StaffMiddleware)

	staffRouter.Get("", (*Context).ViewStaff)
	staffRouter.Get("/staff", (*Context).ViewStaffListStaff)
	staffRouter.Get("/users", (*Context).ViewStaffListSupportTickets)
	staffRouter.Get("/advertising", (*Context).ViewStaffAdvertisings)
	staffRouter.Get("/warnings", (*Context).ViewStaffListWarnings)
	staffRouter.Get("/messages", (*Context).ViewStaffListReportedMessages)
	staffRouter.Get("/messages/:message_uuid", (*Context).ViewStaffShowReportedMessage)
	staffRouter.Get("/items", (*Context).ViewStaffListItems)
	staffRouter.Get("/disputes", (*Context).ViewStaffListDisputes)
	staffRouter.Get("/stats", (*Context).ViewStaffStats)
	staffRouter.Get("/deposits", (*Context).ViewStaffListDeposits)

	// Staff - Stats
	staffRouter.Get("/stats/users.png", (*Context).ViewStatsNumberOfUsersGraph)
	staffRouter.Get("/stats/vendors.png", (*Context).ViewStatsNumberOfVendorsGraph)
	staffRouter.Get("/stats/trade-amount-btc.png", (*Context).ViewStatsBTCTradeAmountGraph)
	staffRouter.Get("/stats/trade-amount-eth.png", (*Context).ViewStatsETHTradeAmountGraph)
	staffRouter.Get("/stats/trade-amount-bch.png", (*Context).ViewStatsBCHTradeAmountGraph)
	staffRouter.Get("/stats/transactions.png", (*Context).ViewStatsNumberOfTransactionsGraph)

	// Staff - Vendors
	staffRouter.Get("/vendors", (*Context).ViewStaffListVendors)
	staffRouter.Get("/vendors/:username", (*Context).ViewStaffVendorVerificationThreadGET)
	staffRouter.Post("/vendors/:username", (*Context).ViewStaffVendorVerificationThreadPOST)

	// Staff - User
	staffRouter.Get("/users/:username/payments", (*Context).ViewStaffUserPayments)
	staffRouter.Get("/users/:username/finance", (*Context).ViewStaffUserFinance)
	staffRouter.Get("/users/:username/tickets", (*Context).ViewStaffUserTickets)
	staffRouter.Get("/users/:username/tickets/:id", (*Context).ShowSupportTicketGET)
	staffRouter.Post("/users/:username/tickets/:id", (*Context).ShowSupportTicketPOST)
	staffRouter.Get("/users/:username/actions", (*Context).ViewStaffUserAdminActions)

	// Staff - User - Admin Actions
	staffRouter.Post("/users/:user/ban", (*Context).BanUser)
	staffRouter.Post("/users/:user/staff", (*Context).GrantStaff)
	staffRouter.Post("/users/:user/seller", (*Context).GrantSeller)

	// Staff - Store
	staffRouter.Get("/stores/:storename/payments", (*Context).ViewStaffStorePayments)
	staffRouter.Get("/stores/:storename/actions", (*Context).ViewStaffStoreAdminActions)

	// Staff - Store - Store Actions
	staffRouter.Post("/stores/:storename/suspend", (*Context).ViewStaffStoreToggleSuspend)
	staffRouter.Post("/stores/:storename/allow_to_sell", (*Context).ViewStaffStoreToggleAllowToSell)
	staffRouter.Post("/stores/:storename/trusted", (*Context).ViewStaffStoreToggleTrusted)
	// -- account types
	staffRouter.Post("/stores/:storename/gold", (*Context).ViewStaffStoreToggleGoldAccount)
	staffRouter.Post("/stores/:storename/silver", (*Context).ViewStaffStoreToggleSilverAccount)
	staffRouter.Post("/stores/:storename/bronze", (*Context).ViewStaffStoreToggleBronzeAccount)
	staffRouter.Post("/stores/:storename/free", (*Context).ViewStaffStoreToggleFreeAccount)

	// Staff - CRUD
	staffRouter.Get("/news", (*Context).ViewStaffEditNewsGET)
	staffRouter.Post("/news", (*Context).ViewStaffEditNewsPOST)
	staffRouter.Get("/item_categories", (*Context).ViewStaffCategories)
	staffRouter.Get("/item_categories/:id", (*Context).ViewStaffCategoriesEditGET)
	staffRouter.Post("/item_categories/:id", (*Context).ViewStaffCategoriesEditPOST)
	staffRouter.Post("/item_categories/:id/delete", (*Context).ViewStaffCategoriesDelete)

	// Warnings
	loggedInRouter.Get("/user/active_reservation", (*Context).ActiveReservation)

	// Store
	userRouter := loggedInRouter.Subrouter(Context{}, "/user/:username")
	userRouter.Middleware((*Context).UserMiddleware)
	userRouter.Get("/", (*Context).ViewAboutUser)

	// Store
	storeRouter := loggedInRouter.Subrouter(Context{}, "/store/:store")
	storeRouter.Middleware((*Context).PublicStoreMiddleware)
	storeRouter.Get("/", (*Context).ViewAboutStore)
	storeRouter.Get("/items", (*Context).ViewListStoreItems)
	storeRouter.Get("/reviews", (*Context).ViewStoreReviews)
	storeRouter.Get("/warnings", (*Context).ViewStoreWarningsGET)
	storeRouter.Post("/warnings", (*Context).ViewStoreWarningsPOST)
	storeRouter.Post("/warnings/:uuid", (*Context).ViewStoreWarningUpdateStatusPOST)

	// Store item
	storeItemRouter := storeRouter.Subrouter(Context{}, "/item/:item")
	storeItemRouter.Middleware((*Context).PublicStoreItemMiddleware)
	storeItemRouter.Get("/", (*Context).ViewShowItem)
	storeItemRouter.Get("/package/:hash/book", (*Context).PreBookPackage)
	storeItemRouter.Post("/package/:hash/book", (*Context).BookPackage)

	// Board
	boardRouter := loggedInRouter.Subrouter(Context{}, "/board")
	boardRouter.Get("/message/:uuid/image", (*Context).MessageImage)
	boardRouter.Post("/:uuid/delete", (*Context).DeleteThread)
	boardRouter.Post("/:uuid/report", (*Context).ViewMessageReportPOST)
	// Messages
	messagesRouter := loggedInRouter.Subrouter(Context{}, "/messages")
	messagesRouter.Middleware((*Context).MessagesMiddleware)
	messagesRouter.Get("/", (*Context).ViewListPrivateMessages)
	messagesRouter.Get("/:username", (*Context).ViewShowPrivateMessageGET)
	messagesRouter.Post("/:username", (*Context).ViewShowPrivateMessagePOST)

	messagesAdminRouter := messagesRouter.Subrouter(Context{}, "/admin")
	messagesAdminRouter.Middleware((*Context).AdminMiddleware)
	messagesAdminRouter.Get("/:uuid", (*Context).AdminMessagesShow)

	// Package
	packagesRouter := loggedInRouter.Subrouter(Context{}, "/packages")
	packagesRouter.Get("/", (*Context).ListPackages)
	singlePackageRouter := packagesRouter.Subrouter(Context{}, "/:package")
	singlePackageRouter.Middleware((*Context).PackageMiddleware)
	singlePackageRouter.Get("/image", (*Context).PackageImage)

	// Profile
	loggedInRouter.Get("/settings/user", (*Context).ViewUserSettingsGET)
	loggedInRouter.Post("/settings/user", (*Context).ViewUserSettingsPOST)
	loggedInRouter.Get("/settings/store", (*Context).ViewStoreSettingsGET)
	loggedInRouter.Post("/settings/store", (*Context).ViewStoreSettingsPOST)
	loggedInRouter.Get("/referrals", (*Context).Referrals)
	loggedInRouter.Get("/verification/encryption", (*Context).ViewVerificationEncryptionGET)
	loggedInRouter.Get("/verification/agreement", (*Context).ViewVerificationAgreementGET)
	loggedInRouter.Post("/verification/agreement", (*Context).ViewVerificationAgreementPOST)
	loggedInRouter.Get("/verification/plan", (*Context).ViewVerificationPlanGET)
	loggedInRouter.Get("/verification/plan/:account", (*Context).ViewVerificationPlanPurchaseGET)
	loggedInRouter.Post("/verification/plan/:account", (*Context).ViewVerificationPlanPurchasePOST)
	loggedInRouter.Get("/free_restrictions", (*Context).FreeRestrictions)
	loggedInRouter.Get("/verification/thread", (*Context).ViewVerificationThreadGET)
	loggedInRouter.Post("/verification/thread", (*Context).ViewVerificationThreadPOST)
	loggedInRouter.Get("/settings/user/pgp/step1", (*Context).SetupPGPViaDecryptionStep1GET)
	loggedInRouter.Post("/settings/user/pgp/step1", (*Context).SetupPGPViaDecryptionStep1POST)
	loggedInRouter.Post("/settings/user/pgp/step2", (*Context).SetupPGPViaDecryptionStep2POST)

	loggedInRouter.Get("/settings/currency/:currency", (*Context).SetCurrency)
	loggedInRouter.Get("/settings/language/:language", (*Context).SetLanguage)

	// Profile
	loggedInRouter.Post("/shipping", (*Context).SaveShippingOption)
	loggedInRouter.Post("/shipping/delete", (*Context).DeleteShippingOption)

	// Support
	supportRouter := loggedInRouter.Subrouter(Context{}, "/support")
	supportRouter.Get("/", (*Context).ViewListSupportTickets)
	supportRouter.Get("/new", (*Context).ShowSupportTicketGET)
	supportRouter.Post("/new", (*Context).ShowSupportTicketPOST)
	supportRouter.Get("/:id", (*Context).ShowSupportTicketGET)
	supportRouter.Post("/:id", (*Context).ShowSupportTicketPOST)
	supportRouter.Post("/:id/status", (*Context).ViewUpdateTicketStatusPOST)

	// Feed
	feedRouter := loggedInRouter.Subrouter(Context{}, "/feed")
	feedRouter.Get("/", (*Context).ShowFeed)

	// Store CMS
	sellerRouter := loggedInRouter.Subrouter(Context{}, "/store-admin/:store")
	sellerRouter.Middleware((*Context).PrivateStoreMiddleware)

	// Advertisings
	sellerRouter.Get("/advertisings", (*Context).ViewListAdvertisings)
	sellerRouter.Post("/advertisings", (*Context).AddAdvertisingsPOST)

	// Deposit
	depositRouter := sellerRouter.Subrouter(Context{}, "/deposits")
	depositRouter.Get("/", (*Context).ViewShowDeposit)
	depositRouter.Get("/add", (*Context).ViewShowDepositAddGET)
	depositRouter.Post("/add", (*Context).ViewShowDepositAddPOST)
	depositRouter.Get("/:deposit_uuid/withdraw", (*Context).ViewWithdrawDepositGET)
	depositRouter.Post("/:deposit_uuid/withdraw", (*Context).ViewWithdrawDepositPOST)

	// Items CMS
	itemRouter := sellerRouter.Subrouter(Context{}, "/item/:item")
	itemRouter.Middleware((*Context).PrivateStoreItemMiddleware)
	itemRouter.Get("/edit", (*Context).EditItem)
	itemRouter.Post("/edit", (*Context).SaveItem)
	itemRouter.Post("/delete", (*Context).DeleteItem)

	// Package CMS
	packageRouter := itemRouter.Subrouter(Context{}, "/package/:package")
	packageRouter.Middleware((*Context).PrivateStoreItemPackageMiddleware)
	packageRouter.Get("/edit", (*Context).EditPackageStep1)
	packageRouter.Post("/edit", (*Context).SavePackage)
	packageRouter.Post("/duplicate", (*Context).DuplicatePackage)
	packageRouter.Post("/delete", (*Context).DeletePackage)

	// Transactions
	transactionRouter := loggedInRouter.Subrouter(Context{}, "/payments")
	transactionRouter.Get("/", (*Context).ListCurrentTransactionStatuses)

	singleTransactionRouter := transactionRouter.Subrouter(Context{}, "/:transaction")
	singleTransactionRouter.Middleware((*Context).TransactionMiddleware)
	singleTransactionRouter.Get("/", (*Context).ShowTransaction)
	singleTransactionRouter.Get("/image", (*Context).TransactionImage)
	singleTransactionRouter.Post("/", (*Context).ShowTransactionPOST)
	singleTransactionRouter.Post("/shipping", (*Context).SetTransactionShippingStatus)
	singleTransactionRouter.Post("/release", (*Context).ReleaseTransaction)
	singleTransactionRouter.Post("/cancel", (*Context).CancelTransaction)
	singleTransactionRouter.Post("/complete", (*Context).CompleteTransactionPOST)

	//Disputes
	disputeRouter := loggedInRouter.Subrouter(Context{}, "/dispute")
	disputeRouter.Get("/", (*Context).ViewDisputeList)
	disputeRouter.Post("/start/:transaction_uuid", (*Context).ViewDisputeStart)

	concreteDisputeRouter := disputeRouter.Subrouter(Context{}, "/:dispute_uuid")
	concreteDisputeRouter.Middleware((*Context).DisputeMiddleware)
	concreteDisputeRouter.Get("/", (*Context).ViewDispute)
	concreteDisputeRouter.Post("/status", (*Context).ViewDisputeSetStatus)
	concreteDisputeRouter.Post("/claim", (*Context).ViewDisputeClaimAdd)

	disputeClaimRouter := concreteDisputeRouter.Subrouter(Context{}, "/:dispute_claim_id")
	disputeClaimRouter.Middleware((*Context).DisputeClaimMiddleware)
	disputeClaimRouter.Get("/", (*Context).ViewDisputeClaimGET)
	disputeClaimRouter.Post("/", (*Context).ViewDisputeClaimPOST)

	disputeAdminROuter := disputeRouter.Subrouter(Context{}, "/admin")
	disputeAdminROuter.Middleware((*Context).AdminMiddleware)
	disputeAdminROuter.Get("/list", (*Context).AdminDisputeList)

	// Wallet
	walletRouter := loggedInRouter.Subrouter(Context{}, "/wallet")

	// Bitcoin Wallet
	bitcoinWalletRouter := walletRouter.Subrouter(Context{}, "/bitcoin")
	bitcoinWalletRouter.Middleware((*Context).BitcoinWalletMiddleware)
	bitcoinWalletRouter.Get("/receive", (*Context).BitcoinWalletRecieve)
	bitcoinWalletRouter.Get("/send", (*Context).BitcoinWalletSendStep1GET)
	bitcoinWalletRouter.Post("/send", (*Context).BitcoinWalletSendPOST)
	bitcoinWalletRouter.Get("/:address/image", (*Context).BitcoinWalletImage)
	bitcoinWalletRouter.Get("/actions", (*Context).BitcoinWalletActions)

	// Bitcoin Cash Wallet
	bitcoinCashWalletRouter := walletRouter.Subrouter(Context{}, "/bitcoin_cash")
	bitcoinCashWalletRouter.Middleware((*Context).BitcoinCashWalletMiddleware)
	bitcoinCashWalletRouter.Get("/receive", (*Context).BitcoinCashWalletRecieve)
	bitcoinCashWalletRouter.Get("/send", (*Context).BitcoinCashWalletSendStep1GET)
	bitcoinCashWalletRouter.Post("/send", (*Context).BitcoinCashWalletSendPOST)
	bitcoinCashWalletRouter.Post("/send_to_btc", (*Context).BitcoinCashWalletSendToBitcoinPOST)
	bitcoinCashWalletRouter.Get("/:address/image", (*Context).BitcoinCashWalletImage)
	bitcoinCashWalletRouter.Get("/actions", (*Context).BitcoinCashWalletActions)

	// Ethereum Wallet
	ethereumWalletRouter := walletRouter.Subrouter(Context{}, "/ethereum")
	ethereumWalletRouter.Middleware((*Context).EthereumWalletMiddleware)
	ethereumWalletRouter.Get("/receive", (*Context).EthereumWalletRecieve)
	ethereumWalletRouter.Get("/send", (*Context).EthereumWalletSendGET)
	ethereumWalletRouter.Post("/send", (*Context).EthereumWalletSendPOST)
	ethereumWalletRouter.Get("/:address/image", (*Context).EthereumWalletImage)
	ethereumWalletRouter.Get("/actions", (*Context).EthereumWalletActions)

	// Transactions Admin
	transactionAdminRouter := transactionRouter.Subrouter(Context{}, "/admin")
	transactionAdminRouter.Middleware((*Context).StaffMiddleware)
	transactionAdminRouter.Get("/list", (*Context).AdminListTransactions)
	transactionAdminRouter.Post("/:transaction/cancel", (*Context).AdminTransactionCancel)
	transactionAdminRouter.Post("/:transaction/fail", (*Context).AdminTransactionFail)
	transactionAdminRouter.Post("/:transaction/pending", (*Context).AdminTransactionMakePending)
	transactionAdminRouter.Post("/:transaction/complete", (*Context).AdminTransactionComplete)
	transactionAdminRouter.Post("/:transaction/release", (*Context).AdminTransactionRelease)
	transactionAdminRouter.Post("/:transaction/freeze", (*Context).AdminTransactionFreeze)
	transactionAdminRouter.Post("/:transaction/update", (*Context).AdminTransactionUpdateStatus)

	return router
}
