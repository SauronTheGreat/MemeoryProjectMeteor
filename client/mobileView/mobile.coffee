Template.mobile.rendered = ()->
#  alert window.innerWidth

  $("#owl-example").owlCarousel
    items : 3, #10 items above 1000px browser width
    itemsDesktop : [1000,1], #5 items between 1000px and 901px
    itemsDesktopSmall : [900,1], # betweem 900px and 601px
    itemsTablet: [600,1], #2 items between 600 and 0
    itemsMobile : [600,1] #itemsMobile disabled - inherit from itemsTablet option
#    autoPlay: true
#    lazyLoad:true
#    lazyEffect:"fade"
    pagination:false

#Template.mobile.events
#   'click #refresh_mobile_content':(e)->
#     window.location.href = "/"


Template.mobile.cards = ()->

  start = Math.floor((Math.random()*500)+1);
  end = start+10
  if crdds.find({}).fetch().length is 755
     crdds.find({}).fetch()[start..end]
  else
     []

