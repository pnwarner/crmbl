#!/usr/bin/bash

declare -a repos_list=(
    "engine"
    "mods"
    "sites"
    "templates"
    "utils"
)

if [[ ! -z $1 ]]
then
    repo_found=false
    for repo in "${repos_list[@]}"
    do
        if [[ "$1" == "$repo" ]]
        then
            repo_found=true
            break
        fi
    done
    if [[ $repo_found == false ]]
    then
        echo "Error: Improper repo name."
        exit 1
    fi
else
    echo "Error: No Repository name or path provided."
    exit 1
fi

origin=""
if [[ -z $2 ]]
then
    echo "Error: No path to origin repository was given."
    echo "Enter a origin path to copy."
    echo "Example:"
    echo "  Repo to copy: [ crmbl-engine ]"
    echo "  Origin Repo path: /home/user/repos/crmbl-engine"
    echo "  PATH TO SUBMIT: /home/user/repos"
    printf "Origin path: "
    read user_input
    origin="$user_input"
else
    origin="$2"
fi

#$1 -
#  engine
#  mods
#  sites
#  templates
#  utils

#$2 - /path/to/origin/repo

#copy to:
project_name="crmbl"
section_name="$1"
repo_name="$project_name-$section_name"
destination_path="../../$repo_name" #To crmbl/<REPO-NAME>
origin_path="$origin/$repo_name" #To copy from user
copy_path="../../"
origin_exist=false
destination_exist=false

if [[ -d "$origin_path" ]]
then
    origin_exist=true
fi

if [[ -d "$destination_path" ]]
then
    destination_exist=true
fi

if [[ ! -d "$origin_path" ]]
then
    echo "Error:"
    echo "  $origin_path"
    echo "This is NOT a valid directory.  Exiting."
    exit 1
fi

if [[ -d "$destination_path" ]]
then
    echo "[ Warning! ]"
    echo "  $destination_path"
    echo "This is an existing project directory. This action may overwrite existing unsaved work. Proceed with caution."
    echo "Copy into existing directory? Enter (Y/y) to Confirm, or any other key to Cancel."
    printf "Confirm? (Y/y): "
    read user_input
    if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
    then
        echo "Action Confirmed."
    else
        echo "Action Canceled. Exiting"
        exit 1
    fi
fi

cp -r "$origin_path" "$copy_path"

echo "[ $repo_name ] copied from $origin_path"