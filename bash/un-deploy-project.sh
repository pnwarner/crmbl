#!/usr/bin/bash
sites_list_string=$(bash ./list-sites.sh)
mods_list_string=$(bash ./list-mods.sh)
templates_list_string=$(bash ./list-templates.sh)
IFS=' ' read -r -a sites_list <<< "$sites_list_string"
IFS=' ' read -r -a mods_list <<< "$mods_list_string"
IFS=' ' read -r -a templates_list <<< "$templates_list_string"
while true
do
    echo "Un-Deploy Project crmbl_site/ ?"
    printf "Confirm (Y/n): "
    read user_input
    if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
    then
        for site in "${sites_list[@]}"
        do
            bash ./remove-site.sh $site
        done
        for mod in "${mods_list[@]}"
        do
            bash ./remove-mod.sh $mod
        done
        for template in "${templates_list[@]}"
        do
            bash ./remove-template.sh $template
        done
        bash ./remove-engine.sh
        echo "Site Un-Deployed."

        echo "Cleaning up."
        bash ./un-deploy-project-cleanup.sh
        break
    elif [[ "$user_input" == "N" || "$user_input" == "n" ]]
    then
        echo "Action cancelled."
        break
    else
        echo "Invalid selection."
        exit 1
    fi
done