#!/usr/bin/bash

# $1 - template-name

project_name="crmbl"
stage_name="crmbl_site"
repo_name="$project_name-templates" #crmbl-templates
staging_path="../.."
publish_path="$staging_path/$repo_name" #../../crmbl-templates
template_pull_path="$staging_path/$stage_name/$project_name" #../../crmbl_site/crmbl
template_dest_path="$publish_path" #../../crmbl-templates

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

    #mkdir ../../crmbl-sites/crmbl-site-<SITE-NAME>
    if [[ ! -d "$dest_path" ]]
    then
        mkdir "$dest_path"
    fi

    #mkdir $dest_path/crmbl
    if [[ ! -d "$dest_path/crmbl" ]]
    then
        mkdir "$dest_path/crmbl"
    fi

    #mkdir $dest_path/crmbl/include
    if [[ ! -d "$dest_path/crmbl/include" ]]
    then
        mkdir "$dest_path/crmbl/include"
    fi

    #Check if template has a script
    if [[ -d "$template_pull_path/include/script/template/$template_name" ]]
    then
        #mkdir $dest_path/crmbl/include/script
        if [[ ! -d "$dest_path/crmbl/include/script" ]]
        then
            mkdir "$dest_path/crmbl/include/script"
        fi

        #mkdir $dest_path/crmbl/include/script/template
        if [[ ! -d "$dest_path/crmbl/include/script/template" ]]
        then
            mkdir "$dest_path/crmbl/include/script/template"
        fi    

        #mkdir $dest_path/crmbl/include/script/template/<TEMPLATE-NAME>
        if [[ ! -d "$dest_path/crmbl/include/script/template/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/include/script/template/$template_name"
        fi
    fi

    #Check for existing stylesheet
    if [[ -d "$template_pull_path/include/style/template/$template_name" ]]
    then
        #mkdir $dest_path/crmbl/include/style/
        if [[ ! -d "$dest_path/crmbl/include/style" ]]
        then
            mkdir "$dest_path/crmbl/include/style"
        fi

        #mkdir $dest_path/crmbl/include/style/template
        if [[ ! -d "$dest_path/crmbl/include/style/template" ]]
        then
            mkdir "$dest_path/crmbl/include/style/template"
        fi

        #mkdir $dest_path/crmbl/include/style/template/<TEMPLATE-NAME>
        if [[ ! -d "$dest_path/crmbl/include/style/template/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/include/style/template/$template_name"
        fi
    fi

    #mkdir $dest_path/crmbl/template
    if [[ ! -d "$dest_path/crmbl/template" ]]
    then
        mkdir "$dest_path/crmbl/template"
    fi

    #Check for body template
    if [[ -d "$template_pull_path/template/body/$template_name" ]]
    then
        #mkdir $dest_path/crmbl/template/body
        if [[ ! -d "$dest_path/crmbl/template/body" ]]
        then
            mkdir "$dest_path/crmbl/template/body"
        fi

        #mkdir $dest_path/crmbl/template/body/<TEMPLATE-NAME>
        if [[ ! -d "$dest_path/crmbl/template/body/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/body/$template_name"
        fi
    fi

    #Check for declaration template
    if [[ -d "$template_pull_path/template/declaration/$template_name" ]]
    then
        #mkdir $dest_path/crmbl/template/declaration
        if [[ ! -d "$dest_path/crmbl/template/declaration" ]]
        then
            mkdir "$dest_path/crmbl/template/declaration"
        fi   

        #mkdir $dest_path/crmbl/template/declaration/<TEMPLATE-NAME>
        if [[ ! -d "$dest_path/crmbl/template/declaration/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/declaration/$template_name"
        fi
    fi

    #Check for head template
    if [[ -d "$template_pull_path/template/head/$template_name" ]]
    then    
        #mkdir $dest_path/crmbl/template/head
        if [[ ! -d "$dest_path/crmbl/template/head" ]]
        then
            mkdir "$dest_path/crmbl/template/head"
        fi

        #mkdir $dest_path/crmbl/template/head/<TEMPLATE-NAME>
        if [[ ! -d "$dest_path/crmbl/template/head/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/head/$template_name"
        fi
    fi
    
    #Check for html template
    if [[ -d "$template_pull_path/template/html/$template_name" ]]
    then    
        #mkdir $dest_path/crmbl/template/html
        if [[ ! -d "$dest_path/crmbl/template/html" ]]
        then
            mkdir "$dest_path/crmbl/template/html"
        fi

        #mkdir $dest_path/crmbl/template/html/<TEMPLATE-NAME>
        if [[ ! -d "$dest_path/crmbl/template/html/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/html/$template_name"
        fi
    fi

    #Check for link template
    if [[ -d "$template_pull_path/template/link/$template_name" ]]
    then
        #mkdir $dest_path/crmbl/template/link
        if [[ ! -d "$dest_path/crmbl/template/link" ]]
        then
            mkdir "$dest_path/crmbl/template/link"
        fi

        #mkdir $dest_path/crmbl/template/link/<TEMPLATE-NAME>
        if [[ ! -d "$dest_path/crmbl/template/link/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/link/$template_name"
        fi
    fi

    #Check for meta template
    if [[ -d "$template_pull_path/template/meta/$template_name" ]]
    then
        #mkdir $dest_path/crmbl/template/meta
        if [[ ! -d "$dest_path/crmbl/template/meta" ]]
        then
            mkdir "$dest_path/crmbl/template/meta"
        fi

        #mkdir $dest_path/crmbl/template/meta/<TEMPLATE-NAME>
        if [[ ! -d "$dest_path/crmbl/template/meta/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/meta/$template_name"
        fi
    fi

    #Check for script template
    if [[ -d "$template_pull_path/template/script/$template_name" ]]
    then
        #mkdir $dest_path/crmbl/template/script
        if [[ ! -d "$dest_path/crmbl/template/script" ]]
        then
            mkdir "$dest_path/crmbl/template/script"
        fi

        #mkdir $dest_path/crmbl/template/script/<TEMPLATE-NAME>
        if [[ ! -d "$dest_path/crmbl/template/script/$template_name" ]]
        then
            mkdir "$dest_path/crmbl/template/script/$template_name"
        fi
    fi

    #######
    #Copy:#
    #######

    #../../crmbl_site/crmbl/include/script/template/<SITE NAME>/* ->
    if [[ -d "$template_pull_path/include/script/template/$template_name" ]]
    then
        cp -r $template_pull_path/include/script/template/$template_name $dest_path/crmbl/include/script/template/
    fi

    #../../crmbl_site/crmbl/include/style/template/<SITE NAME>/* ->
    if [[ -d "$template_pull_path/include/style/template/$template_name" ]]
    then
        cp -r $template_pull_path/include/style/template/$template_name $dest_path/crmbl/include/style/template/
    fi

    #../../crmbl_site/crmbl/template/body/<SITE NAME>/* ->
    if [[ -d "$template_pull_path/template/body/$template_name" ]]
    then
        cp -r $template_pull_path/template/body/$template_name $dest_path/crmbl/template/body/
    fi   
    
    #../../crmbl_site/crmbl/template/declaration/<SITE NAME>/* ->
    if [[ -d "$template_pull_path/template/declaration/$template_name" ]]
    then
        cp -r $template_pull_path/template/declaration/$template_name $dest_path/crmbl/template/declaration/
    fi
    
    #../../crmbl_site/crmbl/template/head/<SITE NAME>/* ->
    if [[ -d "$template_pull_path/template/head/$template_name" ]]
    then
        cp -r $template_pull_path/template/head/$template_name $dest_path/crmbl/template/head/
    fi

    #../../crmbl_site/crmbl/template/html/<SITE NAME>/* ->
    if [[ -d "$template_pull_path/template/html/$template_name" ]]
    then
        cp -r $template_pull_path/template/html/$template_name $dest_path/crmbl/template/html/
    fi

    #../../crmbl_site/crmbl/template/link/<SITE NAME>/* ->
    if [[ -d "$template_pull_path/template/link/$template_name" ]]
    then
        cp -r $template_pull_path/template/link/$template_name $dest_path/crmbl/template/link/
    fi
    
    #../../crmbl_site/crmbl/template/meta/<SITE NAME>/* ->
    if [[ -d "$template_pull_path/template/meta/$template_name" ]]
    then
        cp -r $template_pull_path/template/meta/$template_name $dest_path/crmbl/template/meta/
    fi

    #../../crmbl_site/crmbl/template/script/<SITE NAME>/* ->
    if [[ -d "$template_pull_path/template/script/$template_name" ]]
    then
        cp -r $template_pull_path/template/script/$template_name $dest_path/crmbl/template/script/
    fi
}

backup_template $1