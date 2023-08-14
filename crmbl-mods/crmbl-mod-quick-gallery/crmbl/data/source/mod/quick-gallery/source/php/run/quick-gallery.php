<?php
    global $site_config;
    //Should Pass a Gallery Object to JS File, including $current_page, $current_img_pos, and all custom gallery content as an object
    //.js.php file should have minimal PHP intervention.  $Object() should have all required info for .js.php to manipulate and look
    //clean and nicely seperated.
    //<script type="text/javascript" src="quick-gallery.js.php">
    //$gallery={
    //  ...  init from direct input on php, or js GET lookup in future
    //};
    //$foo = new QuickGallery();
    //$foo.runGallery($gallery);
    //</script>
    function quick_gallery_load_dir($folder_name){
        $file_array = file_io_list_dir($folder_name);
        if (!$file_array){
            echo "<br />Folder not found: " . $folder_name . "<br />";
            return false;
        }
        return $file_array;
    }

    function scrub_file_extensions($file_list){
        $scrubbed_list = array();
        foreach ($file_list as $file_name){
            $scrubbed_list[] = substr($file_name, 0, strrpos($file_name, '.'));
        }
        return $scrubbed_list;
    }

    function get_file_descriptions($folder_name, $image_list) {
        $desc_array = array();
        $image_list = scrub_file_extensions($image_list);
        foreach ($image_list as $image){
            if (file_exists($folder_name . $image . ".desc")){
                $file_name = fopen($folder_name . $image . ".desc", "r");
                $file_contents = fread($file_name, filesize($folder_name . $image . ".desc"));
                $desc_array[$image] = $file_contents;
                fclose($file_name);
            }
        }
        return $desc_array;
    }

    function quick_gallery_run($folder_name){
        global $site_config, $site_mod_quick_gallery_site_name;
        //echo "Inside of quick_gallery_run() <br />";
        //echo "\$site_mod_quick_gallery_site_name: " . $site_mod_quick_gallery_site_name;
        if ($site_mod_quick_gallery_site_name == '') {
            $gallery_dir = "include/media/site/" . $site_config['site_name'] . "/images/" . $folder_name . "/";
        } else {
            $gallery_dir = "include/media/site/" . $site_mod_quick_gallery_site_name . "/images/" . $folder_name . "/";
        }
        $thumbs_path = $gallery_dir . "thumbs/";
        $desc_path = $gallery_dir . "desc/";
        $image_list = quick_gallery_load_dir($thumbs_path);
        $image_descriptions = get_file_descriptions($desc_path, $image_list);
        if ($image_list != false){
            include_quick_gallery_js($image_list, $image_descriptions);
        } else {
            echo "Quick-Gallery - Something went wrong.";
        }
    }

    function include_quick_gallery_js($image_list, $image_descriptions){
        global $site_mod_quick_gallery_js_path;
        $current_images = $image_list;
        $current_descriptions = $image_descriptions;
        require_once($site_mod_quick_gallery_js_path);
    }

    function quick_gallery_api_return_gallery_info(){
        global $site_config, $site_mod_quick_gallery_site_name;
        //echo "Requesting from: " . $site_mod_quick_gallery_site_name . "<br />";
        if (array_key_exists("quick-gallery-req", $_GET)){
            $value = $_GET["quick-gallery-req"];
            $gal_dir = "include/media/site/" . $site_config['site_name'] . "/images/" . $value . "/";
            //$gal_dir = "include/media/site/" . $site_mod_quick_gallery_site_name . "/images/" . $value . "/";
            $images = quick_gallery_load_dir($gal_dir . "images/");
            $thumbs = quick_gallery_load_dir($gal_dir . "thumbs/");
            $descriptions = get_file_descriptions($gal_dir . "desc/", $images);
            $new_images = [];
            foreach($images as $key => $key_value){
                array_push($new_images, $key_value);
            }
            $new_thumbs = [];
            foreach($thumbs as $key => $key_value){
                array_push($new_thumbs, $key_value);
            }
            //Expected Ouput:
            //JSON Object:
            //{
            //   "images": [],
            //   "image-desc": {},
            //}
            //
            //This function should be the end of the workflow.
            
            $images = $new_images;
            
            $return_object = array(
                "images" => $new_images,
                "thumbs" => $new_thumbs,
                "descriptions" => $descriptions
            );

            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($return_object);
         }
    }

?>