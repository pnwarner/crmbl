#!/usr/bin/bash

#Delete crmbl-mod-<module name> from ../../crmbl-mods

mods_path=$(bash ./config-util.sh --get-key-value ModulesPath = ./crmbl.conf)

if [[ -d "$mods_path" ]]
then
    if [[ -d "$mods_path/crmbl-mod-$1" ]]
    then
        while true
        do
            echo "Confirm: Delete module [ $1 ] from crmbl-mods/ ?"
            printf "Delete module (Y/n): "
            read user_input
            if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
            then
                rm -r $mods_path/crmbl-mod-$1
                echo "Module deleted."
                if [[ -z "$(ls -A $mods_path)" ]]
                then
                    rm -r $mods_path
                fi
                exit 0
            else
                if [[ "$user_input" == "N" || "$user_input" == "n" ]]
                then
                    echo "Module deletion was aborted."
                    exit 0
                fi
            fi
        done
    else
        echo "No Module was found with that name.  Exiting"
        exit 1
    fi
    
else
    echo "No crmbl-mods/ directory found. Exiting"
    exit 1
fi