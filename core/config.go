package core

import (
	"io"
	"io/ioutil"
	"log"

	"gopkg.in/yaml.v3"
)

// type Config[T any] interface {
// 	ReadFile(file string) (t T, err error)
// 	ReadAll(r io.Reader) (t T, err error)
// }

type YamlConfig[T any] struct {
	// Config[any]
}

func (o YamlConfig[T]) ReadFile(file string) (t T, err error) {
	f, err := ioutil.ReadFile(file)
	if err != nil {
		log.Print(err)
		return t, err
	}

	// 转换成Struct
	err = yaml.Unmarshal(f, &t)
	if err != nil {
		log.Printf("%v\n", err.Error())
		return t, err
	}

	return t, nil
}

func (o YamlConfig[T]) ReadAll(r io.Reader) (t T, err error) {
	f, err := ioutil.ReadAll(r)
	if err != nil {
		log.Print(err)
		return t, err
	}

	// 转换成Struct
	err = yaml.Unmarshal(f, &t)
	if err != nil {
		log.Printf("%v\n", err.Error())
		return t, err
	}

	return t, nil
}
