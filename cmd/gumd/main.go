package main

import (
	"os"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/funkygao/gum/cmd/gumd/routers"
	"github.com/funkygao/gum/cmd/gumd/scheduler"
	_ "github.com/go-sql-driver/mysql"
)

func init() {
	orm.RegisterDriver("mysql", orm.DRMySQL)
	orm.RegisterDataBase("default", "mysql", "root:@/bookmark?charset=utf8")
	orm.Debug = true // TODO

	if err := os.MkdirAll(beego.AppConfig.String("snapshot"), 0755); err != nil {
		panic(err)
	}
}

func main() {
	go scheduler.RunForever()

	beego.Run()
}
