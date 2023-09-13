#!/usr/bin/bash

#
# This script is only intended to be executed 1 time after repo is cloned.
# This will write over any existing / changed code in $publish_root/$project_name (if pre-existing)
#

current_path=$(pwd)
output_folder="crmbl_site"
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
cp -r $current_path/$project_name-engine/* $path_string/
cp -r $current_path/$project_name-mods/$project_name-mod-client-info/* $path_string/
cp -r $current_path/$project_name-mods/$project_name-mod-quick-gallery/* $path_string/
cp -r $current_path/$project_name-sites/$project_name-site-default/* $path_string/
cp -r $current_path/$project_name-templates/$project_name-template-default/* $path_string/
#Create media folders
mkdir $path_string/$project_name/include/media
mkdir $path_string/$project_name/include/media/site
#delete all README.md in new site
find $path_string/. -name 'README.md' -delete
#Copy website to webroot path
sudo cp -r $path_string/$project_name $publish_root
#Changing site ownership
sudo chown -R $publish_user_group $publish_path

#Move install script to /crmbl-utils and copy compile-site to project root for
#re-deployment
mv new-install.sh crmbl-utils/bash/
cp crmbl-utils/bash/compile-site.sh ./
rm -rf .git

echo "Done."
echo "The default site is set to point to http://127.0.0.1/"