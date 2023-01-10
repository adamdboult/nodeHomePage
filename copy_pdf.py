
import os
import shutil

import sys

dir_path = os.path.dirname(os.path.realpath(__file__))
"""
subjects = [
    "logic", "algebra", "analysis", "geometry", "computer",
    "probabilityUnivariate", "probabilityMultivariate", "probabilityTimeSeriesUnivariate", "probabilityTimeSeriesMultivariate", "machineLearning", "neuralNetworks",
    "physics", "biology", "engineering", "applied",
    "unix", "graphics", "networks", "databases", "cpp", "java", "javascript", "python",
    "VMEmulation", "otherCLanguages", "otherLispLanguages", "otherCompiledLanguages", "R", "otherLanguages", "distributedComputing",
    "ai", "equilibrium", "IO", "MBF", "economics", "macroeconomics", "publicChoice", "history", "epistemologyOntology", "philosophy"
]
"""
subjects = [sys.argv[1]]

directory_to_make = os.path.join(dir_path, "public", "theory")
if not os.path.exists(directory_to_make):
    os.makedirs(directory_to_make)

for subject in subjects:
    source = os.path.join(dir_path, "built", "pug", "theory", subject, subject + ".pdf")
    print(os.listdir(os.path.join(dir_path, "built", "pug", "theory", subject)))
    destination = os.path.join(dir_path, "public", "theory", subject + ".pdf")
    shutil.copyfile(source, destination)

