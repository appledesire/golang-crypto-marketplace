package marketplace

import (
	"html/template"
	"math"
	"strings"

	"github.com/dustin/go-humanize"
	"github.com/russross/blackfriday"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func init() {
	messageboardHtmlPolicy.AllowElements(
		"p",
		"strong",
		"ul",
		"li",
		"i",
		"br",
	)
}

/*
	View models
*/

type ViewMessage struct {
	*Message
	CreatedAtStr     string        `json:"-"`
	TextHTML         template.HTML `json:"text_html"`
	ShortText        string        `json:"-"`
	IsSuspicious     bool          `json:"is_suspicious"`
	ViewSenderUser   ViewUser      `json:"sender_user"`
	ViewReceiverUser ViewUser      `json:"receiver_user"`
}

type ViewThread struct {
	*ViewMessage
	LastMessage *ViewMessage  `json:"-"`
	Messages    []ViewMessage `json:"messages"`

	NumberOfMessages       int   `json:"number_of_messages"`
	NumberOfUnreadMessages int   `json:"number_of_unread_messages"`
	IsRead                 bool  `json:"is_read"`
	Pages                  []int `json:"-"`
	TitleUser              User  `json:"-"`

	LastUpdatedAtStr      string `json:"last_updated_at_str"`
	LastMessageByUsername string `json:"last_message_by_username"`
}

func (m Message) ViewMessage(lang string) ViewMessage {
	vm := ViewMessage{
		Message:          &m,
		CreatedAtStr:     util.HumanizeTime(m.CreatedAtTimestamp, lang),
		TextHTML:         template.HTML(messageboardHtmlPolicy.Sanitize(string(blackfriday.MarkdownCommon([]byte(m.Text))))),
		ViewSenderUser:   m.SenderUser.ViewUser(lang),
		ViewReceiverUser: m.RecieverUser.ViewUser(lang),
	}

	if len(m.Text) > 30 {
		vm.ShortText = m.Text[0:30]
	} else {
		vm.ShortText = m.Text
	}

	if strings.Contains(vm.ShortText, "\n") {
		parts := strings.Split(vm.ShortText, "\n")
		for _, p := range parts {
			if p != "" {
				vm.ShortText = p
				break
			}
		}
	}

	// -----BEGIN PGP MESSAGE-----
	if strings.Contains(m.Text, "-----BEGIN PGP MESSAGE-----") ||
		strings.Contains(m.Text, "-----BEGIN PGP SIGNED MESSAGE-----") ||
		strings.Contains(m.Text, "-----BEGIN PGP PUBLIC KEY BLOCK-----") {
		vm.IsEncrypted = true
	}

	vm.IsSuspicious = m.analyzeIsSuspicious() && !vm.IsEncrypted && !(m.SenderUser.IsStaff || m.SenderUser.IsAdmin)

	return vm
}

func (t Thread) ViewThread(lang string, reciever *User) ViewThread {

	viewMessage := t.Message.ViewMessage(lang)
	order := "ASC"
	if t.Type == "shoutbox" || t.Type == "news" {
		order = "DESC"
	}
	viewMessages := t.Messages(order).ViewMessages(lang)

	if (t.Type == "support" || t.Type == "store") && len(viewMessages) > 0 {
		viewMessages = viewMessages[1:]
	}

	viewThread := ViewThread{
		ViewMessage:      &viewMessage,
		Messages:         viewMessages,
		NumberOfMessages: len(viewMessages),
		LastUpdatedAtStr: humanize.Time(t.LastUpdated),
		IsRead:           false,
	}

	viewThread.LastUpdatedAtStr = util.HumanizeTime(t.LastUpdated, lang)

	if len(viewMessages) > 0 {
		viewThread.LastMessage = &viewMessages[len(viewMessages)-1]
	}

	if reciever != nil {

		if reciever.Uuid == t.RecieverUser.Uuid {
			viewThread.TitleUser = t.SenderUser
		} else {
			viewThread.TitleUser = t.RecieverUser
		}

		if viewThread.LastMessage != nil {
			tps, _ := FindThreadPerusalStatus(t.Uuid, reciever.Uuid)
			if tps != nil && tps.LastReadDate.After(viewThread.LastMessage.CreatedAtTimestamp) {
				viewThread.IsRead = true
			} else {
				viewThread.IsRead = false
			}
		}

		if reciever.Username == "" {
			viewThread.IsRead = false
		}
	}

	numberOfPages := int(math.Ceil(float64(viewThread.NumberOfMessages) / 10.0))
	for i := 0; i < numberOfPages; i++ {
		viewThread.Pages = append(viewThread.Pages, i+1)
	}

	viewThread.ViewSenderUser = t.SenderUser.ViewUser(lang)
	viewThread.ViewReceiverUser = t.RecieverUser.ViewUser(lang)

	return viewThread
}

func (ts Threads) ViewThreads(lang string, reciever *User) []ViewThread {
	viewThreads := []ViewThread{}

	for i, thread := range ts {
		if thread.Type == "messageboard" || (len(thread.Messages("ASC")) > 1 && thread.Type != "messageboard") {
			vt := ts[i].ViewThread(lang, reciever)
			viewThreads = append(viewThreads, vt)
		}
	}

	for i, j := 0, len(viewThreads)-1; i < j; i, j = i+1, j-1 {
		viewThreads[i], viewThreads[j] = viewThreads[j], viewThreads[i]
	}

	return viewThreads
}

func (ms Messages) ViewMessages(lang string) []ViewMessage {
	viewMessages := []ViewMessage{}
	for i := range ms {
		vm := ms[i].ViewMessage(lang)
		viewMessages = append(viewMessages, vm)
	}
	return viewMessages
}
