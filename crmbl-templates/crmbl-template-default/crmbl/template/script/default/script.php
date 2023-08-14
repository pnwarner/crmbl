<?php
	global $site_config;
	verbose_check("script.php Loaded.");
	if ($site_mod_client_info_enabled == true){
		if ($site_mod_client_info_js_enabled == true){
			require_once($site_mod_client_info_js_path);
		}
	}
?>
<script type="text/javascript" src="/include/script/site/<?=$site_config['site_name']?>/js/main.js">

</script>

