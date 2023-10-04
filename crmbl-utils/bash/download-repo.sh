#!/usr/bin/bash

repo_host="https://github.com"
repo_user="pnwarner"
project_name="crmbl"
section_name="$1"
repo_name="$project_name-$section_name"
repo_path="../../$repo_name"
repo_address="$repo_host/$repo_user/$repo_name"

declare -a repos_array=(
    "engine"
    "mods"
    "sites"
    "templates"
    "utils"
)

function download_repo() {
    allow_download=false
    for repo in "${repos_array[@]}"
    do
        if [[ "$section_name" == "$repo" ]]
        then
            allow_download=true
        fi
    done
    if [[ $allow_download == true ]]
    then
        echo "Downloading [ $repo_name ] from:"
        echo "  $repo_address"
        cd ../../
        git clone "$repo_address"
        cd $repo_name
        rm -rf .git
        find ./. -name 'README.md' -delete
        #rm ./README.md
        cd ../crmbl-utils/bash
        echo "Done."
    else
        echo "Invalid repo selection."
    fi
}

if [[ -d "$repo_path" ]]
then
    while true
    do
        echo "[ WARNING! ] You have chosen to download [ $repo_name ].  This will write over any changes made to the existing '$repo_name' directory."
        echo "Enter (Y/y) to confirm this operation, or any other key to cancel."
        printf "Confirm Overwrite (Y/n): "
        read user_choice
        if [[ "$user_choice" == "Y" || "$user_choice" == "y" ]]
        then
            rm -r $repo_path
            break
        else
            echo "Operation cancelled. Exiting."
            exit 1
        fi
    done
fi

download_repo


