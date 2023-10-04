#!/usr/bin/bash

#Delete crmbl-site-<site name> from ../../crmbl-sites

sites_path=$(bash ./config-util.sh --get-key-value SitesPath = ./crmbl.conf)

if [[ -d "$sites_path" ]]
then
    if [[ -d "$sites_path/crmbl-site-$1" ]]
    then
        while true
        do
            echo "Confirm: Delete site [ $1 ] from crmbl-sites/ ?"
            printf "Delete site (Y/n): "
            read user_input
            if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
            then
                rm -r $sites_path/crmbl-site-$1
                echo "Site deleted."
                if [[ -z "$(ls -A $sites_path)" ]]
                then
                    rm -r $sites_path
                fi
                exit 0
            else
                if [[ "$user_input" == "N" || "$user_input" == "n" ]]
                then
                    echo "Site deletion was aborted."
                    exit 0
                fi
            fi
        done
    else
        echo "No site was found with that name.  Exiting"
        exit 1
    fi
else
    echo "No crmbl-sites/ directory found. Exiting"
    exit 1
fi