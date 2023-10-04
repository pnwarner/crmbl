#!/usr/bin/bash

declare -a mod_list=()
mod_list_string=$(bash ./list-available-mods.sh)
IFS=' ' read -r -a mod_list <<< "$mod_list_string"

for mod in "${mod_list[@]}"
do
    bash ./deploy-mod.sh "$mod"
done