<!doctype html>
<html>
<head>
  <title>gum</title>
  {{template "partials/head.tpl" .}}
</head>

<body>

{{template "partials/nav.tpl" .}}

<div class="row">
  <div class="col-md-9">
  <div class="row">
{{range .bookmarks}}
    <div class="thumbnail col-md-6">
      <a href="/v1/bookmarks/go/{{.Id}}" target="_blank"><img class="img-rounded" src="{{.ThumbnailUrl}}" ></a>

      <div class="row">
        <div class="col-md-12 text-right">
          <button type="button" class="btn btn-default custom-button-width .navbar-right">Publish</button>
          <button type="button" class="btn btn-warning custom-button-width .navbar-right">Edit</button>
          <button type="button" class="btn btn-danger custom-button-width .navbar-right">Delete</button>                        
        </div>
      </div>

      <div class="caption text-left">
        <h3>{{.Title}}</h3>
        <p><pre>{{.Description}}</pre></p>
        <ul class="nav nav-pills nav-justified">
          <li><span><i class="glyphicon glyphicon-user"></i> {{.User}}</span></li>
          <li><span>访问 </span><span class="badge badge-default">{{.HitCnt}}</span></li>
          <li><span class="badgex">{{.SinceMtime}} / {{.SinceCtime}}</span></li>
        </ul>
      </div>

      <div class="row">
        <div class="col-md-12 text-left">
          <ul class="nav nav-pills" role="tablist">
            <li role="presentation"><a href="/v1/bookmarks/like/{{.Id}}" target="_blank"><i class="glyphicon glyphicon-thumbs-up"></i> <span class="badge badge-default">{{.LikeCnt}}</span></a></li>
            <li role="presentation"><a href="#"><i class="glyphicon glyphicon-pushpin"></i> <span class="badge badge-default">{{.PinCnt}}</span></a></li>
            <li role="presentation"><a href="#"><i class="glyphicon glyphicon-comment"></i> <span class="badge">{{.CommentCnt}}</span></a></li>
            <li role="presentation"><a href="#"><i class="glyphicon glyphicon-home"></i></a></li>
          </ul>
        </div>
      </div>

      <div class="row">
        <div class="col-md-12 text-left">
          {{range .Tags}}
          <a class="tag badge badge-primary" href="/v1/bookmarks?tag={{.}}"><i class="glyphicon glyphicon-tag"></i> {{.}}</a>
          {{end}}
        </div>
      </div>        

      <br/>

      <div class="row">
        <div class="col-md-12 text-right">
          <input type="text" class="form-control" placeholder="Add a comment...">
        </div>
      </div>

    </div>
{{end}}
  </div> <!-- row-->
  </div> <!-- col-md-9-->

  <div class="col-md-3">
    <div class="row">
      <p>feeds</p>
    </div>
  </div>
</div>

{{template "partials/footer.tpl" .}}
{{template "partials/scripts.tpl" .}}
</body>
</html>
