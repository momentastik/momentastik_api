var http = require('http');
var url = require("url");


var settings = require('../settings');
var httpMsgs = require('./httpMsgs');
var place = require('../controllers/place');
var card = require('../controllers/card');
var event = require('../controllers/event');


http.createServer (function (req, resp){

	switch (req.method){

		case "GET":
			switch(true){

				/*CARDS*/
				case /cards$/.test(req.url):

					card.getListCards(req, resp);
					break;

				/*PLACES*/
				case /places\?+/.test(req.url):

					var parts = url.parse(req.url, true);
					console.log(parts);

					if (typeof parts.query.card_id !== 'undefined' &&
					    typeof parts.query.longi !== 'undefined'   &&
					    typeof parts.query.lati !== 'undefined'   &&
					    typeof parts.query.ratio !== 'undefined'
					){
						place.getListPlaces(req, resp,parts.query.card_id);

					}else{
						//TODO Error 500 
						httpMsgs.show404(req, resp);

					}

					break;


				case /places\/[0-9]+$/.test(req.url):
					var idPlace = /[0-9]+/.exec(req.url);//Get the ID of the place
					place.getPlace(req, resp,idPlace);
					break;

				case /places\/[0-9]+\/events$/.test(req.url):
					var idPlace = /[0-9]+/.exec(req.url);//Get the ID of the place
					place.getPlaceEvents(req, resp,idPlace);
					break;
				case /places\/[0-9]+\/images/.test(req.url):
					var idevent = /[0-9]+/.exec(req.url);//get the id of the event
					place.getPlaceImages(req, resp, idevent);

					break;


				/*EVENTS*/
				case /events\?+/.test(req.url):

					var parts = url.parse(req.url, true);
					console.log(parts.query);
					if (typeof parts.query.card_id !== 'undefined' &&
					    typeof parts.query.longi !== 'undefined'   &&
					    typeof parts.query.lati !== 'undefined'   &&
					    typeof parts.query.ratio !== 'undefined'
					){
						event.getListEvents(req, resp,parts.query.card_id);

					}else{
						//TODO Error 500 
						httpMsgs.show404(req, resp);

					}

					break;


				case /events\/[0-9]+$/.test(req.url):
					var idEvent = /[0-9]+/.exec(req.url);//Get the ID of the event
					event.getEvent(req,resp,idEvent)
					break;

				
				case /events\/[0-9]+\/images/.test(req.url):
					var idevent = /[0-9]+/.exec(req.url);//get the id of the event
					event.getEventImages(req, resp, idevent);

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
