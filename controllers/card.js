var db = require('../core/db');
var httpMsgs = require('../core/httpMsgs');
var util = require('util');

exports.getListCards = function(req, resp){

	db.executeSQL ("SELECT * FROM Card", function (error, rows){

		if(error){
			httpMsgs.show500(req, resp, err);
		}else{
			httpMsgs.sendJson(req, resp, rows);
		}

	});


}




















