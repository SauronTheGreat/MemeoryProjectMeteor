#Router.configure
#   layoutTemplate: "layout"

Router.map ->
  @route "landing",
    path: "/:optionalParam?"
    template: "landing"
    layoutTemplate:"layout"
    yieldTemplates:
      'mainApp': {to: 'main'}
      'game':{to:'gameTemp'}
    data:()->
        searchText:this.params.optionalParam




#Router.map ->
#  @route "landing",
#    path: "/mainApp"
#    template: "mainApp"
#    layoutTemplate:"layout"



#  @route "mainApp",
#    path:"/mainApp"
#    template:"mainApp"