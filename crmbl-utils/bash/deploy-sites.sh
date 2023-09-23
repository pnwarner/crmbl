#!/usr/bin/bash

sites_directory="../../crmbl-sites"
declare -a site_list=()
for site in "$sites_directory"/*
do
  if [[ -d "$site" ]] #Process directories only
  then
    site=${site##*/} #Remove file path
    site=${site//"crmbl-site-"/} #remove folder name prefix
    site_list+=("$site")
  fi
done

for site in "${site_list[@]}"
do
    bash ./deploy-site.sh "$site"
done