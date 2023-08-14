<?php
    global $site_config;
    verbose_check("meta.php Loaded.");
?>
<meta charset="<?=$site_config['meta_charset']?>">
<meta name="viewport" content="<?=$site_config['meta_name_viewport_content']?>">
<meta name="description" content="<?=$site_config['meta_name_description_content']?>">
<meta name="author" content="<?=$site_config['meta_name_author_content']?>">
<meta property="og:title" content="<?=$site_config['meta_property_og_title_content']?>">
<meta property="og:type" content="<?=$site_config['meta_property_og_type_content']?>">
<meta property="og:url" content="<?=$site_config['meta_property_og_url_content']?>">
<meta property="og:description" content="<?=$site_config['meta_property_og_description_content']?>">
<meta property="og:image" content="<?=$site_config['meta_property_og_image_content']?>">
<?php

?>
