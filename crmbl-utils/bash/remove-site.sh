#!/usr/bin/bash

# $1 - Site Name 

declare -a files_array=(
    "data/config/host/$1.php"
)

declare -a directory_array=(
    "data/config/site/$1"
    "include/media/site/$1"
    "include/script/site/$1"
    "include/style/site/$1"
)

site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
project_path=$(bash ./config-util.sh --get-key-value crmblProjectRoot = ./crmbl.conf)

if [[ -d "$site_path" ]]
then
    if [[ -d "$project_path" ]]
    then
        if [[ -d "$project_path/data/config/site/$1" ]]
        then
            echo ""
            echo "[SITES]"
            echo "  REMOVE [ $1 ] from deployed sites."
            echo "  Would you like to backup [ $1 ] to 'crmbl-sites/'?"
            echo "  Enter 'Y/y' to backup site, or any other key will SKIP backup."
            printf "Backup Site? (Y/y): "
            read user_input
            if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
            then
                bash ./backup-site.sh $1
            else
                echo "Site will not be backed up."
            fi
            echo "REMOVING Site [ $1 ]"
            for file in "${files_array[@]}"
            do
                if [[ -f "$project_path/$file" ]]
                then
                    rm $project_path/$file
                fi
            done
            
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