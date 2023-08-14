<?php
	verbose_check("_define_client-info.php Loaded.");
	global $site_config;
	$site_mod_client_info_enabled = true;
	$site_mod_client_info_php_enabled = true;
	$site_mod_client_info_js_enabled = false; //JS Data collection still under work.
	$site_mod_client_info_path = $site_config['site_mod_path'] . "client-info/";
	$site_mod_client_info_php_run_path = $site_mod_client_info_path . "source/php/run/client-info.php";
	$site_mod_client_info_php_display_path = $site_mod_client_info_path . "source/php/display/_display_client-info.php";
	$site_mod_client_info_js_path = $site_mod_client_info_path . "source/js/client-info.js.php";
?>
