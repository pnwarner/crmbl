#!/usr/bin/bash

site_path="../../crmbl_site"
backup_path="../../crmbl-engine"

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
    echo "$site_path/$directory"
    if [[ -d "$site_path/$directory" ]]
    then
        #echo "Do: cp -r $site_path/$directory/* $backup_path/$directory"
        cp -r $site_path/$directory/* $backup_path/$directory
    fi
done

for file in "${backup_files[@]}"
do
    echo "$site_path/$file"
    if [[ -f "$site_path/$file" ]]
    then
        echo "cp $site_path/$file $backup_path/crmbl/"
        cp $site_path/$file $backup_path/crmbl/
    fi
done



