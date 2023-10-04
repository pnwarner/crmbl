#!/usr/bin/bash

project_name="crmbl"
site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
mods_path=$(bash ./config-util.sh --get-key-value ModulesPath = ./crmbl.conf)
mod_name="$1"
copy_from="$mods_path/crmbl-mod-$mod_name"

if [[ -z $mod_name ]]
then
    echo "No module name was given to be deployed. Exiting."
    exit 1
fi

if [[ ! -d "$site_path" ]]
then
    mkdir $site_path
fi

if [[ ! -d "$site_path/$project_name" ]]
then
    mkdir $site_path/$project_name
fi

if [[ -d "$copy_from" ]]
then
    cp -r $copy_from/* $site_path
    echo "[Module][ $mod_name ] was copied to: $site_path"
else
    echo "No module was found with that name!"
    exit 1
fi
find $site_path/. -name 'README.md' -delete
echo "  $mod_name Deployed."