#!/usr/bin/bash

project_name="crmbl"
site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
sites_path=$(bash ./config-util.sh --get-key-value SitesPath = ./crmbl.conf)
site_name="$1"
copy_from="$sites_path/crmbl-site-$site_name"

if [[ -z $site_name ]]
then
    echo "No site name was given to be deployed. Exiting."
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
    echo "[Site][ $site_name ] was copied to: $site_path"
else
    echo "No site was found with that name!"
    exit 1
fi
find $site_path/. -name 'README.md' -delete
echo "  $site_name Deployed."