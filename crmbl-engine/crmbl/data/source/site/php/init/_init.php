<?php
	global $site_source_php;
	//Enables logging:
	require_once($site_source_php . "init/config/_config.php");
	//Allows resource loading to be handled with custom logging:
	require_once($site_source_php . "init/io/_file_IO.php");
	//Set site variable and object templates:
	require_once($site_source_php . "define/_define.php");
	global $site_config;
	//Determine which site to load, and fill site variable and object templates:
	require_once($site_source_php . "request/_process_host_request.php");
	//Load modules requested by site definition:
	require_once($site_source_php ."init/config/_mod_config.php");
	//Create file _requests.php and load:
	//--_process_get_request.php
	//--_process_post_request.php
	//_requests.php will have a $query_match boolean variable initially set to false
	//any request from site or mod will set $query_match to true.
	//This will allow removal of mod requests from site request php files.
	//This will also result in a cleaner looking workflow.
	//Route site requests for api and ui:
	require_once($site_source_php . "request/_process_get_request.php");
	//----|POST  --<<FIFTH 2/2>>
?>
