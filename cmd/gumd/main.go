package main

import (
	_ "github.com/funkygao/gum/cmd/gumd/routers"
	"github.com/astaxie/beego"
)

func main() {
	beego.Run()
}

