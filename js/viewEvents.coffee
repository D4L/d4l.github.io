---
---

$ ->
  $("#scroll-spy").on 'activate.bs.scrollspy', (e) ->
    $(".jumbotron").animate
      backgroundColor: "#eee"
    , 200
    $($(e.target).data("activates")).animate
      backgroundColor: "#f671bb"
    ,200
