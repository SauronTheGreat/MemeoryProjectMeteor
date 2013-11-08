fbSdkLoader = ->
  unless Session.get("is Facebook JDK loaded?") # Load Facebook JDK only once.
    Session.set "is Facebook JDK loaded?", true
    window.fbAsyncInit = -> # See Facebook JavaScript JDK docs at: https://developers.facebook.com/docs/reference/javascript/
      # Init the FB JS SDK
      initConfig =
        appId: "661175753913911" # App ID from the App Dashboard
        channelUrl: "/channel.html" # channel url for FB
        status: false # check the login status upon init?
        cookie: false # set sessions cookies to allow your server to access the session?
        xfbml: false # parse XFBML tags on this page?

      FB.init initConfig

    ((d, debug) -> # Load the SDK's source Asynchronously
      js = undefined
      id = "facebook-jssdk"
      ref = d.getElementsByTagName("script")[0]
      return  if d.getElementById(id)
      js = d.createElement("script")
      js.id = id
      js.async = true
      js.src = "//connect.facebook.net/en_US/all" + ((if debug then "/debug" else "")) + ".js"
      ref.parentNode.insertBefore js, ref
    ) document, false #debug

fbSdkLoader() # run the loader