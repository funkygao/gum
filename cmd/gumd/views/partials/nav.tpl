<div class="modal fade" id="addBookmarkDialog" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">系统信息</h4>
      </div>
      <div class="modal-body">
        <p>Feel free to contact us for any issues you might have with our products.</p>
        <div class="row">
          <div class="col-xs-6">
            <label>Name</label>
            <input type="text" class="form-control" placeholder="Name">
          </div>
          <div class="col-xs-6">
            <label>Email</label>
            <input type="text" class="form-control" placeholder="Email">
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <label>Message</label>
            <textarea class="form-control" rows="3">Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac</textarea>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-success">添加</button>
      </div>
    </div>
  </div>
</div>

<div class="row">
  <nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">        
        <a class="navbar-brand" href="/">ConnectEverything</a>
      </div>
      
      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="/v1/tags">标签</a></li>
          <li class="active"><a href="/v1/bookmarks/public">探索发现</a></li>
          <li class="active"><a href="#" data-toggle="modal" data-target="#addBookmarkDialog">添加系统</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">更多<b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
              <li class="dropdown-header">TODO</li>
              <li><a href="#">gist</a></li>
              <li><a href="#">photo</a></li>
              <li class="divider"></li>
              <li class="active"><a href="#">demo</a></li>
            </ul>
          </li>
        </ul>

        <form class="navbar-form navbar-right" role="search" method="GET" action="/v1/search">
          <div class="form-search search-only">
            <i class="search-icon glyphicon glyphicon-search"></i>
            <input type="text" name="q" class="form-control search-query">
          </div>
        </form>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
</div>
