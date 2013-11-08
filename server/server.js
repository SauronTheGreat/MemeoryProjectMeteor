//Meteor.startup(function() { // serve channel.html file programmatically
//    var connect;
//    connect = Npm.require("connect");
//    __meteor_bootstrap__.app.use(connect.query()).use(function(req, res, next) {
//        // Need to create a Fiber since we're using synchronous http
//        // calls and nothing else is wrapping this in a fiber
//        // automatically
//        return Fiber(function() {
//            if(req.url === "/channel.html") {
//                res.writeHead(200, {
//                    'Content-Type': 'text/html'
//                });
//                return res.end('');
//            } else {
//                return next(); // if not a channel.html request, pass to next middleware.
//            }
//        }).run();
//    });
//});/**
// * Created with JetBrains RubyMine.
// * User: rushabhhathi
// * Date: 08/11/13
// * Time: 16:20
// * To change this template use File | Settings | File Templates.
// */
