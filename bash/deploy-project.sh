#!/usr/bin/bash

path_string=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)

if [[ ! -d "$path_string" ]]
then
    mkdir $path_string
fi

bash ./deploy-engine.sh
bash ./deploy-mods.sh
bash ./deploy-templates.sh
bash ./deploy-sites.sh

