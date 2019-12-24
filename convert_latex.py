
import os

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
    #for tex_folder in os.listdir(os.path.join(directory_to_walk, folder)):
    #    print(tex_folder)

#d = os.walk(os.path.join(directory_to_walk, "sets"))
#for x in d:
#    print("\n")
#    print(x)
#print(d)
#print(2)
#os.listdir("./")
#
#print(3)
