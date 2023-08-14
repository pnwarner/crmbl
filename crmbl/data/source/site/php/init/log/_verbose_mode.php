<?php
    $verbose_mode_counter = 0; //Take index.php & _preloader.php into account

    function verbose_echo($verbose_mode_counter, $function_to_display = '', $value_to_display = '') {
        echo "<b>[V-Mode][</b> " . $verbose_mode_counter . " <b>][</b> " . $function_to_display . " <b>]</b>";
        if ($value_to_display != ''){
            echo "<b>[</b> " . $value_to_display . " <b>]</b>";
        }
        echo "<br />";
    }

    function verbose_call($function_to_display){
        GLOBAL $verbose_mode_counter;
        verbose_echo($verbose_mode_counter, $function_to_display);
        $verbose_mode_counter++;
    }

	//function verbose_check($function_to_display){
	//	GLOBAL $site_dev_verbose_mode;
	//	if ($site_dev_verbose_mode == true){
	//		verbose_call($function_to_display);
	//	}
	//}

    //Initialize Verbose
    // -index.php
    // -_preloader.php
    // -_verbose_mode.php

    verbose_call("index.php - init");
    verbose_call("_preloader.php - init");
    verbose_call("_init.php -init");
    verbose_call("_config.php -init");
    verbose_call("_verbose_mode.php - init");
?>
