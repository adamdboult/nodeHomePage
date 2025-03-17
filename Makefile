
.PHONY: favicon
.PHONY: packages
.PHONY: scripts
#.PHONY: styles
.PHONY: pug
.PHONY: latex
.PHONY: all
.PHONY: clean

all: clean favicon packages scripts pug latex

clean:
	rm -rf built/
	rm -rf public/
	mkdir built/
	mkdir public/

favicon:
	cp -R ./src/img/compiled/. ./public

packages:
	mkdir public/packages/
	cp -R node_modules/mathjax/es5/.    ./public/packages/mathjax
	cp -R node_modules/bootstrap/dist/. ./public/packages/bootstrap

scripts:
	mkdir ./public/js/
	cp -R src/js/. public/js

#styles:
#	mkdir public/css/
#	cp -R./src/styles/. ./public/css

pug:
	cp -R src/pug built/pug

latex:
	./convert_latex.sh
	python create_home_header.py

