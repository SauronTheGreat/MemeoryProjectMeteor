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