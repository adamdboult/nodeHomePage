module.exports=function(app){
    'use strict';
    
    app.get('/', function(req, res) {
	res.render('home');
    });

    app.get('/theory', function(req,res){
	res.redirect('/');
    });

    app.get('/about', function(req,res){
	res.render('about',{user:req.user});
    });

    // DYNAMIC
    app.get('/theory/:area', function(req,res){
	res.render('theory/'+req.params.area, {}, function(err, html) {
	    if(err) {
	    console.log(err);
		res.render('404', { url: req.url });
	    } else {
		res.send(html);
	    }
	});
    });
    
    app.get('/theory/:area/:subject', function(req,res){
	res.render('theory/'+req.params.area+'/'+req.params.subject, {}, function(err, html) {
	    if(err) {
	    console.log(err);
		res.render('404', { url: req.url });
	    } else {
		res.send(html);
	    }
	});
    });
    
    app.get('/theory/:area/:subject/:subsubject', function(req,res){
	res.render('theory/'+req.params.area+'/'+req.params.subject+'/'+req.params.subsubject, {}, function(err, html) {
	    if(err) {
		res.render('404', { url: req.url });
	    } else {
		res.send(html);
	    }
	});
    });

};

