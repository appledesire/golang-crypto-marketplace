package marketplace

import (
	"time"

	"github.com/bluele/gcache"
)

var (
	d1m, _  = time.ParseDuration("1m")
	d15m, _ = time.ParseDuration("15m")
	d1h, _  = time.ParseDuration("1h")

	cache15m = gcache.New(10240).LRU().Expiration(d15m).Build()
	cache1m  = gcache.New(10240).LRU().Expiration(d1m).Build()
	cache1h  = gcache.New(10240).LRU().Expiration(d1h).Build()
)
