package marketplace

import (
	"fmt"
	"strings"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
)

func createDisputeMattermostEvent(dispute Dispute) apis.MattermostEvent {

	var (
		transaction, _ = dispute.Transaction()
		store          = transaction.Store
		buyer          = transaction.Buyer
		claim          = dispute.DisputeClaims[0]
		color          = ""
	)

	if transaction == nil {
		return apis.MattermostEvent{}
	}

	if len(dispute.DisputeClaims) == 0 {
		return apis.MattermostEvent{}
	}

	switch dispute.Status {
	case "OPEN":
		color = "#FF0000"
	case "RESOLVED TO BUYER":
		color = "#00FF00"
	case "RESOLVED TO VENDOR":
		color = "#0000FF"
	}

	return apis.MattermostEvent{
		Attachments: []apis.MattermostEventAttachment{
			{
				Fallback: "Dispute: " + dispute.Uuid,
				Pretext:  "Dispute: " + dispute.Uuid,
				Color:    color,
				Fields: []apis.MattermostEventField{
					{
						Title: "Transaction Address",
						Value: fmt.Sprintf("[%s](%s/payments/%s)", transaction.Uuid, MARKETPLACE_SETTINGS.SiteURL, transaction.Uuid),
						Short: true,
					},
					{
						Title: "Transaction Type",
						Value: transaction.Type,
						Short: true,
					},
					{
						Title: "Transaction Description",
						Value: transaction.Description,
						Short: true,
					},
					{
						Title: "Amount",
						Value: fmt.Sprintf("%f", transaction.TransactionAmount()),
						Short: true,
					},
					{
						Title: "Store",
						Value: fmt.Sprintf("[@%s](%s/store/%s)", store.Storename, MARKETPLACE_SETTINGS.SiteURL, store.Storename),
						Short: true,
					},
					{
						Title: "Buyer",
						Value: fmt.Sprintf("[@%s](%s/user/%s)", buyer.Username, MARKETPLACE_SETTINGS.SiteURL, buyer.Username),
						Short: true,
					},
					{
						Title: "Dispute Claim",
						Value: strings.Replace(claim.Claim, "\n", "\n > ", -1),
						Short: false,
					},
					{
						Title: "Dispute Status",
						Value: dispute.Status,
						Short: true,
					},
				},
			},
		},
	}
}

func EventNewDispute(dispute Dispute) {
	go apis.PostMattermostRawEvent(MARKETPLACE_SETTINGS.MattermostIncomingHookDisputes, createDisputeMattermostEvent(dispute))
}

func EventDisputeNewMessage(dispute Dispute, message Message) {
	payload := createDisputeMattermostEvent(dispute)

	messageAttachment := apis.MattermostEventAttachment{
		Fallback:   "Message: " + message.Uuid,
		Pretext:    "new message",
		Text:       strings.Replace(message.Text, "\n", "\n > ", -1),
		AuthorName: message.SenderUser.Username,
		AuthorLink: fmt.Sprintf("%s/user/%s", MARKETPLACE_SETTINGS.SiteURL, message.SenderUser.Username),
	}

	payload.Attachments = append(payload.Attachments, messageAttachment)

	go apis.PostMattermostRawEvent(MARKETPLACE_SETTINGS.MattermostIncomingHookDisputes, payload)
}
