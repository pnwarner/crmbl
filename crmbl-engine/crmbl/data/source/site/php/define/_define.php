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
		)
	);

	function set_site_values($site_array){
		global $site_config;
		$site_config['site_name'] = $site_array['site_name'];
		$site_config['site_config_path'] = $site_config['site_config_path'] . $site_config['site_name'] . "/";
		$site_config['site-content-path'] = $site_config['site_config_path'] . "site_content/";
		$site_config['site_theme'] = $site_array['site_theme'];
		$site_config['mods_enabled'] = $site_array['mods_enabled'];

		$site_config['company_info']['company_name'] = $site_array['company_info']['company_name'];
		$site_config['company_info']['site_address'] = $site_array['company_info']['site_address'];
		$site_config['company_info']['site_title'] = $site_array['company_info']['site_title'];
		$site_config['company_info']['site_email'] = $site_array['company_info']['site_email'];
		$site_config['company_info']['street_addr_num'] = $site_array['company_info']['street_addr_num'];
		$site_config['company_info']['street_name'] = $site_array['company_info']['street_name'];
		$site_config['company_info']['po_box_num'] = $site_array['company_info']['po_box_num'];
		$site_config['company_info']['suite_num'] = $site_array['company_info']['suite_num'];
		$site_config['company_info']['apt_num'] = $site_array['company_info']['apt_num'];
		$site_config['company_info']['city'] = $site_array['company_info']['city'];
		$site_config['company_info']['state'] = $site_array['company_info']['state'];
		$site_config['company_info']['zipcode'] = $site_array['company_info']['zipcode'];
		$site_config['company_info']['country'] = $site_array['company_info']['country'];
		$site_config['company_info']['phone_num'] = $site_array['company_info']['phone_num'];

		if ($site_array['theme_declaration'] == '') {
			$site_config['theme_declaration'] = $site_config['site_theme'];
		} else {
			$site_config['theme_declaration'] = $site_array['theme_declaration'];
		}

		if ($site_array['theme_html'] == '') {
			$site_config['theme_html'] = $site_config['site_theme'];
		} else {
			$site_config['theme_html'] = $site_array['theme_html'];
		}
		
		if ($site_array['theme_head'] == ''){
			$site_config['theme_head'] = $site_config['site_theme'];
		} else {
			$site_config['theme_head'] = $site_array['theme_head'];
		}
		
		if ($site_array['theme_meta'] == ''){
			$site_config['theme_meta'] = $site_config['site_theme'];
		} else {
			$site_config['theme_meta'] = $site_array['theme_meta'];
		}
		
		if ($site_array['theme_link'] == '') {
			$site_config['theme_link'] = $site_config['site_theme'];
		} else {
			$site_config['theme_link'] = $site_array['theme_link'];
		}
		
		if ($site_array['theme_body'] == '') {
			$site_config['theme_body'] = $site_config['site_theme'];
		} else {
			$site_config['theme_body'] = $site_array['theme_body'];
		}

		if ($site_array['theme_script'] == ''){
			$site_config['theme_script'] = $site_config['site_theme'];
		} else {
			$site_config['theme_script'] = $site_array['theme_script'];
		}

		$site_config['site_lang'] = $site_array['site_lang'];
		$site_config['default_site_title'] = $site_array['default_site_title'];
		$site_config['theme_link_stylesheet'] = $site_array['theme_link_stylesheet'];
		$site_config['meta_charset'] = $site_array['meta_charset'];
		$site_config['meta_name_viewport_content'] = $site_array['meta_name_viewport_content'];
		$site_config['meta_name_description_content'] = $site_array['meta_name_description_content'];
		$site_config['meta_name_author_content'] = $site_array['meta_name_author_content'];
		$site_config['meta_property_og_title_content'] = $site_array['meta_property_og_title_content'];
		$site_config['meta_property_og_type_content'] = $site_array['meta_property_og_type_content'];
		$site_config['meta_property_og_url_content'] = $site_array['meta_property_og_url_content'];
		$site_config['meta_property_og_description_content'] = $site_array['meta_property_og_description_content'];
		$site_config['meta_property_og_image_content'] = $site_array['meta_property_og_image_content'];

		$site_config['site_mod_path'] = "data/source/mod/";
		$site_config['site_declaration_path'] = "template/declaration/" . $site_config['theme_declaration'] . "/declaration.php";
		$site_config['site_html_path'] = "template/html/" . $site_config['theme_html'] . "/" . $site_config['site_lang'] . "/html.php";
		$site_config['site_head_path'] = "template/head/" . $site_config['theme_head'] . "/head.php";
		$site_config['site_meta_path'] = "template/meta/" . $site_config['theme_meta'] . "/meta.php";
		$site_config['site_link_path'] = "template/link/" . $site_config['theme_link'] . "/link.php";
		$site_config['site_body_path'] = "template/body/" . $site_config['theme_body'] . "/body.php";
		$site_config['site_script_path'] = "template/script/" . $site_config['theme_script'] . "/script.php";
	}

?>
