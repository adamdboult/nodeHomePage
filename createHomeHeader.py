
import os
import shutil

import sys

###################################
# Get list of big pages available #
###################################

#print(os.path.basename(your_path))
#print(os.walk(os.path.join("src/pug/theory")))
availableBigPages = [ os.path.basename(f.path) for f in os.scandir(os.path.join("src/pug/theory")) if f.is_dir() ]
#print(availableBigPages)
#raise Exception("hi")
#####################
# Get ordering page #
#####################

bigPagesList = [] 

first = True

with open('bigPages.txt') as bigPages:
    for line in bigPages:
        if len(line) < 2:
            continue
        #line = line,
        line = line.replace("\n", "")
        #print("THING")
        #print(line)
        #print(line,)
        #print("DONE")
        if line[0] == "\t":
            #print("here")
            currentHeader["items"].append(line[1:])
        else:
            #print("there")
            if first is False:
                bigPagesList.append(currentHeader)
            first = False
            currentHeader = {"heading": line, "items": []}
    bigPagesList.append(currentHeader)
        
#print(bigPagesList)
#raise Exception("hi")
allBigPaths = []
for bigPagesDict in bigPagesList:
    allBigPaths = allBigPaths + bigPagesDict["items"]

#print(allBigPaths)
#print(len(allBigPaths))
#print(len(set(allBigPaths)))
if len(allBigPaths) != len(set(allBigPaths)):
    raise Exception("Non unique entries in big pages list")

        
#########################################
# Check unique and not missed any/extra #
#########################################

#print(len(allBigPaths))
#print(len(availableBigPages))
#print(list(set(allBigPaths)))
#print(list(set(availableBigPages)))

for thing in allBigPaths:
    if not thing in availableBigPages:
        raise Exception(f"{thing} requested but not available") 
        #print(thing)

for thing in availableBigPages:
    if not thing in allBigPaths:
        raise Exception(f"{thing} available but not requested")
        #print(thing)

#################################
# Get actual names of big pages #
#################################

nameMapper = {}

for bigPagesDict in bigPagesList:
    for bigPageShort in bigPagesDict["items"]:
        path = os.path.join("src/pug/theory/", bigPageShort, f"{bigPageShort}.tex")
        print("\n" + bigPageShort)
        with open(path) as texFile:
            for line in texFile:
                if line[:6] != "\\title":
                    continue
                #print(line[6+1:-2])
                nameMapper[bigPageShort] =line[6+1:-2] 
                #line = line,
                #line = line.replace("\n", "")

        #\title{Algebra}

        #print(os.bigPageShort)
#print(nameMapper)
#raise Exception("hia")


###################################
# Create header ile #
###################################


f = open(os.path.join("built/pug/templates/header.pug"), "w")

f.write("extends headerCore.pug\n")
f.write("block dropdown\n")

first_bit = True
for bigPagesDict in bigPagesList:
    if first_bit is False:
        f.write('	div.dropdown-divider\n')
    for bigPageShort in bigPagesDict["items"]:
        f.write(f'	a.dropdown-item(href="/theory/{bigPageShort}/") {nameMapper[bigPageShort]}\n')
    first_bit = False

f.close
####################
# Create home file #
####################

f = open(os.path.join("built/pug/home.pug"), "w")

f.write("extends homeCore.pug\n")
f.write("block bigNotes\n")

for bigPagesDict in bigPagesList:
    f.write(f'	p {bigPagesDict["heading"]}\n')
    f.write(f'	ul\n')
    for bigPageShort in bigPagesDict["items"]:
        f.write(f'		li\n')
        f.write(f'			a(href="/theory/{bigPageShort}/") {nameMapper[bigPageShort]}\n')
        f.write(f'			|  \n')
        f.write(f'			a(href="/theory/{bigPageShort}.pdf") (pdf)\n')




f.close
