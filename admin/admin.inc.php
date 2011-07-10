<?php

// Need upgrade?

global $conf;

if (!isset($conf['stripped_black_bloc']))
  include(PHPWG_THEMES_PATH.'stripped_black_bloc/admin/upgrade.inc.php');

load_language('theme.lang', PHPWG_THEMES_PATH.'stripped_black_bloc/');

$config_send= array();

if(isset($_POST['submit_stripped_black_bloc']))
{
	$config_send['thumbnail']=(isset($_POST['f_thumbnail'])) ? $_POST['f_thumbnail'] : 'piwigo';
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
	
	conf_update_param('stripped_black_bloc', pwg_db_real_escape_string(serialize($config_send)));

  array_push($page['infos'], l10n('Information data registered in database'));

  load_conf_from_db();
}

$template->set_filenames(array(
    'theme_admin_content' => dirname(__FILE__) . '/admin.tpl'));

$template->assign('options', unserialize($conf['stripped_black_bloc']));

$template->assign_var_from_handle('ADMIN_CONTENT', 'theme_admin_content');
  
?>