#!/usr/bin/bash

#Delete crmbl-template-<template name> from ../../crmbl-templates

templates_path=$(bash ./config-util.sh --get-key-value TemplatesPath = ./crmbl.conf)

if [[ -d "$templates_path" ]]
then
    if [[ -d "$templates_path/crmbl-template-$1" ]]
    then
        while true
        do
            echo "Confirm: Delete template [ $1 ] from crmbl-templates/ ?"
            printf "Delete Template? (Y/n): "
            read user_input
            if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
            then
                rm -r $templates_path/crmbl-template-$1
                echo "Template deleted."
                if [[ -z "$(ls -A $templates_path)" ]]
                then
                    rm -r $templates_path
                fi
                exit 0
            else
                if [[ "$user_input" == "N" || "$user_input" == "n" ]]
                then
                    echo "Template deletion was aborted."
                    exit 0
                fi
            fi
        done
    else
        echo "No Template was found with that name.  Exiting"
        exit 1
    fi
else
    echo "No crmbl-templates/ directory found. Exiting"
    exit 1
fi