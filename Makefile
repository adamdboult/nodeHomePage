
##########
# README #
##########



##########
# JSHINT #
##########

all: empty_dest favicon packages scripts styles latex latex_convert home_header

#jshint:
#    jshint server.js
#    jshint config/**/*.js
#    jshint src/**/*.js

empty_dest:
	rm -rf built/
	rm -rf public/
	mkdir built/
	mkdir public/

favicon:
	cp src/img/compiled/* public/

packages:
	mkdir public/packages/
	cp -R node_modules/mathjax/es5 ./public/packages/mathjax
	cp -R node_modules/bootstrap/dist ./public/packages/bootstrap
	cp -R node_modules/jquery/dist ./public/packages/jquery
	cp -R node_modules/popper.js/dist/umd ./public/packages/popper.js

scripts:
	#mkdir ./public/js/
	cp -R src/js public/js

styles:
	mkdir public/css/
	#cp -R src/styles/**/*.css public/css/
	#sass src/styles/**/*.scss public/css/

latex:
	cp -R src/pug built/pug

latex_convert:
	./convert_latex.sh

home_header:
	./createHomeHeader.py
