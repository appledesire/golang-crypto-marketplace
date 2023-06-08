package marketplace

import (
	"strings"
	"time"

	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) CurrencyMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {
	c.CurrencyRates = map[string]map[string]float64{}
	for _, fc := range FIAT_CURRENCIES {
		c.CurrencyRates[fc] = map[string]float64{}
		for _, cc := range CRYPTO_CURRENCIES {
			c.CurrencyRates[fc][cc] = GetCurrencyRate(cc, fc)
		}
	}
	next(w, r)
}

func (c *Context) LoggerMiddleware(rw web.ResponseWriter, req *web.Request, next web.NextMiddlewareFunc) {
	next(rw, req)
	startTime := time.Now()
	username := "anon"
	if c.ViewUser != nil {
		username = "@" + c.ViewUser.Username
	}

	if strings.Contains(req.URL.Path, "/user-avatar/") || strings.Contains(req.URL.Path, "/item-image/") {
		return
	}

	util.Log.Info(
		"user:'%s' method:'%s' url':%s' duration:'%d μs' status:'%d'\n",
		username,
		req.Method,
		req.URL.Path,
		time.Since(startTime).Nanoseconds()/1000,
		rw.StatusCode(),
	)
}
