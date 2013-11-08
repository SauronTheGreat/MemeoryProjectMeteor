Template.mainApp.rendered = ()->
  $('#sachinsprite').animate({
    bottom: "-4%",
    width: "22%",
    left: "-5%"
  });
  $('#logo_banner_small').fadeIn();

  $('.chosenbox').chosen
    width: "100%",
    allow_single_deselect: true

  $('.chosenbox').val('').trigger("chosen:updated");
  $("audio")[0].volume = 0
  $("audio")[0].play()
  vol = 0
  interval = 300
  audiopeak = false
  fadevolumeout = setInterval(->
    if vol < 1 & not audiopeak
      vol += 0.05
      $("audio")[0].volume = Math.max(Math.min(vol, 1), 0)
    else
      audiopeak = true
      if vol > 0
        vol -= 0.05
        $("audio")[0].volume = Math.max(Math.min(vol, 1), 0)
      else
        clearInterval fadevolumeout
        $("audio")[0].pause()
  , interval)
  setTimeout ()->
    @timeline_config =
      width: "100%",
      height: "100%",
      start_at_end: true,
      duration: "1000",
      start_zoom_adjust: 1,
      source: "/resources/data1.json"
    $("body").append("<script type='text/javascript' src='/js/storyjs-embed.js'></script>")
    $('.vco-feature').animate
      opacity: 1
    , 6000, ()->
          $('.marker').eq(1).find('.flag').trigger("click");
          $('.vco-navigation').animate
            opacity: 1
          , 2000
        setTimeout ()->

          $("#menu").fadeIn()
          $("#blackbox").fadeIn()
          $("#searchbox").fadeIn()
          $("#batting").fadeIn()
          $(".vco-toolbar").fadeIn()
          $(".nav-previous").css "opacity", "1"
          $(".nav-next").css "opacity", "1"
          $(".score").show()
          $(".vco-storyjs button").show()
          $('#storyjs-timeline').animate
            marginLeft: "+=2000px"
          , 'fast', ()->
            $('.marker').eq(($('.marker').length - 1)).find('.flag').trigger("click")

          $.each($(".slider-item"), (index, elm)->
            $(elm).find(".smbtn").addClass("social_media_share_btn");
          )

        ,6000


  ,500

@go_to_year =(target_year)->
  a = target_year;
  console.log(a)
  rand_card = parseInt($($('.date_no[value*="' + a + '"]')[Math.floor(Math.random() * $('.date_no[value*="' + a + '"]').length)]).prev().prev().val())
  console.log(rand_card);
  $('.marker').eq(rand_card).find('.flag').trigger("click");
  $('.chosenbox').val('').trigger("chosen:updated");


