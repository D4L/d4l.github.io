$(document).ready( function() {
  $("#scroll-spy").on('activate.bs.scrollspy', function(e) {
    $(".jumbotron-background").animate({
      opacity: 0
    }, 200);
    $($(e.target).data("activates")).find(".jumbotron-background").animate( {
      opacity: 1
    }, 200);
  });
});
