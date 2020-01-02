#!/bin/bash

current_dir=$(pwd)
#printf $current_dir

###################################
# Create tex file for each folder #
###################################
python3 ./createDerivedLatexFiles.py

#########################
# Convert all tex files #
#########################
#for i in $(find ./built/jade/theory/maths/ -name \*.tex); do
#for i in $(find ./built/jade/theory/statistics -name \*.tex); do
for i in $(find ./built/jade/theory/ -name \*.tex); do
    b=$(basename -- $i)
    b=${b%.tex}
    s=$b".tex"
    o=$b".html"
    p=$b".pdf"
    d="$(dirname "${i}")/"

    cd $d
    #printf $d"/"$i
    pandoc $s -o $o
    pandoc $s --number-sections --toc --toc-depth 2 -o $p
    cd $current_dir

done

############
# Copy pdf #
############
python3 ./copy_pdf.py

