#!/usr/bin/bash

project_name="crmbl"
site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
templates_path=$(bash ./config-util.sh --get-key-value TemplatesPath = ./crmbl.conf)
template_name="$1"
copy_from="$templates_path/crmbl-template-$template_name"

if [[ -z $template_name ]]
then
    echo "No template name was given to be deployed. Exiting."
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
    echo "[Template][ $template_name ] was copied to: $site_path"
else
    echo "No template was found with that name!"
    exit 1
fi
find $site_path/. -name 'README.md' -delete
echo "  $template_name Deployed."