<!-- Bootstrap -->
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<!-- Bootflat's JS files.-->
<script src="https://bootflat.github.io/bootflat/js/icheck.min.js"></script>
<script src="https://bootflat.github.io/bootflat/js/jquery.fs.selecter.min.js"></script>
<script src="https://bootflat.github.io/bootflat/js/jquery.fs.stepper.min.js"></script>

<script>
$(document).ready(function() {
    $('#addBookmarkBtn').click(function(e) {
      e.preventDefault();
      //alert($('#addBookmarkForm').serialize());
      //$('#addBookmarkForm').submit();
      $.post('/v1/bookmarks', 
         $('#addBookmarkForm').serialize(), 
         function(data, status, xhr) {
           //console.log(data, status, xhr);
         });
    });
    //$('#addBookmarkDialog').modal('hide');

});

$(document).keydown(function(evt) {
    if (evt.keyCode==78) {
        // 'n'
        evt.preventDefault();
        $('#addBookmarkDialog').modal('show');
    } else if (evt.keyCode==83) {
        // 's'
        evt.preventDefault();
        location.href = '/v1/bookmarks?public=1';
    } else if (evt.keyCode==191) {
        // '/'
        evt.preventDefault();
        $('#search').focus();
    } else if (evt.keyCode==16||evt.keyCode==72) {
        // '?', 'h' TODO
        evt.preventDefault();        
    }
});
</script>