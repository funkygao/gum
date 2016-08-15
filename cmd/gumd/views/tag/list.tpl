<!doctype html>
<html>
<head>
  <title>gum</title>
  {{template "partials/head.tpl" .}}
</head>

<body>
{{template "partials/nav.tpl" .}}

<div class="row">
	<div class="col-md-6">
		<h2>Tags</h2>

		<ul class="list-group">
{{range .tags}}
<li class="list-group-item"><span class="badge">{{.Children}}</span><a href="/v1/bookmarks?tag={{.Name}}">{{.Name}}</a></li>
{{end}}
		</ul>
	</div>
</div>

{{template "partials/footer.tpl" .}}
{{template "partials/scripts.tpl" .}}
</body>
</html>
