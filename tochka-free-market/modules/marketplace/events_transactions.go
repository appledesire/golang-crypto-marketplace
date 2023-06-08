package marketplace

import (
	"fmt"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
)

func EventTransactionUpdate(transaction Transaction) {

	color := ""
	switch transaction.CurrentPaymentStatus() {
	case "COMPLETED":
		color = "#0000FF"
	case "PENDING":
		color = "#FFFF00"
	case "CANCELLED", "FAILED":
		color = "#FF0000"
	case "RELEASED":
		color = "#00FF00"
	}

	store, _ := FindStoreByUuid(transaction.StoreUuid)
	buyer, _ := FindUserByUuid(transaction.BuyerUuid)

	request := apis.MattermostEvent{
		Attachments: []apis.MattermostEventAttachment{
			{
				Fallback: "Transaction: " + transaction.Uuid,
				Color:    color,
				Pretext:  "Transaction: " + transaction.Uuid,
				Fields: []apis.MattermostEventField{
					{
						Title: "Status",
						Value: transaction.CurrentPaymentStatus(),
						Short: true,
					},
					{
						Title: "Currency",
						Value: transaction.Type,
						Short: true,
					},
					{
						Title: "Address",
						Value: transaction.Uuid,
						Short: false,
					},
					{
						Title: "Amount",
						Value: fmt.Sprintf("%f", transaction.TransactionAmount()),
						Short: true,
					},
					{
						Title: "Amount Paid",
						Value: fmt.Sprintf("%f", transaction.CurrentAmountPaid()),
						Short: true,
					},
					{
						Title: "Title",
						Value: fmt.Sprintf("[%s](%s/payments/%s)", transaction.Description, MARKETPLACE_SETTINGS.SiteURL, transaction.Uuid)},
					{
						Title: "Store",
						Value: fmt.Sprintf(fmt.Sprintf("[@%s](%s/user/%s)", store.Storename, MARKETPLACE_SETTINGS.SiteURL, store.Storename)),
						Short: true,
					},
					{
						Title: "Buyer",
						Value: fmt.Sprintf(fmt.Sprintf("[@%s](%s/user/%s)", buyer.Username, MARKETPLACE_SETTINGS.SiteURL, buyer.Username)),
						Short: true,
					},
				},
			},
		},
	}

	go apis.PostMattermostRawEvent(MARKETPLACE_SETTINGS.MattermostIncomingHookTransactions, request)
}
