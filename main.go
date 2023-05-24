package main

import (
	"log"
	"net/http"
)

func main() {
	mux := http.NewServeMux()
	mux.Handle("/site", &CollectHandler{})
	log.Fatal(http.ListenAndServe(":8080", mux))
}
