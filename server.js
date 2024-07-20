"use strict";
/*jshint node:true */

// Dependencies
var express = require('express');
var http    = require('http');

////////////////////////////////////
/* Process command line arguments */
////////////////////////////////////

var http_port = 8080;
if (process.argv[2] != null) {
    http_port = process.argv[2];
}

console.log("HTTP port is: "   + http_port);

////////////////////////
/* Express and routes */
////////////////////////

//START EXPRESS
var app = express();

//ROUTES
app.use(express.static(__dirname + '/public'));// set the static files location /public/img will be /img for users

//pretty makes the html not just 1 line, and so is readable
app.locals.pretty=true;
app.set('views',__dirname+'/built/pug/');
app.set('view engine', 'pug');

require(__dirname+'/config/routes/routes')(app);

// Since this is the last non-error-handling
// middleware used, we assume 404, as nothing else
// responded.
app.use(function(req, res, next){
    res.status(404);

    // respond with html page
    if (req.accepts('html')) {
	res.render('404', { url: req.url });
	return;
    }

    // respond with json
    if (req.accepts('json')) {
	res.send({ error: 'Not found' });
	return;
    }
    
    // default to plain-text. send()
    res.type('txt').send('Not found');
});

/////////////////
/* HTTP server */
/////////////////
var httpServer=http.createServer(app);
var HTTPport = process.env.PORT || http_port;
httpServer.listen(HTTPport);

console.log("App listening on port " + http_port);

