package app

import (
	"encoding/json"
	"net/http"
	"regexp"
)

var (
	listSiteRe   = regexp.MustCompile(`^\/sites[\/]*$`)
	getSiteRe    = regexp.MustCompile(`^\/site\/(\d+)$`)
	createSiteRe = regexp.MustCompile(`^\/site[\/]*$`)
	deleteSiteRe = regexp.MustCompile(`^\/site\/(\w+)*$`)
)

type CollectHandler struct{}

func (c *CollectHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	// Set the return Content-Type as JSON like before
	w.Header().Set("Content-Type", "application/json")

	// Change the response depending on the method being requested
	switch {
	case r.Method == http.MethodPost && createSiteRe.MatchString(r.URL.Path):
		c.Create(w, r)
		return
	case r.Method == http.MethodDelete && deleteSiteRe.MatchString(r.URL.Path):
		c.Delete(w, r)
		return
	default:
		notFound(w, r)
		return
	}
}

func (c *CollectHandler) Create(w http.ResponseWriter, r *http.Request) {
	var t []string
	if err := json.NewDecoder(r.Body).Decode(&t); err != nil {
		internalServerError(w, r)
		return
	}

	// h.store.Lock()
	// h.store.m[u.ID] = u
	// h.store.Unlock()
	// jsonBytes, err := json.Marshal(t)
	// if err != nil {
	// 	internalServerError(w, r)
	// 	return
	// }
	// w.WriteHeader(http.StatusOK)
	// w.Write(jsonBytes)
}

func (c *CollectHandler) Delete(w http.ResponseWriter, r *http.Request) {}

func internalServerError(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusInternalServerError)
	w.Write([]byte("internal server error"))
}

func notFound(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusNotFound)
	w.Write([]byte("not found"))
}
