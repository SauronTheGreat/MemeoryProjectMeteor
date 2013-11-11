Template.layout.events
  'click .enter':(e)->
      defaultStartUpRoutines()
      playSachinChant()

      setTimeout ()->
            @timeline_config =
              width: "100%",
              height: "100%",
              start_at_end: true,
              duration: "1000",
              start_zoom_adjust: 1,
        #      source: "/resources/data1.json"
              source:prepare_data(crdds.find({}).fetch())
            $("body").append("<script type='text/javascript' src='/js/storyjs-embed.js'></script>")
            clickButton()
         ,300

  'click #filter_search':(e)->

    searchText = $(e.currentTarget).parent().prev().val()
    card_content = crdds.find({text:{$regex:searchText,$options:'i'}}).fetch()
    reload_timeline(card_content)
#    window.location.href = "/"+searchText


  'keypress #srchbx':(e)->
    if e.which is 13
      card_content = crdds.find({text:{$regex:$(e.currentTarget).val().trim(),$options:'i'}}).fetch()
      reload_timeline(card_content)
#      window.location.href = "/"+$(e.currentTarget).val()

  'click #home':(e)->
    $("#bottomMenu").find(".active").removeClass("active")
    $(e.currentTarget).addClass("active")
    reload_timeline(crdds.find({}).fetch())

  'click #sm':(e)->
    $("#bottomMenu").find(".active").removeClass("active")
    $(e.currentTarget).addClass("active")
    card_content = crdds.find({type:'Bonus Content'}).fetch()
    reload_timeline(card_content)

  'click #ov':(e)->
    $("#bottomMenu").find(".active").removeClass("active")
    $(e.currentTarget).addClass("active")
    card_content = crdds.find({media:{$regex:'ooyala',$options:'i'}}).fetch()
    reload_timeline(card_content)




@reload_timeline = (data)->
  if data.length is 0
    noContentModal()
  else
    $("#storyjs-timeline").remove()
    setTimeout ()->

      $("#jumpToYear").hide()
      @timeline_config =
        width: "100%",
        height: "100%",
        start_at_end: true,
        duration: "1000",
        start_zoom_adjust: 1,
        source:prepare_data(data)
      $("body").append("<script type='text/javascript' src='/js/storyjs-embed.js'></script>")
      filterContentStart()
    ,200


defaultStartUpRoutines = ()->
  $("#welcome_text").fadeOut('fast')
  $(".main").show()
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

playSachinChant = ()->
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

@clickButton = ()->
#  defaultStartUpRoutines()
#  playSachinChant()


  setTimeout ()->
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

        $.each($(".slider-item"), (index, elm)->
          $(elm).find(".smbtn").addClass("social_media_share_btn");
        )

      ,4000
  ,500
  $('#storyjs-timeline').animate
    marginLeft: "+=2000px"
  , 'fast', ()->
      $('.marker').eq(($('.marker').length - 1)).find('.flag').trigger("click")


@filterContentStart = ()->
  defaultStartUpRoutines()
  setTimeout ()->
    $('.vco-feature').animate
      opacity: 1
    , 500, ()->

      $('.marker').eq(1).find('.flag').trigger("click");
      $('.vco-navigation').animate
        opacity: 1
      , 500
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

        $.each($(".slider-item"), (index, elm)->
          $(elm).find(".smbtn").addClass("social_media_share_btn");
        )

      ,700
  ,500
  $('#storyjs-timeline').animate
    marginLeft: "+=2000px"
  , 'fast', ()->
    $('.marker').eq(($('.marker').length - 1)).find('.flag').trigger("click")



@go_to_year =(target_year)->
  a = target_year;
  rand_card = parseInt($($('.date_no[value*="' + a + '"]')[Math.floor(Math.random() * $('.date_no[value*="' + a + '"]').length)]).prev().prev().val())
  $('.marker').eq(rand_card).find('.flag').trigger("click");
  $('.chosenbox').val('').trigger("chosen:updated");
  $('.chosenbox').focusout();


# wiring for the button
@add_comment_box = (v)->
  image = $(v).parents(".content").find(".cardImage").attr("src");

  header = $(v).parents(".content").find(".cardHeading").text();

  desc = $(v).parents(".content").find(".card-text-container").text();

  image= "http://sachin.starsports.com/"+image
  FB.ui
    method: "feed"
    name: header
    link: "sachin.starsports.com"
    picture: image
    caption: "Pay a tribute to sachin"
    description: desc.toString()
#  , (response) ->
#    if response and response.post_id
#      alert "Post was published."
#    else
#      alert "Post was not published."

@twitter_window = (v, e) ->
  e.preventDefault()
  width = 575
  height = 400
  left = ($(window).width() - width) / 2
  top = ($(window).height() - height) / 2
  url = $(v).attr("href")
  opts = "status=1" + ",width=" + width + ",height=" + height + ",top=" + top + ",left=" + left
  window.open url, "twitter", opts
  false
