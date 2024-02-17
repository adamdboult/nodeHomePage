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
    
    
    # Run twice to get table of contents
    # Doing this before pandoc because we change the data for that to reverse escape \_
    # Can't make 2 data copies easily - use of \include is automatic
    cd built/pug/theory/
    cd $subject
    printf "   pdflatex ${subject}\n"
    pdflatex ${subject}.tex > /dev/null 2>&1
    printf "   pdflatex ${subject}\n"
    pdflatex ${subject}.tex > /dev/null 2>&1
    cd $current_dir
    
    # Copy pdf
    ./copy_pdf.py $subject

    printf "   Pandoc\n"

    # Copy preface.tex to the folder.
    cp preface.tex built/pug/theory/${subject}/
    my_list=$(find built/pug/theory/${subject}/ -name \*.tex)
    for i in $my_list; do
        printf "     loop ${i}\n"
        b=$(basename -- $i)
        b=${b%.tex}
        s=$b".tex"
        o=$b".html"
        #p=$b".pdf"
        d="$(dirname "${i}")/"

        cd $d
        printf "     sed ${s}\n"
        #sed -i 's/\\_/_/g' $s
        # Not doing sed for now, breaking pandoc on server
        printf "     Pandoc ${s}\n"
        pandoc $s --mathjax -o $o
        cd $current_dir
    
    done
    
    cd built/pug/theory/${subject}/
    #sed -i 's/\\_/_/g' ${subject}.tex
    # Not doing sed for now, breaking pandoc on server
    cd $current_dir
    
    # Create sidebars
    printf "   Creating side bars\n"
    # Doing this after pandoc because it needs the sed commands too.
    ./create_sidebars.py $subject
    

done

./createHomeHeader.py
