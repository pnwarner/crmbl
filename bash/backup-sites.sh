#!/usr/bin/bash

sites_directory=../../crmbl_site/crmbl/data/config/site

for site in "$sites_directory"/*
do
  site=${site##*/}
  bash ./backup-site.sh "$site"
done
