package controllers

import (
	"github.com/astaxie/beego"
	"github.com/funkygao/gum/cmd/gumd/models"
)

type BaseController struct {
	beego.Controller
}

func (c *BaseController) Prepare() {
	c.Controller.Prepare()

	c.Data["ver"] = beego.AppConfig.String("ver")
}

func (c *BaseController) RenderError(err error) {
	c.TplName = "error.tpl"
	c.Data["err"] = err
}

func (c *BaseController) fetchFeeds() {
	l, err := models.GetAllFeed(nil, []string{}, []string{"ctime"}, []string{"desc"}, 0, 0)
	if err == nil {
		c.Data["feeds"] = l
	}
}
