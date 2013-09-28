$(document).ready( function() {
  $("#scroll-spy").on('activate.bs.scrollspy', function(e) {
    $(".jumbotron").animate({
      backgroundColor: "#eee"
    }, 200);
    $($(e.target).data("activates")).animate( {
      backgroundColor: "#f671bb"
    }, 200);
  });
});
