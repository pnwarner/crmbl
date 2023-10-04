#!/usr/bin/bash

site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
backup_path=$(bash ./config-util.sh --get-key-value EnginePath = ./crmbl.conf)

declare -a backup_dir_struct=(
    "$backup_path"
    "$backup_path/crmbl"
    "$backup_path/crmbl/data"
    "$backup_path/crmbl/data/source"
    "$backup_path/crmbl/data/source/site"
)

declare -a backup_dirs=(
    "crmbl/data/source/site"
)

declare -a backup_files=(
    "crmbl/index.php"
)

function stage_dirs() {
    for directory in "${backup_dir_struct[@]}"
    do
        if [[ ! -d "$directory" ]]
        then
            mkdir $directory
        fi
    done
}

stage_dirs

for directory in "${backup_dirs[@]}"
do
    if [[ -d "$site_path/$directory" ]]
    then
        cp -r $site_path/$directory/* $backup_path/$directory
    fi
done

for file in "${backup_files[@]}"
do
    if [[ -f "$site_path/$file" ]]
    then
        cp $site_path/$file $backup_path/crmbl/
    fi
done

echo "Backing up: [ Engine ]"

