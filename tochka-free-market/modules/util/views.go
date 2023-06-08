package util

import (
	"encoding/json"
	"fmt"
	"net/http"
	"reflect"
	"time"

	"github.com/eknkc/amber"
	"github.com/gocraft/web"
)

var amberOption = amber.Options{PrettyPrint: true, LineNumbers: false}
var amberDirOptions = amber.DirOptions{Ext: ".amber", Recursive: true}
var templates, err = amber.CompileDir("templates", amberDirOptions, amberOption)

func RenderTemplate(w web.ResponseWriter, template string, params interface{}) {
	if err != nil {
		panic(fmt.Sprintf("Could not compile templates: %v", err))
	}

	r := reflect.ValueOf(params).Elem()
	f := r.FieldByName("PageRenderStart")
	fieldValue := f.Interface()

	renderStart := fieldValue.(time.Time)
	renderEnd := time.Now()
	renderTimeSeconds := uint64(renderEnd.Sub(renderStart).Nanoseconds() / 1000000)

	f = r.FieldByName("PageRenderTime")
	// make sure that this field is defined, and can be changed.
	if f.IsValid() && f.CanSet() && f.Kind() == reflect.Uint64 {
		f.SetUint(renderTimeSeconds)
	}

	tmpl := templates[template]
	tmpl.Execute(w, params)
}

// func RenderTemplateOrAPIResponse(w web.ResponseWriter, r *web.Request, template string, params interface{}) {
// 	if len(r.URL.Query()["json"]) > 0 {
// 		APIResponse(w, r, params)
// 	} else {
// 		if err != nil {
// 			panic(fmt.Sprintf("Could not compile templates: %v", err))
// 		}

// 		tmpl := templates[template]
// 		tmpl.Execute(w, params)
// 	}
// }

func APIResponse(w web.ResponseWriter, r *web.Request, params interface{}) {
	json, err := json.MarshalIndent(params, "", "\t")
	if err != nil {
		http.NotFound(w, r.Request)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(json)
}

func RedirectOrAPIResponse(w web.ResponseWriter, r *web.Request, redirectUrl string, params interface{}) {
	if len(r.URL.Query()["json"]) > 0 {
		APIResponse(w, r, params)
	} else {
		http.Redirect(w, r.Request, redirectUrl, 302)
		return
	}
}
