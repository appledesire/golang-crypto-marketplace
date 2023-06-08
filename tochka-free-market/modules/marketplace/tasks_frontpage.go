package marketplace

import (
	"github.com/jasonlvhit/gocron"
)

func StartFrontPageCron() {
	gocron.Every(15).Minutes().Do(RefreshFrontPageItemsMaterializedViews)
}

