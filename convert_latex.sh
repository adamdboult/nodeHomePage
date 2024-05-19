#!/usr/bin/env bash

current_dir=$(pwd)

# Make errors in called scripts fail.
set -e
set -o pipefail


# Convert all tex files

for subject in src/pug/theory/*/
do
    # remove trailing "/"
    subject=${subject%?}
    
    # remove src/pug/theory/
    subject=${subject#*/}
    #subject=${subject#*/}
    #subject=${subject#*/}

    printf "Doing \"${subject}\"...\n"
    # Create tex file
    printf "   Creating derived latex files\n"
    python3 createDerivedLatexFiles.py $subject

    # Run twice to get table of contents
    # Doing this before pandoc because we change the data for that to reverse escape \_
    # Can't make 2 data copies easily - use of \include is automatic
    cd built/pug/theory/
    cd $subject
    printf "   pdflatex ${subject}\n"
    pdflatex ${subject}.tex > /dev/null 2>&1
    pdflatex ${subject}.tex > /dev/null 2>&1
    cd $current_dir

    # Copy pdf
    python3 copy_pdf.py $subject

    printf "   Pandoc\n"

    # Copy preface.tex to the folder.
    cp preface.tex built/pug/theory/${subject}/

    # Next
    tex_files=$(find built/pug/theory/${subject}/ -name \*.tex)
    for tex_file in $tex_files; do
        printf "     loop ${i}\n"
        b=$(basename -- $tex_file)
        b=${b%.tex}
        s=$b".tex"
        o=$b".html"
        #p=$b".pdf"
        d="$(dirname "${i}")/"

        cd $d
        printf "     sed ${s}\n"
        sed -i 's/\\_/_/g' $s
        # Not doing sed for now, breaking pandoc on server
        printf "     Pandoc ${s}\n"
        pandoc $s --mathjax -o $o
        cd $current_dir
    
    done
    
    cd built/pug/theory/${subject}/
    sed -i 's/\\_/_/g' ${subject}.tex
    # Not doing sed for now, breaking pandoc on server
    cd $current_dir
    
    # Create sidebars
    printf "   Creating side bars\n"
    # Doing this after pandoc because it needs the sed commands too.
    python3 create_sidebars.py $subject
    

done

python3 createHomeHeader.py
