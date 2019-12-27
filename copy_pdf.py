
import os
import shutil

###################################
# Create tex file for each folder #
###################################

directory_to_walk = os.path.join("built", "jade", "theory", "maths")

directory_to_make = os.path.join("public", "theory", "maths")
if not os.path.exists(directory_to_make):
    os.makedirs(directory_to_make)

for file_name in os.listdir(directory_to_walk):
    #print("")
    #print(folder)
    if os.path.isdir(os.path.join(directory_to_walk, file_name)):
        #print(folder)
        continue
    if file_name.endswith(".pdf"):
        source = os.path.join(directory_to_walk, file_name)
        destination = os.path.join(directory_to_make, file_name)
        print(file_name)
        shutil.copyfile(source, destination)
        

