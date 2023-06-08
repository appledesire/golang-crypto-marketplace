package marketplace

import (
	"fmt"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/apis"
)

func EventNewItem(item Item) {
	go apis.PostMattermostRawEvent(MARKETPLACE_SETTINGS.MattermostIncomingHookItems, createItemMattermostEvent(item))
}

func createItemMattermostEvent(item Item) apis.MattermostEvent {

	var (
		store = item.Store
	)

	return apis.MattermostEvent{
		Attachments: []apis.MattermostEventAttachment{
			{
				Fallback:   "Item: " + item.Uuid,
				AuthorName: store.Storename,
				AuthorLink: fmt.Sprintf("%s/store/%s", MARKETPLACE_SETTINGS.SiteURL, store.Storename),
				Fields: []apis.MattermostEventField{
					{
						Title: "Item Name",
						Value: fmt.Sprintf(
							"[%s](%s/store/%s/item/%s)",
							item.Name,
							MARKETPLACE_SETTINGS.SiteURL,
							store.Storename,
							item.Uuid,
						),
						Short: true,
					},
					{
						Title: "Category",
						Value: item.ItemCategory.NameEn,
						Short: true,
					},
					{
						Title: "Description",
						Value: item.Description,
						Short: false,
					},
				},
			},
		},
	}
}
