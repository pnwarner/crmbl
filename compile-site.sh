#!/usr/bin/bash

#
# This script is only intended to be executed 1 time after repo is cloned.
# This will write over any existing / changed code in $publish_root/$project_name (if pre-existing)
#

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

#echo "Creating temporary directory."
mkdir $path_string
#Copy all repo files to new temp dir
#echo "Copy engine."
cp -r $current_path/$project_name-engine/* $path_string/
#echo "Copy mod-client-info"
cp -r $current_path/$project_name-mods/$project_name-mod-client-info/* $path_string/
#echo "Copy mod-quick-gallery"
cp -r $current_path/$project_name-mods/$project_name-mod-quick-gallery/* $path_string/
#echo "Copy site-default"
cp -r $current_path/$project_name-sites/$project_name-site-default/* $path_string/
#echo "Copy template-default"
cp -r $current_path/$project_name-templates/$project_name-template-default/* $path_string/
#echo "Creating media folders"
mkdir $path_string/$project_name/include/media
mkdir $path_string/$project_name/include/media/site
#echo "Remove unnecessary files"
#delete all README.md in new site
find $path_string/. -name 'README.md' -delete
#echo "Copy website to webroot"
sudo cp -r $path_string/$project_name $publish_root
#echo "Changing site ownership"
sudo chown -R $publish_user_group $publish_path
#echo "Cleaning up."
rm -r $path_string
echo "Done."
echo "The default site is set to point to http://127.0.0.1/"
