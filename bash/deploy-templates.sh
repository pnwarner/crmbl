#!/usr/bin/bash

declare -a template_list=()

template_list_string=$(bash ./list-available-templates.sh)
IFS=' ' read -r -a template_list <<< "$template_list_string"

for template in "${template_list[@]}"
do
    bash ./deploy-template.sh "$template"
done