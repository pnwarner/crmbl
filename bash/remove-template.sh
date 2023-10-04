#!/usr/bin/bash

#Remove template from crmbl_site/
# $1 - Module Name

declare -a directory_array=(
    "include/media/template/$1"
    "include/script/template/$1"
    "include/style/template/$1"
    "template/body/$1"
    "template/declaration/$1"
    "template/head/$1"
    "template/html/$1"
    "template/link/$1"
    "template/meta/$1"
    "template/script/$1"
)

site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
project_path=$(bash ./config-util.sh --get-key-value crmblProjectRoot = ./crmbl.conf)

if [[ -d "$site_path" ]]
then
    if [[ -d "$project_path" ]]
    then
        template_exists=false
        for directory in "${directory_array[@]}"
        do
            if [[ -d "$project_path/$directory" ]]
            then
                template_exists=true
                break
            fi
        done
        if [[ $template_exists == true ]]
        then
            echo ""
            echo "[TEMPLATES]"
            echo "  REMOVE [ $1 ] from deployed templates."
            echo "  Would you like to backup [ $1 ] to 'crmbl-templates/'?"
            echo "  Enter 'Y/y' to backup template, or any other key will SKIP backup."
            printf "Backup Template? (Y/y): "
            read user_input
            if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
            then
                bash ./backup-template.sh $1
            else
                echo "Template will not be backed up."
            fi
            echo "REMOVING Template [ $1 ]"
            for directory in "${directory_array[@]}"
            do

                if [[ -d "$project_path/$directory" ]]
                then
                    rm -r $project_path/$directory
                fi
            done
        fi
    else
        echo "Project is not deployed. No template to remove."
        exit 1
    fi
else
    echo "Project is not deployed. No template to remove."
    exit 1
fi