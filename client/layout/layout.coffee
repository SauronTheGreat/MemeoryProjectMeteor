Template.layout.rendered = ()->


  queryData = this.data


  $("#sachinsprite").show()
  setTimeout ()->
    if queryData.searchText?
      if queryData.searchText is "special"
        card_content = crdds.find({type:'Bonus Content'}).fetch()
        $("#bottomMenu").find(".active").removeClass("active")
        $("#sm").addClass("active")


      else
        if queryData.searchText is "videos"
          card_content = crdds.find({media:{$regex:'ooyala',$options:'i'}}).fetch()
          $("#bottomMenu").find(".active").removeClass("active")
          $("#ov").addClass("active")



        else
          card_content = crdds.find({text:{$regex:queryData.searchText,$options:'i'}}).fetch()
      clickButton()
      flag = true

    else
      card_content = crdds.find({}).fetch()
      flag  = false
    if card_content.length is 0
      noContentModal()
    @timeline_config =
      width: "100%",
      height: "100%",
      start_at_end: true,
      duration: "1000",
      start_zoom_adjust: 1,
#      source: "/resources/data1.json"
      source:prepare_data(card_content)
    $("body").append("<script type='text/javascript' src='/js/storyjs-embed.js'></script>")
    if(!flag)
     $("#welcome_text").fadeIn()
  ,200


@prepare_data = (data)->

  json =
    timeline:
      headline: "Welcome"
      type: "default"
      text: "Sachin Tendulkar has spent a quarter of a century in the limelight. In this time, he has taken us on an emotional roller-coaster that has scaled epic heights and some gut-wrenching lows.<br><br>As we move inevitably towards the end, here is an attempt to bottle the magic."
      score: ""
      asset:
        media: "/assets/sachin_timeline_pics/extract/80.png"
        credit: ""
        caption: ""
  x= []
  for i in data
    date={}
    date=
      startDate: i.startDate
      headline: i.headline
      type: i.type
      score: i.score
      text: i.text
      classname: i._id
      content: i.content
      asset:
        media: i.media
        caption: ""
    x.push date


  json["timeline"]["date"] = x
  json


noContentModal = ()->
  bootbox.setDefaults
    className:"noContent"
  bootbox.dialog
    title:"No Result"
    message:"Sorry, the memory project has been stumped by your search - just like Sachin was by Mark Waugh in the 1996 World Cup semi-final. Try again."
    onEscape:()->
      true
    closeButton:true
    buttons:
      success:
        label:"Home"
        className: "btn btn-default active"
        callback: ()->
         window.location.href = "/"



