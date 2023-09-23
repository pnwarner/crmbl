#!/usr/bin/bash

site_path="../../crmbl_site"
backup_path="../../crmbl-mods"

declare -a dir_list=()

for directory in "$site_path"/crmbl/data/source/mod/*
do
    directory=${directory##*/}
    dir_list+=("$directory")
done

for dir in "${dir_list[@]}"
do
    bash ./backup-mod "$dir"
done

