package marketplace

import (
	"fmt"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
)

func EventStaffSupportTicketsResolutionStats(interval string, sItems []StaffSupportTicketsStatsItem) {
	var (
		text = fmt.Sprintf(`
Support Agent | Ticket Status | Number Of Tickets
--- | --- | ---
`)
	)
	for _, si := range sItems {
		text += fmt.Sprintf("%s | %s | %d\n", si.ResolverUsername, si.CurrentStatus, si.TicketCount)
	}

	hook := ""
	switch interval {
	case "1 day":
		hook = MARKETPLACE_SETTINGS.MattermostIncomingHookStatsDaily
	case "7 days":
		hook = MARKETPLACE_SETTINGS.MattermostIncomingHookStatsWeekly
	case "1 hour":
		hook = MARKETPLACE_SETTINGS.MattermostIncomingHookStatsHourly
	}

	apis.PostMattermostEvent(hook, text)
}

func EventUsersStats(interval string, newUsers, activeUsers int) {
	var (
		text = fmt.Sprintf(`
New Users | Active Users
--- | ---
%d | %d
`, newUsers, activeUsers)
	)

	hook := ""
	switch interval {
	case "1 day":
		hook = MARKETPLACE_SETTINGS.MattermostIncomingHookStatsDaily
	case "7 days":
		hook = MARKETPLACE_SETTINGS.MattermostIncomingHookStatsWeekly
	case "1 hour":
		hook = MARKETPLACE_SETTINGS.MattermostIncomingHookStatsHourly
	}

	apis.PostMattermostEvent(hook, text)
}

func EventTransactionsStats(
	interval string,
	numberOfNewTransactions,
	numberOfCompletedTransactions,
	numberOfReleasedTransactions,
	numberOfFailedTransactions,
	numberOfCancelledTransactions,
	numberOfFrozenTransactions int,
) {
	var (
		text = fmt.Sprintf(`
New | Completed | Released | Failed | Cancelled | Frozen
--- | --- | --- | --- | --- | --- 
%d | %d | %d | %d | %d | %d
`,
			numberOfNewTransactions,
			numberOfCompletedTransactions,
			numberOfReleasedTransactions,
			numberOfFailedTransactions,
			numberOfCancelledTransactions,
			numberOfFrozenTransactions,
		)
	)

	hook := ""
	switch interval {
	case "1 day":
		hook = MARKETPLACE_SETTINGS.MattermostIncomingHookStatsDaily
	case "7 days":
		hook = MARKETPLACE_SETTINGS.MattermostIncomingHookStatsWeekly
	case "1 hour":
		hook = MARKETPLACE_SETTINGS.MattermostIncomingHookStatsHourly
	}

	apis.PostMattermostEvent(hook, text)
}
