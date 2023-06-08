package marketplace

import (
	"github.com/jasonlvhit/gocron"
)

func CronStaffSupportTicketStats(interval string) {
	sItems, err := StaffSupportTicketsResolutionStats(interval)
	if err != nil {
		return
	}
	EventStaffSupportTicketsResolutionStats(interval, sItems)
}

func CronUsersStats(interval string) {
	var (
		numberOfNewUsers    = NumberOfNewUsersStats(interval)
		numberOfActiveUsers = NumberOfActiveUsersStats(interval)
	)
	EventUsersStats(interval, numberOfNewUsers, numberOfActiveUsers)
}

func CronTransactionsStats(interval string) {
	var (
		numberOfNewTransactions       = NumberOfNewTransactionsStats(interval)
		numberOfCompletedTransactions = NumberOfCompletedTransactionsStats(interval)
		numberOfReleasedTransactions  = NumberOfReleasedTransactionsStats(interval)
		numberOfFailedTransactions    = NumberOfFailedTransactionsStats(interval)
		numberOfCancelledTransactions = NumberOfCancelledTransactionsStats(interval)
		numberOfFrozenTransactions    = NumberOfFrozenTransactionsStats(interval)
	)
	EventTransactionsStats(
		interval,
		numberOfNewTransactions,
		numberOfCompletedTransactions,
		numberOfReleasedTransactions,
		numberOfFailedTransactions,
		numberOfCancelledTransactions,
		numberOfFrozenTransactions,
	)
}

func StartStatsCron() {
	gocron.Every(1).Day().At("00:00").Do(CronStaffSupportTicketStats, "1 day")
	gocron.Every(1).Day().At("00:00").Do(CronTransactionsStats, "1 day")
	gocron.Every(1).Day().At("00:00").Do(CronUsersStats, "1 day")

	gocron.Every(1).Monday().At("00:00").Do(CronStaffSupportTicketStats, "7 days")
	gocron.Every(1).Monday().At("00:00").Do(CronTransactionsStats, "7 days")
	gocron.Every(1).Monday().At("00:00").Do(CronUsersStats, "7 days")
}
