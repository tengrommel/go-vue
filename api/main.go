package main

import (
	"os"
	"strconv"

	DBFactory "github.com/learning/project/api/db"
	ServerFactory "github.com/learning/project/api/server"
)

var port int

var dbHost string
var dbPort string
var dbUser string
var dbPassword string
var dbDatabase string

func init() {
	rawPort := os.Getenv("PORT")
	if len(rawPort) > 0 {
		var err error
		port, err = strconv.Atoi(rawPort)
		if err != nil {
			panic(err)
		}
	} else {
		port = 8000
	}
	dbHost = os.Getenv("DB_HOST")
	dbPort = os.Getenv("DB_PORT")
	dbUser = os.Getenv("DB_USER")
	dbPassword = os.Getenv("DB_PASSWORD")
	dbDatabase = os.Getenv("DB_DATABASE")
}

func main() {
	db, err := DBFactory.Connect(dbHost, dbPort, dbUser, dbDatabase, dbPassword)
	if err != nil {
		panic(err)
	}
	server := ServerFactory.NewServer(port, db)
	server.Start()
}
