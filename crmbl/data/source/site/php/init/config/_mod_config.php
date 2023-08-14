<?php
    global $site_config;
    verbose_check("_mod_config.php loaded.");

    function mod_config_list_all() {
        global $site_config;
        verbose_check("_mod_config.php - mod_config_list_all() called.");
        //Set $site_config['mods_available']
        //echo "<br /> Mod Path: " . $site_config['site_mod_path'];
        $mod_list = file_io_list_dir($site_config['site_mod_path']);
        return $mod_list;
    }

    /*
    function mod_config_enable_mod($enabled_mod) {
        global $site_config;
        //load $site_mod_path . $mod_name . "/source/php/define/_define_" . $mod_name . ".php";
        $require_string = $site_config['site_mod_path'] . $enabled_mod . "/source/php/define/_define_" . $enabled_mod . ".php";
        //echo $require_string . "\n";
        require_once($require_string);
    }
    */

    function mod_config_enable_mods() {
        global $site_config;
        verbose_check("_mod_config.php - mod_config_enable_mods() called.");
        $mod_allow_load_mods = mod_config_verify_site_mod_requirements();
        if($mod_allow_load_mods) {
            //foreach($site_config['mods_enabled'] as $enabled_mod) {
            //    mod_config_enable_mod($enabled_mod);
            //}
            return true;
        } else {
            return false;
        } // ELSE: STOP SITE FROM LOADING!
    }

    function mod_config_verify_mod_requirements() {
        verbose_check("_mod_config.php - mod_config_verify_mod_requirements() called.");
        //check each $site_config['mods_loaded'] item, and check [MOD_REQUIREMENT] list.
        //If all MODS_REQUIRED are in $site_config['mods_loaded'], return true, else false.
    }

    function mod_config_verify_site_mod_requirements() {
        global $site_config;
        verbose_check("_mod_config.php - mod_config_veryify_site_mod_requirements() called.");
        //Itterate over each $site_config['mods_enabled'] item, and pass to mod_config_veryify_mod_requirements();
        //If all function calls return as true, return function as true, else return false.
        $new_mod_list = mod_config_list_all();
        if ($new_mod_list != false){
            foreach($new_mod_list as $a_mod) {
                //echo "Available mod: " . $a_mod . "\n";
                array_push($site_config['mods_available'], $a_mod);
            }
            //foreach($site_config['mods_available'] as $a_mod){
            //    echo "Should contain: " . $a_mod . "\n";
            //}
        } else {
            $site_config['mods_available'] = false;
        }
        $mod_allow_load_mods = false;
        if ($site_config['mods_available'] != false) {
            //Check and make sure $site_config['mods_enabled'] values exist in $site_config['mods_available']
            foreach($site_config['mods_enabled'] as $enabled_mod) {
                //echo "Checking: " . $enabled_mod . "\n";
                if (in_array($enabled_mod, $site_config['mods_available'])) {
                    $mod_allow_load_mods = true;
                    //echo "True \n";
                } else {
                    $mod_allow_load_mods = false;
                    //echo "False \n";
                }
            }
    
            if ($mod_allow_load_mods) {
                return true;
            }
        } else {
            return false;
        } //else log error.  DONT FORGET LOGGING.
    }

    $mod_allow_mods = mod_config_enable_mods();

    //Need to re-address workflow for this portion of code.
	if($mod_allow_mods) {
		foreach($site_config['mods_enabled'] as $enabled_mod) {
            //    mod_config_enable_mod($enabled_mod);
			$require_string = $site_config['site_mod_path'] . $enabled_mod . "/source/php/define/_define_" . $enabled_mod . ".php";
			require_once($require_string);
        }
	}
?>