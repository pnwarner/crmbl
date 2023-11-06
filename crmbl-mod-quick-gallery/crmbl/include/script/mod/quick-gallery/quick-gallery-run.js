const galleryObject = {
    max_thumbs: 5,
    site_name: document.currentScript.getAttribute('site-name'),
    folder_name: document.currentScript.getAttribute('folder-name')
};
const new_gallery = new QuickGallery(galleryObject);
new_gallery.run_gallery();
