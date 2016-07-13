var http = require('http');
var settings = require('../settings');
var httpMsgs = require('./httpMsgs');
var place = require('../controllers/place');
var card = require('../controllers/card');
var card = require('../controllers/event');


http.createServer (function (req, resp){

	switch (req.method){

		case "GET":
			switch(true){

				/*CARDS*/
				case req.url=='/card':
					card.getListCards(req, resp);
					break;

				/*PLACES*/
				case req.url=='/places':
					place.getListPlaces(req, resp);
					console.log("Writing places");
					break;


				case /places\/[0-9]+$/.test(req.url):
					var idPlace = /[0-9]+/.exec(req.url);//Get the ID of the place
					place.getPlace(req, resp,idPlace);
					break;

				case /places\/[0-9]+\/events$/.test(req.url):
					var idPlace = /[0-9]+/.exec(req.url);//Get the ID of the place
					place.getPlaceEvents(req, resp,idPlace);
					break;

				/*EVENTS*/
				case /events\/[0-9]+$/.test(req.url):
					var idEvent = /[0-9]+/.exec(req.url);//Get the ID of the event
					event.getEvent(req,resp,idEvent)
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
