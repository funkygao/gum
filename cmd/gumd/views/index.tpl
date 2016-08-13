<!doctype html>
<html>
<head>
<title>Minimal Bootflat example</title>
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://bootflat.github.io/bootflat/css/bootflat.css">
</head>

<body>
<div class="row">
  <nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/">GUM</a>
      </div> <!-- navbar-header-->
      
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li class="active1"><a href="#">Tags</a></li>
          <li class="active1"><a href="#">Add</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
              <li class="dropdown-header">Setting</li>
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li class="divider"></li>
              <li class="active"><a href="#">Separated link</a></li>
              <li class="divider"></li>
              <li class="disabled"><a href="#">One more separated link</a></li>
            </ul>
          </li>
        </ul>

        <form class="navbar-form navbar-right" role="search">
          <div class="form-search search-only">
            <i class="search-icon glyphicon glyphicon-search"></i>
            <input type="text" class="form-control search-query">
          </div>
        </form>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
</div>

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

<!-- Bootstrap -->
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<!-- Bootflat's JS files.-->
<script src="https://bootflat.github.io/bootflat/js/icheck.min.js"></script>
<script src="https://bootflat.github.io/bootflat/js/jquery.fs.selecter.min.js"></script>
<script src="https://bootflat.github.io/bootflat/js/jquery.fs.stepper.min.js"></script>

</body>
</html>
