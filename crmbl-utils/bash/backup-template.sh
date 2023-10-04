#!/usr/bin/bash

# $1 - template-name

project_name="crmbl"
stage_name="crmbl_site"
repo_name="$project_name-templates" #crmbl-templates
publish_path=$(bash ./config-util.sh --get-key-value TemplatesPath = ./crmbl.conf)
template_pull_path=$(bash ./config-util.sh --get-key-value crmblProjectRoot = ./crmbl.conf)
template_dest_path="$publish_path" #../../crmbl-templates

if [[ -z $1 ]]
then
    echo "No template was specified to be backed up."
    exit 1
fi

if [[ ! -z $2 ]]
then
    if [[ "$2" == "--location" ]]
    then
        if [[ -z $3 ]]
        then
            echo "No crmbl project location given. Exiting"
            exit 1
        fi
    else
        echo "Invalid option. Exiting"
        exit 1
    fi
    if [[ -d "$3/crmbl" ]]
    then
        template_pull_path="$3/crmbl"
    else
        echo "Invalid project path provided. Exiting"
        exit 1
    fi
fi

echo "Backing up template: [ $1 ]"

function backup_template {
    template_name="$1"
    project_template_name="crmbl-template-$template_name" #crmbl-template-<SITE NAME>
    project_template_path="$template_dest_path/$project_template_name" #../../crmbl-templates/crmbl-template-<SITE NAME>
    repo_path=$project_template_path #../../crmbl-templates/crmbl-template-<SITE NAME>
    from_path="$template_pull_path" #../../crmbl_site/crmbl/
    dest_path="$repo_path" #../../crmbl-templates/crmbl-template-<SITE NAME>

    ##########
    # Create #
    ##########

    if [[ ! -d "$template_dest_path" ]]
    then
        mkdir $template_dest_path
    fi

    if [[ ! -d "$dest_path" ]]
    then
        mkdir "$dest_path"
    fi

    if [[ ! -d "$dest_path/crmbl" ]]
    then
        mkdir "$dest_path/crmbl"
    fi

    if [[ ! -d "$dest_path/crmbl/include" ]]
    then
        mkdir "$dest_path/crmbl/include"
    fi

    if [[ -d "$template_pull_path/include/media/template/$template_name" ]]
    then
        if [[ ! -d "$dest_path/crmbl/include/media" ]]
        then
            mkdir "$dest_path/crmbl/include/media"
        fi

        if [[ ! -d "$dest_path/crmbl/include/media/template" ]]
        then
            mkdir "$dest_path/crmbl/include/media/template"
        fi

        if [[ ! -d "$dest_path/crmbl/include/media/template/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/include/media/template/$template_name"
        fi
    fi

    if [[ -d "$template_pull_path/include/script/template/$template_name" ]]
    then
        if [[ ! -d "$dest_path/crmbl/include/script" ]]
        then
            mkdir "$dest_path/crmbl/include/script"
        fi

        if [[ ! -d "$dest_path/crmbl/include/script/template" ]]
        then
            mkdir "$dest_path/crmbl/include/script/template"
        fi    

        if [[ ! -d "$dest_path/crmbl/include/script/template/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/include/script/template/$template_name"
        fi
    fi

    if [[ -d "$template_pull_path/include/style/template/$template_name" ]]
    then
        if [[ ! -d "$dest_path/crmbl/include/style" ]]
        then
            mkdir "$dest_path/crmbl/include/style"
        fi

        if [[ ! -d "$dest_path/crmbl/include/style/template" ]]
        then
            mkdir "$dest_path/crmbl/include/style/template"
        fi

        if [[ ! -d "$dest_path/crmbl/include/style/template/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/include/style/template/$template_name"
        fi
    fi

    if [[ ! -d "$dest_path/crmbl/template" ]]
    then
        mkdir "$dest_path/crmbl/template"
    fi

    if [[ -d "$template_pull_path/template/body/$template_name" ]]
    then
        if [[ ! -d "$dest_path/crmbl/template/body" ]]
        then
            mkdir "$dest_path/crmbl/template/body"
        fi

        if [[ ! -d "$dest_path/crmbl/template/body/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/body/$template_name"
        fi
    fi

    if [[ -d "$template_pull_path/template/declaration/$template_name" ]]
    then
        if [[ ! -d "$dest_path/crmbl/template/declaration" ]]
        then
            mkdir "$dest_path/crmbl/template/declaration"
        fi   

        if [[ ! -d "$dest_path/crmbl/template/declaration/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/declaration/$template_name"
        fi
    fi

    if [[ -d "$template_pull_path/template/head/$template_name" ]]
    then    
        if [[ ! -d "$dest_path/crmbl/template/head" ]]
        then
            mkdir "$dest_path/crmbl/template/head"
        fi

        if [[ ! -d "$dest_path/crmbl/template/head/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/head/$template_name"
        fi
    fi
    
    if [[ -d "$template_pull_path/template/html/$template_name" ]]
    then
        if [[ ! -d "$dest_path/crmbl/template/html" ]]
        then
            mkdir "$dest_path/crmbl/template/html"
        fi

        if [[ ! -d "$dest_path/crmbl/template/html/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/html/$template_name"
        fi
    fi

    if [[ -d "$template_pull_path/template/link/$template_name" ]]
    then
        if [[ ! -d "$dest_path/crmbl/template/link" ]]
        then
            mkdir "$dest_path/crmbl/template/link"
        fi

        if [[ ! -d "$dest_path/crmbl/template/link/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/link/$template_name"
        fi
    fi

    if [[ -d "$template_pull_path/template/meta/$template_name" ]]
    then
        if [[ ! -d "$dest_path/crmbl/template/meta" ]]
        then
            mkdir "$dest_path/crmbl/template/meta"
        fi

        if [[ ! -d "$dest_path/crmbl/template/meta/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/meta/$template_name"
        fi
    fi

    if [[ -d "$template_pull_path/template/script/$template_name" ]]
    then
        if [[ ! -d "$dest_path/crmbl/template/script" ]]
        then
            mkdir "$dest_path/crmbl/template/script"
        fi

        if [[ ! -d "$dest_path/crmbl/template/script/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/script/$template_name"
        fi
    fi

    #######
    #Copy:#
    #######

    if [[ -d "$template_pull_path/include/media/template/$template_name" ]]
    then
        cp -r $template_pull_path/include/media/template/$template_name $dest_path/crmbl/include/media/template/
    fi

    if [[ -d "$template_pull_path/include/script/template/$template_name" ]]
    then
        cp -r $template_pull_path/include/script/template/$template_name $dest_path/crmbl/include/script/template/
    fi

    if [[ -d "$template_pull_path/include/style/template/$template_name" ]]
    then
        cp -r $template_pull_path/include/style/template/$template_name $dest_path/crmbl/include/style/template/
    fi

    if [[ -d "$template_pull_path/template/body/$template_name" ]]
    then
        cp -r $template_pull_path/template/body/$template_name $dest_path/crmbl/template/body/
    fi   
    
    if [[ -d "$template_pull_path/template/declaration/$template_name" ]]
    then
        cp -r $template_pull_path/template/declaration/$template_name $dest_path/crmbl/template/declaration/
    fi
    
    if [[ -d "$template_pull_path/template/head/$template_name" ]]
    then
        cp -r $template_pull_path/template/head/$template_name $dest_path/crmbl/template/head/
    fi

    if [[ -d "$template_pull_path/template/html/$template_name" ]]
    then
        cp -r $template_pull_path/template/html/$template_name $dest_path/crmbl/template/html/
    fi

    if [[ -d "$template_pull_path/template/link/$template_name" ]]
    then
        cp -r $template_pull_path/template/link/$template_name $dest_path/crmbl/template/link/
    fi
    
    if [[ -d "$template_pull_path/template/meta/$template_name" ]]
    then
        cp -r $template_pull_path/template/meta/$template_name $dest_path/crmbl/template/meta/
    fi

    if [[ -d "$template_pull_path/template/script/$template_name" ]]
    then
        cp -r $template_pull_path/template/script/$template_name $dest_path/crmbl/template/script/
    fi
}

backup_template $1