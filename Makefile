
all: empty_dest favicon packages scripts styles pug latex

empty_dest:
	rm -rf built/
	rm -rf public/
	mkdir built/
	mkdir public/

favicon:
	cp src/img/compiled/* public/

packages:
	mkdir public/packages/
	cp -R node_modules/mathjax/es5    ./public/packages/mathjax
	cp -R node_modules/bootstrap/dist ./public/packages/bootstrap

scripts:
	#mkdir ./public/js/
	cp -R src/js public/js

styles:
	mkdir public/css/
	# 
	cp -R src/styles/**/*.css public/css/ || true
	#sass src/styles/**/*.scss public/css/

pug:
	cp -R src/pug built/pug

latex:
	./convert_latex.sh

