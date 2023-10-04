#!/usr/bin/bash

mods_directory=$(bash ./config-util.sh --get-key-value ModulesPath = ./crmbl.conf)
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

echo "${mod_list[@]}"