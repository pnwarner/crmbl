<?php
	verbose_check("_file_IO.php Loaded.");
	global $site_config;
//  This file is the highest priority to complete before implementation of user system structure,
//  and fine tuning of site configuration setup.
//	Once formal file-io functions wrapper is implemented,
//  SQL db implementation needs to come in next.

//	Create file []
//	Check if file exists []
//	Check if directory exists []
//	Append to file []
//		string
//		array
//	Insert data to start of file line [] prepend_file
//		string
//		array
//	Insert data to end of file line []
//		string
//		array
//	Delete file line []
//	Move line to new line []
//	Copy line to new line []
//	Close file []
//	Read whole file []
//		string
//		atray
//	Read file line []
//		string
//		array
//	Get file line length []
//	Get file size []
//	Copy file []
//	Move file []
//	Rename file []
//	Create Directory []
//	Copy directory []
//	Move directory []
//	Rename directory []
//	Delete directory []
//	Delete file []
//	List Directory contents []
//	List Directory Tree [] * Pull all files, subdirectories, and sub files
//
function file_io_create_file($file_path){
	//Done for now
	verbose_check("_file_IO.php - file_io_create_file()");
	if (file_io_check_file_exists($file_path)) {
		verbose_check("_file_IO.php - file_io_create_file(): File already exists.");
		return false;
	} else {
		$new_file = fopen($file_path, "w");
		file_io_close_file($file_path);
		if (file_io_check_file_exists($file_path)) {
			verbose_check("_file_IO.php - file_io_create_file(): File created: " . $file_path);
			return true;
		} else {
			verbose_check("_file_IO.php - file_io_create_file(): Attempt to create file: " . $file_path . " FAILED.");
			return false;
		}
	}
}

function file_io_check_file_exists($file_path){
	//Done for now
	//return True or False
	verbose_check("_file_IO.php - file_io_check_file_exists()");
	if (file_exists($file_path)) {
		return true;
	} else {
		verbose_check("_file_IO.php - file_io_check_file_exists(): Error: [ " . $file_path . " ] Does not exist, or cannot be read.");
		return false;
	}
}

function file_io_check_directory_exists($dir_path){
	//Done for now
	verbose_check("_file_IO.php - file_io_check_directory_exists()");
	if(is_dir($dir_path)){
		return true;
	} else {
		verbose_check("_file_IO.php - file_io_check_directory_exists(): Error: [ " . $dir_path . " ] Does not exist, or cannot be read.");
		return false;
	}
}

function file_io_append_file($file_path, $data){
	//Done for now
	verbose_check("_file_IO.php - file_io_append_file()");
	if(file_io_check_file_exists($file_path)){
		if (!$append_file = fopen($file_path, "a")) {
			verbose_check("_file_IO.php - file_io_append_file(): Error: Cannot open [ " . $file_path . " ] for read/write.");
			return false;
		}
		//fwrite $data
		//Need to figure parameters for error checking data being written to file.
		if (fwrite($append_file, $data)) {
			//Data successfully written. Announce file append and close file.
			verbose_check("_file_IO.php - file_io_append_file(): Data successfully written to [ " . $file_path . " ]");
		} else {
			//File was not writeable, throw error.
			verbose_check("_file_IO.php - file_io_append_file(): Error: Data could not be written to [ " . $file_path . " ]");
			return false;
		}
		file_io_close_file($append_file);
		return true;
	} else {
		verbose_check("_file_IO.php - file_io_append_file(): Error: Data not written to [ " . $file_path . " ]");
		return false;
	}
}

function file_io_prepend_file($file_path, $data){
	//Done for now
	verbose_check("_file_IO.php - file_io_prepend_file()");
	//Code referenced from:
	//https://stackoverflow.com/questions/1760525/need-to-write-at-beginning-of-file-with-php
		if(file_io_check_file_exists($file_path)){
			//file_io_read_file_to_stream? <<
			$context = stream_context_create();
			$prepend_file = fopen($file_path, 'r', 1, $context); //Load file contents into stream '$context' instead of a variable
			// >>
			//Create temp file with system temp file
			$temp_filename = tempnam(sys_get_temp_dir(), 'php_prepend_');
			
			verbose_check("_file_IO.php - file_io_prepend_file(): Temporary file created: [ " . $temp_filename . " ]");
			
			file_put_contents($temp_filename, $data); //Add prepend data to temp file
			file_put_contents($temp_filename, $prepend_file, FILE_APPEND); //append original file to temp file
			file_io_close_file($prepend_file); //close original file
			file_io_delete_file($file_path); //delete original file
			
			verbose_check("_file_IO.php - file_io_prepend_file(): Attempting to rename [ " . $temp_filename . " ] as [ " . $file_path . " ]");
			
			rename($temp_filename, $file_path); //rename temp file to original filepath and name
			//For further error checking, get size of original file before prepending. Then estimate size of file after prepending data
			//to file.  If file size did not change, throw error.
			if(file_io_check_file_exists($file_path)){
				verbose_check("_file_IO.php - file_io_prepend_file(): File [ " . $file_path . " ] successfully prepended.");
				return true;
			} else {
				verbose_check("_file_IO.php - file_io_prepend_file(): Error: [ " . $file_path . " ] was not successfully rewritten. DATA/FILE MAY BE LOST!");
				return false;
			}
		} else {
			verbose_check("_file_IO.php - file_io_prepend_file(): Error: [ " . $file_path . " ] was NOT prepended.");
			return false;
		}
}

function file_io_append_file_line_end(){
	verbose_check("_file_IO.php - file_io_append_file_line_end()");
}

function file_io_delete_file_line(){
	verbose_check("_file_IO.php - file_io_delete_file_line()");
}

function file_io_move_file_line(){
	verbose_check("_file_IO.php - file_io_move_file_line()");
}

function file_io_copy_file_line(){
	verbose_check("_file_IO.php - file_io_copy_file_line()");
}

function file_io_close_file($file_object) {
	//Done for now
	verbose_check("_file_IO.php - file_io_close_file()");
	#Check if $file_object is an open file:
	if (!is_resource($file_object)){
		#$file_object is already CLOSED
		verbose_check("_file_IO.php - file_io_close_file(): Error: Unable to complete request to close file.");
		return false;
	} else {
		#$file_object is OPEN, okay to close.
		verbose_check("_file_IO.php - file_io_close_file(): File closed.");
		fclose($file_object);
		return true;
	}
}

function file_io_read_file() {
	verbose_check("_file_IO.php - file_io_read_file()");
}

function file_io_read_file_line() {
	verbose_check("_file_IO.php - file_io_read_file_line()");
}

function file_io_get_file_length() {
	verbose_check("_file_IO.php - file_io_get_file_length()");
}

function file_io_get_file_size() {
	verbose_check("_file_IO.php - file_io_get_file_size()");
}

function file_io_copy_file() {
	verbose_check("_file_IO.php - file_io_copy_file()");
}

function file_io_move_file() {
	verbose_check("_file_IO.php - file_io_move_file()");
}

function file_io_rename_file() {
	verbose_check("_file_IO.php - file_io_rename_file()");
}

function file_io_create_dir($dir_path, $permissions) {
	//Done for now
	verbose_check("_file_IO.php - file_io_create_dir()");
	if (file_io_check_directory_exists($dir_path)) {
		verbose_check("_file_IO.php - file_io_create_dir(): Error: Directory [ " . $dir_path . " ] already exists.");
		return false;
	} else {
		mkdir($dir_path, $permissions);
		if (file_io_check_directory_exists($dir_path)) {
			verbose_check("_file_IO.php - file_io_create_dir(): Directory [ " . $dir_path . " ] successfully created.");
			return true;
		} else {
			verbose_check("_file_IO.php - file_io_create_dir(): Error: Directory [ " . $dir_path . " ] NOT created.");
			return false;
		}
	}
}
//Cuurently finishing this function. Need file copy fn
function file_io_copy_dir($source_dir, $destination_dir) {
	verbose_check("_file_IO.php - file_io_copy_dir()");
	$path_array = explode("/", $source_dir);
	$dir_name = $path_array[(count($path_array)-1)];
	$new_dir = $destination_dir . "/" . $dir_name;
	//Need current dir permissions!
	//$dir_permissions = 
	if (($current_dir_list = file_io_list_dir($source_dir)) === false){
		verbose_check("_file_IO.php - file_io_copy_dir(): Error: Directory [ " . $source_dir . " ] could NOT be read.");
		return false;
	}
	if ((file_io_create_dir($new_dir, $dir_permissions)) === false) {
		verbose_check("_file_IO.php - file_io_copy_dir(): Error: Directory [ " . $new_dir . " ] could NOT be written.");
		return false;
	} else {
		foreach($current_dir_list as $item){
			$current_file = $source_dir . "/" . $item;
			if (is_file($current_file)) {
				//Get file permissions, and make sure new file permissions are set
				//Copy file
			} elseif (is_dir($current_file)) {
				$new_source_dir = $current_file;
				$new_destination_dir = $destination_dir . "/" . $item;
				if ((file_io_copy_dir($new_source_dir, $new_destination_dir)) === false) {
					return false;
				}
				//Copy directory
			} else {
				//Error
				return false;
			}
		}
		return true;
	}
}

function file_io_move_dir() {
	verbose_check("_file_IO.php - file_io_move_dir()");
}

function file_io_rename_dir() {
	verbose_check("_file_IO.php - file_io_rename_dir()");
}

function file_io_delete_file($file_path) {
	//Done for now
	verbose_check("_file_IO.php - file_io_delete_file()");
	if(file_io_check_file_exists($file_path)){	
		if (unlink($file_path)) {
			verbose_check("_file_IO.php - file_io_delete_file(): [ " . $file_path . " ] successfully deleted.");
			return true;
		} else {
			verbose_check("_file_IO.php - file_io_delete_file(): [ " . $file_path . " ] File exists, but could NOT be deleted.");
			return false;
		}
	} else {
		verbose_check("_file_IO.php - file_io_delete_file(): Error: [ " . $file_path . " ] Does NOT exist.");
		return false;
	}
}

function file_io_delete_dir($dir_path, $recursive = false) {
	//Done for now
	verbose_check("_file_IO.php - file_io_delete_dir()");
	if(file_io_check_directory_exists($dir_path)) {
		if (!($recursive)) {
			//check if dir is empty first
			if (($dir_list = file_io_list_dir($dir_path)) === false){
				return false;
			}
			if(count($dir_list) == 0) {
				unlink($dir_path);
				verbose_check("_file_IO.php - file_io_delete_dir(): [ " . $dir_path . " ] Successfully deleted.");
				return true;
			} else {
				verbose_check("_file_IO.php - file_io_delete_dir(): [ " . $dir_path . " ] NOT able to delete directory.");
				return false;
			}
		} else {
			$file_list = file_io_list_dir($dir_path);
			if(count($file_list) != 0) {
				foreach($file_list as $list_element) {
					if(!(is_dir($list_element))) {
						file_io_delete_file($dir_path . "/" . $list_element);
					} else {
						if(count(file_io_list_dir($dir_path . "/" . $list_element)) == 0) {
							file_io_delete_dir($dir_path . "/" . $list_element, false);
						} else {
							file_io_delete_dir($dir_path . "/" . $list_element, true);
						}
					}
				}
			}
			if(count(file_io_list_dir($dir_path)) == 0) {
				unlink($dir_path);
				verbose_check("_file_IO.php - file_io_delete_dir(): [ " . $dir_path . " ] Successfully deleted.");
				return true;
			}	
		}
	} else {
		verbose_check("_file_IO.php - file_io_delete_dir(): [ " . $dir_path . " ] NOT able to delete directory.");
		return false;
	}
}

function file_io_list_dir($dir_path) {
	//Done for now
	verbose_check("_file_IO.php - file_io_list_dir()");
	//Added $site_abs_path to lookup.
	if(file_io_check_directory_exists($site_config['site_abs_path'] . $dir_path)) {
		$file_array = array_diff(scandir($dir_path), array('.', '..'));
		//echo "Dir Found!";
		return $file_array;
	} else {
		verbose_check("_file_IO.php - file_io_list_dir(): Error: Could NOT read directory [ " . $dir_path . " ]");
		//echo "Dir Not Found!";
		return false;
	}
}

//This will probly be excluded from core file-io functions
//More complicated features will most likely become a _file_io_extended core module in site/php/init/io/
function file_io_list_dir_tree() {
	verbose_check("_file_IO.php - file_io_list_dir_tree()");
}
?>
