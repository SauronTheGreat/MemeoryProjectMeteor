Template.layout.rendered = ()->


  queryData = this.data

  $("#sachinsprite").show()
  setTimeout ()->
    if queryData.searchText?
      card_content = crdds.find({text:{$regex:queryData.searchText,$options:'i'}}).fetch()
      clickButton()
      flag = true
    else
      card_content = crdds.find({}).fetch()
      flag  = false
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
  console.log data
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




