"use strict";
/*jshint node:true */

// Dependencies
var gulp   = require('gulp'); 
var jshint = require('gulp-jshint');
var sass   = require('gulp-sass');
var exec   = require('child_process').exec;
var spawn   = require('child_process').spawn;
var del    = require('del');

// JS Hint
gulp.task('jshint', function(cb) {

    gulp.src([__dirname+'/server.js', __dirname+'/gulpfile.js', __dirname+'/config/**/*.js', __dirname+'/src/**/*.js'])
	.pipe(jshint())
	.pipe(jshint.reporter('default'));
	
    cb();
    
});

// Empty folders
gulp.task('emptyDestFolders', function(cb) {

    del.sync([
        __dirname+'/built',
        __dirname+'/public'
    ]);

    cb();

});

// Favicon
gulp.task('favicon', function(cb) {

    gulp.src(__dirname + '/src/img/compiled/*')
	.pipe(gulp.dest(__dirname+'/public/'));
	
    cb();

});

// Packages
gulp.task('packages', function(cb) {
    
    // Mathjax
    gulp.src(__dirname+'/node_modules/mathjax/es5/**/*')
      .pipe(gulp.dest(__dirname+'/public/packages/mathjax/'));
    
    // Bootstrap
    gulp.src(__dirname+'/node_modules/bootstrap/dist/**/*')
      .pipe(gulp.dest(__dirname+'/public/packages/bootstrap/'));
    
    // JQuery
    gulp.src(__dirname+'/node_modules/jquery/dist/**/*')
      .pipe(gulp.dest(__dirname+'/public/packages/jquery/'));
    
    // Popper
    gulp.src(__dirname+'/node_modules/popper.js/dist/umd/**/*')
      .pipe(gulp.dest(__dirname+'/public/packages/popper.js/'));
      
    cb();

});

// Scripts
gulp.task('scripts', function(cb) {
    
    gulp.src(__dirname+'/src/js/**/*')
      .pipe(gulp.dest(__dirname+'/public/js/'));
      
    cb();
    
});

// Styles
gulp.task('styles', function(cb) {

    gulp.src(__dirname+'/src/styles/**/*.scss')
      .pipe(sass())
      .pipe(gulp.dest(__dirname+'/public/css/'));
       
    gulp.src(__dirname+'/src/styles/**/*.css')
       .pipe(gulp.dest(__dirname+'/public/css/'));
       
    cb();

});

// Latex
gulp.task('latex', function() {

    var latexSrc = __dirname + '/src/pug/**/*';
    var latexDst = __dirname + '/built/pug';

    return gulp.src(latexSrc)
        .pipe(gulp.dest(latexDst));

});

// Latex convert
gulp.task('latexConvert', function(cb) {
    
    exec('./convert_latex.sh', function(err, stdout, stderr) {
        console.log(stdout);
        console.log(stderr);
        cb(err);
    });

});

// Exports
exports.default = gulp.series('jshint', 'emptyDestFolders', 'favicon', 'packages', 'scripts', 'styles', 'latex', 'latexConvert');

