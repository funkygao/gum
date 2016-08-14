<!doctype html>
<html>
<head>
  <title>gum</title>
  {{template "partials/head.tpl" .}}
</head>

<body>
{{template "partials/nav.tpl" .}}

<div class="row">
{{range .bookmarks}}
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <a href="/v1/bookmarks/go/{{.Id}}" target="_blank"><img class="img-rounded" src="{{.Thumbnail}}" ></a>
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12 text-left">
            <button type="button" class="btn btn-default custom-button-width .navbar-right"><i class="glyphicon glyphicon-thumbs-up"></i> <span class="badge badge-default">{{.LikeCnt}}</span></button>
            <button type="button" class="btn btn-default custom-button-width .navbar-right"><i class="glyphicon glyphicon-pushpin"></i> <span class="badge badge-default">{{.PinCnt}}</span></button>
            <a href="#" class="btn btn-default" role="button"><i class="glyphicon glyphicon-comment"></i> <span class="badge">{{.CommentCnt}}</span></a>
            <button type="button" class="btn btn-default custom-button-width .navbar-right"><i class="glyphicon glyphicon-home"></i></button>
          </div>
        </div>

        <div class="row">
          <div class="col-md-12 text-right">
            <!--TODO use label-->
            <button type="button" class="btn btn-default custom-button-width .navbar-right">Publish</button>
            <button type="button" class="btn btn-warning custom-button-width .navbar-right">Edit</button>
            <button type="button" class="btn btn-danger custom-button-width .navbar-right">Delete</button>                        
          </div>
        </div>
      </div>

      <div class="caption text-left">
        <h3>{{.Title}}</h3>
        <p>{{.Description}}</p>
        <ul class="nav nav-pills nav-justified">
          <li><span><i class="glyphicon glyphicon-user"></i> {{.User}}</span></li>
          <li><span>访问 </span><span class="badge badge-default">{{.HitCnt}}</span></li>
          <li><span>最近 </span><span class="badgex">{{.SinceMtime}}</span></li>
          <li><span>发布 </span><span class="badgex">{{.SinceCtime}}</span></li>
        </ul>
        <p>
        {{range .Tags}}
          <a class="tag badge badge-primary" href="/v1/bookmarks?tag={{.}}"><i class="glyphicon glyphicon-tag"></i> {{.}}</a>
        {{end}}
        </p>
      </div>

      <div class="row">
        <div class="col-md-12 text-right">
          <input type="text" class="form-control" placeholder="Add a comment...">
        </div>
      </div>      

    </div>
  </div>
{{end}}
</div>

{{template "partials/footer.tpl" .}}
{{template "partials/scripts.tpl" .}}
</body>
</html>
