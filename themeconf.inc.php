<?php
/*
Theme Name: stripped_black_bloc
Version: 0
Description: stripped_black_bloc
Theme URI: http://piwigo.org/ext/extension_view.php?eid=
Author: 
Author URI: 
*/


	
$themeconf = array(
  'parent' => 'stripped',
  'name' => 'stripped_black_bloc',
  'theme_dir' => 'stripped_black_bloc',
  'icon_dir' => 'themes/stripped/icon',
  'admin_icon_dir' => 'themes/default/icon/admin',
  'mime_icon_dir' => 'themes/default/icon/mimetypes/',
  'local_head' => 'local_head.tpl',
);
add_event_handler('loc_end_index_thumbnails', 'MY');
function MY($tpl_thumbnails_var)
{
    global $template;
		$new_tplvar=array();
		foreach ($tpl_thumbnails_var as $tplvar)
		{
			list($width, $height, $type, $attr) = getimagesize(	$tplvar['TN_SRC'] );
			$tplvar['TN_WIDTH']=$width;
			$tplvar['TN_HEIGHT']=$height;
			$new_tplvar[]=$tplvar;
		}
		return $new_tplvar;
}

?>
