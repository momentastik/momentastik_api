exports.dbConfig = {
	host: '127.0.0.1',
	user: 'root',
	password: '123',
	database: 'momentastik'
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
	

