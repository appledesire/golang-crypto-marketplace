package marketplace

import (
	"fmt"
	"strings"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
)

func EventNewWarning(warning StoreWarning) {
	var (
		marketUrl = MARKETPLACE_SETTINGS.SiteURL
		text      = fmt.Sprintf("[@%s](%s/user/%s) has reported [@%s](%s/user/%s) for:\n> %s",
			warning.Reporter.Username, marketUrl, warning.Reporter.Username,
			warning.Store.Storename, marketUrl, warning.Store.Storename,
			strings.Replace(warning.Text, "\n", "\n > ", -1),
		)
	)
	go apis.PostMattermostEvent(MARKETPLACE_SETTINGS.MattermostIncomingHookWarnings, text)
}

func EventWarningStatsUpdate(warning StoreWarning, staff User) {
	var (
		marketUrl = MARKETPLACE_SETTINGS.SiteURL
		text      = fmt.Sprintf("[@%s](%s/user/%s) has updated warning for [@%s](%s/user/%s) with severety **%s**",
			staff.Username, marketUrl, staff.Username,
			warning.Store.Storename, marketUrl, warning.Store.Storename,
			warning.Severety,
		)
	)
	go apis.PostMattermostEvent(MARKETPLACE_SETTINGS.MattermostIncomingHookWarnings, text)
}
