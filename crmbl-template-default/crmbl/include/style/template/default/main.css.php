<?php
	header("Content-type: text/css");
	//Set these from pre-defined variables.
	//These will have to be passed from $_SESSION to keep things dynamic in the future.
	$site_bgcolor = "#375b7d"; 
	$site_fgcolor = "white";
	$site_font = "Helvetica";
	$nav_bar_height = "60px";
	$nav_bar_bgcolor = "black";
	$nav_bar_fgcolor = "white";
	$banner_bgcolor = "grey";
	$banner_fgcolor = "white";
	$main_bgcolor = "white";
	$main_fgcolor = "black";
	$footer_bgcolor = "black";
	$footer_fgcolor = "white";
	/*
	$company_name = "crmbl CMS";
	$company_site_title = "Website";
	$company_email_title = "Email";
	$company_street_number = "";
	$company_street_name="";
	$company_po_box = "";
	$company_suite_number = "";
	$company_apt_number = "";
	$company_city = "Las Vegas";
	$company_state = "NV";
	$company_country = "USA";
	$company_phone_num = "777-777-7777";
	*/
?>

:root {
	--site-bg-color: <?=$site_bgcolor?>;
	--site-fg-color: <?=$site_fgcolor?>;
	--site-font: <?=$site_font?>;
	--nav-bar-height: <?=$nav_bar_height?>;
	--nav-bar-bgcolor: <?=$nav_bar_bgcolor?>;
	--nav-bar-fgcolor: <?=$nav_bar_fgcolor?>;
	--banner-bgcolor: <?=$banner_bgcolor?>;
	--banner-fgcolor: <?=$banner_fgcolor?>;
	--main-bgcolor: <?=$main_bgcolor?>;
	--main-fgcolor: <?=$main_fgcolor?>;
	--footer-bgcolor: <?=$footer_bgcolor?>;
	--footer-fgcolor: <?=$footer_fgcolor?>;
	--footer-height: 200px;
	--banner-height: 300px;
	--nav-bar-height: 60px;
	/*
	--company-name: "<?=$company_name?>";
	--company-site-title: "<?=$company_site_title?>";
	--company-email-title: "<?=$company_email_title?>";
	--company-street-num: "<?=$company_street_number?>";
	--company-street: "<?=$company_street_name?>";
	--company-po-box: "<?=$company_po_box?>";
	--company-suite: "<?=$company_suite_number?>";
	--company-apt: "<?=$company_apt_number?>";
	--company-city: "<?=$company_city?>";
	--company-state: "<?=$company_state?>";
	--company-country: "<?=$company_country?>";
	--company-phone-num: "<?=$company_phone_num?>";
	*/
}

/*
#footer-company-name::before {
	content: var(--company-name);
}

#footer-address-site-title::before {
	content: var(--company-site-title);
}

#footer-address-email-title::before {
	content: var(--company-email-title);
}

#footer-address-street-num::before {
	content: var(--company-street-num);
}

#footer-address-street::before {
	content: var(--company-street);
}

#footer-address-po-box::before {
	content: var(--company-po-box);
}

#footer-address-suite::before {
	content: var(--company-suite);
}

#footer-address-apt::before {
	content: var(--company-apt);
}

#footer-address-city::before {
	content: var(--company-city);
}

#footer-address-state::before {
	content: var(--company-state);
}

#footer-span-address-country::before {
	content: var(--company-country);
}

#footer-span-phone-num::before {
	content: var(--company-phone-num);
}
*/

*, *::before, *::after {
  box-sizing: inherit;
}

* {
  margin: 0;
  padding: 0;
}

html {
  box-sizing: border-box;
}

body {
  display: block;
  height: 100vh;
  width: 100%;
}

nav {
	height: var(--nav-bar-height);
	width: 100%;
	background-color: var(--nav-bar-bgcolor);
	color: var(--nav-bar-fgcolor);
	position: fixed;
	top: 0;
	left: 0;
}

.nav-bar {
	display: flex;
	height: 100%;
	justify-content: space-between;
	align-items: center;
}

.nav-bar-title {
	margin-left: 1em;
}

.nav-bar-links {
	margin-right: 1em;
}

.banner {
	min-height: 300px;
	width: 100%;
	background-color: var(--banner-bgcolor);
	color: var(--banner-fgcolor);
	display: flex;
	justify-content: center;
	align-items: center;
}

.banner h1 {
	margin: auto;
}

main {
	width: 100%;
	/*min-height: 500px;*/
	/*min-height: calc(100vh - (var(--nav-bar-height) + var(--banner-height) + var(--footer-height)));*/
	background-color: var(--main-bgcolor);
	color: var(--main-fgcolor);
}

.main-content-wrapper {
	padding: 1em 2em 1em 2em;
	/*min-height: fit-content;*/
	min-height: calc(100vh - (var(--nav-bar-height) + var(--banner-height) + var(--footer-height)));
}

footer {
	min-height: 200px;
	width: 100%;
	background-color: var(--footer-bgcolor);
	color: var(--footer-fgcolor);
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding: 2em 2em 1em 2em;
}

footer #copyright {
	text-align: center;
	margin: 0 0.5em;
}

.footer-info a {
	display: block;
	color: var(--footer-fgcolor);
	text-decoration: none;
	width: fit-content;
}

.footer-info a {
	color: grey;
}

.footer-info a:active {
	color: grey;
}

.footer-info a:hover {
	color: var(--footer-fgcolor);
}

.footer-info p {
	margin: 0 0 0 1em;
	width: fit-content;
	font-size: 0.9em;
}

.footer-info ul {
	list-style: none;
}

.footer-items {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.content-scroll-wrapper {
	width: 100%;
	max-height: calc(100vh - var(--nav-bar-height));
	min-height: calc(100vh - var(--nav-bar-height));
	overflow: scroll;
	position: fixed;
	top: var(--nav-bar-height);
	left: 0;
}

