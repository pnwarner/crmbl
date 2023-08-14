<?php
	global $site_config;
	verbose_check("html.php Loaded.");
	//echo "Default _html loaded.\n";
?>
<html lang="en">
<?php
	require_once($site_config['site_head_path']);
	require_once($site_config['site_body_path']);
?>
</html>
