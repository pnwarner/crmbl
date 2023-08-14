<?php
    global $site_config;

    if ($_SERVER['REQUEST_METHOD'] == "GET") {
        if (count($_GET) == 0){  //NO VALUE REQUEST
            //Config-Home-Page
            //Normal site request - www.site.com/
            //Set "Home" or "Landing page"
            $site_config['site_content_request'] = "landing";
        } elseif (count($_GET) >= 1) { 
            $site_query_value_found = false;
            foreach ($_GET as $key => $value){
                if ($value == ""){
                    $no_key_value_pair = true;
                } else {
                    $no_key_value_pair = false;
                }
            }
            //
            //Single Variable page direct [www.site.com/?foo]
            //
            if ($no_key_value_pair){
                //Config-Page-Request
                if ($_SERVER['QUERY_STRING'] == "home"){
                    $site_query_value_found = true;
                    $site_config['site_content_request'] = "landing";
                } elseif ($_SERVER['QUERY_STRING'] == "gallery"){
                    $site_query_value_found = true;
                    $site_config['site_content_request'] = "gallery";
                    //echo "$_GET len with no values " . count($_GET) . "<br />";
                }
            //    
            //Single Variable w/ value page direct [www.site.com/?foo=bar]
            //
            } else {
                //Load additional get requests from mods 
                foreach($site_config['mods_enabled'] as $enabled_mod) {
                    //    mod_config_enable_mod($enabled_mod);
                    $require_string = $site_config['site_mod_path'] . $enabled_mod . "/source/php/request/_request_get_" . $enabled_mod . ".php";
                    require_once($require_string);
                }
            }
            //} else {
            if (!$site_query_value_found){
                //Pointed to invalid request
                echo "Invalid Request: ";
                echo $_SERVER['QUERY_STRING'];
                echo "\n";
                $site_config['site_content_request'] = "landing";
            }
        } 
    }
?>