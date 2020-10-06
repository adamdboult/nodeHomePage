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

printf "Doing \"Logic\"...\n"

for i in $(find ./built/jade/theory/logic/ -name \*.tex); do
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

printf "Done \"Logic\"\n\n"
printf "Doing \"Algebra\"...\n"

for i in $(find ./built/jade/theory/algebra/ -name \*.tex); do
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

printf "Done \"Algebra\"\n\n"
printf "Doing \"Analysis\"...\n"

for i in $(find ./built/jade/theory/analysis/ -name \*.tex); do
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

printf "Done \"Analysis\"\n\n"
printf "Doing \"Geometry\"...\n"

for i in $(find ./built/jade/theory/geometry/ -name \*.tex); do
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

printf "Done \"Geometry\"\n\n"
printf "Doing \"Computer Science\"...\n"

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
printf "Doing probability...\n"

for i in $(find ./built/jade/theory/probability/ -name \*.tex); do
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

printf "Done probability\n\n"
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
printf "Doing AI...\n"

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
printf "Doing engineering...\n"

for i in $(find ./built/jade/theory/engineering -name \*.tex); do
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

printf "Done engineering\n\n"
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
printf "Doing philosophy...\n"

for i in $(find ./built/jade/theory/philosophy/ -name \*.tex); do
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

printf "Done philosophy\n\n"
printf "Doing history...\n"

for i in $(find ./built/jade/theory/history/ -name \*.tex); do
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

printf "Done history\n\n"
printf "Doing organisations...\n"

for i in $(find ./built/jade/theory/organisations/ -name \*.tex); do
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

printf "Done organisations\n\n"

#######
# PDF #
#######
# Run twice to get table of contents
printf "Pandoc logic\n\n"
cd ./built/jade/theory/logic
pdflatex ./logic.tex > /dev/null 2>&1
pdflatex ./logic.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc algebra\n\n"
cd ./built/jade/theory/algebra
pdflatex ./algebra.tex > /dev/null 2>&1
pdflatex ./algebra.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc analysis\n\n"
cd ./built/jade/theory/analysis
pdflatex ./analysis.tex > /dev/null 2>&1
pdflatex ./analysis.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc geometry\n\n"
cd ./built/jade/theory/geometry
pdflatex ./geometry.tex > /dev/null 2>&1
pdflatex ./geometry.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc computer\n\n"
cd ./built/jade/theory/computer
pdflatex ./computer.tex > /dev/null 2>&1
pdflatex ./computer.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc probability\n\n"
cd ./built/jade/theory/probability
pdflatex ./probability.tex > /dev/null 2>&1
pdflatex ./probability.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc statistics\n\n"
cd ./built/jade/theory/statistics
pdflatex ./statistics.tex > /dev/null 2>&1
pdflatex ./statistics.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc physics\n\n"
cd ./built/jade/theory/physics
pdflatex ./physics.tex > /dev/null 2>&1
pdflatex ./physics.tex > /dev/null 2>&1
cd $current_dir
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
printf "Pandoc engineering\n\n"
cd ./built/jade/theory/engineering
pdflatex ./engineering.tex > /dev/null 2>&1
pdflatex ./engineering.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc economics\n\n"
cd ./built/jade/theory/economics
pdflatex ./economics.tex > /dev/null 2>&1
pdflatex ./economics.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc culture\n\n"
cd ./built/jade/theory/culture
pdflatex ./culture.tex > /dev/null 2>&1
pdflatex ./culture.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc philosophy\n\n"
cd ./built/jade/theory/philosophy
pdflatex ./philosophy.tex > /dev/null 2>&1
pdflatex ./philosophy.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc history\n\n"
cd ./built/jade/theory/history
pdflatex ./history.tex > /dev/null 2>&1
pdflatex ./history.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc organisations\n\n"
cd ./built/jade/theory/organisations
pdflatex ./organisations.tex > /dev/null 2>&1
pdflatex ./organisations.tex > /dev/null 2>&1
cd $current_dir

printf "Done!\n\n"
############
# Copy pdf #
############
python3 ./copy_pdf.py

