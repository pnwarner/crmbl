<?php
	verbose_check("body.php Loaded.");
	global $site_config;
	
	$address_string = $site_config['company_info']['street_addr_num'] . " " . $site_config['company_info']['street_name'] . ", ";
	if ($site_config['company_info']['po_box_num'] != '') {
		$address_string = $address_string . $site_config['company_info']['po_box_num'] . ", ";
	} elseif ($site_config['company_info']['suite_num'] != '') {
		$address_string = $address_string . $site_config['company_info']['suite_num'] . ", ";
	} elseif ($site_config['company_info']['apt_num'] != '') {
		$address_string = $address_string . $site_config['company_info']['apt_num'] . ", ";
	}
	$address_string = $address_string . $site_config['company_info']['city'] . ", " . $site_config['company_info']['state'] . " " . $site_config['company_info']['zipcode'] . ", " . $site_config['company_info']['country'];
?>
<body>
  <header>
	<nav>
		<div class="nav-bar">
			<div class="nav-bar-title">
				<p>crmbl CMS</p>
			</div>
			<div class="nav-bar-links">
				<a href="/">
					<p>Home</p>
				</a>
			</div>
		</div>
	</nav>
  </header>
  <div class="content-scroll-wrapper"> 
    <main>
    	<section class="banner">
			<h1>Welcome to crmbl CMS.</h1>
    	</section>
		<section class="main-content-wrapper">
<?php

	//$site_content_string = 'template/site_content/' . $site_config['site_name'] . '/' . $site_config['site_content_request'] . '/_' . $site_config['site_content_request'] . '.php';
	$site_content_string = 'data/config/site/' . $site_config['site_name'] . '/site_content/' . $site_config['site_content_request'] . '/_' . $site_config['site_content_request'] . '.php';
	require_once($site_content_string);
	//Include <script> to body
	require_once($site_config['site_script_path']);
	//echo "Loaded script <br />";

	//Temp include MOD - data-mine - Display client info
	//if ($site_mod_client_info_enabled == true){
  		//if ($site_mod_client_info_php_enabled ==  true){
	//echo "Loading: " . $site_mod_client_info_php_display_path . " . <br />";
	require_once($site_mod_client_info_php_display_path);  //---This should point to RUN PATH!!!
	//echo "load client info php <br />";
  		//}
	//}
?>
		</section>
    </main>
    <footer>
		<div id="footer-items" class="footer-items">
			<div id="footer-info" class="footer-info">
				<ul>
					<li><h3><span id="footer-company-name"><?=$site_config['company_info']['company_name']?></span></h3></li>
					<li><a id="footer-address-site-link" href="<?=$site_config['company_info']['site_address']?>"><span id="footer-address-site-title"><?=$site_config['company_info']['site_title']?></span></a></li>
					<li><a href="mailto:<?=$site_config['company_info']['site_email']?>"><span id="footer-address-email-title"><?=$site_config['company_info']['site_email']?></span></a></li>
					<li><a href="https://maps.google.com/?q=<?=$address_string?>" target="_blank">
						<p><span id="footer-address-street-num"><?=$site_config['company_info']['street_addr_num']?></span> <span id="footer-address-street"><?=$site_config['company_info']['street_name']?></span></p>
						<p><span id="footer-address-po-box"><?=$site_config['company_info']['po_box_num']?></span><span id="footer-address-suite"><?=$site_config['company_info']['suite_num']?></span><span id="footer-address-apt"><?=$site_config['company_info']['apt_num']?></span></p>
						<p><span id="footer-address-city"><?=$site_config['company_info']['city']?></span>, <span id="footer-address-state"><?=$site_config['company_info']['state']?></span> <span id="footer-address-zipcode"><?=$site_config['company_info']['zipcode']?></span></p>
						<p><span id="footer-span-address-country"><?=$site_config['company_info']['country']?></span></p>
						</a>
					</li>
					<li><a href="tel:<?=$site_config['company_info']['phone_num']?>"><p id="footer-phone-num"><span id="footer-span-phone-num"><?=$site_config['company_info']['phone_num']?></span></p></a></li>
				</ul>
			</div>
			<div>
				<h3>Social Media Icons, More Lists...</h3>
			</div>
		</div>
		<p id="copyright">Copyright &copy 2023 crmbl CMS</p>
    </footer>
  </div>
</body>
