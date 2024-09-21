import os
import shutil

import sys

dir_path = os.path.dirname(os.path.realpath(__file__))

subjects = [sys.argv[1]]

directory_to_make = os.path.join(dir_path, "public", "theory")
if not os.path.exists(directory_to_make):
    os.makedirs(directory_to_make)

for subject in subjects:
    source = os.path.join(dir_path, "built", "pug", "theory", subject, subject + ".pdf")
    #print(os.listdir(os.path.join(dir_path, "built", "pug", "theory", subject)))
    destination = os.path.join(dir_path, "public", "theory", subject + ".pdf")
    shutil.copyfile(source, destination)

