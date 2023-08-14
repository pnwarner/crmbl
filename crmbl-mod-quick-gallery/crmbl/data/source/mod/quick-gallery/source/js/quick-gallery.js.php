<?php
    global $folder_name, $site_config, $site_mod_quick_gallery_site_name;
    if ($site_mod_quick_gallery_site_name == '') {
      //echo "Site Name was blank!!! <br />";
      $site_mod_quick_gallery_site_name = $site_config['site_name'];
    }
    /*
    Backend Only, NO JS Request: (Inside script tag)

    const galleryObject = {
      max_thumbs: 5,
      folder_name: '<?=$folder_name?>',
      site_name: '<?=$site_name?>',
      image_array: [<?php 
      $i = 1;
      foreach($current_images as $image_name){
          echo "\"" . $image_name . "\"";
          if ($i < count($current_images)) {
              echo ",";
          }
          $i++;
      }
      ?>],
      image_descriptions: {<?php
      $i = 1;
      foreach ($current_descriptions as $key => $value){
          echo "\"" . $key . "\": " . "\"" . $value . "\"";
          if ($i < count($current_descriptions)) {
              echo ",";
          }
          $i++;
      }
      ?>}
    };
    */

    /*
    JS Request: (Inside script tag)

    const galleryObject = {
      max_thumbs: 5,
      folder_name: '<?=$folder_name?>',
      site_name: '<?=$site_name?>'
    };
    */
    
?>
<script type="text/javascript">
  const galleryObject = {
    max_thumbs: 5,
    folder_name: '<?=$folder_name?>',
    site_name: '<?=$site_mod_quick_gallery_site_name?>'
  };
  const new_gallery = new QuickGallery(galleryObject);
  new_gallery.run_gallery();
</script>
