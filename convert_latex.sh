#!/bin/bash

current_dir=$(pwd)
#printf $current_dir

###################################
# Create tex file for each folder #
###################################
python3 createDerivedLatexFiles.py

#########################
# Convert all tex files #
#########################


declare -a subjects=(
    "logic" "algebra" "analysis" "geometry" "computer"
    "probability" "statistics" "neuralNetworks"
    "physics" "biology" "engineering" "applied"
    "unix" "graphics" "networks" "cpp" "java" "javascript" "python"
    "VMEmulation" "otherCLanguages" "otherLispLanguages" "otherCompiledLanguages" "R" "otherLanguages"
    "ai" "equilibrium" "economics" "macroeconomics" "publicChoice" "history" "epistemologyOntology" "philosophy"
)

for subject in "${subjects[@]}"
do
    #printf "hi"
    #printf ""
    printf "Doing \"${subject}\"...\n"

    for i in $(find built/pug/theory/${subject}/ -name \*.tex); do
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

    # Run twice to get table of contents
    printf "Pandoc ${subject}\n\n"
    #printf "$(pwd)"
    #cd ./built/pug/theory/${subject}
    cd built/pug/theory/
    cd $subject
    #printf "$(pwd)"
    pdflatex ${subject}.tex > /dev/null 2>&1
    pdflatex ${subject}.tex > /dev/null 2>&1
    cd $current_dir

done


############
# Copy pdf #
############
python3 copy_pdf.py

