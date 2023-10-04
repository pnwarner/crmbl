#!/usr/bin/bash

#$1 - Mod name
#$2 - --location (optional)
#$3 - /path/to/crmbl/

site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
backup_path=$(bash ./config-util.sh --get-key-value ModulesPath = ./crmbl.conf)
mod_name="$1"

if [[ -z $mod_name ]]
then
    echo "No mod was specified to be backed up."
    exit 1
fi

if [[ ! -z $2 ]]
then
    if [[ "$2" == "--location" ]]
    then
        if [[ -z $3 ]]
        then
            echo "No crmbl project location given. Exiting"
            exit 1
        fi
    else
        echo "Invalid option. Exiting"
        exit 1
    fi
    if [[ -d "$3/crmbl/data/source/mod" ]]
    then
        site_path="$3"
    else
        echo "Invalid project path provided. Exiting"
        exit 1
    fi
fi

echo "Backing up module: [ $mod_name ]"

backup_mod_path="$backup_path/crmbl-mod-$mod_name"

declare -a backup_dir_struct=(
    "crmbl" #0
    "crmbl/data" #1
    "crmbl/data/source" #2
    "crmbl/data/source/mod" #3
    "crmbl/data/source/mod/$mod_name" #4
    "crmbl/include" #5
    "crmbl/include/media" #6
    "crmbl/include/media/mod" #7
    "crmbl/include/media/mod/$mod_name" #8
    "crmbl/include/script" #9
    "crmbl/include/script/mod" #10
    "crmbl/include/script/mod/$mod_name" #11
    "crmbl/include/style" #12
    "crmbl/include/style/mod" #13
    "crmbl/include/style/mod/$mod_name" #14
)

if [[ ! -d "$backup_path" ]]
then
    mkdir $backup_path
fi

if [[ ! -d "$backup_mod_path" ]]
then
    mkdir $backup_mod_path
fi

function copy_module_sections() {
    start_range=$1
    end_range=$2

    if [[ -d "$site_path/${backup_dir_struct[$end_range]}" ]]
    then
        for (( i=$start_range; i<=$end_range; i++ ))
        do
            if [[ ! -d "$backup_mod_path/${backup_dir_struct[$i]}" ]]
            then
                mkdir "$backup_mod_path/${backup_dir_struct[$i]}"
            fi
        done
        cp -r $site_path/${backup_dir_struct[$end_range]}/* $backup_mod_path/${backup_dir_struct[$end_range]}
    fi
}

copy_module_sections 0 4
#copy_module_sections 5 5
if [[ ! -d "$backup_mod_path/crmbl/include" ]]
then
    mkdir $backup_mod_path/crmbl/include
fi
copy_module_sections 5 8
copy_module_sections 9 11
copy_module_sections 12 14
