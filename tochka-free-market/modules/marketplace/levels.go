package marketplace

import (
	"time"
)

func CalculateStaffLevel(stats StaffStats) int {
	return stats.NumberOfResolvedDisputes/10 + stats.NumberOfResolvedTickets/10 + stats.NumberOfApprovedItems/50 + stats.NumberOfApprovedVendors/50
}

func CalculateStoreLevel(stats StoreStats, registrationDate time.Time) int {
	multiplier := int(time.Now().Sub(registrationDate).Hours()/24/30/6+1) * 2
	return (stats.NumberOfReleasedTransactions/10)*multiplier + 1
}
