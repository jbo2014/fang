package main

import (
	"log"
	"net/http"

	"fang/app"
)

func main() {
	mux := http.NewServeMux()
	mux.Handle("/site", &app.CollectHandler{})
	log.Fatal(http.ListenAndServe(":8080", mux))
}
