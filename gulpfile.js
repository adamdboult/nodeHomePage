"use strict";
/*jshint node:true */

//////////////////
/* DEPENDENCIES */
//////////////////

// include gulp
var gulp = require('gulp'); 

// include plug-ins
var jshint = require('gulp-jshint');
//var changed = require('gulp-changed');
//var minifyHTML = require('gulp-minify-html');
var concat = require('gulp-concat');
var stripDebug = require('gulp-strip-debug');
var uglify = require('gulp-uglify');
//var autoprefix = require('gulp-autoprefixer');
//var minifyCSS = require('gulp-minify-css');
//var sass=require('gulp-sass');
var rmdir = require('rimraf');
var fs=require('fs');
//var shell=require('gulp-shell');
var Q = require('q');
var autoprefix = require('gulp-autoprefixer');

var sass=require('gulp-sass');

var clean = require('gulp-clean');
var del = require('del');

var    exec = require('child_process').exec;

/////////////////
/* DIRECTORIES */
/////////////////
gulp.task('emptyDestFolders', function() {
    return del([
        __dirname+'/public',
        __dirname+'/built'
    ]);
});

gulp.task('latex', function() {

    var latexSrc = __dirname + '/src/jade/**/*',
        latexDst = __dirname + '/built/jade';

    return gulp.src(latexSrc)
        .pipe(gulp.dest(latexDst));

});

gulp.task('latexConvert', function(cb) {

    exec('./convert_latex.sh', function(err, stdout, stderr) {
        console.log(stdout);
        console.log(stderr);
        cb(err);
    });

});


gulp.task('imageMin', function() {

    var imgSrc = __dirname+'/src/img/compiled/*',
	imgDst = __dirname+'/public/img';
    
    return gulp.src(imgSrc)
	.pipe(gulp.dest(imgDst));

});


exports.default = gulp.series('emptyDestFolders', 'imageMin', 'latex', 'latexConvert');

