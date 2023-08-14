<?php
    global $site_config;
    $process_host_found = false;
    $host_string = '';
    $host_port = '';
    if(strpos($_SERVER["HTTP_HOST"], ":") !== false){
        $host_string = (explode(":", $_SERVER["HTTP_HOST"]))[0];
        $host_port = (explode(":", $_SERVER["HTTP_HOST"]))[1];
    } else {
        $host_string = $_SERVER["HTTP_HOST"];
    }

    $hosts_list = file_io_list_dir($site_config['site_hosts_path']);
    foreach($hosts_list as $host_file) {
        $host_file_path = $site_config['site_hosts_path'] . $host_file;
        require_once($host_file_path);
        if ($process_host_found == true) {
            break;
        }
    }
?>