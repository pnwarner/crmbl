<?php
    header ("Content-type: text/css");
?>

.quick_gallery_display {
    height: 100%;
    width: 100%;
    display: block;
    padding: 2em;
    margin: 2em 0.5em;
}

.quick_gallery_image_display {
    display: flex;
    width: 100%;
    min-height: 300px;
    align-items: center;
    justify-content: space-around;
    text-align: center;
    margin-bottom: 1em;
    border-radius: 5px;
}

.quick_gallery_image_caption_display {
    display: flex;
    align-content: center;
    justify-content: center;
    margin-bottom: 1em;
}

.quick_gallery_nav_display {
    display: flex;
    height: inherit;
    justify-content: space-around;;
    margin-bottom: 1em;
    margin-left: 1.5em;
    margin-right: 1.5em;
}

.quick_gallery_nav_prev {
    margin-top: 0.5em;
}

.quick_gallery_nav_next {
    margin-top: 0.5em;
}

.quick_gallery_nav_count {
    justify-content: space-around;
    border-radius: 20px;
    padding: 5px;
}

.quick_gallery_nav_count p {
    padding: 5px;
    font-weight: bold;
    font-size: 0.8em;
}

.quick_gallery_thumb_container {
    display: flex;
    justify-content: center;
    align-content: center;
}

.quick_gallery_thumb_display {
    border: 5px solid #20857C;
    border-radius: 15px;
    padding: 5px;
    display: inline-flex;
    justify-content: space-around;
    min-width: 85%;
    max-width: 85%;
}

.quick_gallery_thumb {
    margin: 0 5px;
    max-width: 15%;
    height: auto;
    border-radius: 10px;
}

.quick_gallery_image {
    /*max-height: 95vh;
    max-width: 60vw;*/
    max-width: 85%;
    height auto;
}

.quick_gallery_change_image_container {
    display: flex;
    align-items: center;
    text-align: center;
    padding: 0.75em;
    height: 1.25em;
    width: 1.25em;
    border-radius: 50%;
}

.quick_gallery_prev_img_h1 {
    margin-right: 0.18em;
}

.quick_gallery_next_img_h1 {
    margin-left: 0.18em;
}

.quick_gallery_no_image_container {
    height: 1.25em;
    width: 1.25 em;
    padding: 0.75em;
}