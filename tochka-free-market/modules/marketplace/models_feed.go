package marketplace

import (
	"time"

	"github.com/dustin/go-humanize"
)

/*
	Models
*/

type FeedItem struct {
	Uuid        string `json:"uuid" gorm:"primary_key"`
	UserUuid    string `json:"user_uuid" sql:"index"`
	Type        string `json:"type" sql:"index"`
	ForeignUuid string `json:"foreign_uuid" sql:"index"`
	Action      string `json:"action"`

	User         User         `json:"-"`
	RatingReview RatingReview `json:"-"`
	Thread       Thread       `json:"-"`
	Transaction  Transaction  `json:"-"`
	Message      Message      `json:"-"`
	Item         Item         `json:"-"`
	OtherUser    User

	CreatedAt *time.Time `json:"created_at" sql:"index"`
	UpdatedAt *time.Time `json:"updated_at" sql:"index"`
	DeletedAt *time.Time `json:"deleted_at" sql:"index"`
}

type FeedItems []FeedItem

type ViewFeedItem struct {
	*FeedItem

	ViewItems        []ViewItem
	ViewMessage      ViewMessage
	ViewOtherUser    ViewUser
	ViewRatingReview ViewRatingReview
	ViewThread       ViewThread
	ViewTransaction  ViewTransaction
	ViewUser         ViewUser

	CreatedAt string
}

/*
	Database methods
*/

func (itm FeedItem) Validate() error {
	return nil
}

func (itm FeedItem) Save() error {
	err := itm.Validate()
	if err != nil {
		return err
	}
	return itm.SaveToDatabase()
}

func (itm *FeedItem) Remove() error {
	return database.Delete(&itm).Error
}

func (itm FeedItem) SaveToDatabase() error {
	if existing, _ := FindFeedItemByUuid(itm.Uuid); existing == nil {
		return database.Create(&itm).Error
	}
	return database.Save(&itm).Error
}

func (itms FeedItems) PopulateRelations() FeedItems {

	populatedItems := FeedItems{}

	for i := range itms {

		switch itms[i].Type {

		case "new_item", "staff_edit_item", "staff_delete_item":
			item, err := FindItemByUuid(itms[i].ForeignUuid)
			// skip certain items
			if err != nil ||
				item.DeletedAt != nil ||
				item.ReviewedAt == nil ||
				// !item.Store.IsAllowedToSell ||
				len(item.Packages) == 0 {
				continue
			}
			itms[i].Item = *item

		case "new_thread":
			thread, err := GetMessageboardThread(itms[i].ForeignUuid)
			if err != nil || thread.DeletedAt != nil {
				continue
			}
			itms[i].Thread = *thread

		case "new_thread_reply":
			message, err := FindMessageByUuid(itms[i].ForeignUuid)
			if err != nil || message.DeletedAt != nil {
				continue
			}
			thread, err := FindThreadByUuid(message.ParentUuid)
			if err != nil || thread.DeletedAt != nil {
				continue
			}
			itms[i].Message = *message
			itms[i].Thread = *thread

		// case "new_review":
		// 	review, err := FindRatingReviewByUuid(itms[i].ForeignUuid)
		// 	if err != nil {
		// 		continue
		// 	}
		// 	itms[i].RatingReview = *review

		case "staff_resolve_dispute":
			transaction, err := FindTransactionByDisputeUuid(itms[i].ForeignUuid)
			if err != nil {
				continue
			}
			itms[i].Transaction = *transaction
		}

		populatedItems = append(populatedItems, itms[i])
	}

	return populatedItems
}

/*
	Queries
*/

func FindFeedItemByUuid(uuid string) (*FeedItem, error) {
	var item FeedItem
	err := database.
		Where(&FeedItem{Uuid: uuid}).
		First(&item).
		Error
	if err != nil {
		return nil, err
	}
	return &item, err
}

func FindRecentPublicFeedItems() FeedItems {
	var items []FeedItem

	database.
		Joins("join users on users.uuid=feed_items.user_uuid").
		Where("feed_items.created_at > ?", time.Now().AddDate(0, 0, -30)).
		Where(`type in (
			'new_item', 
			'new_thread', 
			'new_thread_reply', 
			'new_review')`).
		Where("users.pgp <> '' and users.banned=false").
		Order("uuid DESC").
		Limit(200).
		Preload("User").
		Find(&items)

	return FeedItems(items)
}

func FindRecentStaffFeedItems() FeedItems {
	var items []FeedItem

	database.
		Where("created_at > ?", time.Now().AddDate(0, 0, -30)).
		Where(`type in (
			'staff_delete_item', 
			'staff_edit_item', 
			'staff_resolve_dispute', 
			'staff_support_reply')`).
		Preload("User").
		Order("uuid DESC").
		Find(&items)

	return FeedItems(items)
}

func FindAllFeedItems() []FeedItem {
	var items []FeedItem
	database.
		Find(&items)
	return items
}

func CreateFeedItem(
	userUuid string,
	actionType string,
	action string,
	foreignUuid string,
) (*FeedItem, error) {
	now := time.Now()
	feedItem := FeedItem{
		Uuid:        now.Format("2006-01-02T15:04:05.999999999"),
		UserUuid:    userUuid,
		Type:        actionType,
		ForeignUuid: foreignUuid,
		Action:      action,
		CreatedAt:   &now,
	}
	return &feedItem, feedItem.Save()
}

/*
	View models
*/

func (itms FeedItems) ViewFeedItems(lang, section string) []ViewFeedItem {
	feed := []ViewFeedItem{}
	for _, feedItem := range itms {

		if section == "items" && feedItem.Type != "new_item" {
			continue
		}

		if section == "reviews" && feedItem.Type != "new_review" {
			continue
		}

		if section == "board" && (feedItem.Type != "new_thread" && feedItem.Type != "new_thread_reply") {
			continue
		}

		viewItem := feedItem.ViewFeedItem(lang)
		if len(feed) > 1 {
			previousItem := feed[len(feed)-1]
			if previousItem.UserUuid == viewItem.UserUuid &&
				previousItem.Type == "new_item" &&
				previousItem.Type == viewItem.Type {
				feed[len(feed)-1].ViewItems = append(
					feed[len(feed)-1].ViewItems,
					viewItem.ViewItems[0])
			} else {
				feed = append(feed, viewItem)
			}
		} else {
			feed = append(feed, viewItem)
		}
	}
	return feed
}

func (m FeedItem) ViewFeedItem(lang string) ViewFeedItem {
	viewItem := ViewFeedItem{
		FeedItem:  &m,
		CreatedAt: humanize.Time(*m.CreatedAt),
		ViewUser:  m.User.ViewUser(lang),
	}

	switch m.Type {

	case "new_item", "staff_edit_item", "staff_delete_item":
		viewItem.ViewItems = []ViewItem{m.Item.ViewItem(lang)}

	case "new_thread":
		viewItem.ViewThread = m.Thread.ViewThread(lang, nil)

	case "new_thread_reply":
		viewItem.ViewMessage = m.Message.ViewMessage(lang)
		viewItem.ViewThread = m.Thread.ViewThread(lang, nil)

	case "new_review":
		viewItem.ViewRatingReview = m.RatingReview.ViewRatingReview(lang)

	case "staff_support_reply":
		viewItem.ViewOtherUser = m.OtherUser.ViewUser(lang)
		viewItem.ViewThread = m.Thread.ViewThread(lang, nil)
		if len(viewItem.ViewThread.Messages) > 0 { // strip welcome message
			viewItem.ViewThread.Messages = viewItem.ViewThread.Messages[1:]
		}

	case "staff_resolve_dispute":
		viewItem.ViewTransaction = m.Transaction.ViewTransaction()

	}

	viewItem.FeedItem.Action = TranslateFeedActions(viewItem.FeedItem.Action, lang)
	return viewItem
}

/*
	Cache
*/

func CacheFillPublicFeedItems() FeedItems {
	feedItems := FindRecentPublicFeedItems()
	populatedItems := feedItems.PopulateRelations()
	cache15m.Set("public-feed-items", populatedItems)
	return populatedItems
}

func CacheGetPublicFeedItems() FeedItems {
	var (
		feedItems FeedItems
	)

	if cFeedItems, _ := cache15m.Get("public-feed-items"); cFeedItems == nil {
		feedItems = CacheFillPublicFeedItems()
	} else {
		feedItems = cFeedItems.(FeedItems)
	}

	return feedItems
}

func CacheFillStaffFeedItems() FeedItems {
	feedItems := FindRecentStaffFeedItems()
	populatedItems := feedItems.PopulateRelations()
	cache15m.Set("staff-feed-items", populatedItems)
	return populatedItems
}

func CacheGetStaffFeedItems() FeedItems {
	var (
		feedItems FeedItems
	)

	if cFeedItems, _ := cache15m.Get("staff-feed-items"); cFeedItems == nil {
		feedItems = CacheFillStaffFeedItems()
	} else {
		feedItems = cFeedItems.(FeedItems)
	}

	return feedItems
}
