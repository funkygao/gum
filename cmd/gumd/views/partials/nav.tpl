<div class="container-fluid"> <!--close div tag placed inside footer.tpl-->

<!-- add bookmark dialog-->
<div class="modal fade" id="addBookmarkDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">系统信息</h4>
      </div>
      <div class="modal-body">
        <form action="/v1/bookmarks" class="form-horizontal" id="addBookmarkForm" role="form">
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
            <label>描述</label>
            <textarea type="text" class="form-control" rows="3" name="description"></textarea>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <label>标签</label>
            <textarea type="text" class="form-control" rows="2" data-role="tagsinput" name="tags"></textarea>
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
      </form>
      </div>
      <div class="modal-footer">
        <button type="submit" id="addBookmarkBtn" class="btn btn-success">发布</button>
      </div>
    </div>
  </div>
</div>

<!-- navigation bar-->
<div class="row">
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">        
        <a class="navbar-brand" href="/">LinkEverything</a>
      </div>
      
      <div class="collapse navbar-collapse">        
        <ul class="nav navbar-nav">
          <li><a href="/v1/tags"><i class="glyphicon glyphicon-tags"></i> Tags</a></li>
          <li><a href="/v1/bookmarks?public=1"><i class="glyphicon glyphicon-eye-open"></i> Explore</a></li>

          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">More<b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
              <li class="dropdown-header">Sort</li>
              <li><a href="/v1/bookmarks?sortby=id&order=desc">Latest first</a></li>
              <li><a href="/v1/bookmarks?sortby=id&order=asc">Oldest first</a></li>
              <li><a href="/v1/bookmarks?sortby=like_cnt&order=desc">Liked most first</a></li>
              <li><a href="/v1/bookmarks?sortby=hit_cnt&order=desc">Hits most first</a></li>
              <li><a href="/v1/bookmarks?sortby=comment_cnt&order=desc">Comments most first</a></li>
              <li><a href="/v1/bookmarks?sortby=pin_cnt&order=desc">Pinned most first</a></li>
              <li><a href="/v1/bookmarks?sortby=mtime&order=desc">Latest hit first</a></li>
              <li class="divider"></li>
              <li class="active"><a href="#">demo</a></li>
            </ul>
          </li>
        </ul>


        <span>&nbsp;&nbsp;<button type="button" data-toggle="modal" data-target="#addBookmarkDialog" class="btn btn-success navbar-btn"><i class="glyphicon glyphicon-pencil"></i> 发布</button></span>

        <form class="navbar-form navbar-right" role="search" method="GET" action="/v1/search">
          <div class="form-search search-only">
            <i class="search-icon glyphicon glyphicon-search"></i>
            <input type="text" name="q" id="search" class="form-control search-query">
          </div>
        </form>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
</div>


