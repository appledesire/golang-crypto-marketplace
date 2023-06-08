package bots

import (
	"github.com/mattermost/mattermost-server/model"
)

type MattermostBot struct {
	Client *model.Client4
}

func NewMattermostBot(url string) MattermostBot {
	mattermostBot := MattermostBot{
		Client: model.NewAPIv4Client(url),
	}
}

func ParseMattermostCommand() {
	model.NewAPIv4Client
}
