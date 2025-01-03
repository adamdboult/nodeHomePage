"""
Readme
"""

import os

import sys

###################################
# Create tex file for each folder #
###################################
subjects = [sys.argv[1]]

for subject in subjects:

    directory_to_walk = os.path.join("built", "pug", "theory", subject)

    for folder in os.listdir(directory_to_walk):
        # print("")
        # print(folder)
        if not os.path.isdir(os.path.join(directory_to_walk, folder)):
            continue

        tex_files = os.listdir(os.path.join(directory_to_walk, folder))
        tex_files = sorted(tex_files)
        lines = []

        for tex_file in tex_files:
            line = r"\input{" + folder + "/" + os.path.splitext(tex_file)[0] + "}"
            lines.append(line)
        # print(lines)
        with open(
            os.path.join(directory_to_walk, folder + ".tex"), "w", encoding="utf-8"
        ) as f:

            for line in lines:
                f.write(line + "\n")

        with open(
            os.path.join(directory_to_walk, folder + ".pug"), "w", encoding="utf-8"
        ) as f:

            f.write("extends ../../templates/header.pug\n")
            f.write("block content\n")
            f.write("	style\n")
            f.write(
                "		| h1 {font-weight: bold; text-decoration:underline; text-align:center;}\n"
            )
            f.write("		| h2 {font-weight: bold; text-decoration:underline;}\n")
            f.write("		| h3 {font-weight: bold;}\n")
            f.write("	div.container-fluid\n")
            f.write("		div.row\n")
            # f.write("			nav.col-md-2.d-none.d-md-block.bg-light.sidebar\n")
            f.write("			nav.col-md-2.bg-light.sidebar\n")
            f.write("				div.sidebar-sticky\n")
            f.write("					br\n")
            f.write("					include ../" + subject + "_sidebar.pug\n")
            # f.write("			main.col-md-9.ml-sm-auto.col-lg-10.px-4(role=\"main\")\n")
            f.write("			.col-md-10\n")
            f.write("				br\n")
            f.write("				include " + folder + ".html\n")
