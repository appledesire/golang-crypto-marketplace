package main

import (
	"fmt"
	"os"
)

func main() {
	argsWithoutProg := os.Args[1:]

	if len(argsWithoutProg) == 0 || argsWithoutProg[0] == "server" {
		runServer()
	} else if argsWithoutProg[0] == "sync-models" {
		syncModels()
	} else if argsWithoutProg[0] == "sync-views" {
		syncDatabaseViews()
	} else if argsWithoutProg[0] == "update-deposits" {
		updateDeposits()
	} else if argsWithoutProg[0] == "user" {
		username, action, role := argsWithoutProg[1], argsWithoutProg[2], argsWithoutProg[3]
		manageRole(username, action, role)
	} else if argsWithoutProg[0] == "index" {
		indexItems()
	} else if argsWithoutProg[0] == "import-metro" {
		importMetroStations()
	} else if argsWithoutProg[0] == "staff-stats" {
		staffStats()
	} else {
		fmt.Println("wrong command")
	}
}
