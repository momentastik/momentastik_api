var http = require('http');
var settings = require('../settings');
var httpMsgs = require('./httpMsgs');
var place = require('../controllers/place');
var card = require('../controllers/card');


http.createServer (function (req, resp){

	switch (req.method){


		case "GET":
			switch(true){
				case req.url=='/places':

				place.getListPlaces(req, resp);
				console.log("Writing places");
					break;

				case req.url=='/card':
					card.getListCards(req, resp);

					break;

				case /place\/[0-9]+/.test(req.url):
					var id = /[0-9]+/.exec(req.url);//Get the ID
					place.getPlace(req, resp,id);

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
