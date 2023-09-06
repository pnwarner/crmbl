#!/usr/bin/bash

# $1 - New site name
# $2 - New site content path

landing_folder="$2/landing"
landing_file="$landing_folder/_landing.php"

mkdir $landing_folder
touch $landing_file

cat <<EOT >> $landing_file
<h1>crmbl CMS</h1>
<h2>https://github.com/pnwarner/crmbl</h2>
<h3>Site landing for: $1</h3>
<p>
This project is under development.
</p>
EOT