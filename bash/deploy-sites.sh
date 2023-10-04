#!/usr/bin/bash

declare -a site_list=()
site_list_string=$(bash ./list-available-sites.sh)
IFS=' ' read -r -a site_list <<< "$site_list_string"

for site in "${site_list[@]}"
do
    bash ./deploy-site.sh "$site"
done