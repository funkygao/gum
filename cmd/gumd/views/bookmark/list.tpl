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
      <div class="caption text-left">
        <h3>{{.Title}}</h3>
        <p>{{.Description}}</p>             
        <ul class="nav nav-pills nav-justified">
          <li><span>{{.User}}</span></li>
          <li><span>最近访问 </span><span class="badgex">{{.Mtime}}</span></li>
          <li><span>访问次数 </span><span class="badge badge-default">{{.HitCnt}}</span></li>
        </ul>
        <p><a href="#" class="btn btn-warning" role="button">Button</a> <a href="#" class="btn btn-default" role="button">评论 <span class="badge">{{.CommentCnt}}</span></a></p>
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
