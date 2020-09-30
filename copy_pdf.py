
import os
import shutil

dir_path = os.path.dirname(os.path.realpath(__file__))

subjects = ["maths", "computer", "probability", "statistics", "physics", "ai", "biology", "engineering", "economics", "culture", "philosophy", "history", "organisations"]

directory_to_make = os.path.join(dir_path, "public", "theory")
if not os.path.exists(directory_to_make):
    os.makedirs(directory_to_make)

for subject in subjects:
    source = os.path.join(dir_path, "built", "jade", "theory", subject, subject + ".pdf")
    print(os.listdir(os.path.join(dir_path, "built", "jade", "theory", subject)))
    destination = os.path.join(dir_path, "public", "theory", subject + ".pdf")
    shutil.copyfile(source, destination)

