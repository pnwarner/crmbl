<?php
	verbose_check("_display_client-info.php Loaded.");
	if ($site_mod_client_info_enabled == true){
  		if ($site_mod_client_info_php_enabled ==  true){
			require_once($site_mod_client_info_php_run_path);
  		}
	}
?>
