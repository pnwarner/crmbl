#!/usr/bin/bash

publish_path=$(bash ./config-util.sh --get-key-value PublishPath = ./crmbl.conf)
is_root_user=$(bash ./config-util.sh --get-key-value RootUser = ./crmbl.conf)

if [[ -d "$publish_path" ]]
then
    echo "Would you like to back up the published site to crmbl_site/ before removal?"
    printf "Backup published site? (Y/n): "
    read user_input
    if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
    then
        bash ./pull-published-project.sh
    elif [[ "$user_input" == "N" || "$user_input" == "n" ]]
    then
        echo "Published site will not be backed up."
    else
        echo "Invalid selection. Exiting."
        exit 1
    fi

    if [[ "$is_root_user" == "Off" ]]
    then
        sudo rm -r $publish_path
    else
        rm -r $publish_path
    fi
    echo "Published site was removed from webroot."
else
    echo "No Published Site found. Exiting"
    exit 1
fi