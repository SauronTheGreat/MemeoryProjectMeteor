#Router.configure
#   layoutTemplate: "layout"

Router.map ->
  @route "landing",
    path: "/"
    template: "landing"
  @route "mainApp",
    path:"/mainApp"
    template:"mainApp"