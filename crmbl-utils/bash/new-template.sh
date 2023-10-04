#!/usr/bin/bash

#Options:
# $1 - Template Name
# $1[@] - Options:
#   --name, n
#   --declaration, d
#   --body, b
#   --head, h
#   --html, ht
#       -$@[@+1] "en,es,de" -> Convert string to array( "en" "es" "de" )
#   --link, l
#   --meta, m
#   --script, s
#   --css, c
#   --js, j
project_name="crmbl"
site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
project_path=$(bash ./config-util.sh --get-key-value crmblProjectRoot = ./crmbl.conf)
template_name=""
lang_string=""
is_option=false
new_declaration=false
new_body=false
new_head=false
new_html=false
new_link=false
new_meta=false
new_script=false
new_css=false
new_js=false
declare -a option_list=($@)
declare -a lang_array=()
declare -a template_path_dirs=()
declare -a template_path_files=()
declare -a option_names=(
    "--css"
    "-c"
    "-C"
    "--declaration"
    "-d"
    "-D"
    "--body"
    "-b"
    "-B"
    "--head"
    "-h"
    "-H"
    "--html"
    "-ht"
    "-HT"
    "--js"
    "-j"
    "-J"
    "--link"
    "-l"
    "-L"
    "--meta"
    "-m"
    "-M"
    "--name"
    "-n"
    "-N"
    "--script"
    "-s"
    "-S"
)

function check_if_option_name() {
    test_string="$1"
    for name in "${option_names[@]}"
    do
        if [[ "$name" == "$test_string" ]]
        then
            is_option=true
            break
        else
            is_option=false
        fi
    done
}

function set_template_name() {
    echo "What is the new template name?"
    printf "Name: "
    read template_name
    echo "Template name: $template_name"
}

function check_template_name() {
    if [[ "$template_name" == "" ]]
    then
        set_template_name
    fi
}

function arg_set_template_name() {
    temp_string="$1"
    if [[ -z $temp_string ]]
    then
        check_template_name
    else
        check_if_option_name "$temp_string"
        if [[ $is_option == true ]]
        then
            check_template_name
        else
            if [[ "$template_name" == "" ]]
            then
                template_name="$temp_string"
            fi
            echo "Template Name: $template_name"
        fi
    fi
}

function set_lang_array() {
    #expect string of language abbreviations, seperated by ',' delimiter ("en,de,fr")
    #add all items to lang_array()
    temp_lang_string=$1
    IFS=',' read -a lang_array <<< "$temp_lang_string"
}

function set_languages() {
    echo "The request to create a HTML template requires at least one language, multiple languages should be seperated by a comma ',' with no spaces.  No entry defaults to english (en)."
    echo " | Ex:"
    echo " |   en"
    echo " |   en,es,fr,de"
    printf "Input: "
    read temp_lang_string
    if [[ -z $temp_lang_string ]]
    then
        set_lang_array "en"
    else
        set_lang_array "$temp_lang_string"
    fi
}

function choose_templates() {
    echo "Please choose which sections to add to your template."
    echo "  You will be prompted to add the following sections:"
    echo "  ----"
    echo "  -Declaration"
    echo "  -HTML / Language"
    echo "  -Head"
    echo "  -Link"
    echo "  -Meta"
    echo "  -Body"
    echo "  -Script"
    echo "  ----"
    echo "Please input either (n/N) to EXCLUDE each section to the new template."
    echo "ENTER key, and other inputs default to YES/INCLUDE."
    echo ""

    echo "----"
    echo "Would you like to include a declaration?"
    printf "Declaration (y/N): "
    read usrinput
    if [[ "$usrinput" == "n" || "$usrinput" == "N" ]]
    then
        new_declaration=false
    else
        new_declaration=true
    fi

    echo ""

    echo "Would you like to include a HTML / Language section?"
    printf "HTML/Lang. (y/N): "
    read usrinput
    if [[ "$usrinput" == "n" || "$usrinput" == "N" ]]
    then
        new_html=false
    else
        new_html=true
        set_languages
    fi

    echo ""

    echo "Would you like to include a Head section?"
    printf "Head (y/N): "
    read usrinput
    if [[ "$usrinput" == "n" || "$usrinput" == "N" ]]
    then
        new_head=false
    else
        new_head=true
    fi

    echo ""

    echo "Would you like to include a Link section?"
    printf "Link (y/N): "
    read usrinput
    if [[ "$usrinput" == "n" || "$usrinput" == "N" ]]
    then
        new_link=false
    else
        new_link=true
        new_css=true
    fi

    echo ""

    echo "Would you like to include a Meta section?"
    printf "Meta (y/N): "
    read usrinput
    if [[ "$usrinput" == "n" || "$usrinput" == "N" ]]
    then
        new_meta=false
    else
        new_meta=true
    fi

    echo ""

    echo "Would you like to include a Body section?"
    printf "Body (y/N): "
    read usrinput
    if [[ "$usrinput" == "n" || "$usrinput" == "N" ]]
    then
        new_body=false
    else
        new_body=true
    fi

    echo ""

    echo "Would you like to include a Script section?"
    printf "Script (y/N): "
    read usrinput
    if [[ "$usrinput" == "n" || "$usrinput" == "N" ]]
    then
        new_script=false
    else
        new_script=true
        new_js=true
    fi

    echo ""

    if [[ $new_link == false ]]
    then
        echo "You chose NOT to add a Link section, would you still like to include a css stylesheet with this template?"
        printf "CSS Stylesheet (y/N): "
        read usrinput
        if [[ "$usrinput" == "n" || "$usrinput" == "N" ]]
        then
            new_css=false
        else
            new_css=true
        fi
    fi

    echo ""

    if [[ $new_script == false ]]
    then
        echo "You chose NOT to add a Script section, would you still like to include a js script with this template?"
        printf "JS Script (y/N): "
        read usrinput
        if [[ "$usrinput" == "n" || "$usrinput" == "N" ]]
        then
            new_js=false
        else
            new_js=true
        fi
    fi
    echo "----"
}

function initialize_template() {
    #Check argments provided when script initialized
    if [[ -z "$first_option" ]]
    then
        #No arguments given.
        #Ask for template name, then give full rundown of options
        check_template_name
        choose_templates
    else
        option_pos=0
        option_count=${#option_list[@]}
        #Determine what to do with a single argument
        if [[ $option_count -lt 2 ]]
        then
            #Check if single argument is a valid option:
            check_if_option_name "$1"
            if [[ $is_option == true ]]
            then
                check_args
            else
                #If single argument is NOT a valid option, assume its a template name:
                template_name="$1"
                choose_templates
            fi
        else
            #Handle multiple arguments
            check_if_option_name "${option_list[0]}"
            if [[ $is_option == false ]]
            then
                template_name="${option_list[0]}"
            fi
            check_args
        fi
    fi
}

function review_sections() {
    echo "You have chosen to create a template named:"
    echo "[ $template_name ]"
    echo "The following options have been set:"
    echo "----"
    [[ $new_declaration == true ]] && printf "[x" || printf "[ "
    printf "] Declaration\n"

    [[ $new_html == true ]] && printf "[x" || printf "[ "
    printf "] HTML\n"
    
    printf "    Language(s): [ "
    for lang in "${lang_array[@]}"
    do
        printf "$lang "
    done
    printf "]\n"
    [[ $new_head == true ]] && printf "[x" || printf "[ "
    printf "] Head\n"
    [[ $new_link == true ]] && printf "[x" || printf "[ "
    printf "] Link\n"
    [[ $new_meta == true ]] && printf "[x" || printf "[ "
    printf "] Meta\n"
    [[ $new_body == true ]] && printf "[x" || printf "[ "
    printf "] Body\n"
    [[ $new_script == true ]] && printf "[x" || printf "[ "
    printf "] Script\n"
    [[ $new_css == true ]] && printf "[x" || printf "[ "
    printf "] Stylesheet (css)\n"
    [[ $new_js == true ]] && printf "[x" || printf "[ "
    printf "] Custom Script (js)\n"
    echo "----"
    echo ""
    
}

function check_args() {
    i=0
    #option_pos=0
    for option in "${option_list[@]}"
    do
        if [[ "$option" == "--name" || "$option" == "-n" || "$option" == "-N" ]]
        then
            next_string="${option_list[((i+1))]}"
            arg_set_template_name "$next_string"
            break
        fi
        ((i=i+1))
    done
    for option in "${option_list[@]}"
    do
        case $option in
            --declaration | -d | -D )
                check_template_name
                new_declaration=true
                ;;
            --body | -b | -B )
                check_template_name
                new_body=true
                ;;
            --css | -c | -C )
                check_template_name
                new_css=true
                ;;
            --head | -h | -H )
                check_template_name
                new_head=true
                ;;
            --help | --HELP )
                #Does not expect additional option
                echo "help mode!"
                ;;
            --html | -ht | -HT )
                #Expects string of language abbreviations seperated by comma:
                #--html en,es,de,fr
                check_template_name
                temp_string="${option_list[((option_pos+1))]}"
                if [[ -z $temp_string ]]
                then
                    temp_string="--html"
                fi
                check_if_option_name "$temp_string"
                if [[ $is_option == true ]]
                then
                    set_languages
                else
                    #Need to check for proper lang abbreviations
                    set_lang_array "$temp_string"
                fi
                new_html=true
                ;;
            --js | -j | -J )
                check_template_name
                new_js=true
                ;;
            --link | -l | -L )
                check_template_name
                new_link=true
                ;;
            --meta | -m | -M )
                check_template_name
                new_meta=true
                ;;
            --script | -s | -S )
                check_template_name
                new_script=true
                ;;
            #* )
            #    echo "Unknown"
            #    ;;
        esac
        ((option_pos=option_pos+1))
        check_if_option_name "$option"
    done
}

function confirm_sections() {
    echo "Would you like to keep these selections?"
    printf "Confirm (y/N): "
    read usrinput
}

function change_sections() {
    echo "Which section would you like to change?"
    printf "1)  Template Name: $template_name (Edit)\n"
    printf "2)  ["
    [[ $new_declaration == true ]] && printf "x" || printf " "
    printf "] Declaration (Toggle On/Off)\n"
    printf "3)  ["
    [[ $new_html == true ]] && printf "x" || printf " "
    printf "] HTML/Lang (Toggle On/Off)\n"
    printf "4)      Languages: "
    for lang in "${lang_array[@]}"
    do
        printf "$lang "
    done

    printf "(Edit)\n"
    printf "5)  ["
    [[ $new_head == true ]] && printf "x" || printf " "
    printf "] Head (Toggle On/Off)\n"
    printf "6)  ["
    [[ $new_link == true ]] && printf "x" || printf " "
    printf "] Link (Toggle On/Off)\n"
    printf "7)  ["
    [[ $new_meta == true ]] && printf "x" || printf " "
    printf "] Meta (Toggle On/Off)\n"
    printf "8)  ["
    [[ $new_body == true ]] && printf "x" || printf " "
    printf "] Body (Toggle On/Off)\n"
    printf "9)  ["
    [[ $new_script == true ]] && printf "x" || printf " "
    printf "] Script (Toggle On/Off)\n"
    printf "10) ["
    [[ $new_css == true ]] && printf "x" || printf " "
    printf "] Stylesheet (css) (Toggle On/Off)\n"
    printf "11) ["
    [[ $new_js == true ]] && printf "x" || printf " "
    printf "] Custom Script (js) (Toggle On/Off)\n"
    printf "12) Keep settings\n\n"
    echo "----"

    while true
    do
        printf "Please make a selection:\n(1-12): "
        read usrinput
        case $usrinput in
            1 )
                set_template_name
                break
                ;;
            2 )
                [[ $new_declaration == true ]] && new_declaration=false || new_declaration=true
                break
                ;;
            3 )
                [[ $new_html == true ]] && new_html=false || new_html=true
                break
                ;;
            4 )
                set_languages
                break
                ;;
            5 )
                [[ $new_head == true ]] && new_head=false || new_head=true
                break
                ;;
            6 )
                [[ $new_link == true ]] && new_link=false || new_link=true
                break
                ;;
            7 )
                [[ $new_meta == true ]] && new_meta=false || new_meta=true
                break
                ;;
            8 )
                [[ $new_body == true ]] && new_body=false || new_body=true
                break
                ;;
            9 )
                [[ $new_script == true ]] && new_script=false || new_script=true
                break
                ;;
            10 )
                [[ $new_css == true ]] && new_css=false || new_css=true
                break
                ;;
            11 )
                [[ $new_js == true ]] && new_js=false || new_js=true
                break
                ;;
            12 )
                break
                ;;
        esac
    done
}

function confirm_loop() {
    usrinput=""
    while true
    do
        confirm_sections
        if [[ "$usrinput" == "Y" || "$usrinput" == "y" ]]
        then
            break
        elif [[ "$usrinput" == "N" || "$usrinput" == "n" ]]
        then
            echo "Redo settings."
            change_sections
            review_sections
        else
            echo "Invalid input"
        fi
    done
}

function confirm() {
    review_sections
    confirm_loop
}

function create_template_paths() {
    #Add media path
    template_path_dirs+=("$site_path")
    template_path_dirs+=("$project_path")
    template_path_dirs+=("$project_path/include")
    template_path_dirs+=("$project_path/include/media")
    template_path_dirs+=("$project_path/include/media/template")
    template_path_dirs+=("$project_path/include/media/template/$template_name")
    template_path_dirs+=("$project_path/include/style")
    template_path_dirs+=("$project_path/include/style/template")
    template_path_dirs+=("$project_path/include/script")
    template_path_dirs+=("$project_path/include/script/template")
    template_path_dirs+=("$project_path/template")
    template_path_dirs+=("$project_path/template/declaration")
    template_path_dirs+=("$project_path/template/body")
    template_path_dirs+=("$project_path/template/head")
    template_path_dirs+=("$project_path/template/html")
    template_path_dirs+=("$project_path/template/link")
    template_path_dirs+=("$project_path/template/meta")
    template_path_dirs+=("$project_path/template/script")

    if [[ $new_declaration == true ]]
    then
        #Add declaration folder path.
        template_path_dirs+=("$project_path/template/declaration/$template_name")
        #Add file path
        template_path_files+=("$project_path/template/declaration/$template_name/declaration.php")
    fi

    if [[ $new_body == true ]]
    then
        template_path_dirs+=("$project_path/template/body/$template_name")
        template_path_files+=("$project_path/template/body/$template_name/body.php")
    fi

    if [[ $new_head == true ]]
    then
        template_path_dirs+=("$project_path/template/head/$template_name")
        template_path_files+=("$project_path/template/head/$template_name/head.php")
    fi

    if [[ $new_html == true ]]
    then
        template_path_dirs+=("$project_path/template/html/$template_name")
        for template_lang in "${lang_array[@]}"
        do
            template_path_dirs+=("$project_path/template/html/$template_name/$template_lang")
            template_path_files+=("$project_path/template/html/$template_name/$template_lang/html.php")
        done
    fi

    if [[ $new_link == true ]]
    then
        template_path_dirs+=("$project_path/template/link/$template_name")
        template_path_files+=("$project_path/template/link/$template_name/link.php")
    fi

    if [[ $new_meta == true ]]
    then
        template_path_dirs+=("$project_path/template/meta/$template_name")
        template_path_files+=("$project_path/template/meta/$template_name/meta.php")
    fi

    if [[ $new_script == true ]]
    then
        template_path_dirs+=("$project_path/template/script/$template_name")
        template_path_files+=("$project_path/template/script/$template_name/script.php")
    fi

    if [[ $new_css == true ]]
    then
        template_path_dirs+=("$project_path/include/style/template/$template_name")
        template_path_files+=("$project_path/include/style/template/$template_name/main.css.php")
    fi

    if [[ $new_js == true ]]
    then
        template_path_dirs+=("$project_path/include/script/template/$template_name")
        template_path_files+=("$project_path/include/script/template/$template_name/main.js")
    fi
}

function create_template_dirs(){
    for directory in "${template_path_dirs[@]}"
    do
        if [[ ! -d "$directory" ]]
        then
            mkdir $directory
        fi
    done
}

function write_template_files(){
    for file in "${template_path_files[@]}"
    do
        if [[ ! -f "$file" ]]
        then
            touch $file
        fi
    done
}

###
# Script workflow starts here
###

###
# Check initial arguments & set parameters to create
###
first_option=$1
initialize_template

###
# Review, make changes, and confirm
###
confirm

###
# Write new template
###
create_template_paths
create_template_dirs
write_template_files

echo "Done."

echo "The new template is currently in the project staging folder.  Utilize the backup-template script to isolate the template from the project."
