<?php
/*
Theme Name: Stripped & Columns
Version: auto
Description: stripped_black_bloc
Theme URI: http://piwigo.org/ext/extension_view.php?eid=568
Author: flop25
Author URI: http://www.planete-flop.fr
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

load_language('theme.lang', PHPWG_THEMES_PATH.'stripped_black_bloc/');

// Need upgrade?

include(PHPWG_THEMES_PATH.'stripped_black_bloc/admin/upgrade.inc.php');

add_event_handler('loc_begin_page_header', 'set_config_values_stripped_black_bloc');

function set_config_values_stripped_black_bloc()
{
	global $conf, $template;
	$config = unserialize( $conf['stripped_black_bloc'] );
	$template->assign( 'stripped_black_bloc', $config );
}

/// EVENT
add_event_handler('loc_end_index_category_thumbnails', 'MY');
add_event_handler('loc_end_index_thumbnails', 'MY');
function MY($tpl_thumbnails_var)
{
    global $template, $conf;
		$config = unserialize( $conf['stripped_black_bloc'] );
		$new_tplvar=array();
		foreach ($tpl_thumbnails_var as $tplvar)
		{
			list($width, $height, $type, $attr) = getimagesize(	$tplvar['TN_SRC'] );
			$tplvar['TN_WIDTH']=$width;
			$tplvar['TN_HEIGHT']=$height;
			if (isset($config['thumbnail']))
			{
				switch ($config['thumbnail'])
				{
					case 'generated':
						if (isset($tplvar['FILE_WIDTH']))
						{
							$tplvar['TN_SRC']=PHPWG_THEMES_PATH."stripped_black_bloc/library/timthumb.php?src=".$tplvar['FILE_PATH']."&w=".$config['thumbnail_width'];
						}
						else
						{
							$tplvar['TN_SRC']=PHPWG_THEMES_PATH."stripped_black_bloc/library/timthumb.php?src=".$tplvar['TN_SRC']."&w=".$config['thumbnail_width'];
						}
						$tplvar['TN_HEIGHT']=floor($tplvar['TN_HEIGHT']*($config['thumbnail_width']/$tplvar['TN_WIDTH']));
						$tplvar['TN_WIDTH']=$config['thumbnail_width'];
					break;
					case 'auto':
						if($tplvar['TN_WIDTH']<=$config['thumbnail_width'])
						{
							if (isset($tplvar['FILE_WIDTH']))
							{
								$tplvar['TN_SRC']=PHPWG_THEMES_PATH."stripped_black_bloc/library/timthumb.php?src=".$tplvar['FILE_PATH']."&w=".$config['thumbnail_width'];
							}
							else
							{
								$tplvar['TN_SRC']=PHPWG_THEMES_PATH."stripped_black_bloc/library/timthumb.php?src=".$tplvar['TN_SRC']."&w=".$config['thumbnail_width'];
							}
							$tplvar['TN_HEIGHT']=floor($tplvar['TN_HEIGHT']*($config['thumbnail_width']/$tplvar['TN_WIDTH']));
							$tplvar['TN_WIDTH']=$config['thumbnail_width'];
						}
					break;
					case 'piwigo':break;
				}
			}
			$new_tplvar[]=$tplvar;
		}
		return $new_tplvar;
}
add_event_handler('init', 'MY_init');
function MY_init()
{
	remove_event_handler('loc_begin_index', 'modify_nb_thumbnail_page');
}

/************************************ index.tpl ************************************/
add_event_handler('loc_end_index', 'stripped_black_bloc_index');
function stripped_black_bloc_index()
{
    global $template;
    $template->set_prefilter('index', 'stripped_black_bloc_prefilter_index');
}
function stripped_black_bloc_prefilter_index($content, &$smarty)
{
  $search = '#Menu</span>#';  
  $replacement = "{'Show/hide menu'|@translate}</span>";
  $content = preg_replace($search, $replacement, $content);
  $search = '#id="thumbnails_block2"#';  
  $replacement = "";
  $content = preg_replace($search, $replacement, $content);
  $search = '#\{if \!empty\(\$navbar\) \}[\s]*\{include file=\'navigation_bar\.tpl\'\|@get_extent:\'navbar\'\}[\s]*\{/if\}#';  
  $replacement = '';
  $content = preg_replace($search, $replacement, $content);

  $search = '#<\!-- subContent -->#';  
  $replacement = '<!-- subContent -->
	{if !empty($navbar) }
		{include file=\'navigation_bar.tpl\'|@get_extent:\'navbar\'}
	{/if}';
  return preg_replace($search, $replacement, $content);
}

?>
