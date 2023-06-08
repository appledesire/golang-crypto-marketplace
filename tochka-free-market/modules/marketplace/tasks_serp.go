package marketplace

import (
	"github.com/jasonlvhit/gocron"
)

func StartSERPCron() {
	gocron.Every(15).Minutes().Do(RefreshSerpItemsMaterializedView)
}
