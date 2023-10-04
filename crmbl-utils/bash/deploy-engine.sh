#!/usr/bin/bash

project_name="crmbl"
site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
engine_path=$(bash ./config-util.sh --get-key-value EnginePath = ./crmbl.conf)
copy_from="$engine_path"

if [[ ! -d "$site_path" ]]
then
    mkdir $site_path
fi

if [[ ! -d "$site_path/crmbl" ]]
then
    mkdir $site_path/crmbl
fi

if [[ -d "$copy_from" ]]
then
    cp -r $copy_from/* $site_path
    if [[ -f "$site_path/README.md" ]]
    then
        rm $site_path/README.md
    fi
    echo "[Engine][ $engine_path ] was copied to: $site_path"
else
    echo "Invalid engine path!"
    exit 1
fi
find $site_path/. -name 'README.md' -delete
echo "  Engine Deployed."