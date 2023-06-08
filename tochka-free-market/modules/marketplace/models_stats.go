package marketplace

import (
	"fmt"
	"time"
)

type StatsItem struct {
	Date                           time.Time
	DateStr                        string
	Year                           int
	WeekNumber                     int
	NumberOfUsers                  int
	NumberOfUsersDelta             int
	NumberOfVendors                int
	NumberOfVendorsDelta           int
	NumberOfItems                  int
	NumberOfItemsDelta             int
	NumberOfSupportMessages        int
	NumberOfSupportMessagesDelta   int
	NumberOfDisputes               int
	NumberOfDisputesDelta          int
	NumberOfBTCTransactionsCreated int
	NumberOfETHTransactionsCreated int
	NumberOfBCHTransactionsCreated int
	BTCTradeAmount                 float64
	ETHTradeAmount                 float64
	BCHTradeAmount                 float64
}

type CountStatsItem struct {
	Count int
}

func GetMarketplaceStats(dt time.Time) []StatsItem {
	database.Exec("REFRESH MATERIALIZED VIEW vm_current_bitcoin_transaction_statuses")
	database.Exec("REFRESH MATERIALIZED VIEW vm_current_bitcoin_cash_transaction_statuses")
	database.Exec("REFRESH MATERIALIZED VIEW vm_current_ethereum_transaction_statuses")

	d, _ := time.ParseDuration("168h")

	btcTable := "vm_current_bitcoin_transaction_statuses"
	ethTable := "vm_current_ethereum_transaction_statuses"
	bchTable := "vm_current_bitcoin_cash_transaction_statuses"

	statsItems := []StatsItem{}
	for {
		if dt.After(time.Now()) {
			break
		}
		year, week := dt.ISOWeek()
		from := dt
		to := dt.Add(d)
		statItem := StatsItem{
			NumberOfUsers:                  CountUsers(&to),
			NumberOfVendors:                CountVendors(&to),
			NumberOfBTCTransactionsCreated: CountTransactionsInitiatedInPeriod(btcTable, from, to),
			BTCTradeAmount:                 SumAmountTransactionsInitiatedInPeriod(btcTable, from, to),
			NumberOfETHTransactionsCreated: CountTransactionsInitiatedInPeriod(ethTable, from, to),
			ETHTradeAmount:                 SumAmountTransactionsInitiatedInPeriod(ethTable, from, to),
			NumberOfBCHTransactionsCreated: CountTransactionsInitiatedInPeriod(bchTable, from, to),
			BCHTradeAmount:                 SumAmountTransactionsInitiatedInPeriod(bchTable, from, to),
			Date:                           from,
			Year:                           year,
			WeekNumber:                     week,
			DateStr:                        dt.Format("2006-01-02"),
		}
		statsItems = append(statsItems, statItem)
		dt = dt.Add(d)
	}
	return statsItems
}

func CountTransactionsInitiatedInPeriod(table string, from, to time.Time) int {
	var count int

	database.
		Table(table).
		Where("amount > 0").
		Where("current_status <> ? AND current_status <> ? AND current_status <> ?", "FAILED", "PENDING", "CANCELLED").
		Where("created_at >= ? and created_at < ?", from, to).
		Count(&count)

	return count
}

func CountTransactionsLastUpdatedWithStatusInPeriod(table string, from, to time.Time, status string) int {
	var count int

	database.
		Table(table).
		Where("amount > 0").
		Where("current_status = ?", status).
		Where("updated_at >= ? and updated_at < ?", from, to).
		Count(&count)

	return count
}

func SumAmountTransactionsInitiatedInPeriod(table string, from, to time.Time) float64 {

	var sum struct{ Sum float64 }

	database.
		Table(table).
		Select("COALESCE(SUM(amount), 0) as sum").
		Where("amount > 0").
		Where("current_status <> ? AND current_status <> ? AND current_status <> ?", "FAILED", "PENDING", "CANCELLED").
		Where("created_at >= ? and created_at < ?", from, to).
		Scan(&sum)

	return sum.Sum
}

type StaffSupportTicketsStatsItem struct {
	ResolverUsername string
	CurrentStatus    string
	TicketCount      int
}

func StaffSupportTicketsResolutionStats(from string) ([]StaffSupportTicketsStatsItem, error) {
	var (
		query = fmt.Sprintf(`
select 
	u.username as resolver_username,
	current_status,
	count(*) as ticket_count
from 
	v_current_support_ticket_statuses ts 
join 
	users u on ts.resolver_user_uuid=u.uuid
where 
	u.is_staff=true AND ts.updated_at BETWEEN '%s' AND now() 
group by 
	u.username, current_status;
`, from)
		results = []StaffSupportTicketsStatsItem{}
		err     = database.Raw(query).Find(&results).Error
	)
	return results, err
}

func StaffSupportDisputesResolutionStats(from string) ([]StaffSupportTicketsStatsItem, error) {
	var (
		query = fmt.Sprintf(`
select 
	u.username as resolver_username,
	count(*) as ticket_count
from 
	disputes ds 
join 
	users u on ds.resolver_user_uuid=u.uuid
where 
	u.is_staff=true AND ds.updated_at BETWEEN '%s' AND now() 
group by 
	u.username;
`, from)
		results = []StaffSupportTicketsStatsItem{}
		err     = database.Raw(query).Find(&results).Error
	)
	return results, err
}

func StaffItemApprovalStats(from string) ([]StaffSupportTicketsStatsItem, error) {
	var (
		query = fmt.Sprintf(`
select 
	u.username as resolver_username,
	count(*) as ticket_count
from 
	items ds 
join 
	users u on ds.reviewed_by_user_uuid=u.uuid
where 
	u.is_staff=true AND ds.reviewed_at BETWEEN '%s' AND now() 
group by 
	u.username;
`, from)
		results = []StaffSupportTicketsStatsItem{}
		err     = database.Raw(query).Find(&results).Error
	)
	return results, err
}

func NumberOfNewUsersStats(interval string) int {
	var (
		query = fmt.Sprintf(`
select
	count(*) as count 
from
	users 
where 
	registration_date between now() - interval '%s' and now();
`, interval)
		count = CountStatsItem{}
	)

	database.Raw(query).Scan(&count)
	return count.Count
}

func NumberOfActiveUsersStats(interval string) int {
	var (
		query = fmt.Sprintf(`
select
	count(*) as count 
from
	users 
where 
	last_login_date between now() - interval '%s' and now();
`, interval)
		count = CountStatsItem{}
	)

	database.Raw(query).Scan(&count)
	return count.Count
}

func NumberOfNewTransactionsStats(interval string) int {
	var (
		query = fmt.Sprintf(`
select 
	count(*) as count
from 
	v_transaction_statuses where min_timestamp BETWEEN now() - interval '%s' and now()
`, interval)
		count = CountStatsItem{}
	)

	database.Raw(query).Scan(&count)
	return count.Count
}

func NumberOfCompletedTransactionsStats(interval string) int {
	var (
		query = fmt.Sprintf(`
select 
	count(*) as count
from 
	v_transaction_statuses where min_timestamp BETWEEN now() - interval '%s' and now()  AND max_status = 'COMPLETED'
`, interval)
		count = CountStatsItem{}
	)

	database.Raw(query).Scan(&count)
	return count.Count
}

func NumberOfReleasedTransactionsStats(interval string) int {
	var (
		query = fmt.Sprintf(`
select 
	count(*) as count
from 
	v_transaction_statuses where min_timestamp BETWEEN now() - interval '%s' and now()  AND max_status = 'RELEASED'
`, interval)
		count = CountStatsItem{}
	)

	database.Raw(query).Scan(&count)
	return count.Count
}

func NumberOfFailedTransactionsStats(interval string) int {
	var (
		query = fmt.Sprintf(`
select 
	count(*) as count
from 
	v_transaction_statuses where min_timestamp BETWEEN now() - interval '%s' and now()  AND max_status = 'FAILED'
`, interval)
		count = CountStatsItem{}
	)

	database.Raw(query).Scan(&count)
	return count.Count
}

func NumberOfCancelledTransactionsStats(interval string) int {
	var (
		query = fmt.Sprintf(`
select 
	count(*) as count
from 
	v_transaction_statuses where min_timestamp BETWEEN now() - interval '%s' and now()  AND max_status = 'CANCELLED'
`, interval)
		count = CountStatsItem{}
	)

	database.Raw(query).Scan(&count)
	return count.Count
}

func NumberOfFrozenTransactionsStats(interval string) int {
	var (
		query = fmt.Sprintf(`
select 
	count(*) as count
from 
	v_transaction_statuses where min_timestamp BETWEEN now() - interval '%s' and now()  AND max_status = 'FROZEN'
`, interval)
		count = CountStatsItem{}
	)

	database.Raw(query).Scan(&count)
	return count.Count
}

/*
	Cache
*/

func CacheGetMarketplaceStats(dt time.Time) []StatsItem {
	key := "stats-" + dt.String()
	cStats, _ := cache15m.Get(key)
	if cStats == nil {
		stats := GetMarketplaceStats(dt)
		cache15m.Set(key, stats)
		return stats
	}
	return cStats.([]StatsItem)
}

/*
	Staff Stats
*/

func CountNumberOfTicketsResolved(userUuid string) int {
	var (
		count = CountStatsItem{}
		query = `select count(*) as count from v_current_support_ticket_statuses ts where ts.resolver_user_uuid = ?`
	)
	database.Raw(query, userUuid).Scan(&count)
	return count.Count
}

func CountNumberOfDisputesResolved(userUuid string) int {
	var (
		count = CountStatsItem{}
		query = `select count(*) as count from disputes ds where ds.resolver_user_uuid = ?`
	)
	database.Raw(query, userUuid).Scan(&count)
	return count.Count
}

func CountNumberOfApprovedItems(userUuid string) int {
	var (
		count = CountStatsItem{}
		query = `select count(*) as count from items where items.reviewed_by_user_uuid = ?`
	)
	database.Raw(query, userUuid).Scan(&count)
	return count.Count
}

func CountNumberOfApprovedVendors(userUuid string) int {
	var (
		count = CountStatsItem{}
		query = `select count(*) as count from users us where us.trustee_uuid = ?`
	)
	database.Raw(query, userUuid).Scan(&count)
	return count.Count
}

/*
	Transactions
*/

func CountNumberOfReleasedTransactionsForStore(userUuid string) int {
	var (
		btcQuery = `select tx_number as count from v_store_bitcoin_tx_stats      where store_uuid=?`
		bchQuery = `select tx_number as count from v_store_bitcoin_cash_tx_stats where store_uuid=?`
		ethQuery = `select tx_number as count from v_store_ethereum_tx_stats     where store_uuid=?`
	)

	countTx := func(query string) int {
		var (
			count = CountStatsItem{}
		)
		database.Raw(query, userUuid).Scan(&count)
		return count.Count
	}

	count := countTx(btcQuery) + countTx(bchQuery) + countTx(ethQuery)
	return count
}
