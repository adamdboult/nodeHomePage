"use strict";
/*jshint node:true */

// include gulp
var gulp = require('gulp'); 

// include plug-ins
var jshint = require('gulp-jshint');
//var changed = require('gulp-changed');
//var minifyHTML = require('gulp-minify-html');
var concat = require('gulp-concat');
var stripDebug = require('gulp-strip-debug');
var uglify = require('gulp-uglify');
var autoprefix = require('gulp-autoprefixer');
//var minifyCSS = require('gulp-minify-css');
//var sass=require('gulp-sass');
var rmdir = require('rimraf');
var fs=require('fs');
var shell=require('gulp-shell');
var Q = require('q');

/*gulp.task('css', function () {
    return gulp.src('css/*.css')
        .pipe(gulp.dest('build/css'));
});
*/
var bowerDir = __dirname+'/bower_components';

var jsConcatFilesHeader = [
    bowerDir+'/bootstrap/dist/js/bootstrap.js',
    //bowerDir+'/Bootflat/bootflat/icheck.min.js',
    //bowerDir+'/Bootflat/bootflat/jquery.fs.selecter.min.js',
    //bowerDir+'/Bootflat/bootflat/jquery.fs.stepper.min.js',
    //bowerDir+'/browser-update/browser-update.min.js',
    bowerDir+'/d3/d3.min.js',
    bowerDir+'/angular/angular.min.js',
    //bowerDir+'/flat-ui/dist/js/flat-ui.min.js'
    bowerDir+'/bootstrap-material-design/dist/js/material.min.js',
    bowerDir+'/bootstrap-material-design/dist/js/ripples.min.js',
    bowerDir+'/bootstrap-material-design/dist/js/material.min.js'
];

var jshintFiles = [
    __dirname+'/server.js',
    __dirname+'/gulpfile.js'
];
var stylesFiles = [
    bowerDir+'/bootstrap/dist/css/bootstrap.css',
    //bowerDir+'/Bootflat/bootflat/css/bootflat.min.css',
    //bowerDir+'/bootstrap-theme-bootswatch-flatly/css/bootstrap.min.css',
    //bowerDir+'/bootstrap-material-design/dist/css/roboto.min.css',
    bowerDir+'/bootstrap-material-design/dist/css/material.min.css',
    //bowerDir+'/bootstrap-material-design/dist/css/ripples.min.css',
    //bowerDir+'/flat-ui/dist/css/flat-ui.min.css',
    __dirname+'/src/styles/core.scss'
];
var fontFiles = [
    bowerDir+'/bootstrap/dist/fonts/**/*',
    //bowerDir+'/flat-ui/dist/fonts/**/*'
    bowerDir+'/bootstrap-material-design/dist/fonts/**/*'
];

var modelJSFiles = [
    __dirname+'/src/scripts/models/**/*'
];

var jsFallBack=[bowerDir+'/jquery/dist/jquery.min.js'];
var mathjaxprefix=bowerDir+'/MathJax';
var mathjaxFolder=[mathjaxprefix+'/MathJax.js',
		   mathjaxprefix+'/config/**/*',
		   mathjaxprefix+'/fonts/HTML-CSS/TeX/woff/**/*',
		   mathjaxprefix+'/jax/**/*',
		   mathjaxprefix+'/extensions/**/*'
		  ];
//var mathjaxFolder=[mathjaxprefix+'/MathJax.js',
//		   mathjaxprefix+'/config/**/*',
//		   mathjaxprefix+'/images/**/*',
//		   mathjaxprefix+'/jax/**/*',
//		   mathjaxprefix+'/fonts/HTML-CSS/TeX/woff/**/*',
//		   mathjaxprefix+'/extensions/**/*'
//		  ];

var datepickerFolder=[bowerDir+'/bootstrap-datepicker/js/**/*'];

gulp.task('clean', function() {
    console.log("bleep")
    var deferred = Q.defer();
    rmdir(__dirname+'/public', function(error){
	rmdir(__dirname+'/data', function(error){
	    fs.mkdirSync(__dirname+'/public');
	    fs.mkdirSync(__dirname+'/data');
	    deferred.resolve();
	});
    });
    return deferred.promise;
});
console.log("hi")
gulp.task('fallbackjs',['clean'],function() {
    console.log("boop");
    gulp.src(jsFallBack)
	.pipe(gulp.dest(__dirname+'/public/js/'));
});
console.log("bye")
gulp.task('mathjax',['clean'],function() {
    gulp.src(mathjaxFolder,{base:mathjaxprefix})
	.pipe(gulp.dest(__dirname+'/public/js/MathJax/'));
});

gulp.task('datepicker',['clean'],function() {
    gulp.src(datepickerFolder,{base:bowerDir+'/bootstrap-datepicker/js'})
	.pipe(gulp.dest(__dirname+'/public/js/datepicker/'));
});

// JS hint task
gulp.task('jshint', ['clean'],function() {
    gulp.src(jshintFiles)
	.pipe(jshint())
	.pipe(jshint.reporter('default'));
});

// JS concat, strip debugging and minify
gulp.task('scripts', ['clean'],function() {
    gulp.src(jsConcatFilesHeader)
	.pipe(concat('coreHeader.js'))
	.pipe(stripDebug())
	.pipe(uglify())
	.pipe(gulp.dest(__dirname+'/public/js/'));
});

gulp.task('scripts-debug', ['clean'],function() {
    gulp.src(jsConcatFilesHeader)
	.pipe(concat('coreHeader.js'))
	.pipe(gulp.dest(__dirname+'/public/js/'));
});

// CSS concat, auto-prefix and minify
gulp.task('fonts', ['clean'],function() {
    gulp.src(fontFiles)
	.pipe(gulp.dest(__dirname+'/public/fonts/'));
});
/*
gulp.task('styles', ['clean'],function() {
    gulp.src(stylesFiles)
	.pipe(concat('styles.scss'))
        .pipe(sass())
	.pipe(autoprefix('last 2 versions'))
	//.pipe(minifyCSS({keepSpecialComments:false}))
    //	.pipe(stripDebug())
	.pipe(gulp.dest(__dirname+'/public/css/'));
});
*/
// minify new images
gulp.task('imagemin', ['clean'],function() {
    var imgSrc = __dirname+'/src/img/compiled/*',
	imgDst = __dirname+'/public/img';
    
    gulp.src(imgSrc)
	.pipe(gulp.dest(imgDst));
});

// jade
gulp.task('jade', ['clean'],function() {
    var YOUR_LOCALS = {};
    //	gulp.src([__dirname+'/src/jade/*.jade'])
    //	.pipe(jade({
    //		locals: YOUR_LOCALS
    //	}))
    //	.pipe(gulp.dest(__dirname+'/public/'));
});
/*
gulp.task('nonScript',['styles','jade','imagemin','fonts','mathjax','datepicker','fallbackjs',],function(){
});
*/
gulp.task('nonScript',['jade','imagemin','fonts','mathjax','datepicker','fallbackjs',],function(){
});


gulp.task('debug', ['nonScript','scripts-debug','jshint'],function(){
});

gulp.task('default', ['nonScript','scripts'],function(){
});
