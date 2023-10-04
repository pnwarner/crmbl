#!/usr/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
#Alternate location of deployed or published site:
#$1 --location
#$2 path
#bash ./list-templates.sh --location /home/user/alt-crmbl
#site_path=/home/user/alt-crmbl/crmbl/data/source/mod

site_path=$(bash ./config-util.sh --get-key-value crmblProjectRoot = ./crmbl.conf)
site_path+="/data/source/mod"

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
    if [[ -d "$2/crmbl/data/source/mod" ]]
    then
        site_path="$2/crmbl/data/source/mod"
    else
        echo "Invalid project path provided. Exiting"
        exit 1
    fi
fi

declare -a dir_list=()

for directory in "$site_path"/*
do
    directory=${directory##*/}
    dir_list+=("$directory")
done

echo "${dir_list[@]}"