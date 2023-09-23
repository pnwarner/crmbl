#!/usr/bin/bash

output_folder="crmbl_site"
path_string="../../$output_folder"
project_name="crmbl"
publish_root="/var/www/html"
publish_path="$publish_root/$project_name"
publish_user="www-data"
publish_group="www-data"
publish_user_group="$publish_user:$publish_group"

#delete all the README.md files from repos
find $path_string/. -name 'README.md' -delete

if [[ -d "$publish_path" ]]
then
    sudo rm -r $publish_path
fi

sudo cp -r $path_string/$project_name $publish_root
sudo chown -R $publish_user_group $publish_path