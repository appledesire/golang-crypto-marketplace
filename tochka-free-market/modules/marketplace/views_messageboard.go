package marketplace

import (
	"net/http"
	"strconv"

	"github.com/dchest/captcha"
	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) MessageImage(w web.ResponseWriter, r *web.Request) {
	size := "normal"
	if len(r.URL.Query()["size"]) > 0 {
		size = r.URL.Query()["size"][0]
	}
	util.ServeImage(r.PathParams["uuid"], size, w, r)
}

func (c *Context) DeleteThread(w web.ResponseWriter, r *web.Request) {
	thread, err := FindThreadByUuid(r.PathParams["uuid"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	if thread.SenderUserUuid == c.ViewUser.Uuid || c.ViewUser.IsAdmin || c.ViewUser.IsStaff {
		thread.Remove()
	}
	http.Redirect(w, r.Request, "/board/", 302)
}

func (c *Context) EditThread(w web.ResponseWriter, r *web.Request) {
	var editThread bool
	if r.PathParams["uuid"] != "" {
		thread, err := GetMessageboardThread(r.PathParams["uuid"])
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}
		viewThread := thread.ViewThread(c.ViewUser.Language, c.ViewUser.User)
		c.ViewThread = &viewThread
		editThread = true
	}
	c.CaptchaId = captcha.New()

	if len(r.URL.Query()["section"]) > 0 {
		section := r.URL.Query()["section"][0]
		sectionID, _ := strconv.ParseInt(section, 10, 64)
		c.SelectedSectionID = int(sectionID)
	} else {
		c.SelectedSectionID = 1
	}

	if editThread {
		util.RenderTemplate(w, "board/thread_edit", c)
	} else {
		util.RenderTemplate(w, "board/thread_new", c)
	}
}

func (c *Context) EditThreadPOST(w web.ResponseWriter, r *web.Request) {
	// vars
	var (
		thread      *Thread
		isNewThread bool
		err         error
	)

	// captcha
	isCaptchaValid := captcha.VerifyString(r.FormValue("captcha_id"), r.FormValue("captcha"))
	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.EditThread(w, r)
		return
	}

	// new or existing thread
	if r.PathParams["uuid"] != "" {
		thread, err = GetMessageboardThread(r.PathParams["uuid"])
		if err != nil {
			http.NotFound(w, r.Request)
			return
		}
	} else {
		thread, err = CreateThread(
			"messageboard",
			"",
			r.FormValue("title"),
			r.FormValue("text"),
			c.ViewUser.User,
			nil,
			true,
		)
		if err != nil {
			c.Error = err.Error()
			c.EditThread(w, r)
			return
		}
		isNewThread = true
	}

	// set title, text and section
	thread.Title = r.FormValue("title")
	thread.Text = r.FormValue("text")
	thread.Save()

	viewThread := thread.ViewThread(c.ViewUser.Language, c.ViewUser.User)
	c.ViewThread = &viewThread
	err = thread.AddImage(r)
	if err != nil {
		c.Error = err.Error()
		c.EditThread(w, r)
		return
	}

	// feed actions
	if isNewThread {
		CreateFeedItem(c.ViewUser.Uuid, "new_thread", "created new thread", thread.Uuid)
	}

	// redirect
	// http.Redirect(w, r.Request, fmt.Sprintf("/board/?section=%d", thread.MessageboardSectionID), 302)
}

func (c *Context) ReplyToThread(w web.ResponseWriter, r *web.Request) {
	isCaptchaValid := captcha.VerifyString(
		r.FormValue("captcha_id"),
		r.FormValue("captcha")) ||
		c.ViewUser.IsAdmin ||
		c.ViewUser.IsStaff

	if !isCaptchaValid {
		c.Error = "Invalid captcha"
		c.ShowThread(w, r)
		return
	}
	thread, err := GetMessageboardThread(r.FormValue("thread_uuid"))
	if err != nil {
		c.Error = err.Error()
		c.ShowThread(w, r)
		return
	}
	message, err := CreateMessage(r.FormValue("text"), *thread, *c.ViewUser.User)
	if err != nil {
		c.Error = err.Error()
		c.ViewMessage = message.ViewMessage(c.ViewUser.Language)
		c.ShowThread(w, r)
		return
	}

	err = message.AddImage(r)
	if err != nil {
		c.Error = err.Error()
		c.ShowThread(w, r)
		return
	}

	CreateFeedItem(c.ViewUser.Uuid, "new_thread_reply", "replied in thread", message.Uuid)
	c.ShowThread(w, r)
}

func (c *Context) ViewMessageReportPOST(w web.ResponseWriter, r *web.Request) {
	message, err := FindMessageByUuid(r.PathParams["uuid"])
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}
	if message.RecieverUserUuid != c.ViewUser.Uuid {
		http.NotFound(w, r.Request)
		return
	}
	message.IsReported = true
	message.Save()
	redirectUrl := "/messages/" + message.SenderUser.Username
	http.Redirect(w, r.Request, redirectUrl, 302)
}
