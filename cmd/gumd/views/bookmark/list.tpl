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
      <a href="{{.Uri}}" target="_blank"><img class="img-rounded" src="/static/assets/img/9_thumb.png" ></a>
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12 text-center">
            <button type="button" class="btn btn-success custom-button-width .navbar-right">Like <span class="badge badge-default">{{.LikeCnt}}</span></button>
            <button type="button" class="btn btn-success custom-button-width .navbar-right">Pin <span class="badge badge-default">{{.PinCnt}}</span></button>
            <a href="#" class="btn btn-default" role="button">评论 <span class="badge">{{.CommentCnt}}</span></a>
            <button type="button" class="btn btn-default custom-button-width .navbar-right">Page</button>
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
          <li><span>{{.User}}</span></li>
          <li><span>最近访问 </span><span class="badgex">{{.Mtime}}</span></li>
          <li><span>访问次数 </span><span class="badge badge-default">{{.HitCnt}}</span></li>
        </ul>
        <p>
          <span class="tag badge badge-primary">Tag</span>&nbsp;
          <span class="tag badge badge-primary">Tag</span>
        </p>
        <p><span class="badge badge-primary">Normal</span>&nbsp;<div class="blank"></div></p>
      </div>
    </div>
  </div>
{{end}}
</div>

{{template "partials/footer.tpl" .}}
</body>
</html>
