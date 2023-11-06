<?php
  global $site_mod_quick_gallery_enabled, $site_mod_quick_gallery_php_enabled, $site_mod_quick_gallery_php_run_path, $folder_name;
  //echo "Trying to display gallery: <br />";
	verbose_check("_display_quick-gallery.php Loaded.");
	if ($site_mod_quick_gallery_enabled == true){
  		if ($site_mod_quick_gallery_php_enabled ==  true){
			require_once($site_mod_quick_gallery_php_run_path);
  		}
	}

/*
  quick_gallery_run($folder_name);

  !!! quick_gallery_run() should still be made relevant for use in NO-SCRIPT environment, and
      place images, and links in the DOM.  This function will be moved to the start of this file
      in order to populate media in script, or select a seperate _display_quick-gallery source.

      This function is still important for checking if images are in the /include/media/site/<$SITE_NAME>/images/<$FOLDER_NAME>
  !!!
*/

?>
<!--Quick Gallery Wrapper -->
<section class="quick_gallery_display" id="quick-gallery-<?=$folder_name?>">
  <!--Image Display, and Next and Previous Image button container: -->
  <figure class="quick_gallery_image_display" id="quick-gallery-<?=$folder_name?>-image-view">
  </figure>
  <!--Current Image Description, if applicable -->
  <figcaption class="quick_gallery_image_caption_display" id="quick-gallery-<?=$folder_name?>-image-caption">
  </figcaption>
  <!--Quick Gallery Thumbnail navigation, Previous Page, x of xx images, Next Page: -->
  <div class="quick_gallery_nav_display" id="quick-gallery-<?=$folder_name?>-nav">
    <!--Previous thumb page button -->
    <div class="quick_gallery_nav_prev" id="quick-gallery-<?=$folder_name?>-nav-prev" onclick="">
      <h3>< Prev</h3>
    </div>
    <!--Image count-->
    <div class="quick_gallery_nav_count" id="quick-gallery-<?=$folder_name?>-nav-count"><p>0 of 00</p></div>
    <!--Next thumb page button--> 
    <div class="quick_gallery_nav_next" id="quick-gallery-<?=$folder_name?>-nav-next" onclick="">
      <h3>Next ></h3>
    </div>
  </div>
  <!--Quick Gallery thumbnail container-->
  <div class="quick_gallery_thumb_container">
    <!--Quick Gallery thumbnail display-->
    <div class="quick_gallery_thumb_display" id="quick-gallery-<?=$folder_name?>-thumbs">
    </div>
  </div>
</section>
