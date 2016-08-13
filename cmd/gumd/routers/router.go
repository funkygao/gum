package routers

import (
	"github.com/funkygao/gum/cmd/gumd/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
}
