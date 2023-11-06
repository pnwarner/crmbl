<?php
    //global $site_config;

    function insert_link_resource($style_array) {
        /*
	        Link Resource object = array( 
		        CSS-RESOURCE-NAME => array(
		    	    'rel' = array(), #stylesheet, icon, noopener (https://www.iana.org/assignments/link-relations/link-relations.xhtml)
		    	    'type' => '', # text/css (http://www.iana.org/assignments/media-types/media-types.xhtml)
                    'sizes' => '', #16x16
                    'target' => '', #_blank
		    	    'name' => 'style-name.css', #File Name only, no path
		    	    'path-type' => 'media', |or| 'script' |or| 'style',
                    'media-path-type' => '', #'mod', 'site', 'template',
                    'path-name' => '', #$SITE_NAME, $TEMPLATE_NAME, $MOD_NAME
                    'media-path' => '', #"/include/media/" <media-path-type>/<path-name>/[media/path/]
		    	    'url' => 'https://path.to.ext/url/style.css', #URL Path including file name
		    	    'media' => '', #Printing, Aural, Braille, Handheld, Projection, Teleprinter, TV, All, Paper Embossing, Computer Monitor
		    	    'version' => '1.0' #Version can be left as 1 to keep stored as CACHE as long as possible, Version can also be a hash of the file, which would force the browser to re-request on any file change.
                ),
                Next-resource => array( 
                    ... 
                ),
	        )

            $main-template-css = array(
                'rel' => ["stylesheet"],
                'type' => 'text/css',
                'sizes' => '',
                'target' => '',
                'name' => 'main.css.php',
                'path-type' => 'style',
                'media-path-type' => 'template',
                'path-name' => 'paradoxresearch',
                'media-path' => '',
                'url' => '',
                'media' => '',
                'version' => '1.0'
            )

            $example-favicon = array(
                'rel' => ["icon", "noopener"],
                'type' => 'image/png',
                'sizes' => '24x24',
                'target' => '_blank',
                'name' => 'favicon-24x24.png',
                'path-type' => 'media',
                'media-path-type' => 'site',
                'path-name' => 'paradoxresearch',
                'media-path' => 'favicon',
                'url' => '',
                'media' => '',
                'version' => ''
            )

            $example-apple-touch-icon = array(
                'rel' => ["apple-touch-icon", "noopener"],
                'type' => '',
                'sizes' => '180x180',
                'target' => '_blank',
                'name' => 'favicon-180x180.png',
                'path-type' => 'media',
                'media-path-type' => 'site',
                'path-name' => 'paradoxresearch',
                'media-path' => 'favicon',
                'url' => '',
                'media' => '',
                'version' => ''
            )
	    */

        echo '<link';
        foreach ($style_array['rel'] as $rel_value) {
            echo ' rel="' . $rel_value . '"';
        }
        if($style_array['media'] != '') {
            echo ' media="' . $style_array['media'] . '"';
        }
        if($style_array['type'] != ''){
            echo ' type="' . $style_array['type'] . '"';
        }
        if($style_array['target'] != '') {
            echo ' target="' . $style_array['target'] . '"';
        }
        if($style_array['sizes'] != '') {
            echo ' sizes="' . $style_array['sizes'] . '"';
        }
        echo ' href="';
        if(($style_array['path-type'] != '') && ($style_array['name'] != '') && ($style_array['path-name'] != '') && ($style_array['media-path-type'] != '')) {
            echo '/include/';
            echo $style_array['path-type'] . '/' . $style_array['media-path-type'] . '/' . $style_array['path-name'] . '/';
            if($style_array['media-path'] != '') {
                echo $style_array['media-path'] . '/' . $style_array['name'];
            } else {
                echo $style_array['name'];
            }
        }
        if($style_array['url'] != '') {
            echo $style_array['url'];
        }
        if($style_array['version'] != '') {
            echo '?v=' . $style_array['version'];
        }
        echo '">' . "\n";
    }
    
    function insert_script_resource($script_array){	
        /*
            JS Resource object = array(
                JS-OBJECT-NAME => array(
                    'type' = 'text/javascript',
                    'name' => 'js-name.js',
                    'path-type' => '', #media, script, style
                    'media-path-type' => '', #mod, site, template
                    'path-name' => '', #SITE_NAME, $TEMPLATE_NAME, $MODULE_NAME
                    'media-path' => '', #/include/$path-type/$media-path-type/$path-name/(OPT)$media-path/$name
                    'url' => 'https://path.to.ext/url/script.js',
                    'attr' => array(
                        'attr-name-1' => 'attr-name-1 value',
                        'attr-name-2' => 'attr-name-2 value'
                    ),
                    'version' => ''
                )
            )

            'main' => array(
		    	'type' => 'text/javascript',
			    'name' => 'main.js',
			    'path-type' => 'script',
			    'media-path-type' => 'template',
			    'path-name' => 'default',
			    'media-path' => '',
			    'url' => '',
			    'attr' => array(),
			    'version' => ''
		    )
        */

		echo '<script';
		if($script_array['type'] != '') {
			echo ' type="' . $script_array['type'] . '"';
		}
		echo ' src="';
		if (($script_array['name'] != '') && ($script_array['path-type'] != '') && ($script_array['media-path-type'] != '') && ($script_array['path-name'] != '')) {
			echo '/include/' . $script_array['path-type'] . '/' . $script_array['media-path-type'] . '/' . $script_array['path-name'] . '/';
			if($script_array['media-path'] != '') {
				echo $script_array['media-path'] . '/';
			}
			echo $script_array['name'];
			if($script_array['version'] != '') {
				echo '?v=' . $script_array['version'];
			}
		} else {
			echo $script_array['url'];
		}
		echo '"';
		foreach ($script_array['attr'] as $key => $value) {
			echo ' ' . $key . '="' . $value . '"';
		}
		echo '></script>' . "\n";
	}

?>