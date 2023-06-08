package marketplace

import (
	"fmt"
	"net/http"

	"github.com/dchest/captcha"
	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ViewListSupportTickets(w web.ResponseWriter, r *web.Request) {

	tickets, err := FindSupportTicketsForUser(*c.ViewUser.User)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	c.ViewSupportTickets = tickets.ViewSupportTickets(c.ViewUser.Language)

	c.SelectedSection = "faq"
	if len(r.URL.Query()["section"]) > 0 {
		c.SelectedSection = r.URL.Query()["section"][0]
	}

	users, err := FindStaffMemebers()
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	c.ViewExtendedUsers = ExtendedUsers(users).ViewExtendedUsers(c.Language)

	util.RenderTemplate(w, "support/faq", c)
}

func (c *Context) ShowSupportTicketGET(w web.ResponseWriter, r *web.Request) {

	var (
		id       = r.PathParams["id"]
		username = r.PathParams["username"]
		tickets  SupportTickets
		err      error
	)

	c.CaptchaId = captcha.New()

	if id == "new" || id == "" {
		util.RenderTemplate(w, "support/new_ticket", c)
		return
	}

	st, err := FindSupportTicketByUuid(id)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	if !(st.UserUuid == c.ViewUser.Uuid || c.ViewUser.IsStaff || c.ViewUser.IsAdmin) {
		http.NotFound(w, r.Request)
		return
	}

	thread, err := st.Thread()
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	if username == "" {
		tickets, err = FindSupportTicketsForUser(*c.ViewUser.User)
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}
		// c.ViewSeller = &c.ViewUser //Seller{c.ViewUser.User}.ViewSeller(c.ViewUser.Language)
		c.ViewSupportTickets = tickets.ViewSupportTickets(c.ViewUser.Language)
	} else {
		// TODO: check viewSeller logic
		_, err := FindUserByUsername(username)
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}
		// viewSeller := user.ViewUser(c.ViewUser.Language)
		// c.ViewSeller = &viewSeller
	}

	viewThread := thread.ViewThread(c.ViewUser.Language, c.ViewUser.User)
	c.ViewThread = &viewThread
	c.ViewSupportTicket = st.ViewSupportTicket(c.ViewUser.Language)

	util.RenderTemplate(w, "support/show_ticket", c)

}

func (c *Context) ViewUpdateTicketStatusPOST(w web.ResponseWriter, r *web.Request) {

	st, err := FindSupportTicketByUuid(r.PathParams["id"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	status, err := st.CurrentStatus()
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	ticketStatus := r.FormValue("ticketstatus")
	if ticketStatus != "" && status.Status != ticketStatus {
		err := st.SetStatus(c.ViewUser.Uuid, ticketStatus)
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}
	}

	http.Redirect(w, r.Request, fmt.Sprintf("/support/%s", st.Uuid), 302)
}

func (c *Context) ShowSupportTicketPOST(w web.ResponseWriter, r *web.Request) {

	var (
		id             = r.PathParams["id"]
		title          = r.FormValue("title")
		text           = r.FormValue("text")
		category       = r.FormValue("category")
		ticketStatus   = r.FormValue("ticketstatus")
		isCaptchaValid = captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha")) || c.ViewUser.IsAdmin || c.ViewUser.IsStaff
		st             *SupportTicket
		err            error
		message        *Message
	)

	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.ShowSupportTicketGET(w, r)
		return
	}

	if r.PathParams["id"] == "new" || r.PathParams["id"] == "" {
		st, err = CreateSupportTicket(*c.ViewUser.User, title, text, 5, category)
		if err != nil {
			return
		}
		EventNewSupportTicket(*st)
		http.Redirect(w, r.Request, fmt.Sprintf("/support/%s", st.Uuid), 302)
		return
	}

	st, err = FindSupportTicketByUuid(id)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	c.ViewSupportTicket = st.ViewSupportTicket(c.ViewUser.Language)

	message, err = st.AddMessage(text, *c.ViewUser.User)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	err = message.AddImage(r)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	EventNewSupportTicketMessage(*st, *message)

	thread, err := FindThreadByUuid(st.ThreadUuid)
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	viewThread := thread.ViewThread(c.ViewUser.Language, c.ViewUser.User)
	c.ViewThread = &viewThread

	status, err := st.CurrentStatus()
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	if ticketStatus == "" {
		ticketStatus = "OPENED"
	}

	if status.Status != ticketStatus {
		err := st.SetStatus(c.ViewUser.Uuid, ticketStatus)
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}
	}

	http.Redirect(w, r.Request, fmt.Sprintf("/support/%s", st.Uuid), 302)
}
