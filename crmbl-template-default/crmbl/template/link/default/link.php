<?php
    global $site_config;
    verbose_check("link.php Loaded.");
    //This default template should load a static main.css, and then load .css files over it
    //for further customization.
    //Statically load include/style/template/<Template Name>/
    // instead of:
    // include/style/site/<SITENAME>/main.css.php

    //THEN, the folder of include/style/site/<SITENAME>/*.css *.css.php
    //All files should be loaded into a list, and included

    //$site_config['theme_link_stylesheet'] should be made irrelevant.  themes should have a 
    //standard naming. and /include/style/site/<site name>/*.css can be loaded after the fact.
?>
<link rel="icon" href="/include/media/site/<?=$site_config['site_name']?>/favicon/favicon.ico">
<link rel="icon" href="/include/media/site/<?=$site_config['site_name']?>/favicon/favicon.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="/include/media/site/<?=$site_config['site_name']?>/favicon/apple-touch-icon.png">
<!--Use stylesheet from whichever theme is chosen for Body element.-->
<link rel="stylesheet" href="/include/style/template/<?=$site_config['theme_body']?>/main.css.php?v=1.0">
