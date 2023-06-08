package marketplace

import (
	"github.com/jasonlvhit/gocron"
)

func StartCurrencyCron() {
	UpdateCurrencyRates()
	gocron.Every(1).Minute().Do(UpdateCurrencyRates)
}
