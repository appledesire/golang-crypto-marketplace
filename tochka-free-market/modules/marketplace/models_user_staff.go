package marketplace

import (
	"fmt"
)

/*
	Models
*/

type StaffStats struct {
	NumberOfResolvedTickets  int
	NumberOfResolvedDisputes int
	NumberOfApprovedItems    int
	NumberOfApprovedVendors  int
}

/*
	Cache
*/

func CacheGetStaffStats(userUuid string) StaffStats {

	queryStats := func() StaffStats {
		return StaffStats{
			NumberOfResolvedDisputes: CountNumberOfDisputesResolved(userUuid),
			NumberOfResolvedTickets:  CountNumberOfTicketsResolved(userUuid),
			NumberOfApprovedItems:    CountNumberOfApprovedItems(userUuid),
			NumberOfApprovedVendors:  CountNumberOfApprovedVendors(userUuid),
		}
	}

	key := fmt.Sprintf("staff-stats-%s", userUuid)
	cStats, _ := cache15m.Get(key)
	if cStats == nil {
		stats := queryStats()
		cache15m.Set(key, stats)
		return stats
	}

	return cStats.(StaffStats)
}
