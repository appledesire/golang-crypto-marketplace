package marketplace

import (
	"errors"
	"sort"
	"time"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

type SupportTicket struct {
	Uuid        string `json:"uuid" gorm:"primary_key"`
	Title       string `json:"title"`
	Description string `json:"description" sql:"size:4096"`
	Priority    int    `json:"priority" gorm:"index"`
	Category    string `json:"category"  gorm:"index"`

	ThreadUuid string `json:"thread_uuid" gorm:"index"`
	UserUuid   string `json:"user_uuid" gorm:"index"`

	CreatedAt time.Time  `json:"created_at" gorm:"index"`
	UpdatedAt *time.Time `json:"updated_at" gorm:"index"`
	DeletedAt *time.Time `json:"deleted_at" gorm:"index"`

	User                  User                  `json:"-"`
	SupportTicketStatuses []SupportTicketStatus `json:"-"`
}

type SupportTickets []SupportTicket

// new -> open -> close
type SupportTicketStatus struct {
	Uuid   string `json:"uuid" gorm:"primary_key"`
	Status string `json:"status" gorm:"index"`

	UserUuid          string `json:"user_uuid" gorm:"index"`
	SupportTicketUuid string `json:"support_ticket_uuid" gorm:"index"`

	CreatedAt time.Time  `json:"created_at" gorm:"index"`
	UpdatedAt *time.Time `json:"updated_at" gorm:"index"`
	DeletedAt *time.Time `json:"deleted_at" gorm:"index"`

	SupportTicket SupportTicket `json:"-"`
	User          User          `json:"-"`
}

/*
	Database Methods
*/

func (st SupportTicket) Save() error {
	if existing, _ := FindSupportTicketByUuid(st.Uuid); existing == nil {
		return database.Create(&st).Error
	}
	return database.Save(&st).Error
}

func (sts SupportTicketStatus) Save() error {
	if existing, _ := FindSupportTicketStatusByUuid(sts.Uuid); existing == nil {
		return database.Create(&sts).Error
	}
	return database.Save(&sts).Error
}

/*
	Factory Methods
*/

func CreateSupportTicket(
	user User,
	title string,
	description string,
	priority int,
	category string,
) (*SupportTicket, error) {

	thread, err := CreateThread("support-ticket", "", title, description, &user, nil, true)
	if err != nil {
		return nil, err
	}

	supportTicket := &SupportTicket{
		Uuid:        util.GenerateUuid(),
		Title:       title,
		CreatedAt:   time.Now(),
		Description: description,
		UserUuid:    user.Uuid,
		Priority:    priority,
		Category:    category,
		ThreadUuid:  thread.Uuid,
	}

	err = supportTicket.Save()
	if err != nil {
		return nil, err
	}

	return supportTicket, supportTicket.SetStatus(user.Uuid, "NEW")
}

/*
	Database Queries
*/

func FindSupportTicketByUuid(uuid string) (*SupportTicket, error) {
	var (
		st SupportTicket
	)

	err := database.
		Where(&SupportTicket{Uuid: uuid}).
		Preload("SupportTicketStatuses").
		Preload("SupportTicketStatuses.User").
		Find(&st).Error
	if err != nil {
		return nil, err
	}

	st.SupportTicketStatuses = sortStatuses(st.SupportTicketStatuses)

	return &st, err
}

func FindSupportTicketsForUser(user User) (SupportTickets, error) {
	var (
		st SupportTickets
	)
	err := database.
		Table("v_current_support_ticket_statuses").
		Where("user_uuid=?", user.Uuid).
		Preload("SupportTicketStatuses").
		Preload("SupportTicketStatuses.User").
		Preload("User").
		Find(&st).Error
	if err != nil {
		return nil, err
	}

	return st, err
}

func CountSupportTicketsForUser(user User) int {
	count := 0
	database.
		Table("v_current_support_ticket_statuses").
		Where("user_uuid=?", user.Uuid).
		Count(&count)
	return count
}

func sortStatuses(statuses []SupportTicketStatus) []SupportTicketStatus {
	sortFunc := func(i, j int) bool {
		return statuses[i].CreatedAt.Before(statuses[j].CreatedAt)
	}
	sort.Slice(statuses, sortFunc)
	return statuses
}

func CountSupportTicketsByStatus(status string) int {
	var (
		count int
	)

	query := database.Table("v_current_support_ticket_statuses")

	switch status {
	case "", "all":
		query = query
	case "new-open":
		query = query.Where("current_status IN (?)", []string{"NEW", "OPENED"})
	default:
		query = query.Where("current_status = ?", status)
	}

	query.Count(&count)

	return count
}

func FindSupportTicketsByStatus(status string, pageNumber, pageSize int) (SupportTickets, error) {
	var (
		st SupportTickets
	)

	query := database.Table("v_current_support_ticket_statuses")

	switch status {
	case "", "all":
		query = query
	case "new-open":
		query = query.Where("current_status IN (?)", []string{"NEW", "OPENED"})
	default:
		query = query.Where("current_status = ?", status)
	}

	err := query.
		Offset(pageNumber * pageSize).
		Limit(pageSize).
		Preload("SupportTicketStatuses").
		Preload("SupportTicketStatuses.User").
		Preload("User").
		Find(&st).
		Error

	if err != nil {
		return nil, err
	}

	for i := range st {
		st[i].SupportTicketStatuses = sortStatuses(st[i].SupportTicketStatuses)
	}

	return st, err
}

func FindAllSupportTickets() (SupportTickets, error) {
	var (
		st SupportTickets
	)

	err := database.
		Preload("SupportTicketStatuses").
		Preload("SupportTicketStatuses.User").
		Preload("User").
		Find(&st).
		Error
	if err != nil {
		return nil, err
	}

	for i := range st {
		st[i].SupportTicketStatuses = sortStatuses(st[i].SupportTicketStatuses)
	}

	return st, err
}

func FindSupportTicketStatusByUuid(uuid string) (*SupportTicketStatus, error) {
	var (
		sts SupportTicketStatus
	)

	err := database.
		Where(&SupportTicketStatus{Uuid: uuid}).
		Preload("User").
		Preload("SupportTicket").
		First(&sts).Error

	if err != nil {
		return nil, err
	}

	// st.SupportTicketStatuses = sortStatuses(st.SupportTicketStatuses)

	return &sts, err
}

/*
	Model Methods
*/

func (st *SupportTicket) SetStatus(userUuid string, status string) error {
	sts := SupportTicketStatus{
		Uuid:              util.GenerateUuid(),
		CreatedAt:         time.Now(),
		UserUuid:          userUuid,
		SupportTicketUuid: st.Uuid,
		Status:            status,
	}

	if err := sts.Save(); err != nil {
		return err
	}

	st.SupportTicketStatuses = append(st.SupportTicketStatuses, sts)
	return nil
}

func (st *SupportTicket) SetPriority(priority int) error {
	st.Priority = priority
	return st.Save()
}

func (st SupportTicket) Thread() (*Thread, error) {
	return FindThreadByUuid(st.ThreadUuid)
}

func (st SupportTicket) CurrentStatus() (*SupportTicketStatus, error) {
	if len(st.SupportTicketStatuses) == 0 {
		return nil, errors.New("Status array is empty")
	}
	return &st.SupportTicketStatuses[len(st.SupportTicketStatuses)-1], nil
}

func (st SupportTicket) AddMessage(message string, user User) (*Message, error) {
	thread, err := st.Thread()
	if err != nil {
		return nil, err
	}

	return CreateMessage(message, *thread, user)
}

/*
	View Models
*/

type ViewSupportTicket struct {
	*SupportTicket
	ViewUser      ViewUser
	CurrentStatus string
	CreatedAtStr  string
	UpdatedAtStr  string
}

func (st SupportTicket) ViewSupportTicket(lang string) ViewSupportTicket {
	cs, err := st.CurrentStatus()
	if err != nil {
		return ViewSupportTicket{}
	}
	return ViewSupportTicket{
		SupportTicket: &st,
		ViewUser:      st.User.ViewUser(lang),
		CurrentStatus: cs.Status,
		CreatedAtStr:  util.HumanizeTime(st.CreatedAt, lang),
		UpdatedAtStr:  util.HumanizeTime(cs.CreatedAt, lang),
	}
}

func (st SupportTickets) ViewSupportTickets(lang string) []ViewSupportTicket {
	tickets := []ViewSupportTicket{}
	for _, st := range st {
		tickets = append(tickets, st.ViewSupportTicket(lang))
	}
	return tickets
}

/*
	Database Views
*/

func setupSupportTicketViews() {
	database.Exec("DROP VIEW IF EXISTS v_current_support_ticket_statuses CASCADE;")
	database.Exec(`
		CREATE VIEW v_current_support_ticket_statuses AS (
			SELECT 
			    st.*, 
			    sts1.status AS current_status,
			    sts1.user_uuid AS resolver_user_uuid
			FROM (
			    SELECT support_ticket_uuid, MAX(created_at) max_timestamp
			    FROM support_ticket_statuses sts
			    GROUP BY support_ticket_uuid
			) sts
			JOIN support_ticket_statuses sts1 on sts1.support_ticket_uuid=sts.support_ticket_uuid AND sts1.created_at = sts.max_timestamp
			JOIN support_tickets st on st.uuid=sts.support_ticket_uuid
			ORDER BY st.created_at DESC
	);`)

	database.Exec("DROP MATERIALIZED VIEW IF EXISTS vm_current_support_ticket_statuses CASCADE;")
	database.Exec(`
		CREATE MATERIALIZED VIEW vm_current_support_ticket_statuses AS (
			SELECT 
				* 
			FROM 
				v_current_support_ticket_statuses
	);`)

}

func RefreshSupportTicketsMaterializedView() {
	database.Exec("REFRESH MATERIALIZED VIEW CONCURRENTLY vm_current_support_ticket_statuses;")
}
