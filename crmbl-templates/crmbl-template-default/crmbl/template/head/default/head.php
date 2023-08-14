<?php
	global $site_config;
	verbose_check("head.php Loaded.");
	//echo "default _head loaded.\n";
?>
<head>
<title><?=$site_config['default_site_title']?></title>
<?php
	require_once($site_config['site_meta_path']);
	require_once($site_config['site_link_path']);
?>
</head>
