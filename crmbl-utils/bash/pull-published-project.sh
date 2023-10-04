#!/usr/bin/bash

published_site_path=$(bash ./config-util.sh --get-key-value PublishPath = ./crmbl.conf)
backup_path=$(bash ./config-util.sh --get-key-value SitePath = ./crmbl.conf)
root_user=$(bash ./config-util.sh --get-key-value RootUser = ./crmbl.conf)

if [[ ! -d "$published_site_path" ]]
then
    echo "No published site found to pull."
    exit 1
fi

if [[ -d "$backup_path" ]]
then
    echo "[ Warning! ] There is already a deployed crmbl project."
    echo "This action will overwrite any unsaved changes made after the site was published."
    echo "Proceed with caution!"
    echo "Overwrite current 'crmbl_site' project?"
    echo "  (Enter Y/y to Confirm, any other key to Cancel)"
    printf "Confirm action (Y/y): "
    read user_input
    if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
    then
        rm -r $backup_path
    else
        echo "Action cancelled."
        exit 1
    fi
fi

mkdir $backup_path

if [[ "$root_user" == "Off" ]]
then
    sudo cp -r $published_site_path $backup_path
    sudo chown -R $USER:$USER $backup_path/crmbl
else
    cp -r $published_site_path $backup_path
fi

echo "[ $published_site_path ]"
echo "  Was pulled to:"
echo "[ $backup_path ]"
echo "  Done."