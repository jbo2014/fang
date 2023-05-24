package core

import (
	"io/ioutil"
	"log"

	"gopkg.in/yaml.v3"
)

type Config[T any] interface {
	Read(file string) (t T)
}

type YamlConfig struct{}

func (o YamlConfig) Read(file string) (t any) {
	f, err := ioutil.ReadFile(file)
	if err != nil {
		log.Print(err)
		return t
	}

	// 转换成Struct
	err = yaml.Unmarshal(f, &t)
	if err != nil {
		log.Printf("%v\n", err.Error())
	}

	return t
}
