var http = require('http');
var settings = require('../settings');
var httpMsgs = require('./httpMsgs');
var place = require('../controllers/place');
var card = require('../controllers/card');


http.createServer (function (req, resp){

	switch (req.method){
		

		case "GET":
			switch(req.url){
				case '/':
			
					place.getListPlaces(req, resp);
					break;

				case '/card':
					card.getListCards(req, resp);

					break;
				

				default:

				httpMsgs.show404(req, resp);
			}

		break;

		default:

		httpMsgs.show404(req, resp);
		
	}


}).listen(settings.webPort, function(){

	console.log("Connected at port: " + settings.webPort);
});



