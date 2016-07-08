
var http = require('http');
var port = Number(process.env.PORT||1337);
http.createServer(function (req, resp) {

  if (req.method === 'GET'){
      if (req.url == '/eventos'){
        resp.writeHead(200, {'Content-type':'application/json'});
        var ejemplo = {'api':'yEAH' };
        resp.end(JSON.stringify(ejemplo));

      }

  }
}).listen(port);
console.log("Server is running at: "+ 1337);
