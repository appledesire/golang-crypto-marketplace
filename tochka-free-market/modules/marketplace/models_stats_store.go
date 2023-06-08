package marketplace

import (
	"fmt"
)

/*
	Models
*/

type StoreStats struct {
	NumberOfActiveWarnings       int
	NumberOfDisputes             int
	NumberOfExpiredWarnings      int
	NumberOfGreenWarnings        int
	NumberOfItems                int
	NumberOfLostDisputes         int
	NumberOfNegativeReviews      int
	NumberOfNeutralReviews       int
	NumberOfPositiveReviews      int
	NumberOfRedWarnings          int
	NumberOfReleasedTransactions int
	NumberOfReviews              int
	NumberOfSales                int
	NumberOfWonDisputes          int
	NumberOfYellowWarnings       int
	SalesVolume                  float64
}

/*
	Cache
*/

func InvalidateStoreCache(storeUuid string) {
	key := fmt.Sprintf("store-stats-%s", storeUuid)
	cache15m.Remove(key)
}

func CacheGetStoreStats(storeUuid string) StoreStats {

	queryStats := func() StoreStats {
		return StoreStats{
			NumberOfActiveWarnings:       CountActiveWarningsForStore(storeUuid),
			NumberOfDisputes:             CountDisputesForStoreUuid(storeUuid, ""),
			NumberOfExpiredWarnings:      CountExpiredWarningsForStore(storeUuid),
			NumberOfGreenWarnings:        CountGreenWarningsForStore(storeUuid, false),
			NumberOfLostDisputes:         CountDisputesForStoreUuid(storeUuid, "RESOLVED TO BUYER"),
			NumberOfNegativeReviews:      CountNegativeRatingReviewsForStore(storeUuid),
			NumberOfNeutralReviews:       CountNeutralRatingReviewsForStore(storeUuid),
			NumberOfPositiveReviews:      CountPositiveRatingReviewsForStore(storeUuid),
			NumberOfRedWarnings:          CountRedWarningsForStore(storeUuid, false),
			NumberOfReleasedTransactions: CountNumberOfReleasedTransactionsForStore(storeUuid),
			NumberOfReviews:              CountRatingReviewsForStore(storeUuid),
			NumberOfWonDisputes:          CountDisputesForStoreUuid(storeUuid, "RESOLVED TO VENDOR"),
			NumberOfYellowWarnings:       CountYellowWarningsForStore(storeUuid, false),
		}
	}

	key := fmt.Sprintf("store-stats-%s", storeUuid)
	cStats, _ := cache1h.Get(key)
	if cStats == nil {
		stats := queryStats()
		cache1h.Set(key, stats)
		return stats
	}

	return cStats.(StoreStats)
}
