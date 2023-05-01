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

