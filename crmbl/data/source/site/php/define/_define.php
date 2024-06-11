<?php
	verbose_check("_define.php Loaded.");
	$site_config = array(
		'site_abs_path' => "/var/www/html/crmbl/",
		'site_mod_path' => "data/source/mod/",
		'site_config_path' => 'data/config/site/',
		'site_hosts_path' => 'data/config/host/',
		'site_content_path' => '',
		'site_content_request' => "",
		'site_display_page' => true,
		'site_name' => "",
		'site_theme' => "",
		'site_address' => "",
		'site_address_link_name' => "",
		'site_landing_message' => "",
		'site_email' => "",
		'site_header_message' => "",
		'company_phone_number' => "",
		'mods_available' => [],
		'mods_enabled' => [],
		'mods_loaded' => [],
		'theme_declaration' => "",
		'theme_html' => "",
		'theme_head' => "",
		'theme_meta' => "",
		'theme_link' => "",
		'theme_body' => "",
		'theme_script' => "",
		'site_declaration_path' => "",
		'site_html_path' => "",
		'site_head_path' => "",
		'site_meta_path' => "",
		'site_link_path' => "",
		'site_body_path' => "",
		'site_script_path' => "",
		'theme_link_stylesheet' => "",
		'site_lang' => "",
		'default_site_title' => "",
		'meta_charset' => "",
		'meta_name_viewport_content' => "",
		'meta_name_description_content' => "",
		'meta_name_author_content' => "",
		'meta_property_og_title_content' => "",
		'meta_property_og_type_content' => "",
		'meta_property_og_url_content' => "",
		'meta_property_og_description_content' => "",
		'meta_property_og_image_content' => "",
		'company_info' => array(
			'company_name' => '',
			'site_address' => '',
			'site_title' => '',
			'site_email' => '',
			'street_addr_num' => '',
			'street_name' => '',
			'po_box_num' => '',
			'suite_num' => '',
			'apt_num' => '',
			'city' => '',
			'state' => '',
			'zipcode' => '',
			'country' => '',
			'phone_num' => ''
		),
		'include_additional_styles' => array(),
		'include_additional_scripts' => array(),
		'include_scripts' => array(), #Only populate to static load scripts outside of template
		'include_styles' => array(), #Only populate to static load styles outside of template
		'include_mod_styles' => array(),
		'include_mod_scripts' => array(),
		'link_media_list' => array()
	);

	function set_site_values($site_array){
		global $site_config;
		foreach($site_array as $key => $value){
			if(array_key_exists($key, $site_config)) {
				if (is_array($value)) {
					$site_config[$key] = array_merge($site_config[$key], $value);
				} else {
					$site_config[$key] = $site_array[$key];
				}
			} else {
				$site_config[$key] = $site_array[$key];			
			}
		}

		if ($site_config['theme_declaration'] == '') {
			$site_config['theme_declaration'] = $site_config['site_theme'];
		}
		if ($site_config['theme_html'] == '') {
			$site_config['theme_html'] = $site_config['site_theme'];
		}
		if ($site_config['theme_head'] == ''){
			$site_config['theme_head'] = $site_config['site_theme'];
		}
		if ($site_config['theme_meta'] == ''){
			$site_config['theme_meta'] = $site_config['site_theme'];
		}
		if ($site_config['theme_link'] == '') {
			$site_config['theme_link'] = $site_config['site_theme'];
		}
		if ($site_config['theme_body'] == '') {
			$site_config['theme_body'] = $site_config['site_theme'];
		}
		if ($site_config['theme_script'] == ''){
			$site_config['theme_script'] = $site_config['site_theme'];
		} 
		$site_config['site_config_path'] = $site_config['site_config_path'] . $site_config['site_name'] . "/";
		$site_config['site_content_path'] = $site_config['site_config_path'] . "site_content/";
		#
		$site_config['site_mod_path'] = "data/source/mod/";
		#
		$site_config['site_declaration_path'] = "template/declaration/" . $site_config['theme_declaration'] . "/declaration.php";
		$site_config['site_html_path'] = "template/html/" . $site_config['theme_html'] . "/" . $site_config['site_lang'] . "/html.php";
		$site_config['site_head_path'] = "template/head/" . $site_config['theme_head'] . "/head.php";
		$site_config['site_meta_path'] = "template/meta/" . $site_config['theme_meta'] . "/meta.php";
		$site_config['site_link_path'] = "template/link/" . $site_config['theme_link'] . "/link.php";
		$site_config['site_body_path'] = "template/body/" . $site_config['theme_body'] . "/body.php";
		$site_config['site_script_path'] = "template/script/" . $site_config['theme_script'] . "/script.php";
	}
?>
