<!doctype html>
<html>
<head>
  <title>gum</title>
  {{template "partials/head.tpl" .}}
</head>

<body>
{{template "partials/nav.tpl" .}}

<div class="row">
{{range $i, $b := .bookmarks}}
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img class="img-rounded" src="http://bootflat.github.io/img/thumbnail-3.jpg" >
      <div class="caption text-center">
        <h3>aa</h3>
        <p>mm</p>
        <h3>{{$b.Title}}</h3>
        <p>{{$b.Description}}</p>
        <p>
          <span>{{$b.Ctime}}</span>
          <span>{{$b.HitCnt}}</span>
          <span>{{$b.CommentCnt}}</span>
        </p>
        <p><a href="#" class="btn btn-warning" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
      </div>
    </div>
  </div>
{{end}}
</div>

{{template "partials/footer.tpl" .}}
</body>
</html>
