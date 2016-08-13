package controllers

import (
	"github.com/astaxie/beego"
)

// operations for Search
type SearchController struct {
	beego.Controller
}

// @Title Post
// @Description create Search
// @Param	body		body 	models.Search	true		"body for Search content"
// @Success 201 {object} models.Search
// @Failure 403 body is empty
// @router / [get]
func (c *SearchController) Get() {
	c.TplName = "search/result.tpl"
}
