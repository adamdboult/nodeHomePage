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
//var stripDebug = require('gulp-strip-debug');
//var uglify = require('gulp-uglify');
var autoprefix = require('gulp-autoprefixer');
//var minifyCSS = require('gulp-minify-css');
var sass=require('gulp-sass');
//var rmdir = require('rimraf');
var fs=require('fs');
//var shell=require('gulp-shell');
//var Q = require('q');

var sass=require('gulp-sass');

//var clean = require('gulp-clean');
var del = require('del');

var exec = require('child_process').exec;

/////////////////
/* DIRECTORIES */
/////////////////

var bowerDir = __dirname+'/bower_components';

var stylesFiles = [
    //bowerDir+'/bootstrap/dist/css/bootstrap.css',
    //bowerDir+'/Bootflat/bootflat/css/bootflat.min.css',
    //bowerDir+'/bootstrap-theme-bootswatch-flatly/css/bootstrap.min.css',
    //bowerDir+'/bootstrap-material-design/dist/css/roboto.min.css',
    //bowerDir+'/bootstrap-material-design/dist/css/material.min.css',
    //bowerDir+'/bootstrap-material-design/assets/css/docs.min.css',
    //bowerDir+'/bootstrap-material-design/dist/css/ripples.min.css',
    //bowerDir+'/flat-ui/dist/css/flat-ui.min.css',
    //__dirname+'/src/styles/core.scss'
];


//var fontFiles = [
//    //bowerDir+'/bootstrap/dist/fonts/**/*',
//    //bowerDir+'/flat-ui/dist/fonts/**/*'
//    bowerDir+'/bootstrap-material-design/dist/fonts/**/*'
//];

var scriptFiles = [
    //bowerDir+'/bootstrap-material-design/js/ripples.js',
    //bowerDir+'/bootstrap-material-design/js/bootstrapMaterialDesign.js'
    //bowerDir+'/bootstrap-material-design/dist/js/ripples.min.js',
    //bowerDir+'/bootstrap-material-design/dist/js/material.min.js'
];

///////////
/* TASKS */
///////////
gulp.task('emptyDestFolders', function() {
    return del([
        __dirname+'/public',
        __dirname+'/built'
    ]);
});

gulp.task('scripts', function() {
    return gulp.src(scriptFiles)
	.pipe(concat('coreHeader.js'))
	//.pipe(stripDebug())
	//.pipe(uglify())
	.pipe(gulp.dest(__dirname+'/public/js/'));
});

gulp.task('styles', function() {
    return gulp.src(stylesFiles)
	.pipe(concat('styles.scss'))
        .pipe(sass())
	.pipe(autoprefix('last 2 versions'))
	//.pipe(minifyCSS({keepSpecialComments:false}))
    //	.pipe(stripDebug())
	.pipe(gulp.dest(__dirname+'/public/css/'));

    //cb();
});

gulp.task('latex', function() {

    var latexSrc = __dirname + '/src/pug/**/*',
        latexDst = __dirname + '/built/pug';

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

