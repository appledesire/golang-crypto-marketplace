package marketplace

import (
	"errors"
	"fmt"
	"net/http"
	"strings"
	"time"

	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

/*
	Models
*/

type Message struct {
	Uuid               string     `form:"uuid" json:"uuid" gorm:"primary_key" sql:"size:1024"`
	SenderUserUuid     string     `json:"-" sql:"index""`
	RecieverUserUuid   string     `json:"-" sql:"index"`
	IsReadByReciever   bool       `json:"is_read_by_reciever"`
	ParentUuid         string     `form:"parent_uuid" json:"parent_uuid" sql:"index"`
	Title              string     `form:"title" json:"title" sql:"size:140"`
	Text               string     `form:"text" json:"text" sql:"size:9086"`
	Type               string     `json:"type" sql:"index"`
	IsEncrypted        bool       `json:"is_encrypted" sql:"index"`
	IsReported         bool       `json:"is_reported" sql:"index"`
	ReportedByUserUuid string     `json:"reported_by_user_uuid" sql:"index"`
	ReviewedByUserUuid string     `json:"reviewed_by_user_uuid" sql:"index"`
	HasImage           bool       `json:"has_image" sql:"index"`
	CreatedAtTimestamp time.Time  `json:"created_at" sql:"index"`
	UpdatedAt          *time.Time `json:"updated_at" sql:"index"`
	DeletedAt          *time.Time `json:"deleted_at" sql:"index"`
	SenderUser         User       `json:"sender"`
	RecieverUser       User       `json:"reciever"`
}

type Messages []Message

type Thread struct {
	Message
	LastUpdated time.Time
	LastRead    *time.Time
}

type Threads []Thread

type ThreadPerusalStatus struct {
	ThreadUuid   string    `json:"thread_uuid" gorm:"primary_key" sql:"size:1024"`
	UserUuid     string    `json:"user_uuid" gorm:"primary_key" sql:"size:1024"`
	LastReadDate time.Time `json:"last_reade_date" gorm:"index"`
}

/*
	Model Methods
*/

func (message Message) AddImage(r *web.Request) error {

	_, handler, err := r.FormFile("image")

	if handler == nil {
		return nil
	}

	switch err {
	case nil:
		err = util.SaveImage(r, "image", 2048, message.Uuid)
		if err != nil {
			return err
		}
		message.HasImage = true
		return message.Save()
	case http.ErrMissingFile:
		return nil
	default:
		return err
	}

}

func (m Message) analyzeIsSuspicious() bool {
	text := strings.ToLower(m.Text)
	if strings.Contains(text, "wickr") {
		return true
	}
	if len(openBitcoinRegexp.FindAllStringSubmatch(text, -1)) != 0 {
		return true
	}
	if len(openEthereumRegexp.FindAllStringSubmatch(text, -1)) != 0 {
		return true
	}
	return false
}

func (m Message) Validate() error {
	if m.Uuid == "" {
		return errors.New("Empty UUID")
	}
	if m.SenderUserUuid == "" && m.Type != "shoutbox" && m.Type != "news" && m.Type != "dispute" && m.Type != "support" && m.Type != "store-verification" {
		return errors.New("Empty User Uuid")
	}
	if m.Text == "" && m.Type == "messageboard" {
		return errors.New("Empty text")
	}
	return nil
}

func (m Thread) Validate() error {
	err := m.Message.Validate()
	if err != nil {
		return err
	}
	if m.Title == "" {
		return errors.New("Empty title")
	}
	if m.Type == "private" && m.RecieverUserUuid == "" {
		return errors.New("Private thread should have reciever")
	}
	return nil
}

func (ts ThreadPerusalStatus) Validate() error {
	if ts.ThreadUuid == "" {
		return errors.New("Empty thread uuid")
	}
	if th, _ := FindThreadByUuid(ts.ThreadUuid); th == nil {
		return errors.New("No such thread")
	}

	if ts.UserUuid == "" {
		return errors.New("Empty thread uuid")
	}
	if u, _ := FindUserByUuid(ts.UserUuid); u == nil {
		return errors.New("No such user")
	}

	return nil
}

/*
	Database methods
*/

func (i Message) Remove() error {
	return database.Delete(&i).Error
}

func (itm Message) Save() error {
	err := itm.Validate()
	if err != nil {
		return err
	}
	return itm.SaveToDatabase()
}

func (ts ThreadPerusalStatus) Save() error {
	err := ts.Validate()
	if err != nil {
		return err
	}
	return ts.SaveToDatabase()
}

func (itm Message) SaveToDatabase() error {
	if existing, _ := FindMessageByUuid(itm.Uuid); existing == nil {
		return database.Create(&itm).Error
	}
	return database.Save(&itm).Error
}

func (itm ThreadPerusalStatus) SaveToDatabase() error {
	if existing, _ := FindThreadPerusalStatus(itm.ThreadUuid, itm.UserUuid); existing == nil {
		return database.Create(&itm).Error
	}
	return database.Save(&itm).Error
}

/*
	Relations
*/

func (t Thread) Messages(order string) Messages {
	var (
		messages []Message
	)
	q := database.
		Where("messages.parent_uuid=? or messages.uuid=?", t.Uuid, t.Uuid).
		Preload("SenderUser").
		Preload("RecieverUser")
	if order == "ASC" {
		q = q.Order("created_at_timestamp ASC")
	} else {
		q = q.Order("created_at_timestamp DESC")
	}

	q.Find(&messages)

	return messages
}

/*
	Queries
*/

func GetAllMessages() []Message {
	var messages []Message
	database.Find(&messages)
	return messages
}

func FindThreadsByType(threadType string) Threads {
	var (
		threads Threads
	)

	database.
		Table("v_threads").
		Where("type=?", threadType).
		Order("last_updated ASC").
		Preload("SenderUser").
		Preload("RecieverUser").
		Find(&threads)

	return threads
}

func FindThreadsByActiveUsersByType(threadType string) Threads {
	var (
		threads Threads
	)

	database.
		Table("v_threads").
		Joins("JOIN users on users.uuid=v_threads.sender_user_uuid").
		Where("type=? and users.last_login_date >= (now() - interval '21 day') and users.banned = false", threadType).
		Order("last_updated ASC").
		Preload("SenderUser").
		Preload("RecieverUser").
		Find(&threads)

	return threads
}

func UpdateThreadPerusalStatus(threadUuid, userUuid string) error {
	ts := ThreadPerusalStatus{
		ThreadUuid:   threadUuid,
		UserUuid:     userUuid,
		LastReadDate: time.Now(),
	}

	return ts.Save()
}

func CountPrivateMessages(user User) int {

	var (
		count int
	)
	database.
		Table("messages").
		Joins("join users on messages.sender_user_uuid=users.uuid").
		Where(`
messages.type=? and
(messages.reciever_user_uuid=? OR messages.sender_user_uuid=?) and  
text <> ? and 
messages.deleted_at IS NULL and
users.banned=false`,
			"private",
			user.Uuid,
			user.Uuid,
			"",
		).
		Count(&count)
	return count
}

func CountUndreadPrivateMessages(user User) int {
	var (
		count int
	)
	database.
		Table("messages").
		Joins("join users on messages.sender_user_uuid=users.uuid").
		Where(
			`messages.type=? and
	messages.reciever_user_uuid=? and
	is_read_by_reciever=? and
	text <> ? and
	messages.deleted_at IS NULL and
	users.banned=false`,
			"private", user.Uuid, 0, "",
		).
		Count(&count)
	return count
}

func CreateThread(
	threadType, uuid, title, text string,
	senderUser *User, recieverUser *User, save bool,
) (*Thread, error) {

	if uuid != "" {
		thread, _ := FindThreadByUuid(uuid)
		if thread != nil {
			return nil, errors.New("Thread already exists")
		}
	} else {
		uuid = threadType + "-" + util.GenerateUuid()
	}

	thread := &Thread{Message: Message{
		Uuid:               uuid,
		Text:               text,
		Title:              title,
		CreatedAtTimestamp: time.Now(),
		Type:               threadType,
	}}
	if senderUser != nil {
		thread.SenderUserUuid = senderUser.Uuid
	}
	if recieverUser != nil {
		thread.RecieverUserUuid = recieverUser.Uuid
		thread.RecieverUser = *recieverUser
	}

	err := thread.Validate()
	if err != nil {
		return thread, err
	}

	if save {
		err = thread.Save()
		if err != nil {
			return thread, err
		}
	}

	return thread, err
}

func CreateMessage(text string, thread Thread, user User) (*Message, error) {

	message := Message{
		Uuid:               thread.Uuid + "-" + util.GenerateUuid(),
		ParentUuid:         thread.Uuid,
		Text:               text,
		Type:               thread.Type,
		RecieverUserUuid:   thread.RecieverUserUuid,
		SenderUserUuid:     user.Uuid,
		SenderUser:         user,
		CreatedAtTimestamp: time.Now(),
	}

	switch thread.Type {
	// PM specific fields
	case "private":
		// receiver and sender
		if thread.RecieverUserUuid != user.Uuid {
			message.RecieverUserUuid = thread.RecieverUserUuid
		} else if thread.SenderUserUuid != user.Uuid {
			message.RecieverUserUuid = thread.SenderUserUuid
		}
	}

	if thread.Type == "private" && message.RecieverUserUuid == user.Uuid {
		message.RecieverUserUuid = thread.SenderUserUuid
	}

	err := message.Validate()
	if err != nil {
		return &message, err
	}

	err = message.Save()
	if err != nil {
		return &message, err
	}

	// Message Perusal Status
	switch thread.Type {
	// PM specific fields
	case "private":
		UpdateThreadPerusalStatus(thread.Uuid, user.Uuid)
	}

	return &message, nil
}

func FindMessageByUuid(uuid string) (*Message, error) {
	var (
		message Message
	)
	err := database.
		Where("uuid=?", uuid).
		Preload("SenderUser").
		Preload("RecieverUser").
		Find(&message).Error
	if err != nil {
		return nil, err
	}

	return &message, err
}

func FindThreadByUuid(uuid string) (*Thread, error) {
	message, err := FindMessageByUuid(uuid)
	if err != nil {
		return nil, err
	}
	return &Thread{Message: *message}, nil
}

func FindReportedMessages() Messages {
	var messages Messages
	database.
		Where("is_reported=true").
		Order("created_at_timestamp DESC").
		Preload("SenderUser").
		Preload("RecieverUser").
		Find(&messages)
	return messages

}

/*
	Factory Quieries
*/

func GetDisputeClaimThread(disputeClaim DisputeClaim) (*Thread, error) {
	threadUuid := fmt.Sprintf("dispute-%s-%d", disputeClaim.DisputeUuid, disputeClaim.ID)
	thread, _ := FindThreadByUuid(threadUuid)
	if thread != nil && thread.Type == "dispute" {
		return thread, nil
	}
	return CreateThread(
		"dispute",
		threadUuid,
		threadUuid,
		"",
		nil,
		nil,
		true,
	)
}

func GetShoutboxThread(lang string) (*Thread, error) {
	if lang == "" {
		lang = "en"
	}
	threadUuid := "shoutbox-" + lang
	thread, _ := FindThreadByUuid(threadUuid)
	if thread != nil && thread.Type == "shoutbox" {
		return thread, nil
	}
	l := GetLocalization(lang)
	return CreateThread(
		"shoutbox",
		threadUuid,
		l.LeftMenu.Shoutbox,
		"",
		nil,
		nil,
		true,
	)

}

func GetNewsThread(lang string) (*Thread, error) {
	if lang == "" {
		lang = "en"
	}
	threadUuid := "news-" + lang
	thread, _ := FindThreadByUuid(threadUuid)
	if thread != nil && thread.Type == "news" {
		return thread, nil
	}
	return CreateThread(
		"news",
		threadUuid,
		"news",
		"",
		nil,
		nil,
		true,
	)

}

func GetMessageboardThread(uuid string) (*Thread, error) {
	thread, err := FindThreadByUuid(uuid)
	if err != nil {
		return nil, err
	}
	if thread != nil && thread.Type == "messageboard" {
		return thread, nil
	}
	return nil, errors.New("No such thread or thread of wrong type")
}

func GetTransactionThread(transaction Transaction, message string) (*Thread, error) {
	threadUuid := "transaction-" + transaction.Uuid
	thread, _ := FindThreadByUuid(threadUuid)
	if thread != nil && thread.Type == "transaction" {
		return thread, nil
	}
	return CreateThread(
		"transaction",
		threadUuid,
		"Transaction thread @"+transaction.Uuid,
		message,
		&transaction.Buyer,
		// TODO: add store capabilities for messanging
		nil, //&transaction.Store,
		true,
	)
}

func GetPrivateThread(sender, reciever User, message string, createIfNoExists bool) (*Thread, error) {
	thread := FindPrivateThread(sender, reciever)
	if thread.Uuid != "" {
		return &thread, nil
	}
	return CreateThread(
		"private",
		"private-"+util.GenerateUuid(),
		fmt.Sprintf("Private thread @%s - @%s", sender.Username, reciever.Username),
		message,
		&sender,
		&reciever,
		createIfNoExists,
	)
}

/*
	Database Views
*/

func setupThreadsViews() {
	database.Exec("DROP VIEW IF EXISTS v_threads CASCADE;")
	database.Exec(`
		CREATE VIEW v_threads AS (
			WITH thread_messages as (
				SELECT parent_uuid, MAX(created_at_timestamp) last_updated, count(*) as number_of_messages
				FROM messages
				WHERE parent_uuid <> ''
				AND (deleted_at IS NULL OR deleted_at <= '0001-01-02') 
				GROUP BY parent_uuid
				ORDER BY number_of_messages DESC
			),
			extended_thread_messages as (
				SELECT thread_messages.*, messages.uuid as last_message_uuid , users.username as last_message_by_username
				FROM thread_messages 
				JOIN messages ON messages.parent_uuid=thread_messages.parent_uuid AND messages.created_at_timestamp=thread_messages.last_updated
				JOIN users ON users.uuid = messages.sender_user_uuid
			)

			SELECT  * FROM (
				SELECT
					messages.*,
					tm.last_updated,
					tm.number_of_messages,
					tm.last_message_uuid,
				    tm.last_message_by_username,
					u.is_admin,
					u.is_staff,
					u.is_seller
				FROM	
					messages
				JOIN
					extended_thread_messages tm on tm.parent_uuid=messages.uuid
				JOIN 
					users u on u.uuid=messages.sender_user_uuid
				WHERE
					(messages.deleted_at IS NULL OR messages.deleted_at <= '0001-01-02') AND
					u.banned=false 
				UNION (
					SELECT 
						messages.*,
						created_at_timestamp AS last_updated,
						1,
						messages.uuid,
					    u.username,
						u.is_admin,
					    u.is_seller,
						u.is_staff
					FROM 
						messages
					LEFT JOIN
						thread_messages tm on messages.uuid=tm.parent_uuid
					JOIN 
						users u on u.uuid=messages.sender_user_uuid
					WHERE
						(messages.deleted_at IS NULL OR messages.deleted_at <= '0001-01-02') AND
						u.banned=false AND
						messages.parent_uuid = '' AND
						(tm.parent_uuid IS NULL OR tm.parent_uuid='')
				)
			) threads 
		ORDER BY 
			is_admin, 
			is_staff,
			last_updated ASC
	);`)

	database.Exec("DROP VIEW IF EXISTS v_thread_counts CASCADE;")
	database.Exec(`
		CREATE VIEW v_thread_counts AS (
			SELECT 
				parent_uuid, count(*) as number_of_messages 
			FROM 
				messages 
			GROUP BY
				parent_uuid
	);`)
}
