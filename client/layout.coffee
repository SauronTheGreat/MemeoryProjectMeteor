Template.layout.rendered = ()->

  setTimeout ()->
    @timeline_config =
      width: "100%",
      height: "100%",
      start_at_end: true,
      duration: "1000",
      start_zoom_adjust: 1,
      source: "/resources/data1.json"
    $("body").append("<script type='text/javascript' src='/js/storyjs-embed.js'></script>")
    $("#welcome_text").fadeIn()
  ,50