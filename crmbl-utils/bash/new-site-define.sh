#!/usr/bin/bash

# $1 - New site name
# $2 - New site _define.php path

touch $2

echo "What is the site address? (https://www.diy-site.com:8080/)"
read site_address

echo "What template would you like to use? (Blank for default)"
read site_theme
if [[ -z $site_theme ]]
then
    site_theme="default"
fi

echo "What is the site contact email address? (admin@diy-site.com)"
read site_email

echo "Enter a phone number associated with the site: (Blank if not needed)"
read site_phone_number

echo "What is the company/organization name?"
read company_name

echo "Does the company/organization have a alternate website? (Leave blank if no)"
read company_site
if [[ -z $company_site ]]
then
    company_site="$site_address"
fi

echo "Does the company/organization have a alternate contact email? (Leave blank if no)"
read company_email
if [[ -z $company_email ]]
then
    company_email="$site_email"
fi

echo "Does the company/organization have a alternate contact phone number? (Leave blank if no)"
read company_phone
if [[ -z $company_phone ]]
then
    company_phone="$site_phone_number"
fi

echo "What is the company/organization street number?"
read street_addr_num

echo "What is the street name?"
read street_name

echo "PO Box address line: (If applies)"
read po_box_num

echo "Address suite number: (If applies)"
read suite_num

echo "Apartment number: (If applies)"
read apt_num

echo "What city is the company/organization located?"
read city

echo "State abbreviation:"
read state

echo "Zip code: "
read zipcode

echo "Country: "
read country

echo "What is the default site language code (Leave blank for English (en))"
read site_lang
if [[ -z $site_lang ]]
then
    site_lang="en"
fi

echo "What would you like set the default site title to?"
read site_title

echo "Please give a brief description of the site for meta tags"
read meta_site_description

echo "Author website for meta tags"
read author_website

echo "Title for media linking: "
read og_title

echo "Website content type? (Ex website, blog)"
read og_type_content

echo "Media sharing url: "
read og_url_content

echo "Media sharing description: "
read og_description_content

cat <<EOT >> $2
<?php
\$custom_site_values = array(
    'site_name' => '$1',
    'site_theme' => '$site_theme',
    'mods_enabled' => ["client-info"],
    'site_address' => '$site_address',
    'site_email' => '$site_email',
    'company_phone_number' => '$site_phone_number',
    'company_info' => array(
        'company_name' => '$company_name',
        'site_address' => '$company_site',
        'site_title' => '$site_title',
        'site_email' => '$company_email',
        'street_addr_num' => '$street_addr_num',
        'street_name' => '$street_name',
        'po_box_num' => '$po_box_num',
        'suite_num' => '$suite_num',
        'apt_num' => '$apt_num',
        'city' => '$city',
        'state' => '$state',
        'zipcode' => '$zipcode',
        'country' => '$country',
        'phone_num' => '$company_phone'
    ),
    'site_lang' => '$site_lang',
    'theme_declaration' => '$site_theme',
    'theme_html' => '$site_theme',
    'theme_head' => '$site_theme',
    'theme_meta' => '$site_theme',
    'theme_link' => '$site_theme',
    'theme_body' => '$site_theme',
    'theme_script' => '$site_theme',
    'theme_link_stylesheet' => 'main.css.php',
    'default_site_title' => '$site_title',
    'meta_charset' => 'UTF-8',
    'meta_name_viewport_content' => 'width=device-width, initial-scale=1.0',
    'meta_name_description_content' => '$meta_site_description',
    'meta_name_author_content' => '$author_website',
    'meta_property_og_title_content' => '$og_title',
    'meta_property_og_type_content' => '$og_type_content',
    'meta_property_og_url_content' => '$og_url_content',
    'meta_property_og_description_content' => '$og_description_content',
    'meta_property_og_image_content' => ''
);
?>
EOT
