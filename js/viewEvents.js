(function() {
  $(function() {
    return $("#scroll-spy").on('activate.bs.scrollspy', function(e) {
      $(".jumbotron").animate({
        backgroundColor: "#eee"
      }, 200);
      return $($(e.target).data("activates")).animate({
        backgroundColor: "#f671bb"
      }, 200);
    });
  });

}).call(this);
