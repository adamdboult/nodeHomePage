
import os

import shutil

###################################
# Create tex file for each folder #
###################################

directory_to_walk = os.path.join("built", "jade", "theory", "maths")

for folder in os.listdir(directory_to_walk):
    print("")
    print(folder)
    if not os.path.isdir(os.path.join(directory_to_walk, folder)):
        #print(folder)
        continue

    #tex_directory = os.path.join(directory_to_walk, folder)
    #print(tex_directory)
    tex_files = os.listdir(os.path.join(directory_to_walk, folder))
    tex_files = sorted(tex_files)
    lines = []
    for tex_file in tex_files:
        line = "\include{" + folder + "/" + tex_file + "}"
        #print(line)
        lines.append(line)
    print(lines)
    f = open(os.path.join(directory_to_walk, folder + ".tex"), "w")

    for line in lines:
        f.write(line + "\n")

    f.close()

    f = open(os.path.join(directory_to_walk, folder + ".jade"), "w")

    f.write("extends ../../templates/loginHeader.jade\n")
    f.write("block content\n")
    f.write("	div.container-fluid\n")
    f.write("		div.row\n")
    f.write("			nav.col-md-2.d-none.d-md-block.bg-light.sidebar\n")
    f.write("				div.sidebar-sticky\n")
    f.write("					include ../maths_sidebar.jade\n")
    f.write("			main.col-md-9.ml-sm-auto.col-lg-10.px-4(role=\"main\")\n")
    #f.write("				div.d-flex.justify-content-between.flex-wrap.flex-md-nowrap.align-items-center.pt-3.pb-2.mb-3.border-bottom\n")
    f.write("				include " + folder + ".html\n")

    f.close()
    #for tex_folder in os.listdir(os.path.join(directory_to_walk, folder)):
    #    print(tex_folder)


