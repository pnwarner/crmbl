<?php
	verbose_check("client-info.php Loaded.");
	//foreach($_SERVER as $key => $value){
	//	echo '$_SERVER["'.$key.'"] = '.$value."<br />";
	//}
	function client_info_display_info(){
		echo "<h2>Client:</h2>";
		echo "<h4>";
		echo "Server: " . $_SERVER["HTTP_HOST"] . "<br />";
		echo "Browser: " . $_SERVER["HTTP_USER_AGENT"] . "<br />";
		echo "IP Address: " . $_SERVER["REMOTE_ADDR"] . "<br />";
		echo "Remote Port: " . $_SERVER["REMOTE_PORT"] . "<br />";
		echo "Request Method: " . $_SERVER["REQUEST_METHOD"] . "<br />";
		echo "Query String: " . $_SERVER["QUERY_STRING"] . "<br />";
		echo "Request URI: " . $_SERVER["REQUEST_URI"] . "<br />";
		echo "</h4>";
	}
	if ($site_dev_verbose_mode == true){
		client_info_display_info();
	}

?>
