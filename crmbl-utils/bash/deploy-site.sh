#!/usr/bin/bash

project_name="crmbl"
site_path="../../crmbl_site"
sites_path="../../crmbl-sites"
site_name="$1"
copy_from="$sites_path/crmbl-site-$site_name"

if [[ -z $site_name ]]
then
    echo "No site name was given to be deployed. Exiting."
    exit 1
fi

if [[ -d "$copy_from" ]]
then
    cp -r $copy_from/* $site_path
    echo "[Site][ $site_name ] was copied to: $site_path"
else
    echo "No site was found with that name!"
    exit 1
fi

echo "  $site_name Deployed."