var db = require('../core/db');
var httpMsgs = require('../core/httpMsgs');
var util = require('util');

exports.getListPlaces = function(req, resp,idCard){

	db.executeSQL("SELECT * FROM Place INNER JOIN R_CARD_PLACE on Place.id=R_CARD_PLACE.idPlace AND "+
		 "R_CARD_PLACE.idCard="+idCard
		
		
		, function(error, rows){

		if (error){
			httpMsgs.show500(req, resp, err);
		}else{
			httpMsgs.sendJson(req, resp, rows);
		}

	});
};

exports.getPlace = function(req, resp,id){

	db.executeSQL("SELECT * FROM Place WHERE Place.id = "+id, function(error, rows){

		if (error){
			httpMsgs.show500(req, resp, err);
		}else{
			httpMsgs.sendJson(req, resp, rows[0]);
		}

	});
};

exports.getPlaceEvents = function(req, resp,id){

	db.executeSQL("SELECT * FROM Event INNER JOIN Place on Place.id = Event.idPlace AND Place.id="+id, function(error, rows){

		if (error){
			httpMsgs.show500(req, resp, err);
		}else{
			httpMsgs.sendJson(req, resp, rows[0]);
		}

	});
};


exports.getPlaceImages = function(req, resp, idPlace){

	db.executeSQL ("SELECT * FROM ImagePlace INNER JOIN Place on Place.id=ImagePlace.idPlace AND Place.id="+idPlace, function (error, rows){

		if(error){
			httpMsgs.show500(req, resp, err);
		}else{
			httpMsgs.sendJson(req, resp, rows);
		}
	});
};



