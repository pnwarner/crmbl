#!/usr/bin/bash
# *.conf Key=Value Pair managing script
# Usage:
# config-util.sh --add-key-value NEW_KEY_NAME DELIMITER NEW_KEY_VALUE FILE_PATH
# config-util.sh --change-key-value KEY_NAME DELIMITER NEW_KEY_VALUE FILE_PATH
# config-util.sh --delete-file-line FILE_PATH LINE_NUMBER
# config-util.sh --delete-key KEY_NAME FILE_PATH
# config-util.sh --get-key-line KEY_NAME FILE_PATH
# config-util.sh --get-key-value KEY_NAME DELIMITER FILE_PATH

function add_key_value() {
    if [[ -f "$4" ]]
    then
        echo "${1}${2}${3}" >> $4
    fi
}

function change_key_value() {
    n=$(get_key_line $1 $4)
    if [[ "$n" == "Key was not found in file!" ]]
    then
        exit 1
    else
        sed -i "${n}s/.*/${1}${2}${3}/" "$4"
    fi
}

function delete_file_line() {
    if [[ -f "$1" ]]
    then
        c=$(wc -l  < $1)
        if [ "$2" -le "$c" ]
        then
            sed -i "${2}d" "$1"
        fi
    fi
}

function delete_key() {
    kl=$(get_key_line $1 $2)
    if [[ "$kl" == "Key was not found in file!" ]]
    then
        exit 1
    else
        delete_file_line $2 $kl
    fi
}

function get_key_line() {
    if [[ ! -f "$2" ]]
    then
	    echo "File was not found."
	    exit 1
    fi
    fls=$(cat $2 | grep -m1 -n -- "^$1")
    if [[ -z $fls ]]
    then
	    echo "Key was not found in file!"
	    exit 1
    fi
    IFS=':' read -r id string <<< "$fls"
    echo $id
}

function get_key_value() {
    if [[ ! -f "$3" ]]
    then
	    echo "File was not found."
	    exit 1
    fi
    ts=$(cat $3 | grep -m1 -- "^$1")
    if [[ -z $ts ]]
    then
	    echo "Key was not found in file!"
	    exit 1
    fi
    IFS="$2" read -r id string <<< "$ts"
    if [[ -z $id ]]
    then
	    echo "id was not set"
	    exit 1
    fi
    if [[ -z $string ]]
    then
	    echo ""
	    exit 1
    fi
    echo "$string"
}

case $1 in
    --add-key-value | --akv)
        add_key_value $2 $3 $4 $5
        ;;
    --change-key-value | --ckv)
        change_key_value $2 $3 $4 $5
        ;;
    --delete-file-line | --dfl)
        delete_file_line $2 $3
        ;;
    --delete-key | --dk)
        delete_key $2 $3
        ;;
    --get-key-line | --gkl)
        get_key_line $2 $3
        ;;
    --get-key-value | --gkv)
        get_key_value $2 $3 $4
        ;;
    *)
        exit 1
        ;;
esac
