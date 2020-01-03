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
for i in $(find ./built/jade/theory/ -name \*.tex); do
    b=$(basename -- $i)
    b=${b%.tex}
    s=$b".tex"
    o=$b".html"
    p=$b".pdf"
    d="$(dirname "${i}")/"

    printf $d"/"$i"\n"

    cd $d
    pandoc $s --mathjax -o $o
    #pandoc $s --number-sections --toc --toc-depth 2 -o $p
    #pandoc $s --number-sections -o $p
    cd $current_dir

done

cd ./built/jade/theory/maths
pdflatex ./maths.tex > /dev/null 2>&1
cd $current_dir

cd ./built/jade/theory/statistics
pdflatex ./statistics.tex > /dev/null 2>&1
cd $current_dir

############
# Copy pdf #
############
python3 ./copy_pdf.py

