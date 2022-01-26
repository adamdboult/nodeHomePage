
##########
# README #
##########



##########
# JSHINT #
##########

all: empty_dest favicon packages scripts styles latex sidebars latex_convert

#jshint:
#    jshint ./server.js
#    jshint ./config/**/*.js
#    jshint ./src/**/*.js
    
empty_dest:
    rm -rf ./built
    rm -rf ./public

favicon:
    cp ./src/img/compiled/* ./public/

packages:
    cp -r ./node_modules/mathjax/es5/**/* ./public/packages/mathjax/
    cp -r ./node_modules/bootstrap/dist/**/* ./public/packages/bootstrap/
    cp -r ./node_modules/jquery/dist/**/* ./public/packages/jquery/
    cp -r ./node_modules/popper.js/dist/umd/**/* ./public/packages/popper.js/

scripts:
      cp ./src/js/**/* ./public/js/
      
styles:
    cp ./src/styles/**/*.css ./public/css/
    sass ./src/styles/**/*.scss:./public/css/

latex:
    cp -r ./src/pug/**/* ./built/pug/

sidebars:
    python3 ./create_sidebars.py

latex_convert:
    ./convert_latex.sh
    
    

