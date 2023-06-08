package marketplace

import (
	"fmt"
	"math"
	"net/http"
	"strconv"

	"github.com/dchest/captcha"
	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

/*
	Users
*/

func (c *Context) ViewStaff(w web.ResponseWriter, r *web.Request) {
	http.Redirect(w, r.Request, "/staff/users", 302)
}

/*
	Items
*/

func (c *Context) ViewStaffListItems(w web.ResponseWriter, r *web.Request) {

	var (
		err      error
		page     int = 1
		pageSize int = 200
	)

	if len(r.URL.Query()["page"]) > 0 {
		selectedPageStr := r.URL.Query()["page"][0]
		page, err = strconv.Atoi(selectedPageStr)
	}

	if err == nil {
		c.SelectedPage = page
	}

	unreviewdItems := FindUnreviewedItems(page-1, pageSize)
	c.ViewItems = unreviewdItems.ViewItems(c.ViewUser.Language)

	util.RenderTemplate(w, "staff/items", c)
}

/*
	Disputes
*/

func (c *Context) ViewStaffListDisputes(w web.ResponseWriter, r *web.Request) {
	// transaction type
	if len(r.URL.Query()["status"]) > 0 {
		c.SelectedStatus = r.URL.Query()["status"][0]
	}
	// pages
	pageSize := 20
	if len(r.URL.Query()["page"]) > 0 {
		strPage := r.URL.Query()["page"][0]
		page, err := strconv.ParseInt(strPage, 10, 32)
		if err != nil || page < 0 {
			http.NotFound(w, r.Request)
			return
		}
		c.Page = int(page)
	} else {
		c.Page = 1
	}

	c.SelectedStatus = ""
	if len(r.URL.Query()["status"]) > 0 {
		c.SelectedStatus = r.URL.Query()["status"][0]
	}

	c.NumberOfTransactions = CountDisputedTransactions(c.ViewUser.Uuid, c.SelectedStatus)
	c.NumberOfPages = int(math.Ceil(float64(c.NumberOfTransactions) / float64(pageSize)))
	for i := 0; i < c.NumberOfPages; i++ { // paging
		c.Pages = append(c.Pages, i+1)
	}

	transactions := Transactions(GetDisputedTransactionsPaged(pageSize, c.Page-1, c.ViewUser.Uuid, c.SelectedStatus))
	c.ViewTransactions = transactions.ViewTransactions()
	util.RenderTemplate(w, "staff/disputes", c)
}

/*
	Staff
*/

func (c *Context) ViewStaffListStaff(w web.ResponseWriter, r *web.Request) {
	users, err := FindStaffMemebers()
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	c.ViewExtendedUsers = ExtendedUsers(users).ViewExtendedUsers(c.Language)
	util.RenderTemplate(w, "staff/staff", c)
}

/*
	Warnings
*/

func (c *Context) ViewStaffListWarnings(w web.ResponseWriter, r *web.Request) {
	warnings := FindAllActiveWarnings()
	c.ViewStoreWarnings = warnings.ViewStoreWarnings(c.ViewUser.Language)
	util.RenderTemplate(w, "staff/warnings", c)
}

/*
	News
*/

func (c *Context) ViewStaffEditNewsGET(w web.ResponseWriter, r *web.Request) {
	thread, err := GetNewsThread("en")
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	c.SelectedSection = "news"
	c.CaptchaId = captcha.New()
	viewThread := thread.ViewThread(c.ViewUser.Language, c.ViewUser.User)
	c.ViewThread = &viewThread
	util.RenderTemplate(w, "staff/news", c)
}

func (c *Context) ViewStaffEditNewsPOST(w web.ResponseWriter, r *web.Request) {

	thread, err := GetNewsThread("en")
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha")) || c.ViewUser.IsAdmin || c.ViewUser.IsStaff
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.ViewStaffEditNewsGET(w, r)
		return
	}

	message, err := CreateMessage(r.FormValue("text"), *thread, *c.ViewUser.User)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ViewStaffEditNewsGET(w, r)
		return
	}

	err = message.AddImage(r)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ViewStaffEditNewsGET(w, r)
		return
	}

	c.ViewStaffEditNewsGET(w, r)
}

/*
	Categories
*/

func (c *Context) ViewStaffCategories(w web.ResponseWriter, r *web.Request) {
	itemCategories := FindAllCategories()
	c.ViewItemCategories = itemCategories.ViewCategories(c.ViewUser.Language)
	util.RenderTemplate(w, "staff/categories_list", c)
}

func (c *Context) ViewStaffCategoriesEditGET(w web.ResponseWriter, r *web.Request) {

	if r.PathParams["id"] != "new" {
		catId, err := strconv.ParseInt(r.PathParams["id"], 10, 64)
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}
		category, err := FindCategoryByID(int(catId))
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}
		vc := category.ViewItemCategory(c.ViewUser.Language)
		c.ViewItemCategory = &vc
	}

	categories := FindAllCategories()

	cat := ItemCategory{
		ID: 0,
	}
	c.ViewItemCategories = append(c.ViewItemCategories, cat.ViewItemCategory(c.ViewUser.Language))

	translateCat := func(ic ItemCategory, lvl int) ViewItemCategory {
		vc := ic.ViewItemCategory(c.ViewUser.Language)

		for i := 0; i < lvl-1; i++ {
			vc.Name = "-" + vc.Name
		}

		return vc
	}

	for _, cat1 := range categories {
		c.ViewItemCategories = append(c.ViewItemCategories, translateCat(cat1, 1))
		for _, cat2 := range cat1.Subcategories {
			c.ViewItemCategories = append(c.ViewItemCategories, translateCat(cat2, 2))
			for _, cat3 := range cat2.Subcategories {
				c.ViewItemCategories = append(c.ViewItemCategories, translateCat(cat3, 3))
			}
		}
	}

	util.RenderTemplate(w, "staff/categories_edit", c)
}

func (c *Context) ViewStaffCategoriesEditPOST(w web.ResponseWriter, r *web.Request) {

	var category ItemCategory

	if r.PathParams["id"] != "new" {
		catId, err := strconv.ParseInt(r.PathParams["id"], 10, 64)
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}
		cat, err := FindCategoryByID(int(catId))
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}
		category = *cat
	}

	err := r.ParseForm()
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	if r.FormValue("parent_id") != "" {
		parId, err := strconv.ParseUint(r.FormValue("parent_id"), 10, 64)
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}
		if parId != 0 {
			parentCat, err := FindCategoryByID(int(parId))
			if err != nil {
				http.NotFound(w, r.Request)
				return
			}
			category.ParentID = parentCat.ID
		} else {
			category.ParentID = 0
		}
	}

	category.Icon = r.FormValue("icon")
	category.NameEn = r.FormValue("name_en")
	category.NameRu = r.FormValue("name_ru")
	category.NameDe = r.FormValue("name_de")
	category.NameEs = r.FormValue("name_es")
	category.NameFr = r.FormValue("name_fr")
	category.NameRs = r.FormValue("name_rs")
	category.NameTr = r.FormValue("name_tr")

	if r.FormValue("hidden") == "1" {
		category.Hidden = true
	} else {
		category.Hidden = false
	}

	category.Save()

	http.Redirect(w, r.Request, fmt.Sprintf("/staff/item_categories/"), 302)
}

func (c *Context) ViewStaffCategoriesDelete(w web.ResponseWriter, r *web.Request) {
	catId, err := strconv.ParseUint(r.PathParams["id"], 10, 64)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	category, err := FindCategoryByID(int(catId))
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	err = category.Remove()
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	http.Redirect(w, r.Request, fmt.Sprintf("/staff/item_categories/"), 302)
}

/*
	Advertisings
*/

func (c *Context) ViewStaffAdvertisings(w web.ResponseWriter, r *web.Request) {
	var err error
	c.HideAdvertisings = true
	c.Advertisings, err = FindAllAdvertising()
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	c.AdvertisingCost = MARKETPLACE_SETTINGS.AdvertisingCost
	util.RenderTemplate(w, "staff/advertising", c)
}

/*
	Reported Messages
*/

func (c *Context) ViewStaffListReportedMessages(w web.ResponseWriter, r *web.Request) {
	c.ViewMessages = FindReportedMessages().ViewMessages(c.ViewUser.Language)
	util.RenderTemplate(w, "staff/reported_messages", c)
}

func (c *Context) ViewStaffShowReportedMessage(w web.ResponseWriter, r *web.Request) {
	message, err := FindMessageByUuid(r.PathParams["message_uuid"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	if !message.IsReported {
		http.NotFound(w, r.Request)
		return
	}
	c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
	util.RenderTemplate(w, "staff/reported_message", c)
}

/*
	Deposits
*/

func (c *Context) ViewStaffListDeposits(w web.ResponseWriter, r *web.Request) {
	c.Deposits = FindAllDeposits()
	util.RenderTemplate(w, "staff/deposits", c)
}
