var db = require('../core/db');
var httpMsgs = require('../core/httpMsgs');
var util = require('util');

exports.getListEvents = function(req, resp){

	db.executeSQL("SELECT * FROM Event", function(error, rows){

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
