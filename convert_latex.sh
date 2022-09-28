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

for i in $(find ./built/pug/theory/logic/ -name \*.tex); do
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

for i in $(find ./built/pug/theory/algebra/ -name \*.tex); do
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

for i in $(find ./built/pug/theory/analysis/ -name \*.tex); do
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

for i in $(find ./built/pug/theory/geometry/ -name \*.tex); do
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
printf "Doing \"Computer Science, Lisp and C\"...\n"

for i in $(find ./built/pug/theory/computer -name \*.tex); do
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

printf "Done \"Computer Science\"\n\n"
printf "Doing \"Probability\"...\n"

for i in $(find ./built/pug/theory/probability/ -name \*.tex); do
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

printf "Done \"Probability\"\n\n"
printf "Doing \"Statistics\"...\n"

for i in $(find ./built/pug/theory/statistics/ -name \*.tex); do
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

printf "Done \"Statistics\"\n\n"
printf "Doing \"Physics\"...\n"

for i in $(find ./built/pug/theory/physics -name \*.tex); do
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

printf "Done \"Physics\"\n\n"
printf "Doing \"Programming\"...\n"

for i in $(find ./built/pug/theory/programming -name \*.tex); do
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

printf "Done \"Programming\"\n\n"
printf "Doing \"AI\"...\n"

for i in $(find ./built/pug/theory/ai/ -name \*.tex); do
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

printf "Done \"AI\"\n\n"
printf "Doing \"Biology\"...\n"

for i in $(find ./built/pug/theory/biology/ -name \*.tex); do
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

printf "Done \"Biology\"\n\n"
printf "Doing \"Engineering\"...\n"

for i in $(find ./built/pug/theory/engineering -name \*.tex); do
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

printf "Done \"Engineering\"\n\n"
printf "Doing \"Equilibrium\"...\n"

for i in $(find ./built/pug/theory/equilibrium -name \*.tex); do
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

printf "Done \"Equilibrium\"\n\n"
printf "Doing \"Economics\"...\n"

for i in $(find ./built/pug/theory/economics -name \*.tex); do
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

printf "Done \"Economics\"\n\n"
printf "Doing \"Macroeconomics\"...\n"

for i in $(find ./built/pug/theory/macroeconomics -name \*.tex); do
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

printf "Done \"Macroeconomics\"\n\n"
printf "Doing \"Public Choice\"...\n"

for i in $(find ./built/pug/theory/publicChoice/ -name \*.tex); do
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

printf "Done \"Public Choice\"\n\n"
printf "Doing \"History\"...\n"

for i in $(find ./built/pug/theory/history/ -name \*.tex); do
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

printf "Done \"History\"\n\n"
printf "Doing \"Epistemology\"...\n"

for i in $(find ./built/pug/theory/epistemologyOntology/ -name \*.tex); do
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

printf "Done \"History\"\n\n"
printf "Doing \"Philosophy\"...\n"

for i in $(find ./built/pug/theory/philosophy/ -name \*.tex); do
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

printf "Done \"Philosophy\"\n\n"

#######
# PDF #
#######
# Run twice to get table of contents
printf "Pandoc logic\n\n"
cd ./built/pug/theory/logic
pdflatex ./logic.tex > /dev/null 2>&1
pdflatex ./logic.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc algebra\n\n"
cd ./built/pug/theory/algebra
pdflatex ./algebra.tex > /dev/null 2>&1
pdflatex ./algebra.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc analysis\n\n"
cd ./built/pug/theory/analysis
pdflatex ./analysis.tex > /dev/null 2>&1
pdflatex ./analysis.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc geometry\n\n"
cd ./built/pug/theory/geometry
pdflatex ./geometry.tex > /dev/null 2>&1
pdflatex ./geometry.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc computer\n\n"
cd ./built/pug/theory/computer
pdflatex ./computer.tex > /dev/null 2>&1
pdflatex ./computer.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc probability\n\n"
cd ./built/pug/theory/probability
pdflatex ./probability.tex > /dev/null 2>&1
pdflatex ./probability.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc statistics\n\n"
cd ./built/pug/theory/statistics
pdflatex ./statistics.tex > /dev/null 2>&1
pdflatex ./statistics.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc physics\n\n"
cd ./built/pug/theory/physics
pdflatex ./physics.tex > /dev/null 2>&1
pdflatex ./physics.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc programming\n\n"
cd ./built/pug/theory/programming
pdflatex ./programming.tex > /dev/null 2>&1
pdflatex ./programming.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc AI\n\n"
cd ./built/pug/theory/ai
pdflatex ./ai.tex > /dev/null 2>&1
pdflatex ./ai.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc biology\n\n"
cd ./built/pug/theory/biology
pdflatex ./biology.tex > /dev/null 2>&1
pdflatex ./biology.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc engineering\n\n"
cd ./built/pug/theory/engineering
pdflatex ./engineering.tex > /dev/null 2>&1
pdflatex ./engineering.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc equilibrium\n\n"
cd ./built/pug/theory/equilibrium
pdflatex ./equilibrium.tex > /dev/null 2>&1
pdflatex ./equilibrium.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc economics\n\n"
cd ./built/pug/theory/economics
pdflatex ./economics.tex > /dev/null 2>&1
pdflatex ./economics.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc macroeconomics\n\n"
cd ./built/pug/theory/macroeconomics
pdflatex ./macroeconomics.tex > /dev/null 2>&1
pdflatex ./macroeconomics.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc public choice\n\n"
cd ./built/pug/theory/publicChoice
pdflatex ./publicChoice.tex > /dev/null 2>&1
pdflatex ./publicChoice.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc history\n\n"
cd ./built/pug/theory/history
pdflatex ./history.tex > /dev/null 2>&1
pdflatex ./history.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc epistemologyOntology\n\n"
cd ./built/pug/theory/epistemologyOntology
pdflatex ./epistemologyOntology.tex > /dev/null 2>&1
pdflatex ./epistemologyOntology.tex > /dev/null 2>&1
cd $current_dir
printf "Pandoc philosophy\n\n"
cd ./built/pug/theory/philosophy
pdflatex ./philosophy.tex > /dev/null 2>&1
pdflatex ./philosophy.tex > /dev/null 2>&1
cd $current_dir

printf "Done!\n\n"
############
# Copy pdf #
############
python3 ./copy_pdf.py

