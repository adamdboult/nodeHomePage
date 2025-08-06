#!/usr/bin/env bash

current_dir=$(pwd)

# Make errors in called scripts fail.
set -e
set -o pipefail

# Convert all tex files

#for subject in src/pug/theory/*/
for subject in built/pug/theory/*/; do
	# remove trailing "/"
	subject=${subject%?}

	# remove src/pug/theory/
	subject="${subject##*/}"

	#printf "Doing \"${subject}\"...\n"
	printf "Doing \"%s\"...\n" "$subject"
	# Create tex file
	printf "   Creating derived latex files\n"
	python create_derived_latex_files.py "$subject"

	# Copy preface.tex to the folder. Needed for creating the pdf/html files
	cp preface.tex "built/pug/theory/${subject}/"

	# Run twice to get table of contents
	# Doing this before pandoc because we change the data for that to reverse escape \_
	# (not sure this is the reason, it's about the later stuff I think?)
	# Can't make 2 data copies easily - use of \include is automatic
	cd "built/pug/theory/$subject"
	#printf "   pdflatex ${subject}\n"
	printf "   pdflatex %s\n" "$subject"
	use_pdf_latex=true
	if [ "$use_pdf_latex" = true ]; then
		#pdflatex "${subject}.tex" >/dev/null 2>&1
		#pdflatex "${subject}.tex" >/dev/null 2>&1
		pdflatex -halt-on-error "${subject}.tex"
		# ── If the word “warning” shows up anywhere in the .log, fail the build ──
		if grep -qi warning "${subject}.log"; then
			echo "GREP BELOW"
			grep -C 3 -i warning "${subject}.log"
			echo "\!\! A warning was found in ${subject}.log – treating as fatal."
			exit 1
		fi
		pdflatex -halt-on-error "${subject}.tex"
		# ── If the word “warning” shows up anywhere in the .log, fail the build ──
		if grep -qi warning "${subject}.log"; then
			echo "GREP BELOW"
			grep -C 3 -i warning "${subject}.log"
			echo "\!\! A warning was found in ${subject}.log – treating as fatal."
			exit 1
		fi
	else
		#pandoc ${subject}.tex -o ${subject}.pdf
		echo "something else"
	fi

	# Copy pdf
	#python copy_pdf.py "$subject"
	#source = os.path.join(dir_path, "built", "pug", "theory", subject, subject + ".pdf")
	#destination = os.path.join(dir_path, "public", "theory", subject + ".pdf")
	#pwd
	#ls "../../../../"
	#ls "../../../../public/"
	mkdir -p "../../../../public/theory/"
	cp "${subject}.pdf" "../../../../public/theory/"

	cd "$current_dir"
	printf "   Pandoc\n"

	# Next
	tex_files=$(find built/pug/theory/"${subject}"/ -maxdepth 1 -name \*.tex)
	for tex_file in $tex_files; do
		#printf "    $tex_file\n"
		printf "    %s\n" "$tex_file"
		html_file="${tex_file%.tex}.html"
		tex_basename="${tex_file##*/}"
		html_basename="${html_file##*/}"
		printf "        pandoc\n"
		#pandoc $tex_file --mathjax -o $html_file
		# Need to be in the directory for the \include stuff to work
		cd "$(dirname "$tex_file")"
		pandoc "$tex_basename" --mathjax -o "$html_basename"
		cd "$current_dir"

	done

	# Override tex stuff with escapes so it can be ripped when creating the headers
	# Note different max depth here. Need to change title stuff inside each folder if relevant.
	tex_files=$(find built/pug/theory/"${subject}"/ -maxdepth 2 -name \*.tex)
	for tex_file in $tex_files; do
		# Doing the sed after so it's ready for the create_sidebar bit (?). pandoc needs the \_ stuff just like pdflatex does
		# I only think we care about doing this to the header stuff because we're grabbing it later, so messing around with \(\) stuff shouldn't be an issue
		sed -i 's/\\_/_/g' "$tex_file"
		sed -i 's/\\#/#/g' "$tex_file"
		sed -i 's/\\\//\//g' "$tex_file"
	done
	# Create sidebars
	printf "   Creating side bars\n"
	# sed just needed for create_sidebars, but also needed on main tex thing too as well as individual pages as above
	sed -i 's/\\_/_/g' "built/pug/theory/${subject}/${subject}.tex"
	sed -i 's/\\#/#/g' "built/pug/theory/${subject}/${subject}.tex"

	# Need to figure out how to do this last sed correctly trying to replace \/ with /
	sed -i 's/\\\//\//g' "built/pug/theory/${subject}/${subject}.tex"
	# Doing this after pandoc because it needs the sed commands too.
	python create_sidebars.py "$subject"

done
