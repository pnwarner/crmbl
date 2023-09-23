#!/usr/bin/bash

templates_directory="../../crmbl-templates"
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

for template in "${template_list[@]}"
do
    bash ./deploy-template.sh "$template"
done