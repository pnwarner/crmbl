#!/usr/bin/bash

current_path=$(pwd)
output_folder="crmbl_site"
path_string="$current_path/$output_folder"
project_name="crmbl"
publish_root="/var/www/html"
publish_path="$publish_root/$project_name"
publish_user="www-data"
publish_group="www-data"
publish_user_group="$publish_user:$publish_group"

#Create crmbl_site/
if [[ ! -d "$path_string" ]]
then
    mkdir $path_string
fi


#Copy all repo files to new temp dir
cp -r $current_path/$project_name-engine/* $path_string/

cp -r $current_path/$project_name-mods/$project_name-mod-client-info/* $path_string/

cp -r $current_path/$project_name-mods/$project_name-mod-quick-gallery/* $path_string/

cp -r $current_path/$project_name-sites/$project_name-site-default/* $path_string/

cp -r $current_path/$project_name-templates/$project_name-template-default/* $path_string/

if [[ ! -d "$path_string/$project_name/include/media" ]]
then
    mkdir $path_string/$project_name/include/media
fi

if [[ ! -d "$path_string/$project_name/include/media/site" ]]
then
    mkdir $path_string/$project_name/include/media/site
fi

#delete all the README.md files from repos
find $path_string/. -name 'README.md' -delete

#Publish to web server:
if [[ -d "$publish_path" ]]
then
    sudo rm -r $publish_path
fi

sudo cp -r $path_string/$project_name $publish_root
sudo chown -R $publish_user_group $publish_path