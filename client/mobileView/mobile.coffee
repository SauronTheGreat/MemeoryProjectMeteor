Template.mobile.rendered = ()->
#  alert window.innerWidth
  alert navigator.userAgent.toLowerCase();
  $("#owl-example").owlCarousel
    items : 3, #10 items above 1000px browser width
    itemsDesktop : [1000,1], #5 items between 1000px and 901px
    itemsDesktopSmall : [900,1], # betweem 900px and 601px
    itemsTablet: [600,1], #2 items between 600 and 0
    itemsMobile : [600,1] #itemsMobile disabled - inherit from itemsTablet option


Template.mobile.cards = ()->
  x = crdds.find({}).fetch()[2..10]
