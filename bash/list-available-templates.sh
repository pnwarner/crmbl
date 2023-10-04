#!/usr/bin/bash

templates_directory=$(bash ./config-util.sh --get-key-value TemplatesPath = ./crmbl.conf)
declare -a template_list=()
for template in "$templates_directory"/*
do
  if [[ -d "$template" ]] #Process directories only
  then
    template=${template##*/} #Remove file path
    template=${template//"crmbl-template-"/} #remove folder name prefix
    template_list+=("$template")
  fi
done

echo "${template_list[@]}"