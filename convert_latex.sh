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
for i in $(find ./built/jade/theory/maths/ -name \*.tex); do
    b=$(basename -- $i)
    b=${b%.tex}
    s=$b".tex"
    o=$b".html"
    p=$b".pdf"
    d="$(dirname "${i}")/"

    cd $d
    pandoc $s -o $o
    pandoc $s --number-sections -o $p
    cd $current_dir

done

############
# Copy pdf #
############
python3 ./copy_pdf.py

