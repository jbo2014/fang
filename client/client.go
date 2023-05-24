package client

import (
	"flag"
	"fmt"
)

var f = flag.String("f", "", "Yaml文件路径")

func main() {
	flag.Parse()
	fmt.Println("-f", *f)
	fmt.Println("其他参数", flag.Args())
}
