package marketplace

import (
	"html/template"
)

type StaticPage struct {
	Title    string
	Filename string
	Body     template.HTML
}
