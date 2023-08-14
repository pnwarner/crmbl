<?php
	verbose_check("_define_quick-gallery.php Loaded.");
	global $site_config;
	#Make enabled to False by default.
    $site_mod_quick_gallery_enabled = true;
	$site_mod_quick_gallery_php_enabled = true;
    $site_mod_quick_gallery_js_enabled = true;
	$site_mod_quick_gallery_path = $site_config['site_mod_path'] . "quick-gallery/";
    $site_mod_quick_gallery_js_path = $site_mod_quick_gallery_path . "source/js/quick-gallery.js.php";
	$site_mod_quick_gallery_php_run_path = $site_mod_quick_gallery_path . "source/php/run/quick-gallery.php";
	$site_mod_quick_gallery_php_display_path = $site_mod_quick_gallery_path . "source/php/display/_display_quick-gallery.php";
	$site_mod_quick_gallery_site_name = $site_config['site_name'];
	
	//Create function that gets run after all available mods are loaded.
	//Check each mods -required_mods list, and make sure it is in the mods_enabled list
	//if requirements are met, set requirements_met to TRUE, and enabled to TRUE.
	//Any enabled_mods that do not have met requirements should stop the server from loading, and
	//return and error.
	$site_mod_quick_gallery_required_mods = ["client-info"];
	$site_mod_quick_gallery_requirements_met = false;

	function quick_gallery_insert_gallery($gallery_folder_name, $gallery_site_name = ".0."){
		global $folder_name, $site_name, $site_mod_quick_gallery_site_name, $site_mod_quick_gallery_php_display_path;
		//echo "Inside of quick_gallery_insert_gallery <br />";
		$folder_name = $gallery_folder_name;
		//echo "\$folder_name: " . $folder_name . "<br />";
		//$site_mod_quick_gallery_site_name = $gallery_site_name;
		if ($gallery_site_name == ".0."){
			$site_mod_quick_gallery_site_name = $site_config['site_name'];
		} else {
			$site_mod_quick_gallery_site_name = $gallery_site_name;
		}
		//echo "\$site_mode_quick_gallery_site_name: " . $site_mod_quick_gallery_site_name . "<br />";
		//echo "\$site_mod_quick_gallery_php_display_path: " . $site_mod_quick_gallery_php_display_path . "<br />";
		require_once($site_mod_quick_gallery_php_display_path);
	}
?>