#!/usr/bin/bash

site_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)

if [[ -d "$site_path" ]]
then
    echo ""
    echo "[ENGINE]"
    echo "Would you like to backup [ crmbl-engine ] before removing from crmbl_site/ ?"
    printf "Backup Engine? (Y/n): "
    read user_input

    while true
    do
        if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
        then
            bash ./backup-engine.sh
            break
        elif [[ "$user_input" == "N" || "$user_input" == "n" ]]
        then
            break
        fi
    done

    echo ""
    echo "[ENGINE]"
    echo "  Confirm remove [ crmbl-engine ] from crmbl_site/ ?"
    echo "  Enter 'Y/y' to REMOVE Engine, or any other key will SKIP this action."
    printf "Remove Engine? (Y/y): "
    read user_input

    while true
    do
        if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
        then
            if [[ -f "$site_path/crmbl/index.php" ]]
            then
                rm $site_path/crmbl/index.php
            fi
            if [[ -d "$site_path/crmbl/data/source/site" ]]
            then
                rm -r $site_path/crmbl/data/source/site
            fi
            
            if [[ -z "$(ls -A $site_path/crmbl/data/source)" ]]
            then
                rm -r $site_path/crmbl/data/source
            fi
            if [[ -z "$(ls -A $site_path/crmbl/data)" ]]
            then
                rm -r $site_path/crmbl/data
            fi            
            if [[ -z "$(ls -A $site_path/crmbl)" ]]
            then
                rm -r $site_path/crmbl
            fi
            echo "Engine Removed from project."
            if [[ -z "$(ls -A $site_path)" ]]
            then
                rm -r $site_path
            fi
            break
        elif [[ "$user_input" == "N" || "$user_input" == "n" ]]
        then
            echo "Action cancelled."
            exit 0
        fi
    done
else
    echo "No Deployed Project found. Exiting"
    exit 1
fi
