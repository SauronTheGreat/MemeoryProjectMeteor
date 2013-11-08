Handlebars.registerHelper "loadfile",()->
  $("body").append("<script type='text/javascript' src='/js/storyjs-embed.js'")
  $("body").append("<script type='text/javascript' src='/js/timeline-min.js'")
  $("body").append("<link href='/js/timeline.css' type='text/css'> ")



Template.landing.rendered = ()->
  $("#welcome_text").fadeOut (->
    setTimeout ->
      $(".vco-feature").animate
        opacity: 1
      , 6000, ->
        $(".marker").eq(1).find(".flag").trigger "click"
        $(".vco-navigation").animate
          opacity: 1
        , 2000

      setTimeout (->
        $("#menu").fadeIn()
        $("#blackbox").fadeIn()
        $("#searchbox").fadeIn()
        $("#batting").fadeIn()  unless tabletLandscape
        $(".vco-toolbar").fadeIn()
        $(".nav-previous").css "opacity", "1"
        $(".nav-next").css "opacity", "1"
        $(".score").show()
        $(".vco-storyjs button").show()
      ), 4000

    ), 1000
