
import os
import shutil

#########################################
# Move PDFs to be public facing (maths) #
#########################################

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
        
maths_source = os.path.join("built", "jade", "theory", "maths", "maths.pdf")
maths_destination = os.path.join("public", "theory", "maths.pdf")
shutil.copyfile(maths_source, maths_destination)

##############################################
# Move PDFs to be public facing (statistics) #
##############################################

directory_to_walk = os.path.join("built", "jade", "theory", "statistics")

directory_to_make = os.path.join("public", "theory", "statistics")
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
        
statistics_source = os.path.join("built", "jade", "theory", "statistics", "statistics.pdf")
statistics_destination = os.path.join("public", "theory", "statistics.pdf")
shutil.copyfile(statistics_source, statistics_destination)

