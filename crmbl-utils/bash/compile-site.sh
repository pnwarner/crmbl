#!/usr/bin/bash

current_path=$(pwd)
output_folder="crmbl_site"
path_string="$current_path/$output_folder"
project_name="crmbl"

#Create crmbl_site/
if [[ ! -d "$path_string" ]]
then
    mkdir $path_string
fi

cd crmbl-utils/bash/

bash ./deploy-engine.sh
bash ./deploy-mods.sh
bash ./deploy-templates.sh
bash ./deploy-sites.sh

cd ../../