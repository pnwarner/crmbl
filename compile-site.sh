#!/usr/bin/bash

current_path=$(pwd)
output_folder="new_site"
path_string="$current_path/$output_folder"
project_name="crmbl"
project_repo="https://github.com/pnwarner/$project_name"
publish_root="/var/www/html"
publish_path="$publish_root/$project_name"
publish_user="www-data"
publish_group="www-data"
publish_user_group="$publish_user:$publish_group"

mkdir $path_string

#delete all the README.md files from repos
find . -name 'README.md' -delete

#Copy all repo files to new temp dir
cp -r $current_path/$project_name-engine/* $path_string/

cp -r $current_path/$project_name-mods/$project_name-mod-client-info/* $path_string/

cp -r $current_path/$project_name-mods/$project_name-mod-quick-gallery/* $path_string/

cp -r $current_path/$project_name-sites/$project_name-site-default/* $path_string/

cp -r $current_path/$project_name-templates/$project_name-template-default/* $path_string/

mkdir $path_string/$project_name/include/media
mkdir $path_string/$project_name/include/media/site

sudo cp -r $path_string/$project_name $publish_root
sudo chown -R $publish_user_group $publish_path
rm -r $path_string
