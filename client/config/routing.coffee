#Router.configure
#   layoutTemplate: "layout"

Router.map ->
  @route "landing",
    path: "/"
    template: "landing"
    layoutTemplate:"layout"
    yieldTemplates:
      'mainApp': {to: 'main'}


#Router.map ->
#  @route "landing",
#    path: "/mainApp"
#    template: "mainApp"
#    layoutTemplate:"layout"



#  @route "mainApp",
#    path:"/mainApp"
#    template:"mainApp"