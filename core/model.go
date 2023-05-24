package core

type Conf interface{}

type Task struct {
	Name string   `yaml:"name"`
	Cron string   `yaml:"crom"`
	Json JsonTask `yaml:"json"`
	Html HtmlTask `yaml:"html"`
}
type JsonTask struct {
	Url string `yaml:"url"`
}
type HtmlTask struct {
	Url string `yaml:"url"`
	Tag string `yaml:"tag"`
}
