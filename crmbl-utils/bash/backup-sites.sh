#!/usr/bin/bash

#crmbl site file paths:

#Store in: crmbl/crmbl-sites/

sites_directory=../../crmbl_site/crmbl/data/config/site
#pull list of directories from $sites_directory and remove prefixed path
#../../crmbl_site/crmbl/data/config/site/default -> default
#Pass each site name to backup-site script
for site in "$sites_directory"/*
do
  site=${site##*/}
  bash ./backup-site.sh "$site"
done
