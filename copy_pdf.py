
import os
import shutil



subjects = ["maths", "statistics"]

directory_to_make = os.path.join("public", "theory")
if not os.path.exists(directory_to_make):
    os.makedirs(directory_to_make)

for subject in subjects:
    source = os.path.join("built", "jade", "theory", subject, subject + ".pdf")
    destination = os.path.join("public", "theory", subject + ".pdf")
    shutil.copyfile(source, destination)

