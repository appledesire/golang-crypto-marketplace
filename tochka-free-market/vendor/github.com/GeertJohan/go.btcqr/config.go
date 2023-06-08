package btcqr

import (
	"log"
)

// Config allows the user of this package
type Config struct {
	// Scheme is the scheme name/urn used in the URI.
	// When empty, "bitcoin" will be used.
	Scheme string

	// Level denotes a QR error correction level.
	// For more information see the Level type and constants.
	Level Level

	// Debug logger
	Logger *log.Logger
}

// DefaultConfig contains the default config values used by the package-level functions.
// You can override these values, or create a custom *Config (safer).
var DefaultConfig = &Config{
	Scheme: "bitcoin",
	Level:  M,
}

func (c *Config) scheme() string {
	if len(c.Scheme) == 0 {
		return "bitcoin"
	}
	return c.Scheme
}
