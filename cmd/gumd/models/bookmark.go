package models

import (
	"errors"
	"fmt"
	"github.com/astaxie/beego/orm"
	"reflect"
	"strings"
	"time"
)

type Bookmark struct {
	Id          int64  `orm:"auto"`
	User        string `orm:"size(128)"`
	Uri         string `orm:"size(255)"`
	Title       string `orm:"type(longtext)"`
	Description string `orm:"type(longtext)"`
	Private     bool
	CommentCnt  int
	HitCnt      int
	Pin         bool
	Ctime       time.Time `orm:"type(datetime)"`
	Mtime       time.Time `orm:"type(datetime)"`
}

func (b *Bookmark) Thumbnail() string {
	return fmt.Sprintf("/static/assets/img/%d_thumb.png", b.Id)
}

func init() {
	orm.RegisterModel(new(Bookmark))
}

// AddBookmark insert a new Bookmark into database and returns
// last inserted Id on success.
func AddBookmark(m *Bookmark, tags []string) (id int64, err error) {
	o := orm.NewOrm()
	o.Begin()
	id, err = o.Insert(m)
	if err != nil {
		o.Rollback()
		return
	}

	var feed Feed
	feed.BookmarkId = id
	feed.Body = "" // TODO
	feed.Ctime = m.Ctime
	if _, err = o.Insert(&feed); err != nil {
		o.Rollback()
		return
	}

	// add tags
	for _, t := range tags {
		if strings.TrimSpace(t) == "" {
			continue
		}

		var tag Tag
		tag.BookmarkId = id
		tag.Tag = t
		tag.Ctime = m.Ctime
		if _, err = o.Insert(&tag); err != nil {
			o.Rollback()
			return
		}
	}

	err = o.Commit()
	return
}

// GetBookmarkById retrieves Bookmark by Id. Returns error if
// Id doesn't exist
func GetBookmarkById(id int64) (v *Bookmark, err error) {
	o := orm.NewOrm()
	v = &Bookmark{Id: id}
	if err = o.Read(v); err == nil {
		return v, nil
	}
	return nil, err
}

// GetAllBookmark retrieves all Bookmark matches certain condition. Returns empty list if
// no records exist
func GetAllBookmark(query map[string]string, fields []string, sortby []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(Bookmark))
	// query k=v
	for k, v := range query {
		// rewrite dot-notation to Object__Attribute
		k = strings.Replace(k, ".", "__", -1)
		qs = qs.Filter(k, v)
	}
	// order by:
	var sortFields []string
	if len(sortby) != 0 {
		if len(sortby) == len(order) {
			// 1) for each sort field, there is an associated order
			for i, v := range sortby {
				orderby := ""
				if order[i] == "desc" {
					orderby = "-" + v
				} else if order[i] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
			qs = qs.OrderBy(sortFields...)
		} else if len(sortby) != len(order) && len(order) == 1 {
			// 2) there is exactly one order, all the sorted fields will be sorted by this order
			for _, v := range sortby {
				orderby := ""
				if order[0] == "desc" {
					orderby = "-" + v
				} else if order[0] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
		} else if len(sortby) != len(order) && len(order) != 1 {
			return nil, errors.New("Error: 'sortby', 'order' sizes mismatch or 'order' size is not 1")
		}
	} else {
		if len(order) != 0 {
			return nil, errors.New("Error: unused 'order' fields")
		}
	}

	var l []Bookmark
	qs = qs.OrderBy(sortFields...)
	if _, err := qs.Limit(limit, offset).All(&l, fields...); err == nil {
		if len(fields) == 0 {
			for _, v := range l {
				ml = append(ml, v)
			}
		} else {
			// trim unused fields
			for _, v := range l {
				m := make(map[string]interface{})
				val := reflect.ValueOf(v)
				for _, fname := range fields {
					m[fname] = val.FieldByName(fname).Interface()
				}
				ml = append(ml, m)
			}
		}
		return ml, nil
	}
	return nil, err
}

// UpdateBookmark updates Bookmark by Id and returns error if
// the record to be updated doesn't exist
func UpdateBookmarkById(m *Bookmark) (err error) {
	o := orm.NewOrm()
	v := Bookmark{Id: m.Id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

// DeleteBookmark deletes Bookmark by Id and returns error if
// the record to be deleted doesn't exist
func DeleteBookmark(id int64) (err error) {
	o := orm.NewOrm()
	v := Bookmark{Id: id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Delete(&Bookmark{Id: id}); err == nil {
			fmt.Println("Number of records deleted in database:", num)
		}
	}
	return
}
