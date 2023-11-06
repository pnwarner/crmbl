<?php
	global $site_config;
	verbose_check("script.php Loaded.");
	if ($site_mod_client_info_enabled == true){
		if ($site_mod_client_info_js_enabled == true){
			require_once($site_mod_client_info_js_path);
		}
	}
	$theme_js = array(
		'main' => array(
			'type' => 'text/javascript',
			'name' => 'main.js',
			'path-type' => 'script',
			'media-path-type' => 'template',
			'path-name' => 'default',
			'media-path' => '',
			'url' => '',
			'attr' => array(),
			'version' => ''
		)
	);

	$theme_js = array_merge($theme_js, $site_config['include_scripts']);
	$theme_js = array_merge($theme_js, $site_config['include_mod_scripts']);
	$theme_js = array_merge($theme_js, $site_config['include_additional_scripts']);
	foreach ($theme_js as $value) {
		insert_script_resource($value);
	}
?>