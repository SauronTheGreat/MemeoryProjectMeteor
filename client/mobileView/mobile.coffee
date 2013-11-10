Template.mobile.rendered = ()->
  $("#owl-example").owlCarousel(
    items : 5,
    itemsDesktop : [1199,4],
    itemsDesktopSmall : [980,3],
    itemsTablet: [768,2],
    itemsTabletSmall: false,
    itemsMobile : [479,1],
    singleItem : false,
    itemsScaleUp : false,
    autoHeight:true

  )
Template.mobile.cards = ()->
  x = crdds.find({}).fetch()[2..15]
