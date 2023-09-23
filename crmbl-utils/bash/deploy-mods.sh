#!/usr/bin/bash

mods_directory="../../crmbl-mods"
declare -a mod_list=()
for mod in "$mods_directory"/*
do
  if [[ -d "$mod" ]] #Process directories only
  then
    mod=${mod##*/} #Remove file path
    mod=${mod//"crmbl-mod-"/} #remove folder name prefix
    mod_list+=("$mod")
  fi
done

for mod in "${mod_list[@]}"
do
    bash ./deploy-mod.sh "$mod"
done