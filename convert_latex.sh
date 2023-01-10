#!/bin/bash

current_dir=$(pwd)

# Create tex file for each folder
#python createDerivedLatexFiles.py

# Create sidebars
#python create_sidebars.py

# Convert all tex files

#declare -a subjects=(
#    "logic" "algebra" "analysis" "geometry" "computer"
#    "probabilityUnivariate" "probabilityMultivariate" "probabilityTimeSeriesUnivariate" "probabilityTimeSeriesMultivariate" "machineLearning" "neuralNetworks"
#    "physics" "biology" "engineering" "applied"
#    "unix" "graphics" "networks" "databases" "cpp" "java" "javascript" "python"
#    "VMEmulation" "otherCLanguages" "otherLispLanguages" "otherCompiledLanguages" "R" "otherLanguages" "windows" "distributedComputing"
#    "ai" "equilibrium" "IO" "MBF" "economics" "macroeconomics" "publicChoice" "history" "epistemologyOntology" "philosophy"
#)

#for subject in "${subjects[@]}"
#for subject in src/pug/theory/*/
#for subject in $(cd src/pug/theory/; ls -d; cd $current_dir;)
for subject in src/pug/theory/*/
do
    # remove trailing "/"
    subject=${subject%?}
    
    # remove src/pug/theory/
    subject=${subject#*/}
    subject=${subject#*/}
    subject=${subject#*/}

    printf "Doing \"${subject}\"...\n"
    # remove trailing "/"
    #subject2 =${subject%???}
    #printf "Doing \"${subject2}\"...\n"
    
    # Create tex file
    python createDerivedLatexFiles.py $subject
    
    # Create sidebars
    python create_sidebars.py $subject

    for i in $(find built/pug/theory/${subject}/ -name \*.tex); do
        b=$(basename -- $i)
        b=${b%.tex}
        s=$b".tex"
        o=$b".html"
        p=$b".pdf"
        d="$(dirname "${i}")/"

        cd $d
        pandoc $s --mathjax -o $o
        #pandoc $s --number-sections --toc --toc-depth 2 -o $p
        cd $current_dir

    done

    # Run twice to get table of contents
    printf "Pandoc ${subject}\n\n"
    cd built/pug/theory/
    cd $subject
    pdflatex ${subject}.tex > /dev/null 2>&1
    pdflatex ${subject}.tex > /dev/null 2>&1
    cd $current_dir
    
    # Copy pdf
    python copy_pdf.py $subject

done


# Copy pdf
#python copy_pdf.py

