<!doctype html>
<html>
<head>
  <title>gum</title>
  {{template "partials/head.tpl" .}}
</head>

<body>
{{template "partials/nav.tpl" .}}

         <div class="example">
        <h2 class="example-title">Thumbnails</h2>
        <div class="row">
            <div class="col-sm-6 col-md-3">
              <div class="thumbnail">
                <img class="img-rounded" src="http://bootflat.github.io/img/thumbnail-1.jpg" >
                <div class="caption text-center">
                  <h3>Thumbnail label</h3>
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id ...</p>
                  <p><a href="#" class="btn btn-warning" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-3">
              <div class="thumbnail">
                <img class="img-rounded" src="http://bootflat.github.io/img/thumbnail-2.jpg">
                <div class="caption text-center">
                  <h3>Thumbnail label</h3>
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id ...</p>
                  <p><a href="#" class="btn btn-warning" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-3">
              <div class="thumbnail">
                <img class="img-rounded" src="http://bootflat.github.io/img/thumbnail-3.jpg">
                <div class="caption text-center">
                  <h3>Thumbnail label</h3>
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id ...</p>
                  <p><a href="#" class="btn btn-warning" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-3">
              <div class="thumbnail">
                <img class="img-rounded" src="http://bootflat.github.io/img/thumbnail-4.jpg">
                <div class="caption text-center">
                  <h3>Thumbnail label</h3>
                  <span class="badge badge-primary">Normal</span>&nbsp;
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id ...</p>
                  <p><a href="#" class="btn btn-warning" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                </div>
              </div>
            </div>
          </div>
      </div>


            <div class="row">
              <div class="col-md-6">
                <textarea class="form-control" rows="3"></textarea>
              </div>
              <div class="col-md-6">
                <div class="row">
                  <div class="col-md-12">
                    <div class="input-group">
                      <span class="input-group-addon">$</span>
                      <input type="text" class="form-control">
                      <span class="input-group-addon">.00</span>
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="input-group">
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-danger" tabindex="-1">Action</button>
                        <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" tabindex="-1">
                          <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                          <li><a href="#">Action</a></li>
                          <li><a href="#">Another action</a></li>
                          <li><a href="#">Something else here</a></li>
                          <li class="divider"></li>
                          <li><a href="#">Separated link</a></li>
                        </ul>
                      </div>
                      <input type="text" class="form-control">
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-primary" tabindex="-1">Action</button>
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" tabindex="-1">
                          <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                          <li><a href="#">Action</a></li>
                          <li><a href="#">Another action</a></li>
                          <li><a href="#">Something else here</a></li>
                          <li class="divider"></li>
                          <li><a href="#">Separated link</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>


{{template "partials/footer.tpl" .}}
</body>
</html>
