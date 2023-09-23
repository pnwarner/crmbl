#!/usr/bin/bash

project_name="crmbl"
site_path="../../crmbl_site"
mods_path="../../crmbl-mods"
mod_name="$1"
copy_from="$mods_path/crmbl-mod-$mod_name"

if [[ -z $mod_name ]]
then
    echo "No module name was given to be deployed. Exiting."
    exit 1
fi

if [[ -d "$copy_from" ]]
then
    cp -r $copy_from/* $site_path
    echo "[Module][ $mod_name ] was copied to: $site_path"
else
    echo "No module was found with that name!"
    exit 1
fi

echo "  $mod_name Deployed."