#!/bin/bash

current_dir=$(pwd)
#printf $current_dir

###################################
# Create tex file for each folder #
###################################
python3 ./convert_latex.py

#########################
# Convert all tex files #
#########################
for i in $(find ./built/jade -name \*.tex); do
    b=$(basename -- $i)
    b=${b%.tex}
    s=$b".tex"
    o=$b".html"
    d="$(dirname "${i}")/"

    cd $d
    pandoc $s -o $o
    cd $current_dir
    #rm $i
done

