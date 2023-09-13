#!/usr/bin/bash

# $1 - Site-name

project_name="crmbl"
stage_name="crmbl_site"
repo_name="$project_name-sites" #crmbl-sites
staging_path="../.."
publish_path="$staging_path/$repo_name" #../../crmbl-sites
site_pull_path="$staging_path/$stage_name/$project_name" #../../crmbl_site/crmbl
site_dest_path="$publish_path" #../../crmbl-sites

function create_directories() {
    for directory in "${site_paths[@]}"
    do
        if [[ ! -d "$directory" ]]
        then
            mkdir "$directory"
        fi
    done
}

function copy_site_media() {
    declare -a media_paths=(
        "include/media/site"
        "include/style/site"
        "include/script/site"
    )
    cp $site_pull_path/data/config/host/$site_name.php $dest_path/crmbl/data/config/host/
    cp -r $site_pull_path/data/config/site/$site_name/* $dest_path/crmbl/data/config/site/$site_name
    #Check if directories are empty or not, copy files if not.
    for media_path in "${media_paths[@]}"
    do
        if [[ -d "$site_pull_path/$media_path/$site_name" ]]
        then
            cp -r $site_pull_path/$media_path/$site_name $dest_path/crmbl/$media_path
        fi
    done
}

function backup_site() {
    site_name="$1"
    project_site_name="crmbl-site-$site_name" #crmbl-site-default
    project_site_path="$site_dest_path/$project_site_name" #../../crmbl-sites/crmbl-site-default
    repo_path=$project_site_path #../../crmbl-sites/crmbl-site-default
    from_path="$site_pull_path" #../../crmbl_site/crmbl/
    dest_path="$repo_path" #../../crmbl-sites/crmbl-site-default
    #echo "$dest_path"
    declare -a site_paths=(
       "$dest_path"
        "$dest_path/crmbl"
        "$dest_path/crmbl/data"
        "$dest_path/crmbl/data/config"
        "$dest_path/crmbl/data/config/host"
        "$dest_path/crmbl/data/config/site"
        "$dest_path/crmbl/data/config/site/$site_name"
        "$dest_path/crmbl/include"
        "$dest_path/crmbl/include/media"
        "$dest_path/crmbl/include/media/site"
        "$dest_path/crmbl/include/media/site/$site_name"
        "$dest_path/crmbl/include/style"
        "$dest_path/crmbl/include/style/site"
        "$dest_path/crmbl/include/style/site/$site_name"
        "$dest_path/crmbl/include/script"
        "$dest_path/crmbl/include/script/site"
        "$dest_path/crmbl/include/script/site/$site_name"
    )

    create_directories
    copy_site_media
}

backup_site $1