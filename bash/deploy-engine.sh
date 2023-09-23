#!/usr/bin/bash

project_name="crmbl"
site_path="../../crmbl_site"
engine_path="../../crmbl-engine"
copy_from="$engine_path"

if [[ -d "$copy_from" ]]
then
    cp -r $copy_from/* $site_path
    echo "[Engine][ $engine_path ] was copied to: $site_path"
else
    echo "Invalid engine path!"
    exit 1
fi

echo "  Engine Deployed."