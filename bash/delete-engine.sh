#!/usr/bin/bash

engine_path=$(bash ./config-util.sh --get-key-value EnginePath = ./crmbl.conf)

echo "Confirm Delete [ Engine ]"
printf "(Y/n): "
read user_input
if [[ "$user_input" == "Y" || "$user_input" == "y" ]]
then
    rm -r $engine_path
elif [[ "$user_input" == "N" || "$user_input" == "n" ]]
then
    echo "Action canceled."
else
    echo "Invalid Selection."
    exit 1
fi