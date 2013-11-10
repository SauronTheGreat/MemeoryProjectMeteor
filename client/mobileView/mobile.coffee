Template.mobile.rendered = ()->
  $("#owl-example").owlCarousel
    items : 5, #10 items above 1000px browser width
    itemsDesktop : [1000,5], #5 items between 1000px and 901px
    itemsDesktopSmall : [900,3], # betweem 900px and 601px
    itemsTablet: [600,2], #2 items between 600 and 0
    itemsMobile : false #itemsMobile disabled - inherit from itemsTablet option


Template.mobile.cards = ()->
  x = crdds.find({}).fetch()[2..10]
