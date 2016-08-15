package models

import (
	"fmt"
	"strconv"

	"github.com/astaxie/beego/orm"
)

type TagGroup struct {
	Name     string
	Children int
}

func GroupTags() (ml []interface{}, err error) {
	var maps []orm.Params
	o := orm.NewOrm()
	sql := fmt.Sprintf("select tag,count(bookmark_id) c from tag group by tag order by c desc")
	if _, err = o.Raw(sql).Values(&maps); err != nil {
		return
	}

	for _, p := range maps {
		c, _ := strconv.Atoi(p["c"].(string))
		ml = append(ml, TagGroup{
			Name:     p["tag"].(string),
			Children: c,
		})
	}

	return
}
