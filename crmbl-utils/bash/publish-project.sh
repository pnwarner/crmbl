#!/usr/bin/bash

path_string=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
project_name="crmbl"
publish_root=$(bash ./config-util.sh --get-key-value WebRoot = ./crmbl.conf)
publish_path=$(bash ./config-util.sh --get-key-value PublishPath = ./crmbl.conf)
publish_user=$(bash ./config-util.sh --get-key-value PublishUser = ./crmbl.conf)
publish_group=$(bash ./config-util.sh --get-key-value PublishGroup = ./crmbl.conf)
publish_user_group="$publish_user:$publish_group"

find $path_string/. -name 'README.md' -delete

root_user=$(bash ./config-util.sh --get-key-value RootUser = ./crmbl.conf)

if [[ -d "$publish_path" ]]
then
    if [[ "$root_user" == "Off" ]]
    then
        sudo rm -r $publish_path
    else
        rm -r $publish_path
    fi
fi

if [[ "$root_user" == "Off" ]]
then
    sudo cp -r $path_string/$project_name $publish_root
    sudo chown -R $publish_user_group $publish_path
else
    cp -r $path_string/$project_name $publish_root
fi