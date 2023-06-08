package marketplace

import (
	"fmt"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
)

func createSupportTicketMattermostEvent(supportTicket SupportTicket) apis.MattermostEvent {

	color := ""
	status, _ := supportTicket.CurrentStatus()
	user, _ := FindUserByUuid(supportTicket.UserUuid)
	currentStatus := "NEW"
	if status != nil {
		currentStatus = status.Status
	}

	switch currentStatus {
	case "NEW":
		color = "#FF0000"
	case "OPEN":
		color = "#0000FF"
	case "CLOSED":
		color = "#00ff00"
	}

	return apis.MattermostEvent{
		Attachments: []apis.MattermostEventAttachment{
			{
				Fallback: "Ticket: " + supportTicket.Uuid,
				Pretext:  "Ticket: " + supportTicket.Uuid,
				Color:    color,
				Fields: []apis.MattermostEventField{
					{
						Title: "Ticket",
						Value: fmt.Sprintf("[%s](%s/staff/users/%s/tickets/%s)", supportTicket.Title, MARKETPLACE_SETTINGS.SiteURL, user.Username, supportTicket.Uuid),
						Short: true,
					},
					{
						Title: "Category",
						Value: supportTicket.Category,
						Short: true,
					},
					{
						Title: "User",
						Value: fmt.Sprintf(fmt.Sprintf("[@%s](%s/user/%s)", user.Username, MARKETPLACE_SETTINGS.SiteURL, user.Username)),
						Short: true,
					},
					{
						Title: "Status",
						Value: currentStatus,
						Short: true,
					},
					{
						Title: "Description",
						Value: supportTicket.Description,
						Short: false,
					},
				},
			},
		},
	}
}

func EventNewSupportTicketMessage(supportTicket SupportTicket, message Message) {
	payload := createSupportTicketMattermostEvent(supportTicket)
	messageAttachment := apis.MattermostEventAttachment{
		Fallback:   "Message: " + message.Uuid,
		AuthorName: "@" + message.SenderUser.Username,
		AuthorLink: fmt.Sprintf("%s/user/%s", MARKETPLACE_SETTINGS.SiteURL, message.SenderUser.Username),
		Text:       message.Text,
	}
	payload.Attachments = append(payload.Attachments, messageAttachment)
	go apis.PostMattermostRawEvent(MARKETPLACE_SETTINGS.MattermostIncomingHookSupport, payload)
}

func EventNewSupportTicket(supportTicket SupportTicket) {
	go apis.PostMattermostRawEvent(MARKETPLACE_SETTINGS.MattermostIncomingHookSupport, createSupportTicketMattermostEvent(supportTicket))
}
