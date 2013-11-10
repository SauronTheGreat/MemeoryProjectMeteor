#Router.configure
#   layoutTemplate: "layout"

Router.map ->
  @route "landing",
    path: "/:filterData?"
    template: "landing"
    layoutTemplate:"layout"
    yieldTemplates:
      'mainApp': {to: 'main'}
      'game':{to:'gameTemp'}
    data:()->
        searchText:this.params.filterData
    before:()->
      if navigator.userAgent.toLowerCase().indexOf("iphone") isnt -1
        window.location.href="/mm/mobile"
  @route "mobile",
     path:"/mm/mobile"
     template:"mobile"








#Router.map ->
#  @route "landing",
#    path: "/mainApp"
#    template: "mainApp"
#    layoutTemplate:"layout"



#  @route "mainApp",
#    path:"/mainApp"
#    template:"mainApp"