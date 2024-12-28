"""
Readme
"""

import os


###################################
# Get list of big pages available #
###################################
def get_available_big_pages():
    """
    Documentation
    """
    available_big_pages = [
        os.path.basename(f.path)
        for f in os.scandir(os.path.join("src/pug/theory"))
        if f.is_dir()
    ]
    return available_big_pages


#####################
# Get ordering page #
#####################


def get_big_pages_list():
    """
    Documentation
    """
    big_pages_list = []

    current_header = {}

    with open("bigPages.txt", encoding="utf-8") as big_pages:
        is_first_iteration = True
        for line in big_pages:
            if len(line) < 2:
                continue
            # line = line,
            line = line.replace("\n", "")
            if line[0] == "\t":
                if "items" not in current_header:
                    raise KeyError("Not right")
                current_header["items"].append(line[1:])
            else:
                if is_first_iteration is False:
                    big_pages_list.append(current_header)
                is_first_iteration = False
                current_header = {"heading": line, "items": []}
        big_pages_list.append(current_header)

    all_big_paths = []
    for big_pages_dict in big_pages_list:
        all_big_paths = all_big_paths + big_pages_dict["items"]

    if len(all_big_paths) != len(set(all_big_paths)):
        raise ValueError("Non unique entries in big pages list")

    return big_pages_list


#########################################
# Check unique and not missed any/extra #
#########################################


def check_consistency(available_big_pages, big_pages_list):
    """
    Documentation
    """
    all_big_paths = []
    for big_pages_dict in big_pages_list:
        all_big_paths = all_big_paths + big_pages_dict["items"]

    for thing in all_big_paths:
        if not thing in available_big_pages:
            print(thing)
            raise ValueError(f"{thing} requested but not available")

    for thing in available_big_pages:
        if not thing in all_big_paths:
            print(thing)
            raise ValueError(f"{thing} available but not requested")


#################################
# Get actual names of big pages #
#################################


def get_name_mapper(big_pages_list):
    """
    Documentation
    """

    name_mapper = {}
    for big_pages_dict in big_pages_list:
        for big_page_short in big_pages_dict["items"]:
            path = os.path.join(
                "built/pug/theory/", big_page_short, f"{big_page_short}.tex"
            )
            print("\n" + big_page_short)
            with open(path, encoding="utf-8") as tex_file:
                for line in tex_file:
                    if line[:6] != "\\title":
                        continue
                    # print(line[6+1:-2])
                    name_mapper[big_page_short] = line[6 + 1 : -2]
                    # line = line,
                    # line = line.replace("\n", "")
    return name_mapper


######################
# Create header file #
######################


def create_header_file(big_pages_list, name_mapper):
    """
    Documentation
    """

    with open(
        os.path.join("built/pug/templates/header.pug"), "w", encoding="utf-8"
    ) as f:

        f.write("extends headerCore.pug\n")
        f.write("block dropdown\n")

        first_bit = True
        for big_pages_dict in big_pages_list:
            if first_bit is False:
                f.write("	div.dropdown-divider\n")
            for big_page_short in big_pages_dict["items"]:
                f.write(
                    f'	a.dropdown-item(href="/theory/{big_page_short}/") {name_mapper[big_page_short]}\n'
                )
            first_bit = False


####################
# Create home file #
####################


def create_home_file(big_pages_list, name_mapper):
    """
    Documentation
    """
    with open(os.path.join("built/pug/home.pug"), "w", encoding="utf-8") as f:

        f.write("extends homeCore.pug\n")
        f.write("block bigNotes\n")

        for big_pages_dict in big_pages_list:
            f.write(f'	p {big_pages_dict["heading"]}\n')
            f.write("	ul\n")
            for big_page_short in big_pages_dict["items"]:
                f.write("		li\n")
                f.write(
                    f'			a(href="/theory/{big_page_short}/") {name_mapper[big_page_short]}\n'
                )
                f.write("			|  \n")
                f.write(f'			a(href="/theory/{big_page_short}.pdf") (pdf)\n')


########
# Main #
########
def main():
    """
    Main
    """

    available_big_pages = get_available_big_pages()
    big_pages_list = get_big_pages_list()
    check_consistency(available_big_pages, big_pages_list)
    name_mapper = get_name_mapper(big_pages_list)

    create_header_file(big_pages_list, name_mapper)

    create_home_file(big_pages_list, name_mapper)


if __name__ == "__main__":
    main()
