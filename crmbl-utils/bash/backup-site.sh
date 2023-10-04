#!/usr/bin/bash

# $1 - Site-name

project_name="crmbl"
stage_name="crmbl_site"
repo_name="$project_name-sites" #crmbl-sites
publish_path=$(bash ./config-util.sh --get-key-value SitesPath = ./crmbl.conf)
site_pull_path=$(bash ./config-util.sh --get-key-value crmblProjectRoot = ./crmbl.conf)
site_dest_path="$publish_path" #../../crmbl-sites

if [[ -z $1 ]]
then
    echo "No site was specified to be backed up."
    exit 1
fi

if [[ ! -z $2 ]]
then
    if [[ "$2" == "--location" ]]
    then
        if [[ -z $3 ]]
        then
            echo "No crmbl project location given. Exiting"
            exit 1
        fi
    else
        echo "Invalid option. Exiting"
        exit 1
    fi
    if [[ -d "$3/crmbl/data/config/site" ]]
    then
        site_pull_path="$3/crmbl"
    else
        echo "Invalid project path provided. Exiting"
        exit 1
    fi
fi

echo "Backing up site: [ $1 ]"

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

    if [[ ! -d "$publish_path" ]]
    then
        mkdir $publish_path
    fi

    if [[ ! -d "$project_site_path" ]]
    then
        mkdir $project_site_path
    fi

    create_directories
    copy_site_media
}

backup_site $1