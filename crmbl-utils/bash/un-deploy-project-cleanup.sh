#!/usr/bin/bash

site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)

declare -a site_struct=(
    "$site_path/crmbl/data/source/mod"
    "$site_path/crmbl/data/source/site"
    "$site_path/crmbl/data/source"
    "$site_path/crmbl/data/config/host"
    "$site_path/crmbl/data/config/site"
    "$site_path/crmbl/data/config"
    "$site_path/crmbl/data"
    "$site_path/crmbl/template/body"
    "$site_path/crmbl/template/declaration"
    "$site_path/crmbl/template/head"
    "$site_path/crmbl/template/html"
    "$site_path/crmbl/template/link"
    "$site_path/crmbl/template/meta"
    "$site_path/crmbl/template/script"
    "$site_path/crmbl/template"
    "$site_path/crmbl/include/media/mod"
    "$site_path/crmbl/include/media/site"
    "$site_path/crmbl/include/media/template"
    "$site_path/crmbl/include/media"
    "$site_path/crmbl/include/style/mod"
    "$site_path/crmbl/include/style/site"
    "$site_path/crmbl/include/style/template"
    "$site_path/crmbl/include/style/"
    "$site_path/crmbl/include/script/mod"
    "$site_path/crmbl/include/script/site"
    "$site_path/crmbl/include/script/template"
    "$site_path/crmbl/include/script/"
    "$site_path/crmbl/include"
    "$site_path/crmbl"
    "$site_path"
)

for directory in "${site_struct[@]}"
do
    if [[ -d "$directory" ]]
    then
        if [[ -z "$(ls -A $directory)" ]]
        then
            rm -r $directory
        else
            echo "[CleanUp] $directory/ still has files.  Exiting"
            break
        fi
    fi
done






