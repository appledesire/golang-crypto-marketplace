package apis

import (
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

type MattermostEventField struct {
	Title string `json:"title,omitempty"`
	Value string `json:"value,omitempty"`
	Short bool   `json:"short"`
}

type MattermostEvent struct {
	Text        string                      `json:"text"`
	Attachments []MattermostEventAttachment `json:"attachments,omitempty"`
	Short       bool
}

type MattermostEventAttachment struct {
	Fallback   string                 `json:"fallback"`
	Text       string                 `json:"text,omitempty""`
	Color      string                 `json:"color,omitempty"`
	AuthorName string                 `json:"author_name,omitempty"`
	AuthorLink string                 `json:"author_link,omitempty"`
	Pretext    string                 `json:"pretext,omitempty"`
	Fields     []MattermostEventField `json:"fields,omitempty"`
}

func PostMattermostEvent(url, text string) {
	ir := MattermostEvent{Text: text}
	util.TorJSONPOST(url, ir)
}

func PostMattermostRawEvent(url string, ir MattermostEvent) {
	util.TorJSONPOST(url, ir)
}
