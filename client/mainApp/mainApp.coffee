Template.mainApp.rendered = ()->
  $('#sachinsprite').animate({
    bottom: "-4%",
    width: "22%",
    left: "-5%"
  });
  $('#logo_banner_small').fadeIn();
  $('.notchie').hide();
  $("#timeline-embed").css("background","/header..jpg")

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
#    $("body").append("<script type='text/javascript'>var timeline_config = {width: '100%', height: '100%',start_at_end: true,duration: '1000',start_zoom_adjust: 1,source: '/resouces/data1.json'}</script> ")
    $("body").append("<script type='text/javascript' src='/js/storyjs-embed.js'></script>")
    $("#menu").fadeIn()
    $("#blackbox").fadeIn()
    $("#searchbox").fadeIn()
    $("#batting").fadeIn()
    $('.notchie').hide();
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

  ,4000




