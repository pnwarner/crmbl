<?php
global $site_config, $site_query_value_found;
//echo "Loading quick gallery from mod path!\n";
if (array_key_exists("quick-gallery-req", $_GET)){
    //MODULE: quick-gallery
    //Return JSON Packet of all gallery folder information for quick-gallery.js to digest and display
    /*
        For now, request goes as sitename.com/?quick-gallery-req=<DIRECTORY>

        Could support Internal Cross-site support:
        sitename.com/?quick-gallery-req=<DIRECTORY>;<INTERNAL SITE NAME>
        ex:
        sitename.com/?quick-gallery-req=test-gallery\default
        sitename.com/?quick-gallery-req=portfolio/grooming\puppers
    */
    $site_query_value_found = true;
    //Rest-API does not need to display website:
    $site_config['site_display_page'] = false;
    //JSON encoding returns:
    require_once($site_mod_quick_gallery_php_run_path);
    quick_gallery_api_return_gallery_info();
 }
?>