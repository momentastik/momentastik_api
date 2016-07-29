exports.dbConfig = {
	host: '-cdbr-iron-east-04.cleardb.net',
	user: 'b6c554615a1711', 
	password: '26a49be9',
	database: 'heroku_e2ac4ee7ad1fbad'
};

var webPortApp = process.env.PORT || 1337;

exports.webPort = webPortApp;


exports.headerResponse = {
	"Content-type": "application/json"
};

exports.displayError = function(err){

	return {
		error: "Error ocurred: " + err
	}
};
	

