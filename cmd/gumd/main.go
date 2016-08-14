package main

import (
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
}

func main() {
	go scheduler.RunForever()

	beego.Run()
}
