package marketplace

import (
	"github.com/microcosm-cc/bluemonday"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/settings"
	"regexp"
)

/*
	Globals
*/

var (
	usernameRegexp     = regexp.MustCompile("^[a-z0-9_-]{3,16}$")
	bitmessageRegexp   = regexp.MustCompile("^BM-[1-9a-km-zA-HJ-NP-Z]{32,34}$")
	bitcoinRegexp      = regexp.MustCompile("^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$")
	ethereumRegexp     = regexp.MustCompile("^0x[a-fA-F0-9]{40}$")
	openBitcoinRegexp  = regexp.MustCompile("[13][a-km-zA-HJ-NP-Z1-9]{25,34}")
	openEthereumRegexp = regexp.MustCompile("0x[a-fA-F0-9]{40}")
	emailRegexp        = regexp.MustCompile("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$")

	userHtmlPolicy         = bluemonday.NewPolicy()
	htmlPolicy             = bluemonday.UGCPolicy()
	messageboardHtmlPolicy = bluemonday.NewPolicy()

	MARKETPLACE_SETTINGS = settings.GetSettings()
)

func init() {
	userHtmlPolicy.AllowElements("h1", "h2", "h3", "h4", "h5", "p", "strong", "i")
}
