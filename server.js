var http = require('http');
var port = Number(process.env.PORT||1337);
http.createServer(function (req, resp) {

  resp.writeHead(200, {'Content-type':'text/html'})
  resp.end('okeys');

}).listen(port);
