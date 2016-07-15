var db = require('../core/db');
var httpMsgs = require('../core/httpMsgs');
var util = require('util');

exports.getListEvents = function(req, resp,idCard){

	db.executeSQL("SELECT * FROM Event INNER JOIN R_CARD_EVENT on Event.id=R_CARD_EVENT.idEvent AND "+

		"R_CARD_EVENT.idCard="+idCard
		, function(error, rows){

		if (error){
			httpMsgs.show500(req, resp, err);
		}else{
			httpMsgs.sendJson(req, resp, rows);
		}

	});
};

exports.getEvent = function(req, resp, id){

	db.executeSQL("SELECT * FROM Event WHERE Event.id = "+id, function(error, rows){

		if (error){
			httpMsgs.show500(req, resp, err);
		}else{
			httpMsgs.sendJson(req, resp, rows);
		}

	});
};



exports.getEventImages = function(req, resp, idEvent){

	db.executeSQL ("SELECT * FROM ImageEvent INNER JOIN Event on Event.id=ImageEvent.idEvent AND Event.id="+idEvent, function(error, rows){


		if(error){
			httpMsgs.show500(req, resp, err);
		}else{
			httpMsgs.sendJson(req, resp, rows);
		}

	});
}










