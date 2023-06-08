package marketplace

import (
	"math/rand"
	"time"

	"github.com/alexedwards/scs"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/settings"
)

var (
	appSettings  = settings.GetSettings()
	sessionStore *scs.Manager
	rs           = rand.New(rand.NewSource(time.Now().UnixNano()))
)

func init() {

	if !appSettings.Debug {
		sessionStore = scs.NewCookieManager(MARKETPLACE_SETTINGS.CookieEncryptionSalt)
	} else {
		sessionStore = scs.NewCookieManager("debug")
	}

	sessionStore.Persist(true)
	sessionStore.Lifetime(48 * time.Hour)
}
