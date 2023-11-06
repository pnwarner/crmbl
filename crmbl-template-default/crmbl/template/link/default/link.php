<?php
    global $site_config;
    verbose_check("link.php Loaded.");
    $theme_css = array(
        'main' => array(
            'rel' => ["stylesheet"],
            'type' => 'text/css',
            'sizes' => '',
            'target' => '',
            'name' => 'main.css.php',
            'path-type' => 'style',
            'media-path-type' => 'template',
            'path-name' => 'default',
            'media-path' => '',
            'url' => '',
            'media' => '',
            'version' => '1.0'
        )
    );

    foreach ($site_config['link_media_list'] as $key => $value) {
        insert_link_resource($value);
    }
    if ($site_config['theme_link'] != $site_config['theme_body']) {
        $body_css = array(
            'rel' => ["stylesheet"],
            'type' => 'text/css',
            'sizes' => '',
            'target' => '',
            'name' => 'main.css.php',
            'path-type' => 'style',
            'media-path-type' => 'template',
            'path-name' => $site_config['theme_body'],
            'media-path' => '',
            'url' => '',
            'media' => '',
            'version' => '1.0'
        );
        array_push($theme_css, $body_css);
    }
    $theme_css = array_merge($theme_css, $site_config['include_styles']);
    $theme_css = array_merge($theme_css, $site_config['include_additional_styles']);
    $theme_css = array_merge($theme_css, $site_config['include_mod_styles']);
    foreach($theme_css as $key => $value) {
        insert_link_resource($value);
    }
?>