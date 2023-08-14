<?php
global $process_host_found, $host_string, $host_port;
$host_match = "127.0.0.1";
$port_match = '';
require_once('data/config/site/default/_define/_define.php');
if ($host_string == $host_match){
    if ($port_match != '') {
        if ($host_port == $port_match) {
            //set site only if custom port number is matched.
            $process_host_found = true;
            set_site_values($custom_site_values);
        }
    } else {
        //No need to match custom port number, just set site
        $process_host_found = true;
        set_site_values($custom_site_values);
    }
}  // ELSE CREATE FALLBACK CONFIGURATION!
?>