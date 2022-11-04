
import os
import shutil

dir_path = os.path.dirname(os.path.realpath(__file__))

subjects = ["logic", "algebra", "analysis", "geometry", "computer", "probability", "statistics", "neuralNetworks", "applied", "physics", "programming", "OOP", "VMEmulation", "python", "R", "javascript", "otherProgrammingLanguages", "ai", "biology", "engineering", "equilibrium", "economics", "macroeconomics", "publicChoice", "history", "epistemologyOntology", "philosophy"]

directory_to_make = os.path.join(dir_path, "public", "theory")
if not os.path.exists(directory_to_make):
    os.makedirs(directory_to_make)

for subject in subjects:
    source = os.path.join(dir_path, "built", "pug", "theory", subject, subject + ".pdf")
    print(os.listdir(os.path.join(dir_path, "built", "pug", "theory", subject)))
    destination = os.path.join(dir_path, "public", "theory", subject + ".pdf")
    shutil.copyfile(source, destination)

