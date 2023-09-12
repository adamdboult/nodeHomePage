#!/bin/bash

current_dir=$(pwd)

# Convert all tex files

for subject in src/pug/theory/*/
do
    # remove trailing "/"
    subject=${subject%?}
    
    # remove src/pug/theory/
    subject=${subject#*/}
    subject=${subject#*/}
    subject=${subject#*/}

    printf "Doing \"${subject}\"...\n"
    
    # Create tex file
    printf "   Creating derived latex files\n"
    ./createDerivedLatexFiles.py $subject
    
    # Create sidebars
    printf "   Creating side bars\n"
    ./create_sidebars.py $subject

    printf "   Pandoc\n"
    for i in $(find built/pug/theory/${subject}/ -name \*.tex); do
        b=$(basename -- $i)
        b=${b%.tex}
        s=$b".tex"
        o=$b".html"
        #p=$b".pdf"
        d="$(dirname "${i}")/"

        cd $d
        printf "     Pandoc ${s}\n"
        pandoc $s --mathjax -o $o
        cd $current_dir

    done

    # Run twice to get table of contents
    cd built/pug/theory/
    cd $subject
    printf "   pdflatex ${subject}\n"
    pdflatex ${subject}.tex > /dev/null 2>&1
    printf "   pdflatex ${subject}\n"
    pdflatex ${subject}.tex > /dev/null 2>&1
    cd $current_dir
    
    # Copy pdf
    ./copy_pdf.py $subject

done

