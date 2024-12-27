"""
Readme
"""

import os


###################################
# Get list of big pages available #
###################################
availableBigPages = [
    os.path.basename(f.path)
    for f in os.scandir(os.path.join("src/pug/theory"))
    if f.is_dir()
]

#####################
# Get ordering page #
#####################

bigPagesList = []


currentHeader = {}

with open("bigPages.txt", encoding="utf-8") as bigPages:
    is_first_iteration = True
    for line in bigPages:
        if len(line) < 2:
            continue
        # line = line,
        line = line.replace("\n", "")
        if line[0] == "\t":
            if "items" not in currentHeader:
                raise KeyError("Not right")
            currentHeader["items"].append(line[1:])
        else:
            if is_first_iteration is False:
                bigPagesList.append(currentHeader)
            is_first_iteration = False
            currentHeader = {"heading": line, "items": []}
    bigPagesList.append(currentHeader)

allBigPaths = []
for bigPagesDict in bigPagesList:
    allBigPaths = allBigPaths + bigPagesDict["items"]

if len(allBigPaths) != len(set(allBigPaths)):
    raise ValueError("Non unique entries in big pages list")

# print(bigPagesList)
# print(currentHeader)
# awdaw


#########################################
# Check unique and not missed any/extra #
#########################################

for thing in allBigPaths:
    if not thing in availableBigPages:
        print(thing)
        raise ValueError(f"{thing} requested but not available")

for thing in availableBigPages:
    if not thing in allBigPaths:
        print(thing)
        raise ValueError(f"{thing} available but not requested")

#################################
# Get actual names of big pages #
#################################

nameMapper = {}

for bigPagesDict in bigPagesList:
    for bigPageShort in bigPagesDict["items"]:
        path = os.path.join("built/pug/theory/", bigPageShort, f"{bigPageShort}.tex")
        print("\n" + bigPageShort)
        with open(path, encoding="utf-8") as texFile:
            for line in texFile:
                if line[:6] != "\\title":
                    continue
                # print(line[6+1:-2])
                nameMapper[bigPageShort] = line[6 + 1 : -2]
                # line = line,
                # line = line.replace("\n", "")

        # \title{Algebra}

######################
# Create header file #
######################


with open(os.path.join("built/pug/templates/header.pug"), "w", encoding="utf-8") as f:

    f.write("extends headerCore.pug\n")
    f.write("block dropdown\n")

    ####
    # OLD
    ####
    first_bit = True
    for bigPagesDict in bigPagesList:
        if first_bit is False:
            f.write("	div.dropdown-divider\n")
        for bigPageShort in bigPagesDict["items"]:
            f.write(
                f'	a.dropdown-item(href="/theory/{bigPageShort}/") {nameMapper[bigPageShort]}\n'
            )
        first_bit = False

####
# NEW
####
# for bigPagesDict in bigPagesList:
#    f.write(f'	a.dropdown-item(href="#") {bigPagesDict["heading"]}\n')
#    f.write(f'	ul.dropdown-menu.dropdown-submenu\n')
#    for bigPageShort in bigPagesDict["items"]:
#        f.write(f'		li\n')
#        f.write(f'			a.dropdown-item(href="/theory/{bigPageShort}/") {nameMapper[bigPageShort]}\n')

####################
# Create home file #
####################

with open(os.path.join("built/pug/home.pug"), "w", encoding="utf-8") as f:

    f.write("extends homeCore.pug\n")
    f.write("block bigNotes\n")

    for bigPagesDict in bigPagesList:
        f.write(f'	p {bigPagesDict["heading"]}\n')
        f.write("	ul\n")
        for bigPageShort in bigPagesDict["items"]:
            f.write("		li\n")
            f.write(
                f'			a(href="/theory/{bigPageShort}/") {nameMapper[bigPageShort]}\n'
            )
            f.write("			|  \n")
            f.write(f'			a(href="/theory/{bigPageShort}.pdf") (pdf)\n')
