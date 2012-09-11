<?php

// Need upgrade?

global $conf;

include(PHPWG_THEMES_PATH.'stripped_black_bloc/admin/upgrade.inc.php');

load_language('theme.lang', PHPWG_THEMES_PATH.'stripped_black_bloc/');

$config_send= array();

if(isset($_POST['submit_stripped_black_bloc']))
{
	$config_send['color_main']=(isset($_POST['f_color_main']) and !empty($_POST['f_color_main'])) ? $_POST['f_color_main'] : 'E6554F';
	$config_send['column_width']=(isset($_POST['f_column_width'])) ? $_POST['f_column_width'] : 170;
	if ( isset($_POST['f_column_width']) and isset($_POST['f_thumbnail_width']))
	{
		if ( $_POST['f_column_width']>$_POST['f_thumbnail_width'] )
		{
			$config_send['thumbnail_width']=$_POST['f_thumbnail_width'];
		}
		else
		{
			$config_send['thumbnail_width']=$_POST['f_column_width']-20;
		}
	}
	else
	{
		$config_send['thumbnail_width']=150;
	}
	$config_send['every_x']=(isset($_POST['f_every_x'])) ? $_POST['f_every_x'] : 20;
	$config_send['starting_to']=(isset($_POST['f_starting_to'])) ? $_POST['f_starting_to'] : 1;
	$config_send['catthumb']=(isset($_POST['f_catthumb'])) ? $_POST['f_catthumb'] : 'none';
	$config_send['orientation_option']=(isset($_POST['f_orientation_option'])) ? $_POST['f_orientation_option'] : 'none';
	conf_update_param('stripped_black_bloc', pwg_db_real_escape_string(serialize($config_send)));

  array_push($page['infos'], l10n('Information data registered in database'));

  load_conf_from_db();
}
if(!isset($conf['stripped']))
{
  array_push($page['errors'], l10n('The parent-theme Stripped need to be enabled in order to use its parameters'));
}

$template->set_filenames(array(
    'theme_admin_content' => dirname(__FILE__) . '/admin.tpl'));

$template->assign('options', unserialize($conf['stripped_black_bloc']));

$template->assign_var_from_handle('ADMIN_CONTENT', 'theme_admin_content');
  
?>