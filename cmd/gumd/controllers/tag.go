package controllers

import (
	"encoding/json"
	"strconv"

	"github.com/funkygao/gum/cmd/gumd/models"
)

// oprations for Tag
type TagController struct {
	BaseController
}

// @Title Post
// @Description create Tag
// @Param	body		body 	models.Tag	true		"body for Tag content"
// @Success 201 {int} models.Tag
// @Failure 403 body is empty
// @router / [post]
func (c *TagController) Post() {
	var v models.Tag
	json.Unmarshal(c.Ctx.Input.RequestBody, &v)
	if _, err := models.AddTag(&v); err == nil {
		c.Ctx.Output.SetStatus(201)
		c.Data["json"] = v
	} else {
		c.Data["json"] = err.Error()
	}
	c.ServeJSON()
}

// @Title Get
// @Description get Tag by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} models.Tag
// @Failure 403 :id is empty
// @router /:id [get]
func (c *TagController) GetOne() {
	idStr := c.Ctx.Input.Param(":id")
	id, _ := strconv.ParseInt(idStr, 0, 64)
	v, err := models.GetTagById(id)
	if err != nil {
		c.Data["json"] = err.Error()
	} else {
		c.Data["json"] = v
	}
	c.ServeJSON()
}

// @Title Get All
// @Description get Tag
// @Param	query	query	string	false	"Filter. e.g. col1:v1,col2:v2 ..."
// @Param	fields	query	string	false	"Fields returned. e.g. col1,col2 ..."
// @Param	sortby	query	string	false	"Sorted-by fields. e.g. col1,col2 ..."
// @Param	order	query	string	false	"Order corresponding to each sortby field, if single value, apply to all sortby fields. e.g. desc,asc ..."
// @Param	limit	query	string	false	"Limit the size of result set. Must be an integer"
// @Param	offset	query	string	false	"Start position of result set. Must be an integer"
// @Success 200 {object} models.Tag
// @Failure 403
// @router / [get]
func (c *TagController) GetAll() {
	c.TplName = "tag/list.tpl"
	l, err := models.GroupTags()
	if err != nil {
		c.Data["json"] = err.Error()
	} else {
		c.Data["tags"] = l
	}
	return

}

// @Title Update
// @Description update the Tag
// @Param	id		path 	string	true		"The id you want to update"
// @Param	body		body 	models.Tag	true		"body for Tag content"
// @Success 200 {object} models.Tag
// @Failure 403 :id is not int
// @router /:id [put]
func (c *TagController) Put() {
	idStr := c.Ctx.Input.Param(":id")
	id, _ := strconv.ParseInt(idStr, 0, 64)
	v := models.Tag{Id: id}
	json.Unmarshal(c.Ctx.Input.RequestBody, &v)
	if err := models.UpdateTagById(&v); err == nil {
		c.Data["json"] = "OK"
	} else {
		c.Data["json"] = err.Error()
	}
	c.ServeJSON()
}

// @Title Delete
// @Description delete the Tag
// @Param	id		path 	string	true		"The id you want to delete"
// @Success 200 {string} delete success!
// @Failure 403 id is empty
// @router /:id [delete]
func (c *TagController) Delete() {
	idStr := c.Ctx.Input.Param(":id")
	id, _ := strconv.ParseInt(idStr, 0, 64)
	if err := models.DeleteTag(id); err == nil {
		c.Data["json"] = "OK"
	} else {
		c.Data["json"] = err.Error()
	}
	c.ServeJSON()
}
