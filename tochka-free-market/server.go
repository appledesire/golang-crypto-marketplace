package main

import (
	"fmt"
	"net/http"

	"github.com/gocraft/web"
	// "github.com/gorilla/csrf"
	// "github.com/NYTimes/gziphandler"
	"github.com/jasonlvhit/gocron"
	// "github.com/valyala/fasthttp"
	// "github.com/valyala/fasthttp/fasthttpadaptor"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/marketplace"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/settings"
)

var (
	APP_SETTINGS = settings.GetSettings()
)

func runCrons() {
	if !APP_SETTINGS.Debug {
		marketplace.StartTransactionsCron()
		marketplace.StartWalletsCron()
		marketplace.StartStatsCron()
		marketplace.StartSERPCron()
		marketplace.StartFrontPageCron()
		marketplace.StartSupportTicketCron()
	}

	marketplace.StartCurrencyCron()

	<-gocron.Start()

}

func runWebserver() {
	// Root router
	rootRouter := web.New(marketplace.Context{})
	rootRouter.Middleware(web.StaticMiddleware("public"))
	// Marketplace router
	marketplace.ConfigureRouter(rootRouter.Subrouter(marketplace.Context{}, "/"))
	// Start HTTP server

	startHttpServer := func() {
		address := fmt.Sprintf("%s:%s", APP_SETTINGS.Host, APP_SETTINGS.Port)
		println(fmt.Sprintf("Running a HTTP server or, %s", address))
		http.ListenAndServe(address, rootRouter)
		// fasthttp.ListenAndServe(address, fasthttpadaptor.NewFastHTTPHandler(rootRouter))
	}
	// Start HTTPs server
	startHttpServer()

}

func runServer() {
	go runCrons()
	runWebserver()
}
