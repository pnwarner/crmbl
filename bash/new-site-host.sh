#!/usr/bin/bash

#Expects to arguments in the order:
#$1 - site name
#$2 - site host file path

echo "Please enter a host address: (ex: localhost, www.site.com)"
read host_match
echo "Please enter a port to respond to: (Hit enter for default)"
read port_match
touch $2
cat <<EOT >> $2
<?php
global \$process_host_found, \$host_string, \$host_port;
\$host_match = "$host_match";
\$port_match = '$port_match';
require_once('data/config/site/$1/_define/_define.php');
if (\$host_string == \$host_match){
    if (\$port_match != '') {
        if (\$host_port == \$port_match) {
            //set site only if custom port number is matched.
            \$process_host_found = true;
            set_site_values(\$custom_site_values);
        }
    } else {
        //No need to match custom port number, just set site
        \$process_host_found = true;
        set_site_values(\$custom_site_values);
    }
}  // ELSE CREATE FALLBACK CONFIGURATION!
?>
EOT