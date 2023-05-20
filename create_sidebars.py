
import os
#import shutil

import sys

###################################
# Create tex file for each folder #
###################################
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

# def test():
#    assert(

for subject in subjects:

    ####
    # Prep
    ####
    source_file      = os.path.join("built", "pug", "theory", subject, subject + ".tex")
    sidebar_file     = os.path.join("built", "pug", "theory", subject + "_sidebar.pug")
    non_sidebar_file = os.path.join("built", "pug", "theory", subject + ".pug")
    
    #subject_proper = subject
    
    sidebar_file_data     = open(sidebar_file    , "w")
    non_sidebar_file_data = open(non_sidebar_file, "w")
    #f2 = open(source_file, "r")
    
    ####
    # Get proper subject
    ####
    with open(source_file, "r") as source_file_data:
        for item in source_file_data:
            item = item.replace("\n", "")
            item = item.replace("\t", " ")
            item = item.strip()
            if item[0:7] == "\\title{":
                subject_proper = item[7:len(item)-1]
                
    ####
    # Write non-sidebar
    ####
    non_sidebar_file_data.write("extends ../templates/header.pug\n")
    non_sidebar_file_data.write("block content\n")
    non_sidebar_file_data.write("	div.container-fluid\n")
    non_sidebar_file_data.write("		div.row\n")
    non_sidebar_file_data.write("			//nav.col-md-2.d-none.d-md-block.bg-light.sidebar\n")
    non_sidebar_file_data.write("			nav.col-md-2.bg-light.sidebar\n")
    non_sidebar_file_data.write("				div.sidebar-sticky\n")
    non_sidebar_file_data.write("					br\n")
    non_sidebar_file_data.write("					include ./" + subject + "_sidebar.pug\n")
    non_sidebar_file_data.write("			//main.col-md-9.ml-sm-auto.col-lg-10.px-4(role=\"main\")\n")
    non_sidebar_file_data.write("			.col-md-10\n")
    non_sidebar_file_data.write("				br\n")
    non_sidebar_file_data.write("				p Please select a chapter from the left.\n")
    non_sidebar_file_data.write("				include ./" + subject + "/preface.html\n")

    ####
    # Write basic
    ####
    sidebar_file_data.write("div\n")
    sidebar_file_data.write("	h2(style=\"text-decoration:none;\")\n")
    sidebar_file_data.write("		b\n")
    sidebar_file_data.write("			a(href=\"/theory/" + subject + "\") " + subject_proper + "\n")
    sidebar_file_data.write("	p\n")
    sidebar_file_data.write("		a(href=\"/theory/" + subject + ".pdf\") Download PDF\n")
    
    ####
    # Main stuff
    ####
    contents_in_tex = []
    with open(source_file, "r") as source_file_data:
        for item in source_file_data:
            item = item.replace("\n", "")
            item = item.replace("\t", " ")
            item = item.strip()
            
            ####
            # Do h3
            ####
            if item[0:6] == "\\part{":
                content = item[6:len(item)-1]
                sidebar_file_data.write("	h3\n")
                sidebar_file_data.write("		b " + content + "\n")
                
            ####
            # Do links
            ####
            elif item[0:9] == "\\include{":
                content = item[9:len(item)-1]
                
                ####
                # Skip preface
                ####
                if content == "preface":
                    continue
                ####
                # Carry on
                ####
                else:
                    contents_in_tex.append(content)
                    
                    ####
                    # Get content proper
                    ####
                    #content_proper = content
                    #print(subject)
                    #print(content)
                    content_file = os.path.join("built", "pug", "theory", subject, content, "00-00-Chapter_name.tex")
                    with open(content_file, "r") as f3:
                        for item2 in f3:
                            item2 = item2.replace("\n", "")
                            item2 = item2.replace("\t", " ")
                            item2 = item2.strip()
                            if item2[0:9] == "\\chapter{":
                                content_proper = item2[9:len(item2)-1]
                    
                    ####
                    # Write
                    ####
                    sidebar_file_data.write("	p\n")
                    sidebar_file_data.write("		a(href=\"/theory/" + subject + "/" + content + "\") " + content_proper + "\n")
    
    ####
    # Check all folders used
    ####
    contents_in_folder = []
    directory_to_walk = os.path.join("built", "pug", "theory", subject)

    for folder in os.listdir(directory_to_walk):
        if folder.find(".") == -1:
            contents_in_folder.append(folder)
    
    contents_in_folder.sort()
    contents_in_tex.sort()
    if (contents_in_folder != contents_in_tex):
        print("\n\nContents in folder do not match tex (" + subject + ")")
        print("Folder not in tex:")
        #print(contents_in_folder)
        print([content for content in contents_in_folder if content not in contents_in_tex])
        print("Tex not in folder:")
        #print(contents_in_tex)
        print([content for content in contents_in_tex if content not in contents_in_folder])
        raise Exception("Contents do no match") 
    
    ####
    # Fin
    ####
    sidebar_file_data.close()
    non_sidebar_file_data.close()

