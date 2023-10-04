#!/usr/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
engine_path=$(bash ./config-util.sh --get-key-value EnginePath = ./crmbl.conf)
modules_path=$(bash ./config-util.sh --get-key-value ModulesPath = ./crmbl.conf)
sites_path=$(bash ./config-util.sh --get-key-value SitesPath = ./crmbl.conf)
templates_path=$(bash ./config-util.sh --get-key-value TemplatesPath = ./crmbl.conf)
web_root=$(bash ./config-util.sh --get-key-value WebRoot = ./crmbl.conf)
publish_path=$(bash ./config-util.sh --get-key-value PublishPath = ./crmbl.conf)
no_action=true
possible_selections=0
optional_selections=0
declare -A selection_array
MENU_ERR_MSG=""
site_deployed=false
site_published=false
engine_exist=false
modules_exist=false
sites_exist=false
templates_exist=false
engine_available=false
engine_deployed=false
engine_published=false
mods_available=false
mods_deployed=false
mods_published=false
sites_available=false
sites_deployed=false
sites_published=false
templates_available=false
templates_deployed=false
templates_published=false


#####################
# Resource Checking #
#####################

function check_installs() {
    if [[ ! -d "$site_path" && ! -d "$publish_path" ]]
        then
            no_action=true
        else
            no_action=true
            if [[ ! -d "$site_path" ]]
            then
                site_deployed=false
            else
                site_deployed=true
                no_action=false
            fi

            if [[ $site_deployed == true ]]
            then
                check_deployed_resources
            fi

            if [[ ! -d "$publish_path" ]]
            then
                site_published=false
            else
                site_published=true
                no_action=false
            fi
            
            if [[ $site_published == true ]]
            then
                check_published_resources
            fi
    fi
}

function display_installs() {
    check_installs
    if [[ ! -d "$site_path" && ! -d "$publish_path" ]]
    then
        echo "  [ ] Site Deployed  (!)" 
        echo "  [ ] Site Published (!)"
    else
        printf "  ["
        if [[ ! -d "$site_path" ]]
        then
            printf " "
        else
            printf "x"
        fi
        printf "] Site Deployed "
        if [[ $site_deployed == false ]]
        then
            printf " (!)\n"
        else
            check_deployed_resources
            printf " "
            if [[ $engine_deployed == true ]]
            then
                printf "[E]"
            fi
            if [[ $mods_deployed == true ]]
            then
                printf "[M]"
            fi
            if [[ $sites_deployed == true ]]
            then
                printf "[S]"
            fi
            if [[ $templates_deployed == true ]]
            then
                printf "[T]"
            fi
            printf " "
            if [[ $engine_deployed == false || $mods_deployed == false || $sites_deployed == false || $templates_deployed == false ]]
            then
                printf "(!)"
            fi
            printf "\n"
        fi

        printf "  ["
        if [[ ! -d "$publish_path" ]]
        then
            printf " "
        else
            printf "x"
        fi
            
        printf "] Site Published"
        if [[ $site_published == false ]]
        then
            printf " (!)\n"
        else
            check_published_resources
            printf " "
            if [[ $engine_published == true ]]
            then
                printf "[E]"
            fi
            if [[ $mods_published == true ]]
            then
                printf "[M]"
            fi
            if [[ $sites_published == true ]]
            then
                printf "[S]"
            fi
            if [[ $templates_published == true ]]
            then
                printf "[T]"
            fi
            printf " "
            if [[ $engine_published == false || $mods_published == false || $sites_published == false || $templates_published == false ]]
            then
                printf "(!)"
            fi
            printf "\n"
        fi
    fi
}

function check_resources() {
    if [[ ! -d "$engine_path" ]]
    then
        engine_exist=false
    else
        engine_exist=true
    fi

    if [[ ! -d "$modules_path" ]]
    then
        modules_exist=false
    else
        modules_exist=true
    fi

    if [[ ! -d "$sites_path" ]]
    then
        sites_exist=false
    else
        sites_exist=true
    fi
    
    if [[ ! -d "$templates_path" ]]
    then
        templates_exist=false
    else
        templates_exist=true
    fi
    check_available_resources
    check_deployed_resources
    check_published_resources
}

function display_resources() {
    check_resources
    printf "  ["
    if [[ $engine_exist == false ]]
    then
        printf " "
    else
        printf "x"
    fi
    printf "] Engine"
    if [[ $engine_exist == false ]]
    then
        printf " (!)\n"
    else
        printf "\n"
    fi

    printf "  ["
    if [[ $modules_exist == false ]]
    then
        printf " "
    else
        printf "x"
    fi
    printf "] Modules\n"

    printf "  ["
    if [[ $sites_exist == false ]]
    then
        printf " "
    else
        printf "x"
    fi
    printf "] Sites\n"
    
    printf "  ["
    if [[ $templates_exist == false ]]
    then
        printf " "
    else
        printf "x"
    fi
    printf "] Templates\n"
}

function check_available_resources() {
    if [[ -d "$engine_path/crmbl" ]]
    then
        engine_available=true
        engine_exist=true
    else
        engine_available=false
    fi
    temp_string=$(bash ./list-available-mods.sh)
    if [[ ! -z $temp_string ]]
    then
        if [[ "$temp_string" == "*" || "$temp_string" == "Invalid project path provided. Exiting" ]]
        then
            mods_available=false
        else
            mods_available=true
            modules_exist=true
        fi
    fi
    temp_string=$(bash ./list-available-sites.sh)
    if [[ ! -z $temp_string ]]
    then
        if [[ "$temp_string" == "*" || "$temp_string" == "Invalid project path provided. Exiting" ]]
        then
            sites_available=false
        else
            sites_available=true
            sites_exist=true
        fi
    fi
    temp_string=$(bash ./list-available-templates.sh)
    if [[ ! -z $temp_string ]]
    then
        if [[ "$temp_string" == "*" ]]
        then
            templates_available=false
        else
            templates_available=true
            templates_exist=true
        fi
    fi
}

function check_published_resources() {
    if [[ $site_published == true ]]
    then
        if [[ -d "$web_root/crmbl/data/source/site" ]]
        then
            engine_published=true
        else
            engine_published=false
        fi
        temp_string=$(bash ./list-mods.sh --location $web_root)
        if [[ "$temp_string" == "*" || "$temp_string" == "Invalid project path provided. Exiting" ]]
        then
            mods_published=false
        else
            mods_published=true
        fi
        temp_string=$(bash ./list-sites.sh --location $web_root)
        if [[ "$temp_string" == "*" || "$temp_string" == "Invalid project path provided. Exiting" ]]
        then
            sites_published=false
        else
            sites_published=true
        fi
        temp_string=$(bash ./list-templates.sh --location $web_root)
        if [[ "$temp_string" == "*" ]]
        then
            templates_published=false
        else
            templates_published=true
        fi
    fi
}

function check_deployed_resources() {
    if [[ $site_deployed == true ]]
    then
        if [[ -d "$site_path/crmbl/data/source/site" ]]
        then
            engine_deployed=true
        else
            engine_deployed=false
        fi
        temp_string=$(bash ./list-mods.sh)
        if [[ "$temp_string" == "*" || "$temp_string" == "Invalid project path provided. Exiting" ]]
        then
            mods_deployed=false
        else
            mods_deployed=true
        fi
        temp_string=$(bash ./list-sites.sh)
        if [[ "$temp_string" == "*" || "$temp_string" == "Invalid project path provided. Exiting" ]]
        then
            sites_deployed=false
        else
            sites_deployed=true
        fi
        temp_string=$(bash ./list-templates.sh)
        if [[ "$temp_string" == "*" ]]
        then
            templates_deployed=false
        else
            templates_deployed=true
        fi
    fi
}

################
# Menu Options #
################

function add_selection(){
    selection_string="$1"
    ((possible_selections=possible_selections+1))
    selection_array["$possible_selections"]="$selection_string"
}

function add_menu_options() {
    optional_selections=0
    if [[ ! -z "$1" ]]
    then
        if [[ "$1" == "back" ]]
        then
            printf "    B) Back"
            add_selection "help"
            ((optional_selections=optional_selections+1))
            printf " | H) Help"
        fi
    else
        add_selection "help"
        ((optional_selections=optional_selections+1))
        printf "    H) Help"
    fi
    add_selection "about"
    ((optional_selections=optional_selections+1))
    printf " | A) About"
    add_selection "quit"
    ((optional_selections=optional_selections+1))
    printf " | Q) Quit\n"
}

#############
# TEMPLATES #
#############

## Templates - Delete Menu

function display_delete_templates_menu_options() {
    possible_selections=0
    declare -a ava_templates=()
    ava_templates_string=$(bash ./list-available-templates.sh)
    IFS=' ' read -r -a ava_templates <<< "$ava_templates_string"
    for template in "${ava_templates[@]}"
    do
        if [[ "$template" == "*" ]]
        then
            break
        fi
        add_selection $template
        echo "    $possible_selections) Delete [ $template ]"
    done
    add_menu_options "back"
}

function process_delete_templates_menu_options() {
    case $1 in
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            if [[ ! -d "$templates_path/crmbl-template-$1" ]]
            then
                MENU_ERR_MSG="INVALID SELECTION: $1"
            else
                MENU_ERR_MSG="Delete Template - $1"
                bash ./delete-template.sh $1
                sleep 1
            fi
            gen_menu "delete-templates"
            ;;
    esac
}

## Templates - Remove Menu

function display_remove_templates_menu_options() {
    possible_selections=0
    declare -a dep_templates=()
    dep_templates_string=$(bash ./list-templates.sh)
    IFS=' ' read -r -a dep_templates <<< "$dep_templates_string"
    for template in "${dep_templates[@]}"
    do
        if [[ "$template" == "*" ]]
        then
            break
        fi
        add_selection $template
        echo "    $possible_selections) Remove [ $template ]"
    done
    add_menu_options "back"
}

function process_remove_templates_menu_options() {
    case $1 in
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            declare -a possible_paths=(
                "$site_path/crmbl/include/script/template"
                "$site_path/crmbl/include/style/template"
                "$site_path/crmbl/template/body"
                "$site_path/crmbl/template/declaration"
                "$site_path/crmbl/template/head"
                "$site_path/crmbl/template/html"
                "$site_path/crmbl/template/link"
                "$site_path/crmbl/template/meta"
                "$site_path/crmbl/template/script"
            )
            path_exists=false
            for try_path in "${possible_paths[@]}"
            do
                if [[ -d "$try_path/$1" ]]
                then
                    path_exists=true
                    break
                fi
            done
            if [[ $path_exists == false ]]
            then
                MENU_ERR_MSG="INVALID SELECTION: $1"
            else
                MENU_ERR_MSG="Remove Template - $1"
                bash ./remove-template.sh $1
                sleep 1
            fi
            gen_menu "remove-templates"
            ;;
    esac
}

## Templates - Backup Menu

function display_backup_templates_menu_options() {
    possible_selections=0
    declare -a dep_templates=()
    dep_templates_string=$(bash ./list-templates.sh)
    IFS=' ' read -r -a dep_templates <<< "$dep_templates_string"
    for template in "${dep_templates[@]}"
    do
        add_selection $template
        echo "    $possible_selections) Backup [ $template ]"
    done
    add_selection "backup-all-templates"
    echo "    $possible_selections) Backup ALL Templates"
    add_menu_options "back"
}

function process_backup_templates_menu_options() {
    case $1 in
        backup-all-templates)
            MENU_ERR_MSG="Backup ALL Site(s)"
            bash ./backup-templates.sh
            sleep 1
            gen_menu "backup-templates"
            ;;
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            declare -a possible_paths=(
                "$site_path/crmbl/include/script/template"
                "$site_path/crmbl/include/style/template"
                "$site_path/crmbl/template/body"
                "$site_path/crmbl/template/declaration"
                "$site_path/crmbl/template/head"
                "$site_path/crmbl/template/html"
                "$site_path/crmbl/template/link"
                "$site_path/crmbl/template/meta"
                "$site_path/crmbl/template/script"
            )
            path_exists=false
            for try_path in "${possible_paths[@]}"
            do
                if [[ -d "$try_path/$1" ]]
                then
                    path_exists=true
                    break
                fi
            done
            if [[ $path_exists == false ]]
            then
                MENU_ERR_MSG="INVALID SELECTION: $1"
            else
                MENU_ERR_MSG="Backup Template - $1"
                bash ./backup-template.sh $1
                sleep 1
            fi
            gen_menu "backup-templates"
            ;;
    esac
}

## Templates - Deploy Menu

function display_deploy_templates_menu_options() {
    possible_selections=0
    declare -a ava_templates=()
    ava_templates_string=$(bash ./list-available-templates.sh)
    IFS=' ' read -r -a ava_templates <<< "$ava_templates_string"
    for template in "${ava_templates[@]}"
    do
        add_selection $template
        echo "    $possible_selections) Deploy [ $template ]"
    done
    add_selection "deploy-all-templates"
    echo "    $possible_selections) Deploy ALL Templates"
    add_menu_options "back"
}

function process_deploy_templates_menu_options() {
    case $1 in
        deploy-all-templates)
            MENU_ERR_MSG="Deploy Template(s) to crmbl_site"
            bash ./deploy-templates.sh
            sleep 1
            gen_menu "deploy-templates"
            ;;
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            if [[ ! -d "$templates_path/crmbl-template-$1" ]]
            then
                MENU_ERR_MSG="INVALID SELECTION: $1"
            else
                MENU_ERR_MSG="Deploy Template - $1"
                bash ./deploy-template.sh $1
                sleep 1
            fi
            gen_menu "deploy-templates"
            ;;
    esac
}

## Templates Menu

function display_templates_menu_options() {
    possible_selections=0
    if [[ $templates_exist == false ]]
    then
        if [[ $site_deployed == true ]]
        then
            add_selection "pull-deployed-templates"
            echo "    $possible_selections) Load Templates from deployed site"
        fi
        add_selection "download-templates"
        echo "    $possible_selections) Download Templates from Repo"
        add_selection "load-templates"
        echo "    $possible_selections) Load Templates from Local path"
    fi
    if [[ $templates_exist == true ]]
    then
        check_available_resources
        if [[ $templates_available == true ]]
        then
            add_selection "deploy-templates"
            echo "    $possible_selections) Deploy Templates"
        fi
    fi
    if [[ $templates_deployed == true ]]
    then
        add_selection "backup-templates"
        echo "    $possible_selections) Backup Templates"
        add_selection "remove-templates"
        echo "    $possible_selections) Remove Templates"
    fi
    if [[ $templates_exist == true ]]
    then
        check_available_resources
        if [[ $templates_available == true ]]
        then
            add_selection "delete-templates"
            echo "    $possible_selections) Delete Templates"
        fi
    fi
    add_menu_options "back"
}

function process_templates_menu_options() {
   case $1 in
        deploy-templates)
            MENU_ERR_MSG="Deploy Site(s) to crmbl_site"
            gen_menu "deploy-templates"
            ;;
        backup-templates)
            MENU_ERR_MSG="Backup Site(s) to crmbl-mods"
            gen_menu "backup-templates"
            ;;
        remove-templates)
            MENU_ERR_MSG="Delete Site(s) from crmbl_site"
            gen_menu "remove-templates"
            ;;
        delete-templates)
            MENU_ERR_MSG="Remove & Delete Site(s) from project"
            gen_menu "delete-templates"
            ;;
        download-templates)
            MENU_ERR_MSG="Download Templates from repo"
            bash ./download-repo.sh "templates"
            sleep 1
            gen_menu "templates"
            ;;
        load-templates)
            MENU_ERR_MSG="Load Templates from local path"
            bash ./load-local-repo.sh "templates"
            sleep 1
            gen_menu "templates"
            ;;
        pull-deployed-templates)
            MENU_ERR_MSG="Pull deployed templates to crmbl-templates"
            bash ./backup-templates.sh
            sleep 1
            gen_menu "templates"
            ;;
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            MENU_ERR_MSG="INVALID SELECTION: $1"
            gen_menu "templates"
            ;;
    esac
}

#########
# SITES #
#########

## Sites - Delete Menu

function display_delete_sites_menu_options() {
    possible_selections=0
    declare -a ava_sites=()
    ava_sites_string=$(bash ./list-available-sites.sh)
    IFS=' ' read -r -a ava_sites <<< "$ava_sites_string"
    for site in "${ava_sites[@]}"
    do
        if [[ "$site" == "*" ]]
        then
            break
        fi
        add_selection $site
        echo "    $possible_selections) Delete [ $site ]"
    done
    add_menu_options "back"
}

function process_delete_sites_menu_options() {
    case $1 in
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            if [[ ! -d "$sites_path/crmbl-site-$1" ]]
            then
                MENU_ERR_MSG="INVALID SELECTION: $1"
            else
                MENU_ERR_MSG="Delete Site - $1"
                bash ./delete-site.sh $1
                sleep 1
            fi
            gen_menu "delete-sites"
            ;;
    esac
}

## Sites - Remove Menu

function display_remove_sites_menu_options() {
    possible_selections=0
    declare -a dep_sites=()
    dep_sites_string=$(bash ./list-sites.sh)
    IFS=' ' read -r -a dep_sites <<< "$dep_sites_string"
    for site in "${dep_sites[@]}"
    do
        if [[ "$site" == "*" ]]
        then
            break
        fi
        add_selection $site
        echo "    $possible_selections) Remove [ $site ]"
    done
    add_menu_options "back"
}

function process_remove_sites_menu_options() {
    case $1 in
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            if [[ ! -d "$site_path/crmbl/data/config/site/$1" ]]
            then
                MENU_ERR_MSG="INVALID SELECTION: $1"
            else
                MENU_ERR_MSG="Remove Site - $1"
                bash ./remove-site.sh $1
                sleep 1
            fi
            gen_menu "remove-sites"
            ;;
    esac
}

## Sites - Backup Menu

function display_backup_sites_menu_options() {
    possible_selections=0
    declare -a dep_sites=()
    dep_sites_string=$(bash ./list-sites.sh)
    IFS=' ' read -r -a dep_sites <<< "$dep_sites_string"
    for site in "${dep_sites[@]}"
    do
        add_selection $site
        echo "    $possible_selections) Backup [ $site ]"
    done
    add_selection "backup-all-sites"
    echo "    $possible_selections) Backup ALL Sites"
    add_menu_options "back"
}

function process_backup_sites_menu_options() {
    case $1 in
        backup-all-sites)
            MENU_ERR_MSG="Backup ALL Site(s)"
            bash ./backup-sites.sh
            sleep 1
            gen_menu "backup-sites"
            ;;
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            if [[ ! -d "$site_path/crmbl/data/config/site/$1" ]]
            then
                MENU_ERR_MSG="INVALID SELECTION: $1"
            else
                MENU_ERR_MSG="Backup Site - $1"
                bash ./backup-site.sh $1
                sleep 1
            fi
            gen_menu "backup-sites"
            ;;
    esac
}

## Sites - Deploy Menu

function display_deploy_sites_menu_options() {
    possible_selections=0
    declare -a ava_sites=()
    ava_sites_string=$(bash ./list-available-sites.sh)
    IFS=' ' read -r -a ava_sites <<< "$ava_sites_string"
    for site in "${ava_sites[@]}"
    do
        add_selection $site
        echo "    $possible_selections) Deploy [ $site ]"
    done
    add_selection "deploy-all-sites"
    echo "    $possible_selections) Deploy ALL Sites"
    add_menu_options "back"
}

function process_deploy_sites_menu_options() {
    case $1 in
        deploy-all-sites)
            MENU_ERR_MSG="Deploy Site(s) to crmbl_site"
            bash ./deploy-sites.sh
            sleep 1
            gen_menu "deploy-sites"
            ;;
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            if [[ ! -d "$sites_path/crmbl-site-$1" ]]
            then
                MENU_ERR_MSG="INVALID SELECTION: $1"
            else
                MENU_ERR_MSG="Deploy Site - $1"
                bash ./deploy-site.sh $1
                sleep 1
            fi
            gen_menu "deploy-sites"
            ;;
    esac
}

## Sites Menu

function display_sites_menu_options() {
    possible_selections=0
    if [[ $sites_exist == false ]]
    then
        if [[ $site_deployed == true ]]
        then
            add_selection "pull-deployed-sites"
            echo "    $possible_selections) Load Sites from deployed site"
        fi
        add_selection "download-sites"
        echo "    $possible_selections) Download Sites from Repo"
        add_selection "load-sites"
        echo "    $possible_selections) Load Sites from Local path"
    fi
    if [[ $sites_exist == true ]]
    then
        check_available_resources
        if [[ $sites_available == true ]]
        then
            add_selection "deploy-sites"
            echo "    $possible_selections) Deploy Sites"
        fi
    fi
    if [[ $sites_deployed == true ]]
    then
        add_selection "backup-sites"
        echo "    $possible_selections) Backup Sites"
        add_selection "remove-sites"
        echo "    $possible_selections) Remove Sites"
    fi
    if [[ $sites_exist == true ]]
    then
        check_available_resources
        if [[ $sites_available == true ]]
        then
            add_selection "delete-sites"
            echo "    $possible_selections) Delete Sites"
        fi
    fi
    add_menu_options "back"
}

function process_sites_menu_options() {
   case $1 in
        deploy-sites)
            MENU_ERR_MSG="Deploy Site(s) to crmbl_site"
            gen_menu "deploy-sites"
            ;;
        backup-sites)
            MENU_ERR_MSG="Backup Site(s) to crmbl-mods"
            gen_menu "backup-sites"
            ;;
        remove-sites)
            MENU_ERR_MSG="Delete Site(s) from crmbl_site"
            gen_menu "remove-sites"
            ;;
        delete-sites)
            MENU_ERR_MSG="Remove & Delete Site(s) from project"
            gen_menu "delete-sites"
            ;;
        load-sites)
            MENU_ERR_MSG="Load Sites from local path"
            bash ./load-local-repo.sh "sites"
            sleep 1
            check_resources
            gen_menu "sites"
            ;;
        download-sites)
            MENU_ERR_MSG="Download Sites from Repo"
            bash ./download-repo.sh "sites"
            sleep 1
            check_resources
            gen_menu "sites"
            ;;
        pull-deployed-sites)
            MENU_ERR_MSG="Pull deployed sites to crmbl-sites"
            bash ./backup-sites.sh
            sleep 1
            check_resources
            gen_menu "sites"
            ;;
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            MENU_ERR_MSG="INVALID SELECTION: $1"
            gen_menu "sites"
            ;;
    esac
}


###########
# MODULES #
###########

## Modules - Delete Menu

function display_delete_modules_menu_options() {
    possible_selections=0
    declare -a ava_mods=()
    ava_mods_string=$(bash ./list-available-mods.sh)
    IFS=' ' read -r -a ava_mods <<< "$ava_mods_string"
    for mod in "${ava_mods[@]}"
    do
        if [[ "$mod" == "*" ]]
        then
            break
        fi
        add_selection $mod
        echo "    $possible_selections) Delete [ $mod ]"
    done
    add_menu_options "back"
}

function process_delete_modules_menu_options() {
    case $1 in
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            if [[ ! -d "$modules_path/crmbl-mod-$1" ]]
            then
                MENU_ERR_MSG="INVALID SELECTION: $1"
            else
                MENU_ERR_MSG="Delete Module - $1"
                bash ./delete-mod.sh $1
                sleep 1
            fi
            gen_menu "delete-modules"
            ;;
    esac
}

## Modules - Remove Menu

function display_remove_modules_menu_options() {
    possible_selections=0
    declare -a dep_mods=()
    dep_mods_string=$(bash ./list-mods.sh)
    IFS=' ' read -r -a dep_mods <<< "$dep_mods_string"
    for mod in "${dep_mods[@]}"
    do
        if [[ "$mod" == "*" ]]
        then
            break
        fi
        add_selection $mod
        echo "    $possible_selections) Remove [ $mod ]"
    done
    add_menu_options "back"
}

function process_remove_modules_menu_options() {
    case $1 in
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            if [[ ! -d "$site_path/crmbl/data/source/mod/$1" ]]
            then
                MENU_ERR_MSG="INVALID SELECTION: $1"
            else
                MENU_ERR_MSG="Remove Module - $1"
                bash ./remove-mod.sh $1
                sleep 1
            fi
            gen_menu "remove-modules"
            ;;
    esac
}

## Modules - Backup Menu

function display_backup_modules_menu_options() {
    possible_selections=0
    declare -a dep_mods=()
    dep_mods_string=$(bash ./list-mods.sh)
    IFS=' ' read -r -a dep_mods <<< "$dep_mods_string"
    for mod in "${dep_mods[@]}"
    do
        add_selection $mod
        echo "    $possible_selections) Backup [ $mod ]"
    done
    add_selection "backup-all-modules"
    echo "    $possible_selections) Backup ALL Modules"
    add_menu_options "back"
}

function process_backup_modules_menu_options() {
    case $1 in
        backup-all-modules)
            MENU_ERR_MSG="Backup ALL Module(s)"
            bash ./backup-mods.sh
            sleep 1
            gen_menu "backup-modules"
            ;;
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            if [[ ! -d "$site_path/crmbl/data/source/mod/$1" ]]
            then
                MENU_ERR_MSG="INVALID SELECTION: $1"
            else
                MENU_ERR_MSG="Backup Module - $1"
                bash ./backup-mod.sh $1
                sleep 1
            fi
            gen_menu "backup-modules"
            ;;
    esac
}

## Modules - Deploy Menu

function display_deploy_modules_menu_options() {
    possible_selections=0
    declare -a ava_mods=()
    ava_mods_string=$(bash ./list-available-mods.sh)
    IFS=' ' read -r -a ava_mods <<< "$ava_mods_string"
    for mod in "${ava_mods[@]}"
    do
        add_selection $mod
        echo "    $possible_selections) Deploy [ $mod ]"
    done
    add_selection "deploy-all-modules"
    echo "    $possible_selections) Deploy ALL Modules"
    add_menu_options "back"
}

function process_deploy_modules_menu_options() {
    case $1 in
        deploy-all-modules)
            MENU_ERR_MSG="Deploy Module(s) to crmbl_site"
            bash ./deploy-mods.sh
            sleep 1
            gen_menu "deploy-modules"
            ;;
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            if [[ ! -d "$modules_path/crmbl-mod-$1" ]]
            then
                MENU_ERR_MSG="INVALID SELECTION: $1"
            else
                MENU_ERR_MSG="Deploy Module - $1"
                bash ./deploy-mod.sh $1
                sleep 1
            fi
            gen_menu "deploy-modules"
            ;;
    esac
}

## Modules Menu

function display_modules_menu_options() {
    possible_selections=0
    if [[ $modules_exist == false ]]
    then
        if [[ $site_deployed == true ]]
        then
            add_selection "pull-deployed-mods"
            echo "    $possible_selections) Load Modules from deployed site"
        fi
        add_selection "download-modules"
        echo "    $possible_selections) Download Modules from Repo"
        add_selection "load-modules"
        echo "    $possible_selections) Load Modules from Local path"
    fi
    if [[ $modules_exist == true ]]
    then
        check_available_resources
        if [[ $mods_available == true ]]
        then
            add_selection "deploy-modules"
            echo "    $possible_selections) Deploy Modules"
        fi
    fi
    if [[ $mods_deployed == true ]]
    then
        add_selection "backup-modules"
        echo "    $possible_selections) Backup Modules"
        add_selection "remove-modules"
        echo "    $possible_selections) Remove Modules"
    fi
    if [[ $modules_exist == true ]]
    then
        check_available_resources
        if [[ $mods_available == true ]]
        then
            add_selection "delete-modules"
            echo "    $possible_selections) Delete Modules"
        fi
    fi
    add_menu_options "back"
}

function process_modules_menu_options() {
    case $1 in
        deploy-modules)
            MENU_ERR_MSG="Deploy Module(s) to crmbl_site"
            gen_menu "deploy-modules"
            ;;
        backup-modules)
            MENU_ERR_MSG="Backup Module(s) to crmbl-mods"
            gen_menu "backup-modules"
            ;;
        remove-modules)
            MENU_ERR_MSG="Delete Module(s) from crmbl_site"
            gen_menu "remove-modules"
            ;;
        delete-modules)
            MENU_ERR_MSG="Remove & Delete Module(s) from project"
            gen_menu "delete-modules"
            ;;
        download-modules)
            MENU_ERR_MSG="Download crmbl-mods from remote repo"
            bash ./download-repo.sh "mods"
            sleep 1
            check_resources
            gen_menu "modules"
            ;;
        load-modules)
            MENU_ERR_MSG="Load crmbl-mods from local path"
            bash ./load-local-repo.sh "mods"
            sleep 1
            check_resources
            gen_menu "modules"
            ;;
        pull-deployed-mods)
            MENU_ERR_MSG="Pull deployed mods to crmbl-mods"
            bash ./backup-mods.sh
            sleep 1
            check_resources
            gen_menu "modules"
            ;;
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            MENU_ERR_MSG="INVALID SELECTION: $1"
            gen_menu "modules"
            ;;
    esac
}

##########
# ENGINE #
##########

## Engine Menu

function display_engine_menu_options() {
    possible_selections=0
    check_resources
    if [[ $engine_exist == false ]]
    then
        if [[ $site_deployed == true ]]
        then
            add_selection "pull-deployed-engine"
            echo "    $possible_selections) Load Engine from deployed site"
        fi
        add_selection "download-engine"
        echo "    $possible_selections) Download Engine from Repo"
        add_selection "load-engine"
        echo "    $possible_selections) Load Engine from Local path"
    fi
    if [[ $engine_exist == true  ]]
    then
        check_available_resources
        if [[ $engine_available == true ]]
        then
            add_selection "deploy-engine"
            echo "    $possible_selections) Deploy Engine"
        fi
    fi
    if [[ $engine_deployed == true ]]
    then
        add_selection "backup-engine"
        echo "    $possible_selections) Backup Engine"
        add_selection "remove-engine"
        echo "    $possible_selections) Remove Engine"
    fi
    if [[ $engine_exist == true ]]
    then
        check_available_resources
        if [[ $engine_available == true ]]
        then
            add_selection "delete-engine"
            echo "    $possible_selections) Delete Engine"
        fi
    fi
    add_menu_options "back"
}

function process_engine_menu_options() {
    case $1 in
        deploy-engine)
            MENU_ERR_MSG="Deploy Engine to crmbl_site"
            bash ./deploy-engine.sh
            sleep 1
            #engine_deployed=true
            check_installs
            check_resources
            gen_menu "engine"
            ;;
        backup-engine)
            MENU_ERR_MSG="Backup Engine to crmbl-engine"
            bash ./backup-engine.sh
            sleep 1
            #engine_available=true
            check_installs
            check_resources
            gen_menu "engine"
            ;;
        remove-engine)
            MENU_ERR_MSG="Delete Engine from crmbl_site"
            bash ./remove-engine.sh
            sleep 1
            engine_deployed=false
            site_deployed=false
            check_installs
            check_resources
            gen_menu "engine"
            ;;
        delete-engine)
            MENU_ERR_MSG="Remove & Delete Engine from project"
            bash ./delete-engine.sh
            sleep 1
            #engine_available=false
            engine_available=false
            check_installs
            check_resources
            gen_menu "engine"
            ;;
        pull-deployed-engine)
            bash ./backup-engine.sh
            sleep 1
            check_installs
            check_resources
            gen_menu "engine"
            ;;
        download-engine)
            bash ./download-repo.sh "engine"
            sleep 1
            #engine_available=true
            check_installs
            check_resources
            gen_menu "engine"
            ;;
        load-engine)
            bash ./load-local-repo.sh "engine"
            sleep 1
            #engine_available=true
            check_installs
            check_resources
            gen_menu "engine"
            ;;
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            MENU_ERR_MSG="INVALID SELECTION: $1"
            check_installs
            check_resources
            gen_menu "engine"
            ;;
    esac
    
}

###########
# PROJECT #
###########

## Project Menu

function display_project_menu_options() {
    possible_selections=0
    if [[ $no_action == true ]]
    then
        if [[ $site_deployed == false && $site_published == false && $engine_exist == true ]]
        then
            add_selection "install"
            echo "    $possible_selections) Install crmbl (Deploy & Publish to webroot)"
            add_selection "deploy-project"
            echo "    $possible_selections) Setup crmbl install (Deploy only)"
        fi
    else
        if [[ $engine_exist == true ]]
        then
            add_selection "deploy-project"
            echo "    $possible_selections) Deploy Project"
        fi
        if [[ $site_deployed == true ]]
        then
            add_selection "publish-project"
            echo "    $possible_selections) Publish Project"
        fi
        if [[ $site_published == true ]]
        then
            add_selection "pull-published-project"
            echo "    $possible_selections) Pull published site to crmbl_sites"
        fi
        if [[ $site_deployed == true ]]
        then
            add_selection "un-deploy-project"
            echo "    $possible_selections) Un-Deploy Project"
        fi
        if [[ $site_published == true ]]
        then
            add_selection "un-publish-project"
            echo "    $possible_selections) Un-Publish Project"
        fi
    fi
    add_menu_options "back"
}

function process_project_menu_options() {
    case $1 in
        install)
            MENU_ERR_MSG="Install crmbl"
            bash ./new-install.sh
            sleep 1
            gen_menu "project"
            ;;
        deploy-project)
            MENU_ERR_MSG="Deploy to crmbl_site"
            bash ./deploy-project.sh
            sleep 1
            gen_menu "project"
            ;;
        publish-project)
            MENU_ERR_MSG="Publish to webroot"
            bash ./publish-project.sh
            sleep 1
            gen_menu "project"
            ;;
        pull-published-project)
            MENU_ERR_MSG="Pull published project"
            bash ./pull-published-project.sh
            sleep 1
            gen_menu "project"
            ;;
        un-deploy-project)
            MENU_ERR_MSG="Un-Deploy project"
            bash ./un-deploy-project.sh
            sleep 1
            gen_menu "project"
            ;;
        un-publish-project)
            MENU_ERR_MSG="Un-Publish Project"
            bash ./un-publish-project.sh
            sleep 1
            gen_menu "project"
            ;;
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            MENU_ERR_MSG="INVALID SELECTION: $1"
            gen_menu "project"
            ;;
    esac
}

########
# MAIN #
########

## Main Menu

function display_main_menu_options() {
    possible_selections=0
    add_selection "menu-projects"
    echo "    $possible_selections) Projects Menu"
    add_selection "menu-engine"
    echo "    $possible_selections) Engine Menu"
    add_selection "menu-modules"
    echo "    $possible_selections) Modules Menu"
    add_selection "menu-sites"
    echo "    $possible_selections) Sites Menu"
    add_selection "menu-templates"
    echo "    $possible_selections) Templates Menu"
    add_menu_options
}

function process_main_menu_options() {
    case $1 in
        menu-projects)
            gen_menu "project"
            ;;
        download-engine)
            MENU_ERR_MSG="Download Engine from repo"
            bash ./download-repo.sh engine
            sleep 1
            gen_menu "main"
            ;;
        load-engine)
            MENU_ERR_MSG="Load engine from local path"
            bash ./load-local-repo.sh engine
            sleep 1
            gen_menu "main"
            ;;
        menu-engine)
            MENU_ERR_MSG="Engine menu"
            gen_menu "engine"
            ;;
        download-modules)
            MENU_ERR_MSG="Download Modules from repo"
            bash ./download-repo.sh mods
            sleep 1
            gen_menu "main"
            ;;
        load-modules)
            MENU_ERR_MSG="Load modules from local path"
            bash ./load-local-repo.sh mods
            sleep 1
            gen_menu "main"
            ;;
        menu-modules)
            MENU_ERR_MSG="Modules menu"
            gen_menu "modules"
            ;;
        download-sites)
            MENU_ERR_MSG="Download Sites from repo"
            bash ./download-repo.sh sites
            sleep 1
            gen_menu "main"
            ;;
        load-sites)
            MENU_ERR_MSG="Load sites from local path"
            bash ./load-local-repo.sh sites
            sleep 1
            gen_menu "main"
            ;;
        menu-sites)
            MENU_ERR_MSG="Sites menu"
            gen_menu "sites"
            ;;
        download-templates)
            MENU_ERR_MSG="Download Templates from repo"
            bash ./download-repo.sh templates
            sleep 1
            gen_menu "main"
            ;;
        load-templates)
            MENU_ERR_MSG="Load templates from local path"
            bash ./load-local-repo.sh templates
            sleep 1
            gen_menu "main"
            ;;
        menu-templates)
            MENU_ERR_MSG="Templates menu"
            gen_menu "templates"
            ;;
        pull-deployed-engine)
            MENU_ERR_MSG="Pull deployed engine"
            bash ./backup-engine.sh
            sleep 1
            gen_menu "main"
            ;;
        pull-deployed-mods)
            MENU_ERR_MSG="Pull deployed mods"
            bash ./backup-mods.sh
            sleep 1
            gen_menu "main"
            ;;
        pull-deployed-sites)
            MENU_ERR_MSG="Pull deployed sites"
            bash ./backup-sites.sh
            sleep 1
            gen_menu "main"
            ;;
        pull-deployed-templates)
            MENU_ERR_MSG="Pull deployed templates"
            bash ./backup-templates.sh
            sleep 1
            gen_menu "main"
            ;;
        quit)
            clear
            exit 1
            ;;
        help)
            MENU_ERR_MSG="Load help documentation"
            ;;
        about)
            MENU_ERR_MSG="Brief project description"
            ;;
        *)
            MENU_ERR_MSG="INVALID SELECTION: $1"
            gen_menu "main"
            ;;
    esac
}

############
# GEN_MENU #
############

function gen_menu() {
    menu_type="$1"
    #
    #Menu's List:
    #
    case $menu_type in
        main)
            title="Main"
            display_status=true
            display_resources=false
            ;;
        project)
            title="Projects"
            display_status=true
            display_resources=false
            ;;
        engine)
            title="Engine"
            res_type="engine"
            res_name="Engine"
            display_status=true
            display_resources=false
            ;;
        modules)
            title="Modules"
            res_type="modules"
            res_name="Modules"
            display_status=true
            display_resources=true
            ;;
        deploy-modules)
            title="Deploy Modules"
            res_type="modules"
            res_name="Modules"
            display_status=true
            display_resources=true
            ;;
        backup-modules)
            title="Backup Modules"
            res_type="modules"
            res_name="Modules"
            display_status=true
            display_resources=true
            ;;
        remove-modules)
            title="Remove Modules"
            res_type="modules"
            res_name="Modules"
            display_status=true
            display_resources=true
            ;;
        delete-modules)
            title="Delete Modules"
            res_type="modules"
            res_name="Modules"
            display_status=true
            display_resources=true
            ;;
        sites)
            title="Sites"
            res_type="sites"
            res_name="Sites"
            display_status=true
            display_resources=true
            ;;
        deploy-sites)
            title="Deploy Sites"
            res_type="sites"
            res_name="Sites"
            display_status=true
            display_resources=true
            ;;
        backup-sites)
            title="Backup Sites"
            res_type="sites"
            res_name="Sites"
            display_status=true
            display_resources=true
            ;;
        remove_sites)
            title="Remove Sites"
            res_type="sites"
            res_name="Sites"
            display_status=true
            display_resources=true
            ;;
        delete-sites)
            title="Delete Sites"
            res_type="sites"
            res_name="Sites"
            display_status=true
            display_resources=true
            ;;
        templates)
            title="Templates"
            res_type="templates"
            res_name="Templates"
            display_status=true
            display_resources=true
            ;;
        deploy-templates)
            title="Deploy Templates"
            res_type="templates"
            res_name="Templates"
            display_status=true
            display_resources=true
            ;;
        backup-templates)
            title="Backup Templates"
            res_type="templates"
            res_name="Templates"
            display_status=true
            display_resources=true
            ;;
        remove-templates)
            title="Remove Templates"
            res_type="templates"
            res_name="Templates"
            display_status=true
            display_resources=true
            ;;
        delete-templates)
            title="Delete Templates"
            res_type="templates"
            res_name="Templates"
            display_status=true
            display_resources=true
            ;;
    esac
    declare -a pub_res_list=()
    declare -a dep_res_list=()
    declare -a ava_res_list=()
    declare -a all_modules=()
    
    function merge_arrays() {
        declare -A key_array
        declare -a temp_merge_arr
        for keys in "${pub_res_list[@]}" "${dep_res_list[@]}" "${ava_res_list[@]}"
        do
            key_array[$keys]=1
        done
        temp_merge_arr=("${!key_array[@]}")
        all_modules=("${temp_merge_arr[@]}")
    }

    clear
    echo "[crmbl CMS] ($title Menu)"

    if [[ $display_status == true ]]
    then
        echo "[Status]"
        display_installs #Display published, deployed
        check_resources
        case $res_type in
            modules)
                if [[ $modules_exist == true ]]
                then
                    available_mods_string=$(bash ./list-available-mods.sh)
                    if [[ ! -z $available_mods_string ]]
                    then
                        if [[ "$available_mods_string" == "*" || "$available_mods_string" == "Invalid project path provided. Exiting" ]]
                        then
                            ava_res_list=()
                        else
                            IFS=' ' read -r -a ava_res_list <<< "$available_mods_string"
                        fi
                    fi

                    deployed_mods_string=$(bash ./list-mods.sh)
                    if [[ ! -z $deployed_mods_string ]]
                    then
                        if [[ "$deployed_mods_string" == "*" || "$deployed_mods_string" == "Invalid project path provided. Exiting" ]]
                        then
                            dep_res_list=()
                        else
                            IFS=' ' read -r -a dep_res_list <<< "$deployed_mods_string"
                        fi
                    fi

                    published_mods_string=$(bash ./list-mods.sh --location $web_root)
                    if [[ ! -z $published_mods_string ]]
                    then
                        if [[ "$published_mods_string" == "*" || "$published_mods_string" == "Invalid project path provided. Exiting" ]]
                        then
                            pub_res_list=()
                        else
                            IFS=' ' read -r -a pub_res_list <<< "$published_mods_string"
                        fi
                    fi
                fi
                ;;
            sites)
                if [[ $sites_exist == true ]]
                then
                    available_sites_string=$(bash ./list-available-sites.sh)
                    if [[ ! -z $available_sites_string ]]
                    then
                        if [[ "$available_sites_string" == "*" || "$available_sites_string" == "Invalid project path provided. Exiting" ]]
                        then
                            ava_res_list=()
                        else
                            IFS=' ' read -r -a ava_res_list <<< "$available_sites_string"
                        fi
                    fi

                    deployed_sites_string=$(bash ./list-sites.sh)
                    if [[ ! -z $deployed_sites_string ]]
                    then
                        if [[ "$deployed_sites_string" == "*" || "$deployed_sites_string" == "Invalid project path provided. Exiting" ]]
                        then
                            dep_res_list=()
                        else
                            IFS=' ' read -r -a dep_res_list <<< "$deployed_sites_string"
                        fi
                    fi

                    published_sites_string=$(bash ./list-sites.sh --location $web_root)
                    if [[ ! -z $published_sites_string ]]
                    then
                        if [[ "$published_sites_string" == "*" || "$published_sites_string" == "Invalid project path provided. Exiting" ]]
                        then
                            pub_res_list=()
                        else
                            IFS=' ' read -r -a pub_res_list <<< "$published_sites_string"
                        fi
                    fi
                fi
                ;;
            templates)
                if [[ $templates_exist == true ]]
                then
                    available_templates_string=$(bash ./list-available-templates.sh)
                    if [[ ! -z $available_templates_string ]]
                    then
                        if [[ "$available_templates_string" == "*" || "$available_templates_string" == "Invalid project path provided. Exiting" ]]
                        then
                            ava_res_list=()
                        else
                            IFS=' ' read -r -a ava_res_list <<< "$available_templates_string"
                        fi
                    fi

                    deployed_templates_string=$(bash ./list-templates.sh)
                    if [[ ! -z $deployed_templates_string ]]
                    then
                        if [[ "$deployed_templates_string" == "*" || "$deployed_templates_string" == "Invalid project path provided. Exiting" ]]
                        then
                            dep_res_list=()
                        else
                            IFS=' ' read -r -a dep_res_list <<< "$deployed_templates_string"
                        fi
                    fi

                    published_templates_string=$(bash ./list-templates.sh --location $web_root)
                    if [[ ! -z $published_templates_string ]]
                    then
                        if [[ "$published_templates_string" == "*" || "$published_templates_string" == "Invalid project path provided. Exiting" ]]
                        then
                            pub_res_list=()
                        else
                            IFS=' ' read -r -a pub_res_list <<< "$published_templates_string"
                        fi
                    fi
                fi
                ;;
        esac
    fi

    if [[ $display_resources == true ]]
    then
        echo "[$res_name]"
        merge_arrays
        for temp_res in "${all_modules[@]}"
        do
            printf "  $temp_res "
            if [[ ${ava_res_list[@]} =~ $temp_res ]]
            then
                printf "[A]"
            fi
            if [[ ${dep_res_list[@]} =~ $temp_res ]]
            then
                printf "[D]"
            fi
            if [[ ${pub_res_list[@]} =~ $temp_res ]]
            then
                printf "[P]"
            fi
            printf "\n"
        done
    fi

    echo "[SELECT]:"
    #
    #Menu Options
    #
    case $menu_type in
        main)
            display_main_menu_options
            ;;
        project)
            display_project_menu_options
            ;;
        engine)
            display_engine_menu_options
            ;;
        modules)
            display_modules_menu_options
            ;;
        deploy-modules)
            display_deploy_modules_menu_options
            ;;
        backup-modules)
            display_backup_modules_menu_options
            ;;
        remove-modules)
            display_remove_modules_menu_options
            ;;
        delete-modules)
            display_delete_modules_menu_options
            ;;
        sites)
            display_sites_menu_options
            ;;
        deploy-sites)
            display_deploy_sites_menu_options
            ;;
        backup-sites)
            display_backup_sites_menu_options
            ;;
        remove-sites)
            display_remove_sites_menu_options
            ;;
        delete-sites)
            display_delete_sites_menu_options
            ;;
        templates)
            display_templates_menu_options
            ;;
        deploy-templates)
            display_deploy_templates_menu_options
            ;;
        backup-templates)
            display_backup_templates_menu_options
            ;;
        remove-templates)
            display_remove_templates_menu_options
            ;;
        delete-templates)
            display_delete_templates_menu_options
            ;;
    esac
    if [[ ! "$MENU_ERR_MSG" == "" ]]
    then
        echo "[ $MENU_ERR_MSG ]"
    fi
    echo "Choose an option"
    crmbl_selections=$(($possible_selections - $optional_selections))
    if [[ "$menu_type" == "main" ]]
    then
        printf "(1-$crmbl_selections)[H,A,Q]: "
    else
        printf "(1-$crmbl_selections)[B,H,A,Q]: "
    fi
    read user_input
    #
    #B) Back Option functionality
    #
    if [[ "$user_input" == "b" || "$user_input" == "B" ]]
    then 
        case $menu_type in
            project|engine|modules|sites|templates)
                gen_menu "main"
                ;;
            deploy-modules|backup-modules|remove-modules|delete-modules)
                gen_menu "modules"
                ;;
            deploy-sites|backup-sites|remove-sites|delete-sites)
                gen_menu "sites"
                ;;
            deploy-templates|backup-templates|remove-templates|delete-templates)
                gen_menu "templates"
                ;;
        esac
    fi
    [[ "$user_input" == "h" || "$user_input" == "H" ]] && user_input="$(($possible_selections - 2))"
    [[ "$user_input" == "a" || "$user_input" == "A" ]] && user_input="$(($possible_selections - 1))"
    [[ "$user_input" == "q" || "$user_input" == "Q" ]] && user_input="$possible_selections"
    #
    # Menu Handle User Requests
    #
    case $menu_type in
        main)
            process_main_menu_options "${selection_array[$user_input]}"
            ;;
        project)
            process_project_menu_options "${selection_array[$user_input]}"
            ;;
        engine)
            process_engine_menu_options "${selection_array[$user_input]}"
            ;;
        modules)
            process_modules_menu_options "${selection_array[$user_input]}"
            ;;
        deploy-modules)
            process_deploy_modules_menu_options "${selection_array[$user_input]}"
            ;;
        backup-modules)
            process_backup_modules_menu_options "${selection_array[$user_input]}"
            ;;
        remove-modules)
            process_remove_modules_menu_options "${selection_array[$user_input]}"
            ;;
        delete-modules)
            process_delete_modules_menu_options "${selection_array[$user_input]}"
            ;;
        sites)
            process_sites_menu_options "${selection_array[$user_input]}"
            ;;
        deploy-sites)
            process_deploy_sites_menu_options "${selection_array[$user_input]}"
            ;;
        backup-sites)
            process_backup_sites_menu_options "${selection_array[$user_input]}"
            ;;
        remove-sites)
            process_remove_sites_menu_options "${selection_array[$user_input]}"
            ;;
        delete-sites)
            process_delete_sites_menu_options "${selection_array[$user_input]}"
            ;;
        templates)
            process_templates_menu_options "${selection_array[$user_input]}"
            ;;
        deploy-templates)
            process_deploy_templates_menu_options "${selection_array[$user_input]}"
            ;;
        backup-templates)
            process_backup_templates_menu_options "${selection_array[$user_input]}"
            ;;
        remove-templates)
            process_remove_templates_menu_options "${selection_array[$user_input]}"
            ;;
        delete-templates)
            process_delete_templates_menu_options "${selection_array[$user_input]}"
            ;;
    esac
}

########
# RUN: #
########

#main_menu
gen_menu "main"