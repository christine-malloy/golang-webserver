package main

import (
	"fmt"
	"log"
	"os"
	"github.com/christinemalloy/golang-webserver/pkg/router"
)

func main() {
	fmt.Println("Starting up Golang Webserver")

	// Creates a router with basic logging and recovery middleware already attached
	// Sets up route handlers
	r := router.SetupRouter()

	// set port
	port := os.Getenv("API_TCP_PORT")
	if port == "" {
		log.Println("API_TCP_PORT not set explicitly, defaulting to 9000")
		port = "9000"
	}

	// run router
	err := r.Run(":" + port)
	if err != nil {
		log.Fatalf("could not run router: %s\n", err.Error())
	}
}