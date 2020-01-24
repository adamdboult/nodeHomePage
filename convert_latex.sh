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

printf "Doing AI\n"

for i in $(find ./built/jade/theory/ai/ -name \*.tex); do
    b=$(basename -- $i)
    b=${b%.tex}
    s=$b".tex"
    o=$b".html"
    p=$b".pdf"
    d="$(dirname "${i}")/"

    #printf $d"/"$i"\n"

    cd $d
    pandoc $s --mathjax -o $o
    #pandoc $s --number-sections --toc --toc-depth 2 -o $p
    cd $current_dir

done

printf "Done AI\n\n"
printf "Doing biology...\n"

for i in $(find ./built/jade/theory/biology/ -name \*.tex); do
    b=$(basename -- $i)
    b=${b%.tex}
    s=$b".tex"
    o=$b".html"
    p=$b".pdf"
    d="$(dirname "${i}")/"

    #printf $d"/"$i"\n"

    cd $d
    pandoc $s --mathjax -o $o
    #pandoc $s --number-sections --toc --toc-depth 2 -o $p
    cd $current_dir

done

printf "Done biology\n\n"
printf "Doing culture...\n"

for i in $(find ./built/jade/theory/culture/ -name \*.tex); do
    b=$(basename -- $i)
    b=${b%.tex}
    s=$b".tex"
    o=$b".html"
    p=$b".pdf"
    d="$(dirname "${i}")/"

    #printf $d"/"$i"\n"

    cd $d
    pandoc $s --mathjax -o $o
    #pandoc $s --number-sections --toc --toc-depth 2 -o $p
    cd $current_dir

done

printf "Done culture\n\n"
printf "Doing statistics...\n"

for i in $(find ./built/jade/theory/statistics/ -name \*.tex); do
    b=$(basename -- $i)
    b=${b%.tex}
    s=$b".tex"
    o=$b".html"
    p=$b".pdf"
    d="$(dirname "${i}")/"

    #printf $d"/"$i"\n"

    cd $d
    pandoc $s --mathjax -o $o
    #pandoc $s --number-sections --toc --toc-depth 2 -o $p
    cd $current_dir

done

printf "Done statistics\n\n"
printf "Doing maths...\n"

for i in $(find ./built/jade/theory/maths/ -name \*.tex); do
    b=$(basename -- $i)
    b=${b%.tex}
    s=$b".tex"
    o=$b".html"
    p=$b".pdf"
    d="$(dirname "${i}")/"

    #printf $d"/"$i"\n"

    cd $d
    pandoc $s --mathjax -o $o
    #pandoc $s --number-sections --toc --toc-depth 2 -o $p
    cd $current_dir

done

printf "Done maths\n\n"
printf "Doing physics...\n"

for i in $(find ./built/jade/theory/physics -name \*.tex); do
    b=$(basename -- $i)
    b=${b%.tex}
    s=$b".tex"
    o=$b".html"
    p=$b".pdf"
    d="$(dirname "${i}")/"

    #printf $d"/"$i"\n"

    cd $d
    pandoc $s --mathjax -o $o
    #pandoc $s --number-sections --toc --toc-depth 2 -o $p
    cd $current_dir

done

printf "Done physics\n\n"
printf "Doing economics...\n"

for i in $(find ./built/jade/theory/economics -name \*.tex); do
    b=$(basename -- $i)
    b=${b%.tex}
    s=$b".tex"
    o=$b".html"
    p=$b".pdf"
    d="$(dirname "${i}")/"

    #printf $d"/"$i"\n"

    cd $d
    pandoc $s --mathjax -o $o
    #pandoc $s --number-sections --toc --toc-depth 2 -o $p
    cd $current_dir

done

printf "Done economics\n\n"
printf "Doing computer...\n"

for i in $(find ./built/jade/theory/computer -name \*.tex); do
    b=$(basename -- $i)
    b=${b%.tex}
    s=$b".tex"
    o=$b".html"
    p=$b".pdf"
    d="$(dirname "${i}")/"

    #printf $d"/"$i"\n"

    cd $d
    pandoc $s --mathjax -o $o
    #pandoc $s --number-sections --toc --toc-depth 2 -o $p
    cd $current_dir

done

printf "Done computer\n\n"

#######
# PDF #
#######
# Run twice to get table of contents
printf "Pandoc AI\n\n"
cd ./built/jade/theory/ai
pdflatex ./ai.tex > /dev/null 2>&1
pdflatex ./ai.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc biology\n\n"
cd ./built/jade/theory/biology
pdflatex ./biology.tex > /dev/null 2>&1
pdflatex ./biology.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc computer\n\n"
cd ./built/jade/theory/computer
pdflatex ./computer.tex > /dev/null 2>&1
pdflatex ./computer.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc culture\n\n"
cd ./built/jade/theory/culture
pdflatex ./culture.tex > /dev/null 2>&1
pdflatex ./culture.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc economics\n\n"
cd ./built/jade/theory/economics
pdflatex ./economics.tex > /dev/null 2>&1
pdflatex ./economics.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc maths\n\n"
cd ./built/jade/theory/maths
pdflatex ./maths.tex > /dev/null 2>&1
pdflatex ./maths.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc physics\n\n"
cd ./built/jade/theory/physics
pdflatex ./physics.tex > /dev/null 2>&1
pdflatex ./physics.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc statistics\n\n"
cd ./built/jade/theory/statistics
pdflatex ./statistics.tex > /dev/null 2>&1
pdflatex ./statistics.tex > /dev/null 2>&1
cd $current_dir
printf "Done!\n\n"
############
# Copy pdf #
############
python3 ./copy_pdf.py

