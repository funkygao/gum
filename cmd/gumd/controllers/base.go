package controllers

import (
	"github.com/astaxie/beego"
)

type BaseController struct {
	beego.Controller
}

func (c *BaseController) Prepare() {
	c.Controller.Prepare()

	beego.Debug("ha")
	c.Data["ver"] = beego.AppConfig.String("ver")
}

func (c *BaseController) RenderError(err error) {
	c.TplName = "error.tpl"
	c.Data["err"] = err
}
