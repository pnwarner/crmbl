#!/usr/bin/bash

project_name="crmbl_site"

echo "New site name: "
read new_site_name

new_site_path="../../$project_name/crmbl/data/config/site/$new_site_name"
new_site_define_path="$new_site_path/_define"
new_site_request_path="$new_site_path/_request"
new_site_content_path="$new_site_path/site_content"

#Create directory structure

mkdir $new_site_path
mkdir $new_site_define_path
mkdir $new_site_request_path
mkdir $new_site_content_path

#Create new host file
host_file_name="../../$project_name/crmbl/data/config/host/$new_site_name.php"
bash ./new-site-host.sh $new_site_name $host_file_name

# Create initial request files:

bash ./new-site-get-request.sh $new_site_request_path/_process_get_request.php
bash ./new-site-post-request.sh $new_site_request_path/_process_post_request.php

# Create initial landing content page:

bash ./new-site-content-landing.sh $new_site_name $new_site_content_path

# Add new site media folders
mkdir ../../$project_name/crmbl/include/media/site/$new_site_name

# Now ask a long list of questions to populate the _define.php file
bash ./new-site-define.sh $new_site_name $new_site_define_path/_define.php

echo "Done, new site added."