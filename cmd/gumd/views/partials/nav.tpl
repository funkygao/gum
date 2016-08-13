<!-- add bookmark dialog-->
<div class="modal fade" id="addBookmarkDialog" role="dialog">
  <form action="/v1/bookmarks" method="POST">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">系统信息</h4>
      </div>
      <div class="modal-body">
        <p>请认真填写</p>
        <div class="row">
           <div class="col-xs-12">
            <label>URL</label>
            <input type="text" class="form-control" placeholder="http://" name="uri" />
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <label>标题</label>
            <input type="text" class="form-control" placeholder="title" name="title" />
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <label>描述信息</label>
            <textarea type="text" class="form-control" rows="3" name="description"></textarea>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <label>标签</label>
            <textarea type="text" class="form-control" rows="2" name="tags"></textarea>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <label>是否共享</label>
            <label class="toggle">
              <input type="checkbox" checked name="public">
              <span class="handle"></span>
            </label>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-success">添加</button>
      </div>
    </div>
  </div>
</form>
</div>

<!-- navigation bar-->
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
