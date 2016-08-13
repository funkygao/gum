package routers

import (
	"github.com/astaxie/beego"
	"github.com/funkygao/gum/cmd/gumd/controllers"
)

func init() {
	beego.Router("/", &controllers.MainController{})

	ns := beego.NewNamespace("/v1",
		beego.NSNamespace("/bookmarks", beego.NSInclude(&controllers.BookmarkController{})),
		beego.NSNamespace("/comments", beego.NSInclude(&controllers.CommentController{})),
		beego.NSNamespace("/tags", beego.NSInclude(&controllers.TagController{})),
		beego.NSNamespace("/search", beego.NSInclude(&controllers.SearchController{})),
	)
	beego.AddNamespace(ns)
}
