#!/usr/bin/bash

sites_directory=$(bash ./config-util.sh --get-key-value SitesPath = ./crmbl.conf)
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

echo "${site_list[@]}"