<?php
	//Logging Configurations

	$site_dev_verbose_mode = false;

	if ($site_dev_verbose_mode == true) {
		//Load verbose mode model
		require_once($site_source_php . "init/log/_verbose_mode.php");
	}
	
	function verbose_check($function_to_display){
		GLOBAL $site_dev_verbose_mode;
		if ($site_dev_verbose_mode == true){
			verbose_call($function_to_display);
		}
	}
?>
