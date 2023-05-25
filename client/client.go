package client

import (
	"flag"
	"fmt"
	"os"
)

var add = flag.NewFlagSet("add", flag.ExitOnError)
var addFile = add.String("f", "", "Yaml文件路径")
var del = flag.NewFlagSet("del", flag.ExitOnError)
var delFile = del.String("f", "", "Yaml文件路径")

func main() {
	if len(os.Args) < 1 {
		fmt.Println("expected subcommands")
		os.Exit(1)
	}

	switch os.Args[1] {
	case "add":

	case "del":
	default:
		fmt.Println("unknown subcommands")
	}
}
