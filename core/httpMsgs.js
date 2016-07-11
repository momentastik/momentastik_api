var settings = require('../settings');

exports.show500 = function(req, resp, err){

	resp.writeHead(500, "Internal Error ocurred", settings.headerResponse);
	resp.end(JSON.stringify(settings.displayError(err)));
}


exports.sendJson = function (req, resp, data){
	
	resp.writeHead(200, settings.headerResponse);
	if(data){
		resp.write(JSON.stringify(data));
	}
	resp.end();

}

exports.show404 = function (req, resp){
	resp.writeHead(404, "Resource Not Found", settings.headerResponse);
	resp.end(JSON.stringify(settings.displayError("Resource Not Found")));
	
}












