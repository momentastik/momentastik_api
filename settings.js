exports.dbConfig = {
	host: '127.0.0.1',
	user: 'root',
	password: '123',
	database: 'momentastik'
};

exports.webPort = 1337;


exports.headerResponse = {
	"Content-type": "application/json"
};

exports.displayError = function(err){

	return {
		error: "Error ocurred: " + err
	}
};
	

