#!/usr/bin/bash

sites_directory=$(bash ./config-util.sh --get-key-value crmblProjectRoot = ./crmbl.conf)
sites_directory+="/data/config/site"

if [[ ! -z $1 ]]
then
    if [[ "$1" == "--location" ]]
    then
        if [[ -z $2 ]]
        then
            echo "No crmbl project location given. Exiting"
            exit 1
        fi
    else
        echo "Invalid option. Exiting"
        exit 1
    fi
    if [[ -d "$2/crmbl/data/config/site" ]]
    then
        sites_directory="$2/crmbl/data/config/site"
    else
        echo "Invalid project path provided. Exiting"
        exit 1
    fi
fi

declare -a dir_list=()

for site in "$sites_directory"/*
do
  site=${site##*/}
  dir_list+=("$site")
done

echo "${dir_list[@]}"