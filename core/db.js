var mySQLDB = require('mysql');
var settings = require('../settings');

exports.executeSQL(sql, callback){
	var dbConnection = mySQLDB.createConnection (settings.dbConfig);
	
	dbConnection.connect (function (error){

		if (error){
			console.log("Error Connection DataBase");
			callback(error, null);
		}else{
			console.log("Connected");
			
			dbConnection.query(sql, function (error, rows, fields){

				if (error){
					console.log ("Error on Query");
					callback(error, null);
				} else{
					callback(null, rows);
				}

			});
			
		}


	});
};






























