<!-- Project title / top -->
<h1 align="center" id="crmbl-cms">crmbl</h1>

<!--Table of contents -->
### Table Of Contents
<details>
    <summary><b>Expand</b></summary>
    <blockquote>
    <ol>
        <li>
            <a href="#what-is-crmbl">Introduction</a>
            <div>What is crmbl?</div>
            <div>Workflow:</div>
            <ul>
                <li><a href="#project-structure">Project Structure</a></li>
            </ul>
        </li>
        <li>
            <a href="#project-contents">Project Contents</a>
            <details>
                <summary>Subtrees</summary>
                <ul>
                    <li>
                        <a href="#crmbl-engine">Engine</a>
                        <details>
                            <summary>crmbl-engine</summary>
                            <ul>
                                <li>
                                    <a href="#crmbl-engine-structure">crmbl-engine Structure</a>
                                </li>
                                <li>
                                    <a href="https://github.com/pnwarner/crmbl-engine">crmbl-engine Repository</a>
                                </li>
                            </ul>
                        </details>
                    </li>
                    <li>
                        <a href="#crmbl-sites">Sites</a>
                        <details>
                            <summary>crmbl-sites</summary>
                            <ul>
                                <li>
                                    <a href="#crmbl-sites-structure">crmbl-sites Structure</a>
                                </li>
                                <li>
                                    <a href="https://github.com/pnwarner/crmbl-sites">crmbl-sites Repository</a>
                                    <details>
                                        <summary>Sites</summary>
                                        <ul>
                                            <li>
                                                <a href="#default-site">Default</a>
                                            </li>
                                        </ul>
                                    </details>
                                </li>
                            </ul>
                        </details>
                    </li>
                    <li>
                        <a href="#crmbl-mods">Modules</a>
                        <details>
                            <summary>crmbl-mods</summary>
                            <ul>
                                <li>
                                    <a href="#crmbl-mods-structure">crmbl-mods Structure</a>
                                </li>
                                <li>
                                    <a href="https://github.com/pnwarner/crmbl-mods">crmbl-mods Repository</a>
                                    <details>
                                        <summary>Modules</summary>
                                        <ul>
                                            <li>
                                                <a href="#client-info">client-info</a>
                                            </li>
                                            <li>
                                                <a href="#quick-gallery">quick-gallery</a>
                                            </li>
                                        </ul>
                                    </details>
                                </li>
                            </ul>
                        </details>
                    </li>
                    <li>
                        <a href="#crmbl-templates">Templates</a>
                        <details>
                            <summary>crmbl-templates</summary>
                            <ul>
                                <li>
                                    <a href="#template-sections">crmbl-templates Structure</a>
                                    <details>
                                        <summary>Sections</summary>
                                        <ul>
                                            <li>
                                                <a href="#declaration">Declaration</a>
                                            </li>
                                            <li>
                                                <a href="#html---language">HTML - Language</a>
                                            </li>
                                            <li>
                                                <a href="#head">Head</a>
                                            </li>
                                            <li>
                                                <a href="#meta">Meta</a>
                                            </li>
                                            <li>
                                                <a href="#link">Link</a>
                                            </li>
                                            <li>
                                                <a href="#body">Body</a>
                                            </li>
                                            <li>
                                                <a href="#script">Script</a>
                                            </li>
                                            <li>
                                                <a href="#stylesheets">Stylesheets</a>
                                            </li>
                                            <li>
                                                <a href="#scripts">Scripts</a>
                                            </li>
                                        </ul>
                                    </details>
                                </li>
                                <li>
                                    <a href="https://github.com/pnwarner/crmbl-templates">crmbl-templates Repository</a>
                                    <details>
                                        <summary>Templates</summary>
                                        <ul>
                                            <li>
                                                <a href="#default-template">Default</a>
                                            </li>
                                        </ul>
                                    </details>
                                </li>
                            </ul>
                        </details>
                    </li>
                    <li>
                        <a href="#crmbl-utils">Utilities</a>
                    </li>
                </ul>
            </details>
        </li>
        <li>
            <a href="#deploying-a-crmbl-site">Installation and deployment</a>
                <details>
                    <summary>Installation</summary>
                        <ul>
                            <li>
                                <a href="#requirements">Requirements</a>
                            </li>
                            <li>
                                <a href="#web-server-setup">Web server setup</a>
                            </li>
                        </ul>
                </details>
                <details>
                    <summary>Content Management</summary>
                    <ul>
                        <li>
                            <a href="#create-a-new-site">Create a new site</a>
                        </li>
                        <li>
                            <a href="#add-new-site-content">Add new site content</a>
                        </li>
                    </ul>
                </details>
        </li>
        <li>
            <a href="#roadmap">Roadmap</a>
        </li>
        <li>
            <a href="#contribute">Contribute</a>
        </li>
        <li>
            <a href="#license">License</a>
        </li>
        <li>
            <a href="#contact">Contact</a>
        </li>
    </ol>
    </blockquote>
</details>

---

## What is crmbl?
>***This project is still in early development stages.*** _crmbl is not intended to be hosted on servers or networks containing sensitive content._

**crmbl** is a _[content management system][wiki-cms]_ written primarily in [PHP][php-link]. It is currently being developed as an educational study, and practice for writing: clean, scalable, dynamic, and modular software architectures.

The overall goal for this project will be to deploy a web server capable of hosting:
* Static and dynamic web content held to a standard of [accessible publishing][wiki-accessible-publishing]. **Any data that is available to all, should be accessible by all.** _All modules developed for this project should output with clean semantic tags, and work with browsers that do not support javascript._
  
**A current demonstration of this project, and respective hosted sites can be found at [paradoxresearch.net](http://www.paradoxresearch.net/).**


<p align="right"> ( <a href="#crmbl-cms">back to top</a> ) </p>

## Project Structure
Without taking media folders into account, crmbl is currently structured into four sections: 
* [Engine](#crmbl-engine)  
    The engine contains the main project workflow, and combines the sites, modules, and templates together to create the desired output.
* [Sites](#crmbl-sites)  
    Sites defines each individual sites Host name, desired port, site configurations, and instructions for handling incoming HTTP requests.
* [Modules](#crmbl-mods)  
    Modules are additional instruction sets that are kept seperate from the site engine.  Modules are the bulk of the site code, but by design should be kept seperate from one another.
* [Templates](#crmbl-templates)  
    Templates can be created, mixed, and reused between different maintained sites.  Templates control the look, and HTML structure of the site output.
* [Utilities](#crmbl-utils)   
  Utilities for an admin / developer to manage content outside of the browser / PHP.

<!-- Directory listing of complete default project -->
**Example of a newly assembled crmbl environment:**
> Note: This structure currently does not contain the directory: ***crmbl/include/media/mod*** and ***crmbl/include/media/site*** 

<details>
    <summary>Show structure example</summary>
    <p>
    <pre>
crmbl
├── data
│   ├── config
│   │   ├── host
│   │   │   └── default.php
│   │   └── site
│   │       └── default
│   │           ├── _define
│   │           │   └── _define.php
│   │           ├── _request
│   │           │   ├── _process_get_request.php
│   │           │   └── _process_post_request.php
│   │           └── site_content
│   │               ├── gallery
│   │               │   └── _gallery.php
│   │               └── landing
│   │                   └── _landing.php
│   └── source
│       ├── mod
│       │   ├── client-info
│       │   │   └── source
│       │   │       ├── js
│       │   │       │   └── client-info.js.php
│       │   │       └── php
│       │   │           ├── define
│       │   │           │   └── _define_client-info.php
│       │   │           ├── display
│       │   │           │   └── _display_client-info.php
│       │   │           ├── request
│       │   │           │   └── _request_get_client-info.php
│       │   │           └── run
│       │   │               └── client-info.php
│       │   └── quick-gallery
│       │       └── source
│       │           ├── js
│       │           │   └── quick-gallery.js.php
│       │           └── php
│       │               ├── define
│       │               │   └── _define_quick-gallery.php
│       │               ├── display
│       │               │   └── _display_quick-gallery.php
│       │               ├── request
│       │               │   └── _request_get_quick-gallery.php
│       │               └── run
│       │                   └── quick-gallery.php
│       └── site
│           └── php
│               ├── define
│               │   └── _define.php
│               ├── display
│               │   └── _site_output.php
│               ├── init
│               │   ├── config
│               │   │   ├── _config.php
│               │   │   └── _mod_config.php
│               │   ├── _init.php
│               │   ├── io
│               │   │   └── _file_IO.php
│               │   └── log
│               │       └── _verbose_mode.php
│               ├── _preloader.php
│               └── request
│                   ├── _process_get_request.php
│                   ├── _process_host_request.php
│                   └── _process_post_request.php
├── include
│   ├── script
│   │   ├── mod
│   │   │   └── quick-gallery
│   │   │       └── quick-gallery.js
│   │   └── site
│   │       └── default
│   │           └── js
│   │               └── main.js
│   └── style
│       ├── mod
│       │   └── quick-gallery
│       │       └── quick-gallery.css.php
│       └── site
│           └── default
│               └── main.css.php
├── index.php
└── template
    ├── body
    │   ├── default
    │   │   └── body.php
    ├── declaration
    │   └── default
    │       └── declaration.php
    ├── head
    │   └── default
    │       └── head.php
    ├── html
    │   └── default
    │       └── en
    │           └── html.php
    ├── link
    │   └── default
    │       └── link.php
    ├── meta
    │   └── default
    │       └── meta.php
    └── script
        └── default
            └── script.php
    </pre>
    </p>
</details>
<!--
## Project Workflow
Here is a simple flow chart:
-->
<!--```mermaid
graph TD;
    A-|->B;
    A-|->C;
    B-|->D;
    C-|->D;
```
-->
<p align="right"> ( <a href="#crmbl-cms">back to top</a> ) </p>

## Project Contents
### CRMBL-ENGINE
* [Repository][crmbl-engine]

The **engine** acts as the wrapper from the whole project, and combines all the neccessary sections of the site (*[sites](#crmbl-sites), [modules](#crmbl-mods), [templates](#crmbl-templates)*) to match the incoming HTTP requests.  

The site `/index.php` will include the **preloader**.  The preloader then **initiates**: site **logging**, **file io**, and **defines** a template of all the values to display a site. Next, the server will determine if the incoming **hostname** belongs to any of the [site configurations](#sites) hosted on the server, along with port numbers if defined.  
> ```www.hostname.com/``` **or** ```www.hostname.com:8080/```

If the **host** and *optional* **port** are matched to a [site configuration](#sites), a ```GLOBAL``` Array named ```$site_configuration``` will be populated with all the basic information for displaying a dynamic site. This will include which [modules](#modules) are to be loaded, and which [template](#templates) paths to display content with *if applicable*.

> *Site configurations, and individual requests can mix and match different templates for the following sections:*    
**Declaration  
Language  
HTML  
Head  
Meta  
Link  
Body  
Script**

The incoming **request** from the **client** is then compared to any defined **requests** to be processed by the **site**, or any **modules** enabled within the site configuation. The server will then use the defined **template** paths to display the content requested by the client.

#### Webpage Response:

> **Incoming server request:**  
```www.yoursite.com/?blog```  
**Host:**  
```www.yoursite.com```  
**Request:**  
```?blog```  
**Points to:**  
```index.php/?blog```  
**Matches request:**  
```blog```  
**Response:**  
```HTML Document```
#### API Response:
> **Incoming server request:**  
```www.yoursite.com/?quick_gallery=demo-gallery```  
**Host:**  
```www.yoursite.com```  
**Request:**  
```?quick_gallery=demo-gallery```  
**Points to:**  
```index.php/?quick_gallery=demo-gallery```  
**Matches request:**  
```quick_gallery```  
**Processes value:**  
```demo-gallery```  
**Response:**  
```JSON Object```  
*Site output and templates are not loaded.*
#### CRMBL-ENGINE Structure:
<details>
    <summary><b>Engine workflow</b></summary>
    <blockquote>
    <ul>
        <li> <!-- Index-->
            Index.php
            <ul>
                <li> <!-- Preloader -->
                    Preloader
                    <ul>
                        <li> <!-- Init -->
                            Init
                                <ul>
                                    <li>
                                        _config.php ->
                                        <ul>
                                            <li>
                                                Logging wrapper -> _verbose_mode.php
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        _file_IO.php ->
                                        <ul>
                                            <li>
                                                File read/write wrapper
                                            </li>
                                            <li>
                                                SQL db Wrapper (Not yet implemented)
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        _define.php ->
                                        <ul>
                                            <li>
                                                Initiates <b>$site_configuration</b> template
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        _process_host_request.php ->
                                        <ul>
                                            <li>
                                                Sets <b>$site_configuration</b> values <b>(<i><a href="#crmbl-sites">SITES</a></i>)</b>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        _mod_config.php ->
                                        <ul>
                                            <li>
                                                Load required modules defined in <b>$site_configuration</b> <b>(<i><a href="#crmbl-mods">MODULES</a></i>)</b>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        _process_get_request.php -> <b>(<i><a href="#crmbl-sites">SITES</a>, <a href="#crmbl-mods">MODULES</a></i>)</b> <br />
                                        <b>(will be _process_requests.php when POST is added.)</b>
                                        <ul>
                                            <li>
                                                <b>$site_config['site_display_page']</b> is set to <b>true</b> if the request is determined to output a webpage. <b>API's</b> will set <i>site_display_page</i> to <b>false</b> and just return an expected value.
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <b>IF</b> <i>site_display_page</i> is <b>true</b> -> include: _site_output.php ->
                                        <ul>
                                            <li>
                                                <b>Else</b> No site output is required, end of workflow has been reached. Done.
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        site output -> <b>(<i><a href="#crmbl-templates">TEMPLATES</a>, <a href="#crmbl-sites">SITES</a>, <a href="#crmbl-mods">MODULES</a></i>)</b>
                                        <ul>
                                            <li>
                                                [Site Template] _declaration.php ->
                                            </li>
                                            <li>
                                                [Site Template]/[LANGUAGE]/ _html.php ->
                                            </li>
                                            <li>
                                                [Site Template] _head.php ->
                                            </li>
                                            <li>
                                                [Site Template] _meta.php ->
                                            </li>
                                            <li>
                                                [Site Template] _link.php ->
                                            </li>
                                            <li>
                                                [Site Template] _body.php ->
                                            </li>
                                            <li>
                                                [Site Template] _script.php ->
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
        <li>
            <b>
            Return webpage or API response back to client.
            </b>
        </li>
    </ul>
    </blockquote>
</details>

<details>
    <summary><b>CRMBL-ENGINE file structure</b></summary>
    <p>
        <pre>
crmbl
├── data
│   └── source
│       └── site
│           └── php
│               ├── define
│               │   └── _define.php
│               ├── display
│               │   └── _site_output.php
│               ├── init
│               │   ├── config
│               │   │   ├── _config.php
│               │   │   └── _mod_config.php
│               │   ├── _init.php
│               │   ├── io
│               │   │   └── _file_IO.php
│               │   └── log
│               │       └── _verbose_mode.php
│               ├── _preloader.php
│               └── request
│                   ├── _process_get_request.php
│                   ├── _process_host_request.php
│                   └── _process_post_request.php
└── index.php
        </pre>
    </p>
</details>

<!--- Engine workflo in md
**Order of engine workflow:**  
*HTTP Request -> Server -> DocumentRoot/crmbl:* 
* index.php -> include _preloader.php ->
  * preloader -> include _init.php ->
    * init -> include:  
      * _config.php ->  
         *  Logging wrapper -> _verbose_mode.php
      * _file_IO.php ->  
        * File read/write wrapper
        * *SQL db wrapper (**Not Implemented**)*
      * _define.php ->
        * INITIATES **$site_configuration** template
      * _process_host_request.php ->
        * SETS **$site_configuration** values **(***[[SITES]](#crmbl-sites)***)**
      * _mod_config.php ->  
        * Load required modules defined in **$site_configuration** **(***[[MODULES]](#crmbl-mods)***)**
      * _process_get_request.php **(***[[SITES]](#crmbl-sites),[[MODULES]](#crmbl-mods)***)**  
  **(*will be _process_requests.php when POST is added.*)**
        * **$site_config['site_display_page']** is set to **true** if the request is determined to output a site. **API**'s set site_display_page to **false** and just return an expected value.
      * **IF** *site_display_page* is **true** -> include: _site_output.php -> 
        * **Else** No site output is required, end of workflow has been reached. Done.
    * site output -> **(***[[TEMPLATES]](#crmbl-templates),[[SITES]](#crmbl-sites),[[MODULES]](#crmbl-mods)***)**  
      * [Site Template] _declaration.php ->
      * [Site Template]/[LANGUAGE]/ _html.php ->
      * [Site Template] _head.php ->
      * [Site Template] _meta.php ->
      * [Site Template] _link.php ->
      * [Site Template] _body.php ->
      * [Site Template] _script.php ->
    * Return output to client.
--->
---

<p align="right">[<a href="#project-structure">Project</a>] ( <a href="#crmbl-cms">back to top</a> ) </p>

### CRMBL-SITES
* [Repository][crmbl-sites]

Each individual website hosted with crmbl require a **Host** file, **Define** file, **Request** file(s), and **site content** to display. Each site hosted by crmbl will have these files individually:

#### Host
A Host file (located in data/config/host) that can be uniquely named to identify your site. The host file contains the web address(required), port(optional), and location of the website data, and content.

<!--
<details>
<summary><b>Example host file</b></summary>
<pre>
<code>
$host_match = "www.defaultsite.com";
$port_match = '';
require_once('data/config/site/default/_define/_define.php');
if ($host_string == $host_match){
    if ($port_match != '') {
        if ($host_port == $port_match) {
            //set site only if custom port number is matched.
            $process_host_found = true;
            set_site_values($custom_site_values);
        }
    } else {
        $process_host_found = true;
        set_site_values($custom_site_values);
    }
}
</code>
</pre>
</details>
-->


<sub>Host file example:</sub>

```php
$host_match = "www.defaultsite.com";
$port_match = '';
require_once('data/config/site/default/_define/_define.php');
if ($host_string == $host_match){
    if ($port_match != '') {
        if ($host_port == $port_match) {
            //set site only if custom port number is matched.
            $process_host_found = true;
            set_site_values($custom_site_values);
        }
    } else {
        $process_host_found = true;
        set_site_values($custom_site_values);
    }
}
```

#### Define
A define file consists of details about the site that will be applied to the **$site_configuration** ```Array```. Define files contain unique site metadata, organization/company information, and site templates.

<details>
<summary><b>Example define file contents:</b></summary>
<pre>
<code>
'site_name' => 'default',
'site_theme' => 'default',
'mods_enabled' => ["client-info", "quick-gallery"],
'site_address' => 'http://www.defaultsite.com/',
'site_email' => 'admin@defaultsite.com',
'company_phone_number' => '123-456-7890',
'company_info' => array(
    'company_name' => 'crmbl CMS',
    'site_address' => 'http://www.defaultsite.com/',
    'site_title' => 'Default crmbl CMS Site',
    'site_email' => 'admin@defaultsite.com',
    'street_addr_num' => '123',
    'street_name' => 'Streetname Ave',
    'po_box_num' => '',
    'suite_num' => '',
    'apt_num' => '',
    'city' => 'Las Vegas',
    'state' => 'NV',
    'zipcode' => '89777',
    'country' => 'USA',
    'phone_num' => '123-456-7890'
    ),
//Templates: (if left blank, will default to site_theme value)
'site_lang' => 'en',
'theme_declaration' => '',
'theme_html' => '',
'theme_head' => '',
'theme_meta' => '',
'theme_link' => '',
'theme_body' => '',
'theme_script' => '',
'theme_link_stylesheet' => 'main.css.php',
//Meta data:
'default_site_title' => 'crmbl CMS site',
'meta_charset' => 'UTF-8',
'meta_name_viewport_content' => 'width=device-width, initial-scale=1.0',
'meta_name_description_content' => 'crmbl CMS default template',
'meta_name_author_content' => 'defaultsite.com',
'meta_property_og_title_content' => 'crmbl CMS',
'meta_property_og_type_content' => 'website',
'meta_property_og_url_content' => 'defaultsite.com',
'meta_property_og_description_content' => 'crmbl CMS default page',
'meta_property_og_image_content' => '/include/media/site/default/images/Logo.png'
</code>
</pre>
</details>

#### Requests

All sites are directed through the root ```index.php``` file. Because of this, each site will be required to handle its own requests for navigation, and data handling without the use of additional html files.

Instead of linking a blog page for a site as:  
```http://www.defaultsite.com/blog```  
Which would most likely point a webserver to:  
```http://www.defaultsite.com/blog/index.html```  
crmbl will link to the blog page as:  
```http://www.defaultsite.com/?blog```  
Which points the server to:  
```http://www.defaultsite.com/index.php?blog```
> This will allow the server to host multiple domains under the same root directory, and keep content dynamic without having to make continous changes to the site structure.

<sub>Example navigation request</sub>
```php
if ($_SERVER['QUERY_STRING'] == "blog"){
    $site_query_value_found = true;
    $site_config['site_content_request'] = "blog";
}
```

This request condtion for the ```default``` site would be located in:  
```data/config/site/default/_request/_process_get_request.php```  
and direct the engine to load the content of:  
```data/config/site/default/site_content/blog/blog.php```  
into the **body** of the webpage response.

#### CRMBL-SITES Structure
<details>
    <summary><b>CRMBL-SITES file structure</b></summary>
    <p>
        <pre>
crmbl
└── data
    └── config
        ├── host
        │   └── [SITE NAME].php
        └── site
            └── [SITE NAME]
                ├── _define
                │   └── _define.php
                ├── _request
                │   ├── _process_get_request.php
                │   └── _process_post_request.php
                └── site_content
        </pre>
    </p>
</details>

<h3 align="center" id="sites">Sites</h3>

---

#### Default site
* [Repository][crmbl-site-default]

This template is a general example of crmbl output, and the first to be displayed after initial deployment.

<details>
    <summary>crmbl-site-default file structure</summary>
    <p>
        <pre>
crmbl
└── data
    └── config
    ├── host
    │   └── default.php
    └── site
        └── default
            ├── _define
            │   └── _define.php
            ├── _request
            │   ├── _process_get_request.php
            │   └── _process_post_request.php
            └── site_content
                ├── gallery
                │   └── _gallery.php
                └── landing
                    └── _landing.php
        </pre>
    </p>
</details>

---

<p align="right">[<a href="#project-structure">Project</a>] [<a href="#crmbl-engine">Engine</a>] ( <a href="#crmbl-cms">back to top</a> ) </p>

### CRMBL-MODS
* [Repository][crmbl-mods]

Modules are any extended addtional features to the CMS that are independent of the site engine itself, and can be shared with all the hosted sites. Modules may handle [DOM](https://en.wikipedia.org/wiki/Document_Object_Model) output, [HTTP request](https://en.wikipedia.org/wiki/HTTP) responses, or just backend functions.

Sites must declare which modules are enabled in their respective _define.php file, and modules themselves may declare other modules that are required to to be loaded for functionality.

#### CRMBL-MODS Structure
<details>
    <summary><b>CRMBL-MODS file structure</b></summary>
    <p>
        <pre>
        <code>
crmbl
├── data
│   └── source
│       └── mod
│           └── [MODULE NAME]
│               └── source
│                   ├── js
│                   │   └── [MODULE NAME].js.php
│                   └── php
│                       ├── define
│                       │   └── _define_[MODULE NAME].php
│                       ├── display
│                       │   └── _display_[MODULE NAME].php
│                       ├── request
│                       │   └── _request_get_[MODULE NAME].php
│                       └── run
│                           └── [MODULE NAME].php
└── include
    ├── script
    │   └── mod
    │       └── [MODULE NAME]
    │           └── [MODULE NAME].js
    └── style
        └── mod
            └── [MODULE NAME]
                └── [MODULE NAME].css.php
        </code>
        </pre>
    </p>
</details>


<h3 align="center" id="modules">Modules</h3>

---

#### client-info
* [Repository][crmbl-mod-client-info]

> *This module is still in development, but necessary to to the project. These files are just acting as a placeholder for the present moment*

The client-info module is being developed to relay specifically how any site information requested should be presented back to the client.  Every request should check to see if javascript if enabled, and if not, switch to a ```<noscript> ... </noscript>``` environment, to keep screen readers and text browsers in mind.

<details>
    <summary>crmbl-mod-client-info file structure</summary>
    <p>
        <pre>
        <code>
crmbl
└── data
    └── source
        └── mod
            └── client-info
                └── source
                    ├── js
                    │   └── client-info.js.php
                    └── php
                        ├── define
                        │   └── _define_client-info.php
                        ├── display
                        │   └── _display_client-info.php
                        ├── request
                        │   └── _request_get_client-info.php
                        └── run
                            └── client-info.php
        </code>
        </pre>
    </p>
</details>

---

#### quick-gallery
* [Repository][crmbl-mod-quick-gallery]

> This module is still in development

The quick-gallery module was the first module developed for the CMS. It was built as a demonstration for a module that can interact with the client [DOM](https://en.wikipedia.org/wiki/Document_Object_Model), and handle requests as a [restful](https://en.wikipedia.org/wiki/Representational_state_transfer) [API](https://en.wikipedia.org/wiki/API) itself.

**quick-gallery** requires a site to have a gallery sub-directory inside of the site's **include/media/site/[SITE NAME]/images/** directory.

**Inside a gallery directory there are three sub-directories:**
* **images/** - Contains the actual images to be displayed. *Ex: 001.jpeg*  
* **thumbs/** - Contains thumbnails of the images to be displayed. Will have the same file name as the image itself. *Ex: 001.jpeg*  
* **desc/** - (Optional) A filename that matches an image name, and contains a description of the image, but has .desc file extension. *Ex: 001.desc*

When the module is inserted into a site page, and pointed to a gallery directory:  
* The module inserts all of the required elements into the site page at load time, along with stylesheets, and javascript.
* After the page loads, the module javascript calls its restful API with the foldername as the value.  The quick-gallery api returns a json object with a list of images, thumbs, and descriptions.

<sub>HTTP Request from client/module:</sub>
```
http://www.yoursite.com/?quick-gallery-req=demo-gallery
```
<sub>JSON Response from crmbl site/module:
```
{
    "images":["001.jpg","002.jpg"],
    "thumbs":["001.jpg","002.jpg"],
    "descriptions":["001", "002"]
}
```
* The script then displays the images and thumbnails for the user to browse and view.

**Inserting a browsable gallery into a crmbl site page**:
> Assume site **'default'** has a folder setup to be a gallery:  
***include/media/site/default/images/demo-gallery***  

1. Enable quick-gallery module:  

<sub>data/config/site/[YOUR SITE]/_define/_define.php</sub>
```php
    //add quick-gallery to mods-enabled list:
    "mods_enabled" => ["quick-gallery", ... ],
```

2. Add the gallery somewhere into your page content:

<sub>data/config/site/[YOUR SITE]/site_content/[PAGE]/[PAGE].php</sub>
```php
<?php
    quick_gallery_insert_gallery("demo-gallery");
?>
```

##### In progress:
- [ ] ```<noscript>``` detection and functionality in coordination with the **client-info** module.
- [ ] GET Request scheme to compliment ```<noscript>``` functionality. Such as ```site.com/?quick-gallery-img=001&quick-gallery-thumb=1```

<details>
    <summary>crmbl-mod-quick-gallery file structure</summary>
    <p>
        <pre>
        <code>
crmbl
├── data
│   └── source
│       └── mod
│           └── quick-gallery
│               └── source
│                   ├── js
│                   │   └── quick-gallery.js.php
│                   └── php
│                       ├── define
│                       │   └── _define_quick-gallery.php
│                       ├── display
│                       │   └── _display_quick-gallery.php
│                       ├── request
│                       │   └── _request_get_quick-gallery.php
│                       └── run
│                           └── quick-gallery.php
└── include
    ├── script
    │   └── mod
    │       └── quick-gallery
    │           └── quick-gallery.js
    └── style
        └── mod
            └── quick-gallery
                └── quick-gallery.css.php
        </code>
        </pre>
    </p>
</details>

---

<p align="right">[<a href="#project-structure">Project</a>] [<a href="#crmbl-engine">Engine</a>] ( <a href="#crmbl-cms">back to top</a> ) </p>

### CRMBL-TEMPLATES
* [Repository][crmbl-templates]

Templates have dynamic structures and styles that define how a site will look when returned to the client. A template can be shared between different sites in crmbl, and a site can use a different mixture of template sections to create unique outputs.

A template can consist of any the following sections, but is not required to have all of them:

#### Template Sections

* [Declaration](#declaration)
* [HTML - Language](#html---language)
* [Head](#head)
* [Meta](#meta)
* [Link](#link)
* [Body](#body)
* [Script](#script)
* [Stylesheets](#stylesheets)
* [Scripts](#scripts)

##### Declaration 
* */template/declaration/[TEMPLATE NAME]/declaration.php* 
```php
!doctype html

<?php
    require_once($site_config['site_html_path']);
?>
```

<p align="right"><a href="#template-sections">[Template sections]</a></p>

##### HTML - Language
* */template/html/[TEMPLATE NAME]/[LANGUAGE]/html.php*
```php
<html lang="[LANGUAGE]">

    <?php
        require_once($site_config['site_head_path']);
        require_once($site_config['site_body_path']);
    ?>

</html>
```
<p align="right"><a href="#template-sections">[Template sections]</a></p>

##### Head
* */template/head/[TEMPLATE NAME]/head.php*
```php
<head>

    <title><?=$site_config['default_site_title']?></title>

    <?php
	    require_once($site_config['site_meta_path']);
	    require_once($site_config['site_link_path']);
    ?>

</head>
```
<p align="right"><a href="#template-sections">[Template sections]</a></p>

##### Meta
* */template/meta/[TEMPLATE NAME]/meta.php*
```php
<meta charset="<?=$site_config['meta_charset']?>">
<meta name="viewport" content="<?=$site_config['meta_name_viewport_content']?>">
<meta name="description" content="<?=$site_config['meta_name_description_content']?>">
<meta name="author" content="<?=$site_config['meta_name_author_content']?>">
<meta property="og:title" content="<?=$site_config['meta_property_og_title_content']?>">
<meta property="og:type" content="<?=$site_config['meta_property_og_type_content']?>">
<meta property="og:url" content="<?=$site_config['meta_property_og_url_content']?>">
<meta property="og:description" content="<?=$site_config['meta_property_og_description_content']?>">
<meta property="og:image" content="<?=$site_config['meta_property_og_image_content']?>">
```

<p align="right"><a href="#template-sections">[Template sections]</a></p>

##### Link
* */template/link/[TEMPLATE NAME]/link.php*
```php
<link rel="icon" href="/include/media/site/<?=$site_config['site_name']?>/favicon/favicon.ico">
<link rel="icon" href="/include/media/site/<?=$site_config['site_name']?>/favicon/favicon.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="/include/media/site/<?=$site_config['site_name']?>/favicon/apple-touch-icon.png">
<link rel="stylesheet" href="/include/style/site/<?=$site_config['site_name']?>/<?=$site_config['theme_link_stylesheet']?>?v=1.0">
```

<p align="right"><a href="#template-sections">[Template sections]</a></p>

##### Body
* */template/body/[TEMPLATE NAME]/body.php*
```php
<body>
    
    <!-- Elements to lay out custom site content -->
    <header>
        <nav></nav>
        <section>
        </section>
    </header>
    <article>
    
        <?php
            //Get site name, and page request
            //Ex:
            //.../[SITENAME]/site_content/[REQUEST]/_[REQUEST].php
            //data/config/site/default/site_content/landing/_landing.php
            $site_content_string = 'data/config/site/' . $site_config['site_name'] . '/site_content/' . $site_config['site_content_request'] . '/_' . $site_config['site_content_request'] . '.php';
            //Insert requested content in body
            require_once($site_content_string);
        ?>
    
    </article>

    <?php
        require_once($site_config['site_script_path']);
    ?>

</body>

```

<p align="right"><a href="#template-sections">[Template sections]</a></p>

##### Script
* *template/script/[TEMPLATE NAME]/script.php*
```php
<script type="text/javascript" src="/include/script/site/<?=$site_config['site_name']?>/js/main.js">

</script>
```

<p align="right"><a href="#template-sections">[Template sections]</a></p>

##### Stylesheets
* *include/style/site/[TEMPLATE NAME]/main.css.php*
```php
<?php
	header("Content-type: text/css");
    //Set some custom values from server
    //$site_bgcolor = [SOME GLOBAL SESSION VARIABLE]
    $site_bgcolor = "#375b7d";
?>

:root {
    --site-bg-color: <?=$site_bgcolor?>;
}

*, *::before, *::after {
    box-sizing: inherit;
}

* {
    margin: 0;
    padding: 0;
}

html {
    box-sizing: border-box;
}

body {
    display: block;
    height: 100vh;
    width: 100%;
}
```
##### Scripts
* *include/script/site/[TEMPLATE NAME]/js/main.js*

<p align="right"><a href="#template-sections">[Template sections]</a></p>

#### CRMBL-TEMPLATES Structure: 
<details id="crmbl-templates-structure">
    <summary><b>CRMBL-TEMPLATES file structure</b></summary>
    <p>
        <pre>
crmbl
├── include
│   ├── script
│   │   └── site
│   │       └── [TEMPLATE NAME]
│   │           └── js
│   │               └── main.js
│   └── style
│       └── site
│           └── [TEMPLATE NAME]
│               └── main.css.php
└── template
    ├── body
    │   └── [TEMPLATE NAME]
    │       └── body.php
    ├── declaration
    │   └── [TEMPLATE NAME]
    │       └── declaration.php
    ├── head
    │   └── [TEMPLATE NAME]
    │       └── head.php
    ├── html
    │   └── [TEMPLATE NAME]
    │       └── [LANGUAGE]
    │           └── html.php
    ├── link
    │   └── [TEMPLATE NAME]
    │       └── link.php
    ├── meta
    │   └── [TEMPLATE NAME]
    │       └── meta.php
    └── script
        └── [TEMPLATE NAME]
            └── script.php
        </pre>
    </p>
</details>

<h3 align="center" id="templates">Templates</h3>

---

#### Default template
* [Repository][crmbl-template-default]

A basic template to demonstrate the main template sections of crmbl.

Template UI:
* Navigation Menu
* Banner
* Article / Content
* Footer

<details>
    <summary>crmbl-template-default file structure</summary>
    <p>
        <pre>
crmbl
├── include
│   ├── script
│   │   └── site
│   │       └── default
│   │           └── js
│   │               └── main.js
│   └── style
│       └── site
│           └── default
│               └── main.css.php
└── template
    ├── body
    │   └── default
    │       └── body.php
    ├── declaration
    │   └── default
    │       └── declaration.php
    ├── head
    │   └── default
    │       └── head.php
    ├── html
    │   └── default
    │       └── en
    │           └── html.php
    ├── link
    │   └── default
    │       └── link.php
    ├── meta
    │   └── default
    │       └── meta.php
    └── script
        └── default
            └── script.php
        </pre>
    </p>
</details>

---
<p align="right">[<a href="#project-structure">Project</a>] [<a href="#crmbl-engine">Engine</a>] ( <a href="#crmbl-cms">back to top</a> ) </p>


### CRMBL-UTILS

  Until the web based admin console is completed: updating and managing content is done with the aide of shell scripts, or manual file creation.  Default sites, modules, templates and be copied and edited.

#### Shell Scripts
* backup-engine.sh
* backup-mod.sh
* backup-mods.sh
* backup-site.sh
* backup-sites.sh
* backup-template.sh
* backup-templates.sh
* cli-menu.sh
* config-util.sh
* crmbl
* delete-engine.sh
* delete-mod.sh
* delete-site.sh
* delete-template.sh
* deploy-engine.sh
* deploy-mod.sh
* deploy-mods.sh
* deploy-project.sh
* deploy-site.sh
* deploy-sites.sh
* deploy-template.sh
* deploy-templates.sh
* download-repo.sh
* list-available-mods.sh
* list-available-sites.sh
* list-available-templates.sh
* list-mods.sh
* list-sites.sh
* list-templates.sh
* load-local-repo.sh
* new-install.sh
* new-site-content-landing.sh
* new-site-define.sh
* new-site-get-request.sh
* new-site-host.sh
* new-site-post-request.sh
* new-site.sh
* new-template.sh
* publish-project.sh
* pull-published-project.sh
* remove-engine.sh
* remove-mod.sh
* remove-site.sh
* remove-template.sh
* un-deploy-project-cleanup.sh
* un-deploy-project.sh
* un-publish-project.sh

---

<p align="right">[<a href="#project-structure">Project</a>] [<a href="#crmbl-engine">Engine</a>] ( <a href="#crmbl-cms">back to top</a> ) </p>

## Deploying a crmbl site
### Installation
#### Requirements
> Currently crmbl has only been tested, and deployed on [Debian](https://www.debian.org/) based [GNU/Linux](https://www.gnu.org/) [distributions](https://en.wikipedia.org/wiki/List_of_Linux_distributions) using the [Apache HTTP Server](https://httpd.apache.org/).
* A HTTP Server capable of executing PHP Scripts
#### Web server Setup
##### Debian based disitribution
> [sudo](https://www.sudo.ws/) [**root**](https://en.wikipedia.org/wiki/Superuser) privileges will most likely need to be escalated for some terminal instructions.

This project requires that you have a http server, and PHP installed.

<sub>From the computer terminal:</sub>
```bash
#Update system and install Apache HTTP Server & PHP
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install apache2 php
```

Clone the crmbl project to a area on your computer/server such as /home/user , but not to the web root.

```bash
git clone https://github.com/pnwarner/crmbl
```

Navigate to the crmbl folder, and run the './crmbl' script to display a menu to help get set up.

```bash
cd crmbl/
./crmbl
```

The project should come pre-packaged with the engine, modules, default site, and template ready to be deployed, and published.

To deploy, and check out the complete project structure without publishing to the webroot:
 * Select option 1 'Projects Menu' from the script main menu
 * Then select option 2, 'Setup crmbl install (Deploy Only)'

> '[ ] Site Deployed (!)' should now appear as '[x] Site Deployed' in the script output. You can now navigate to the 'crmbl_sites/' directory to explore, test, or make changes to the project.

Any changes to the deployed site can be backed up to their respective areas (engine, modules, sites, templates) by running the backup routines.  

> The engine, modules, sites, and templates can be loaded, backed up, deployed, removed (from the deployed site), and deleted (from the available resources) individually from their menus.

Once a site has been deployed, it can be published to the webroot using the crmbl shell script, or the 'crmbl/' folder in 'crmbl_site/' can be manually copied to the web root.

Now that the project has been assembled in the http server directory, the HTTP Server needs to be set up correctly.

> The following steps are just a basic example for setting up minimum requirements for a Apache web server.  Please note this configuration points to a webserver listening on Port 8080 for testing.

```bash
sudo touch /etc/apache2/sites-available/crmbl.conf
sudo nano /etc/apache2/sites-available/crmbl.conf
```

Add some basic configuration, and save the file `Ctrl + o` and exit `Ctrl + x`

```
<VirtualHost *:8080>
	DocumentRoot "/var/www/html/crmbl"
	ServerName localhost
	ServerAlias localhost
	ServerAdmin admin@localhost
	DirectoryIndex index.php
    <Directory /var/www/html/crmbl>
		Options -Indexes
		AllowOverride None
		Require all granted
	</Directory>
</VirtualHost>
```

Now enable the HTTP server to listen on **Port 8080** to first test the site out on.

Open the Apache2 ports.conf to edit

```bash
sudo nano /etc/apache2/ports.conf
```

Locate the line in ports.conf editor containing

```bash
Listen 8080
```

And add the following, in a new line below it

```bash
Listen 8080
```

Now, write the file and close the editor.  `Ctrl + o` and `Ctrl + x`

Enable the new site & restart the server

```bash
sudo a2ensite crmbl
sudo systemctl reload apache2
```

Now point your web browser to `l27.0.0.1:8080/` to verify if the default landing page is displayed.  If the landing page is displayed, you can move forward to creating a new site.

> This is very basic demonstration of getting the project running locally. You can add and change configuration options to meet your needs. You can also host multiple different websites under one installation in combination with a Domain Hosting Service of your choice.

### Content Manangement
#### Create a new site

After you have verified the install was a success by viewing the landing page. You're ready to add a new site.

All changes to the sites and content will happen in the project folder, and get pushed to the webroot.  This makes developing, publishing, and backing up individual sites, modules, or templates much more practical, as well as provide better organization, and structure for repositories.

The default project directory name is set to `crmbl_site/`. You can edit files in this directory, and pull the code into the appropriate project folders to save changes.  Once you are ready to re-publish to your websever, run the `Publish Site` option in the Projects menu of the crmbl shell script.

#### Add new site content

Adding a new site requires adding a new `crmbl-site` directory structure to the existing crmbl_site project.  This can be done manually, or just by running the crmbl-utils/ `new-site.sh` script.

```bash

bash ./crmbl-utils/new-site.sh

```

You will be prompted for some basic information about the site, and the new site will be created in the `crmbl_site/` directory.  To backup, and save the site for re-deployment: Navigate to the Sites menu in the crmbl shell script, and select Backup Sites.  Choose the site name that you created to back it up to your `crmbl-sites` project directory.  The site can be un-deployed, re-deployed or published after saving.


##### Create/Edit Sites and Content
 > Creating and editing content is still a manual process. An automated process for this is in the making. Please refer to the crmbl-sites section for more information about crmbl sites.

#### Back-up/Restore Sites and Content
Published sites can be pulled, and backed up into the `crbml_sites/` folder with the `crmbl` script in the project root directory.
 * Choose the `Projects Menu`
 * Select the 'Pull published site to crmbl_sites' options.
 * Navigate back to the areas of the project that you wish to backup, and choose the backup options.

 Resources that are stored in their respective areas (crmbl-engine, crmbl-mods, crmbl-sites, crmbl-templates) can be re-deployed to the `crmbl_site/` folder, and re-published to the webserver.

<p align="right"> ( <a href="#crmbl-cms">back to top</a> ) </p>


## Roadmap

- [x] Combine seperate content, modules, and templates to output website
- [x] Host multiple websites
- [ ] Complete logging structure
- [ ] Complete file input/output wrapper
- [x] Implement basic GET Request handling
- [ ] Implement basic POST request handling
- [ ] Complete client-info module for javascript environment detection
- [ ] Demonstrate a complete script/noScript module with quick-gallery 
- [ ] Implement SQL db wrapper
- [ ] Implement Admin Console
- [ ] Implement User Module
- [ ] Implement Basic article publishing module
- [ ] Implement User media uploading / storage solutions

<p align="right"> ( <a href="#crmbl-cms">back to top</a> ) </p>

## Contribute

If you would like to contribute to this project, please contact the author.

<p align="right"> ( <a href="#crmbl-cms">back to top</a> ) </p>

## License

This is still under consideration with the continuing development of the project.

<p align="right"> ( <a href="#crmbl-cms">back to top</a> ) </p>

## Contact
Patrick Warner
* [Email][author-email]
* [Social - mastodon][author-social]
* [About the author][author-site]

<p align="right"> ( <a href="#crmbl-cms">back to top</a> ) </p>


<!-- Wiki Link content-->
[wiki-cms]: https://en.wikipedia.org/wiki/Content_management_system
[wiki-accessible-publishing]: https://en.wikipedia.org/wiki/Accessible_publishing

<!-- External links -->
[php-link]: https://www.php.net/

<!-- Project links -->
[crmbl]: https://github.com/pnwarner/crmbl/
[crmbl-engine]: https://github.com/pnwarner/crmbl-engine/
[crmbl-sites]: https://github.com/pnwarner/crmbl-sites/
[crmbl-site-default]: https://github.com/pnwarner/crmbl-site-default/
[crmbl-mods]: https://github.com/pnwarner/crmbl-mods/
[crmbl-mod-client-info]: https://github.com/pnwarner/crmbl-mod-client-info/
[crmbl-mod-quick-gallery]: https://github.com/pnwarner/crmbl-mod-quick-gallery/
[crmbl-templates]: https://github.com/pnwarner/crmbl-templates/
[crmbl-template-default]: https://github.com/pnwarner/crmbl-template-default/

<!-- Author links -->
[author-site]: https://pnwarner.github.io/
[author-email]: mailto:patrick.warner@paradoxresearch.net
[author-social]: https://fosstodon.org/prdoxi
[org-site]: http://www.paradoxresearch.net/