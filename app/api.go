package app

import (
	"net/http"
	"regexp"

	"fang/core"
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
	// req, err := ioutil.ReadAll(r.Body)
	// if err != nil {
	// 	internalServerError(w, r)
	// 	return
	// }

	// var ts []core.Task
	// // h.store.Lock()
	// // h.store.m[u.ID] = u
	// // h.store.Unlock()
	// if err := json.Unmarshal(req, &ts); err != nil {
	// 	internalServerError(w, r)
	// 	return
	// }

	yml := core.YamlConfig[[]core.Task]{}
	ts, err := yml.ReadAll(r.Body)
	if err != nil {
		internalServerError(w, r)
		return
	}

	core.CreateJobs(ts)
	w.WriteHeader(http.StatusOK)
	// w.Write(jsonBytes)
	// json.NewEncoder(w).Encode(req)
}

func (c *CollectHandler) Delete(w http.ResponseWriter, r *http.Request) {
	// req, err := ioutil.ReadAll(r.Body)
	// if err != nil {
	// 	internalServerError(w, r)
	// 	return
	// }

	// var ts []core.Task
	// if err := json.Unmarshal(req, &ts); err != nil {
	// 	internalServerError(w, r)
	// 	return
	// }

	yml := core.YamlConfig[[]core.Task]{}
	ts, err := yml.ReadAll(r.Body)
	if err != nil {
		internalServerError(w, r)
		return
	}

	var names []string
	for _, t := range ts {
		names = append(names, t.Name)
	}
	core.DeleteJobs(names...)
	w.WriteHeader(http.StatusOK)
}

func internalServerError(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusInternalServerError)
	w.Write([]byte("internal server error"))
}

func notFound(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusNotFound)
	w.Write([]byte("not found"))
}
