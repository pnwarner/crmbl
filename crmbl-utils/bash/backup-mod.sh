#!/usr/bin/bash

site_path="../../crmbl_site"
backup_path="../../crmbl-mods"
mod_name="$1"

if [[ -z $mod_name ]]
then
    echo "No mod was specified to be backed up."
    exit 1
fi

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

function copy_module_sections() {
    start_range=$1
    end_range=$2
    if [[ -d "$site_path/${backup_dir_struct[$end_range]}" ]]
    then
        #echo "Module exists."
        #for i in {"$start_range".."$end_range"}
        for (( i=$start_range; i<=$end_range; i++ ))
        do
            #Create directories
            if [[ ! -d "$backup_mod_path/${backup_dir_struct[$i]}" ]]
            then
                echo "mkdir $backup_mod_path/${backup_dir_struct[$i]}"
            fi
        done
        #echo "Copy media"
        cp -r $site_path/${backup_dir_struct[$end_range]}/* $backup_mod_path/${backup_dir_struct[$end_range]}
    fi
}

copy_module_sections 0 4
copy_module_sections 5 8
copy_module_sections 9 11
copy_module_sections 12 14
