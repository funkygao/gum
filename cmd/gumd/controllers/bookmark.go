package controllers

import (
	"encoding/json"
	"errors"
	"github.com/funkygao/gum/cmd/gumd/models"
	"strconv"
	"strings"
	"time"

	"github.com/astaxie/beego"
)

// oprations for Bookmark
type BookmarkController struct {
	BaseController
}

// @router /go/:id [get]
func (c *BookmarkController) Goto() {
	idStr := c.Ctx.Input.Param(":id")
	id, err := strconv.ParseInt(idStr, 0, 64)
	if err != nil {
		beego.Error(err)
		c.RenderError(err)
		return
	}

	v, err := models.GetBookmarkById(id)
	if err != nil {
		beego.Error(err)
		c.RenderError(err)
		return
	}
	v.HitCnt += 1
	v.Mtime = time.Now()
	models.UpdateBookmarkById(v)

	c.Redirect(v.Uri, 302)
}

// @router /like/:id [get]
func (c *BookmarkController) Like() {
	idStr := c.Ctx.Input.Param(":id")
	id, err := strconv.ParseInt(idStr, 0, 64)
	if err != nil {
		beego.Error(err)
		c.RenderError(err)
		return
	}

	v, err := models.GetBookmarkById(id)
	if err != nil {
		beego.Error(err)
		c.RenderError(err)
		return
	}
	v.LikeCnt += 1 // TODO 1 user can like only once
	models.UpdateBookmarkById(v)

	c.Data["json"] = map[string]int{"like": v.LikeCnt}
	c.ServeJSON()
}

// @Title Post
// @Description create Bookmark
// @Param	body		body 	models.Bookmark	true		"body for Bookmark content"
// @Success 201 {int} models.Bookmark
// @Failure 403 body is empty
// @router / [post]
func (c *BookmarkController) Post() {
	now := time.Now()

	var v models.Bookmark
	v.Uri = c.GetString("uri")
	v.Title = c.GetString("title")
	v.Description = c.GetString("description")
	v.Private = c.GetString("public") != "on"
	v.Ctime = now
	v.Mtime = now
	v.User = "demo" // TODO
	if id, err := models.AddBookmark(&v, strings.Split(c.GetString("tags"), " ")); err == nil {
		models.EmitJob(models.Job{
			BookmarkId: id,
			Uri:        v.Uri,
		})

		c.Redirect("/", 302)
	} else {
		c.Data["json"] = err.Error()
		c.ServeJSON()

	}
}

// @Title Get
// @Description get Bookmark by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} models.Bookmark
// @Failure 403 :id is empty
// @router /:id [get]
func (c *BookmarkController) GetOne() {
	idStr := c.Ctx.Input.Param(":id")
	id, _ := strconv.ParseInt(idStr, 0, 64)
	v, err := models.GetBookmarkById(id)
	if err != nil {
		c.Data["json"] = err.Error()
	} else {
		c.Data["json"] = v
	}
	c.ServeJSON()
}

// @Title Get All
// @Description get Bookmark
// @Param	query	query	string	false	"Filter. e.g. col1:v1,col2:v2 ..."
// @Param	fields	query	string	false	"Fields returned. e.g. col1,col2 ..."
// @Param	sortby	query	string	false	"Sorted-by fields. e.g. col1,col2 ..."
// @Param	order	query	string	false	"Order corresponding to each sortby field, if single value, apply to all sortby fields. e.g. desc,asc ..."
// @Param	limit	query	string	false	"Limit the size of result set. Must be an integer"
// @Param	offset	query	string	false	"Start position of result set. Must be an integer"
// @Success 200 {object} models.Bookmark
// @Failure 403
// @router / [get]
func (c *BookmarkController) GetAll() {
	c.TplName = "bookmark/list.tpl"

	var fields []string
	var sortby []string
	var order []string
	var query map[string]string = make(map[string]string)
	var limit int64 = 1000
	var offset int64 = 0

	if v := c.GetString("tag"); v != "" {
		l, err := models.GetBookmarksByTag(v)
		if err != nil {
			c.Data["err"] = err.Error()
		} else {
			c.Data["bookmarks"] = l
		}
		return
	}

	// fields: col1,col2,entity.col3
	if v := c.GetString("fields"); v != "" {
		fields = strings.Split(v, ",")
	}
	// limit: 10 (default is 10)
	if v, err := c.GetInt64("limit"); err == nil {
		limit = v
	}
	// offset: 0 (default is 0)
	if v, err := c.GetInt64("offset"); err == nil {
		offset = v
	}
	// sortby: col1,col2
	if v := c.GetString("sortby"); v != "" {
		sortby = strings.Split(v, ",")
	}
	// order: desc,asc
	if v := c.GetString("order"); v != "" {
		order = strings.Split(v, ",")
	}
	// query: k:v,k:v
	if v := c.GetString("query"); v != "" {
		for _, cond := range strings.Split(v, ",") {
			kv := strings.Split(cond, ":")
			if len(kv) != 2 {
				c.Data["json"] = errors.New("Error: invalid query key/value pair")
				c.ServeJSON()
				return
			}
			k, v := kv[0], kv[1]
			query[k] = v
		}
	}

	l, err := models.GetAllBookmark(query, fields, sortby, order, offset, limit)
	if err != nil {
		c.Data["err"] = err.Error()
	} else {
		c.Data["bookmarks"] = l
	}
}

// @Title Update
// @Description update the Bookmark
// @Param	id		path 	string	true		"The id you want to update"
// @Param	body		body 	models.Bookmark	true		"body for Bookmark content"
// @Success 200 {object} models.Bookmark
// @Failure 403 :id is not int
// @router /:id [put]
func (c *BookmarkController) Put() {
	idStr := c.Ctx.Input.Param(":id")
	id, _ := strconv.ParseInt(idStr, 0, 64)
	v := models.Bookmark{Id: id}
	json.Unmarshal(c.Ctx.Input.RequestBody, &v)
	if err := models.UpdateBookmarkById(&v); err == nil {
		c.Data["json"] = "OK"
	} else {
		c.Data["json"] = err.Error()
	}
	c.ServeJSON()
}

// @Title Delete
// @Description delete the Bookmark
// @Param	id		path 	string	true		"The id you want to delete"
// @Success 200 {string} delete success!
// @Failure 403 id is empty
// @router /:id [delete]
func (c *BookmarkController) Delete() {
	idStr := c.Ctx.Input.Param(":id")
	id, _ := strconv.ParseInt(idStr, 0, 64)
	if err := models.DeleteBookmark(id); err == nil {
		c.Data["json"] = "OK"
	} else {
		c.Data["json"] = err.Error()
	}
	c.ServeJSON()
}
