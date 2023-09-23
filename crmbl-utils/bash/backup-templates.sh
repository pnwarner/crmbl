#!/usr/bin/bash

project_dir="../../crmbl_site/crmbl"
declare -a template_arr=()
declare -a new_templates=()
declare -a template_dir_index=(
  "$project_dir/include/script/template"
  "$project_dir/include/style/template"
  "$project_dir/template/body"
  "$project_dir/template/declaration"
  "$project_dir/template/head"
  "$project_dir/template/html"
  "$project_dir/template/link"
  "$project_dir/template/meta"
  "$project_dir/template/script"
)

function merge_arrays() {
  declare -A key_array
  declare -a temp_merge_arr
  for keys in "${template_arr[@]}" "${new_templates[@]}"
  do
    key_array[$keys]=1
  done
  temp_merge_arr=("${!key_array[@]}")
  template_arr=("${temp_merge_arr[@]}")
}

function search_dirs() {  
  for template_dir in "${template_dir_index[@]}"
  do
    declare -a dir_list=()
    search_directory=$template_dir
    #pull list of directories from $template_dir and remove prefixed path
    #../../crmbl_site/crmbl/template/body/default -> default
    #Pass each template name to be merged into a list of all existing templates
    for directory in "$search_directory"/*
    do
      directory=${directory##*/}
      dir_list+=("$directory")
    done
    new_templates=("${dir_list[@]}")
    merge_arrays
  done
}

function backup_templates() {
  search_dirs
  for template_name in "${template_arr[@]}"
  do
    bash ./backup-template.sh "$template_name"
  done
}

backup_templates