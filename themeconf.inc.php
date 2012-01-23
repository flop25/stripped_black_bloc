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
  'load_parent_local_head' => true,
);
global $stripped;
$stripped['themeStyle']='original';

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

/************************************ thumbnails and category_thumbnails ************************************/
add_event_handler('loc_end_index_category_thumbnails', 'stripped_black_bloc');
add_event_handler('loc_end_index_thumbnails', 'stripped_black_bloc');
function stripped_black_bloc($tpl_thumbnails_var)
{
  global $template, $conf;
  $config = unserialize( $conf['stripped_black_bloc'] );
  $new_tplvar=array();
  $i=1;
  foreach ($tpl_thumbnails_var as $tplvar)
  {
    list($width, $height, $type, $attr) = getimagesize( str_replace("../", "", $tplvar['TN_SRC']) );
    $tplvar['TN_WIDTH']=$width;
    $tplvar['TN_HEIGHT']=$height;
    if (!isset($tplvar['CAPTION_NB_IMAGES']))
    {
      $conf_thumbnail_width=($i==$config['starting_to']) ? $config['column_width']+$config['thumbnail_width'] : $config['thumbnail_width'];
      $tplvar['TN_CLASS']=($i==$config['starting_to']) ? "bloc_big" : "bloc";
    }
    else
    {
      $conf_thumbnail_width=$config['thumbnail_width'];
    }
    if (isset($config['thumbnail']))
    {
      switch ($config['thumbnail'])
      {
        case 'generated':
          if (isset($tplvar['FILE_WIDTH']))
          {
           $tplvar['TN_SRC']=get_root_url().PHPWG_THEMES_PATH."stripped_black_bloc/library/phpthumb/phpThumb.php?src=../../../../".$tplvar['FILE_PATH']."&w=".$conf_thumbnail_width;
          }
          else
          {
           $tplvar['TN_SRC']=get_root_url().PHPWG_THEMES_PATH."stripped_black_bloc/library/phpthumb/phpThumb.php?src=../../../../".str_replace("../", "", $tplvar['TN_SRC'])."&w=".$conf_thumbnail_width;
          }
          $tplvar['TN_HEIGHT']=floor($tplvar['TN_HEIGHT']*($conf_thumbnail_width/$tplvar['TN_WIDTH']));
          $tplvar['TN_WIDTH']=$conf_thumbnail_width;
         break;
         case 'auto':
          if($tplvar['TN_WIDTH']<=$conf_thumbnail_width)
          {
            if (isset($tplvar['FILE_WIDTH']))
            {
             $tplvar['TN_SRC']=get_root_url().PHPWG_THEMES_PATH."stripped_black_bloc/library/phpthumb/phpThumb.php?src=../../../../".$tplvar['FILE_PATH']."&w=".$conf_thumbnail_width;
            }
            else
            {
             $tplvar['TN_SRC']=get_root_url().PHPWG_THEMES_PATH."stripped_black_bloc/library/phpthumb/phpThumb.php?src=../../../../".str_replace("../", "", $tplvar['TN_SRC'])."&w=".$conf_thumbnail_width;
            }
            $tplvar['TN_HEIGHT']=floor($tplvar['TN_HEIGHT']*($conf_thumbnail_width/$tplvar['TN_WIDTH']));
            $tplvar['TN_WIDTH']=$conf_thumbnail_width;
          }
        break;
        case 'piwigo':break;
      }
    }
   $new_tplvar[]=$tplvar;
    if ($i==$config['every_x'])
    {
      $i=1;
    }
    else {
      $i++;    
    }
  }
  return $new_tplvar;
}
add_event_handler('init', 'stripped_black_bloc_init');
function stripped_black_bloc_init()
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
  $search = '#<div id="subcontent">#';  
  $replacement = "";
  $content = preg_replace($search, $replacement, $content);
  $search = '#\{if \!empty\(\$CONTENT_DESCRIPTION\) \}#';  
  $replacement = ' <div id="subcontent">

  {if !empty($CONTENT_DESCRIPTION) }';
  $content = preg_replace($search, $replacement, $content);
  $search = '#\{if \!empty\(\$navbar\) \}[\s]*\{include file=\'navigation_bar\.tpl\'\|@get_extent:\'navbar\'\}[\s]*\{/if\}#';  
  $replacement = '';
  $content = preg_replace($search, $replacement, $content);

  $search = '#{\$PLUGIN_INDEX_CONTENT_AFTER}</div>{/if}.*</div>#s';  
  $replacement = '{$PLUGIN_INDEX_CONTENT_AFTER}</div>{/if}
	</div>
 {if !empty($navbar) }
  {include file=\'navigation_bar.tpl\'|@get_extent:\'navbar\'}
 {/if}';
  return preg_replace($search, $replacement, $content);
}

?>
