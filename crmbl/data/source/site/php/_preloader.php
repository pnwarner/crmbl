<?php
	global $site_source_php;

	//ANY require_once() scripts must be loaded outside of functions for continuous run of code.  

	require_once($site_source_php . "init/_init.php");
	if ($site_config['site_display_page']){
		header("Content-type: text/html");
		require_once($site_source_php . "display/_site_output.php");
	}

?>
