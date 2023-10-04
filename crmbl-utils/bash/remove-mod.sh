#!/usr/bin/bash

# $1 - Module Name

declare -a directory_array=(
    "data/source/mod/$1"
    "include/media/mod/$1"
    "include/script/mod/$1"
    "include/style/mod/$1"
)

site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
project_path=$(bash ./config-util.sh --get-key-value crmblProjectRoot = ./crmbl.conf)

if [[ -d "$site_path" ]]
then
    if [[ -d "$project_path" ]]
    then
        if [[ -d "$project_path/data/source/mod/$1" ]]
        then
            echo ""
            echo "[MODULES]"
            echo "  REMOVE [ $1 ] from deployed modules."
            echo "  Would you like to backup [ $1 ] to 'crmbl-mods/'?"
            echo "  Enter 'Y/y' to backup module, or any other key will SKIP backup."
            printf "Backup Module? (Y/y): "
            read user_input
            if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
            then
                bash ./backup-mod.sh $1
            else
                echo "Module will not be backed up."
            fi
            echo "REMOVING Module [ $1 ]"
            for directory in "${directory_array[@]}"
            do
                if [[ -d "$project_path/$directory" ]]
                then
                    rm -r $project_path/$directory
                fi
            done
        fi
    else
        echo "Project is not deployed. No site to remove."
        exit 1
    fi
else
    echo "Project is not deployed. No site to remove."
    exit 1
fi