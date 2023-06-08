package marketplace

import (
	"fmt"
	"time"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

/*
	Models
*/

type MessageboardThread struct {
	Uuid                  string
	LastMessageUsername   string
	MessageboardSectionId int
	NumberOfMessages      int
	Pages                 []int
	SenderIsAdmin         bool
	SenderIsStaff         bool

	SenderUsername string
	Title          string

	CreatedAt   time.Time
	LastUpdated time.Time
	LastRead    time.Time
}

type ViewMessageboardThread struct {
	*MessageboardThread
	IsRead           bool
	CreatedAtStr     string
	LastUpdatedAtStr string
}

func (mt MessageboardThread) ViewMessageboardThread(lang string) ViewMessageboardThread {
	vmbt := ViewMessageboardThread{
		MessageboardThread: &mt,
		CreatedAtStr:       util.HumanizeTime(mt.CreatedAt, lang),
		LastUpdatedAtStr:   util.HumanizeTime(mt.LastUpdated, lang),
	}
	return vmbt
}

type MessageboardThreads []MessageboardThread

func (msbts MessageboardThreads) ViewMessageboardThreads(lang string) []ViewMessageboardThread {
	var vmsbts []ViewMessageboardThread
	for _, msbt := range msbts {
		vmsbt := msbt.ViewMessageboardThread(lang)
		vmsbts = append(vmsbts, vmsbt)
	}

	return vmsbts
}

func FindMessageboardThreads(sectionId int) []MessageboardThread {
	threads := []MessageboardThread{}

	database.
		Table("v_messageboard_threads").
		Where("messageboard_section_id=?", sectionId).
		Find(&threads)

	return threads
}

func FindMessageboardThreadsForUserUuid(sectionId, page, pageSize int, userUuid string) []MessageboardThread {
	threads := []MessageboardThread{}

	database.
		Table("v_messageboard_threads").
		Select("v_messageboard_threads.*, thread_perusal_statuses.last_read_date as last_read").
		Joins(fmt.Sprintf(`
			LEFT OUTER JOIN thread_perusal_statuses 
			ON v_messageboard_threads.uuid=thread_perusal_statuses.thread_uuid AND thread_perusal_statuses.user_uuid = '%s'
		`, userUuid)).
		Where("messageboard_section_id=?", sectionId).
		Offset(page * pageSize).
		Limit(pageSize).
		Find(&threads)

	return threads
}

func CountMessageboardThreads(sectionId int) int {
	count := 0

	query := database.
		Table("v_messageboard_threads").
		Where("messageboard_section_id=?", sectionId)
	query.Count(&count)

	return count
}

func FindNewMessageboardThreads(limit int) MessageboardThreads {
	threads := MessageboardThreads{}

	database.
		Table("v_messageboard_threads").
		Order("created_at DESC").
		Limit(limit).
		Find(&threads)

	return threads
}

/*
	Messageboard Stats
*/

type MessageboardStats struct {
	NumberOfMessages int
	NumberOfThreads  int
}

func GetMessageboardSummaryStats() MessageboardStats {
	var (
		query = "select count(*) as number_of_threads, sum(number_of_messages) as number_of_messages from v_messageboard_threads"
		count = MessageboardStats{}
	)
	database.Raw(query).Scan(&count)
	return count
}

func GetMessageboardDailyStats() MessageboardStats {
	var (
		query = `select 
		(select count(*)  from v_messageboard_threads where created_at >= now() - interval '1 day') as number_of_threads,
		(select count(*) from messages where deleted_at IS null and type='messageboard' and created_at_timestamp >= now() - interval '1 day') as number_of_messages
	`
		count = MessageboardStats{}
	)
	database.Raw(query).Scan(&count)
	return count
}

/*
	Cache
*/

func CacheCountMessageboardThreads(sectionId int) int {
	key := fmt.Sprintf("count-messageboard-threads-%d", sectionId)
	cCount, _ := cache15m.Get(key)
	if cCount == nil {
		vs := CountMessageboardThreads(sectionId)
		cache15m.Set(key, vs)

		return vs
	}
	return cCount.(int)
}

func CacheGetMessageboardSummaryStats() MessageboardStats {
	key := "messageboard-summary-stats"
	cStats, _ := cache1m.Get(key)
	if cStats == nil {
		vs := GetMessageboardSummaryStats()
		cache1m.Set(key, vs)

		return vs
	}
	return cStats.(MessageboardStats)
}

func CacheGetMessageboardDailyStats() MessageboardStats {
	key := "messageboard-daily-stats"
	cStats, _ := cache15m.Get(key)
	if cStats == nil {
		vs := GetMessageboardDailyStats()
		cache15m.Set(key, vs)

		return vs
	}
	return cStats.(MessageboardStats)
}

func CacheFindNewMessageboardThreadsTop5() MessageboardThreads {
	key := "messageboard-new-threads-top-5"
	cThreads, _ := cache15m.Get(key)
	if cThreads == nil {
		vs := FindNewMessageboardThreads(5)
		cache15m.Set(key, vs)

		return vs
	}
	return cThreads.(MessageboardThreads)
}

/*
	Database Views
*/

func setupMessageboardThreadsViews() {
	database.Exec("DROP VIEW IF EXISTS v_messageboard_threads CASCADE;")
	database.Exec(`
		CREATE VIEW v_messageboard_threads AS (
			SELECT 
				v_threads.uuid,
				v_threads.title,
				v_threads.created_at_timestamp as created_at,
				v_threads.last_updated as last_updated,
				v_threads.number_of_messages,
				v_threads.messageboard_section_id,
				u1.username as sender_username,
				u2.username as last_message_username,
				u1.is_admin as sender_is_admin,
				u1.is_staff as sender_is_staff			
			FROM v_threads
			JOIN users u1 on u1.uuid=sender_user_uuid
			JOIN messages m on m.uuid=last_message_uuid
			JOIN users u2 on u2.uuid=m.sender_user_uuid
			WHERE v_threads.type='messageboard'
			ORDER BY 
				u1.is_admin DESC, 
				u1.is_staff DESC,
				last_updated DESC
	);`)
}
