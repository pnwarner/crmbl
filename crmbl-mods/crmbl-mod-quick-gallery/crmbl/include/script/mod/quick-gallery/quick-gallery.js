class QuickGallery {
    constructor($galleryObject) {
      self = this;
      this.folder_name = $galleryObject.folder_name;
      this.site_name = $galleryObject.site_name;
      this.max_thumbs = $galleryObject.max_thumbs;
      this.thumb_window = document.getElementById("quick-gallery-" + this.folder_name + "-thumbs")
      this.img_view_window = document.getElementById("quick-gallery-" + this.folder_name + "-image-view");
      this.img_caption_window = document.getElementById("quick-gallery-" + this.folder_name + "-image-caption");
      this.thumb_nav = document.getElementById("quick-gallery-" + this.folder_name + "-nav");
      this.thumb_nav_prev = document.getElementById("quick-gallery-" + this.folder_name + "-nav-prev");
      this.thumb_nav_count = document.getElementById("quick-gallery-" + this.folder_name + "-nav-count");
      this.thumb_nav_next = document.getElementById("quick-gallery-" + this.folder_name + "-nav-next");
      this.image_path = 'include/media/site/' + this.site_name + '/images/' + this.folder_name + '/images/';
      this.thumb_path = 'include/media/site/' + this.site_name + '/images/' + this.folder_name + '/thumbs/';
      this.first_run = true;
      this.current_page = 0;
      this.request_flag = false;
      if (typeof $galleryObject.image_array === 'undefined') {
        this.image_array = [];
        this.request_flag = true;
        this.thumb_count = 0;
        this.max_pages = 0;
      } else {
        this.image_array = $galleryObject.image_array;
      }
      if (typeof $galleryObject.image_descriptions === 'undefined') {
        this.image_descriptions = {};
        this.request_flag = true;
      } else {
        this.image_descriptions = $galleryObject.image_descriptions;
      }

      if (this.request_flag == false){
        this.thumb_count = this.image_array.length;
        this.max_pages = Math.floor(this.thumb_count / this.max_thumbs);
        if (this.thumb_count % this.max_thumbs != 0){
          this.max_pages++;
        }
      }
    }

    run_gallery = function() {
      if (this.request_flag){
        //console.log("Need to request data from backend.");
        this.request_gallery_data();
      } else {
        //console.log("Data already supplied from backend.");
        this.display_thumbs();
        if (this.first_run){
          this.first_run = false;
          this.display_image(this.image_array[0]);
        }
      }
    }

    display_thumbs = function(){
      this.thumb_window.innerHTML = '';
      let $thumb_css_class = 'class="quick_gallery_thumb"';
      for (let $i=0; $i < this.max_thumbs; $i++){
            this.current_img_pos = (this.current_page * this.max_thumbs) + $i;
            let $thumb_src = ' src="' + this.thumb_path + this.image_array[this.current_img_pos];
            let $thumb_onclick = '" onclick="self.display_image(\'' + this.image_array[this.current_img_pos] + '\')" ';
            this.thumb_window.innerHTML += '<img ' + $thumb_css_class + $thumb_src + $thumb_onclick + '/>';
            if (this.current_img_pos == this.thumb_count - 1){
                break;
            }
        }
        
      let $a = (this.max_thumbs * this.current_page) + 1;
      let $b = ($a + this.max_thumbs) - 1;
      if ($b < this.thumb_count) {
        this.thumb_nav_count.innerHTML = '<p>' + $a + ' - ' + $b + '  (' + this.thumb_count + ' images)</p>';
      } else {
        this.thumb_nav_count.innerHTML = '<p>' + $a + ' - ' + this.thumb_count + '</p>';
      }

      let $prev_flag = false;
      let $next_flag = false;
      if ((this.current_page <= this.max_pages) && (this.current_page != 0)) {
        $prev_flag = true;
      } 
      if ((this.current_page < (this.max_pages - 1)) && (this.current_page != (this.max_pages - 1))) {
            $next_flag = true;
      }
      if ($next_flag && $prev_flag){
        this.thumb_nav_prev.style["visibility"] = "visible";
        this.thumb_nav_prev.onclick= function () {self.prev_page();}
        this.thumb_nav_next.style["visibility"] = "visible";
        this.thumb_nav_next.onclick= function () {self.next_page();}
      } else if ($next_flag) {
        this.thumb_nav_next.style["visibility"] = "visible";
        this.thumb_nav_next.onclick= function () {self.next_page();}
        this.thumb_nav_prev.style["visibility"] = "hidden";
        this.thumb_nav_prev.onclick="";
      } else if ($prev_flag) {
        this.thumb_nav_prev.style["visibility"] = "visible";
        this.thumb_nav_prev.onclick= function () {self.prev_page();}
        this.thumb_nav_next.style["visibility"] = "hidden";
        this.thumb_nav_next.onclick="";
      }
    }

    display_image = function($image_name) {
      let $indexIs = this.image_array.indexOf($image_name);
      let $current_img_pos = $indexIs + 1;
      this.img_view_window.innerHTML = '';
      let $needed_page = Math.floor(($current_img_pos - 1) / this.max_thumbs);

      if ($needed_page > this.current_page) {
        this.current_page = $needed_page - 1;
        this.next_page();
      }

      if ($needed_page < this.current_page){
        this.current_page = $needed_page + 1;
        this.prev_page();
      }

      let $change_container_class = ' class="bg_color_dark_neighbor quick_gallery_change_image_container"';
      let $no_change_container = '<div class="quick_gallery_no_image_container"></div>';

      let $quick_gallery_img_class = ' class="quick_gallery_image"';
      let $quick_gallery_img_src = ' src="' + this.image_path + $image_name + '" ';

      if (($current_img_pos <= (this.thumb_count)) && ($indexIs > 0)){
        let $img_prev_onclick = ' onclick="self.display_image(\'' + this.image_array[($indexIs - 1)] + '\');"';
        let $img_prev_h1 = '<h1 class="quick_gallery_prev_img_h1"><</h1>';
        this.img_view_window.innerHTML += '<div' + $change_container_class + $img_prev_onclick +'>' + $img_prev_h1 + '</div>';
      } else {
        this.img_view_window.innerHTML += $no_change_container;
      }
      this.img_view_window.innerHTML += '<img' + $quick_gallery_img_class + $quick_gallery_img_src + '/>';
      if (($current_img_pos + 1) <= this.thumb_count){
        let $img_next_onclick = ' onclick="self.display_image(\'' + this.image_array[($indexIs + 1)] + '\');"';
        let $img_next_h1 = '<h1 class="quick_gallery_next_img_h1">></h1>';
        this.img_view_window.innerHTML += '<div' + $change_container_class + $img_next_onclick + '>' + $img_next_h1 + '</div>';
      } else {
        this.img_view_window.innerHTML += $no_change_container;
      }
      let $img_name_stripped = $image_name.split('.')[0];
      if ($img_name_stripped in this.image_descriptions){
        this.img_caption_window.innerHTML = '<p>' + this.image_descriptions[$img_name_stripped] + '</p>';
      } else {
        this.img_caption_window.innerHTML = '';
      }
      return;
    }

    next_page = function(){
      this.current_page++;
      this.display_thumbs();
      return;
    }

    prev_page = function(){
      this.current_page--;
      this.display_thumbs();
      return;
    }

    request_gallery_data = async function(){
      let rawData = await this.make_request("GET","/?quick-gallery-req=" + this.folder_name);
      //console.log(this.folder_name);
      //console.log(rawData);
      let newData = JSON.parse(rawData);
      this.image_array = newData.images;
      this.image_descriptions = newData.descriptions;
      this.thumb_count = this.image_array.length;
      this.max_pages = Math.floor(this.thumb_count / this.max_thumbs);
      if (this.thumb_count % this.max_thumbs != 0){
        this.max_pages++;
      }

      this.display_thumbs();
      if (this.first_run){
          this.first_run = false;
          this.display_image(this.image_array[0]);
      }
      return;
    }

    make_request = function(method, url){
      return new Promise(function (resolve, reject) {
        let xhr = new XMLHttpRequest();
        xhr.open(method, url);
        xhr.onload = function () {
          if (this.status >= 200 && this.status < 300) {
            resolve(xhr.response);
          } else {
            reject({
            status: this.status,
            statusText: xhr.statusText
            });
          }
        };
        xhr.onerror = function () {
          reject({
            status: this.status,
            statusText: xhr.statusText
          });
        };
        xhr.send();
      });
    }
    
  } //End QuickGallery class