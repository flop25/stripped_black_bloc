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
  'img_dir' => 'themes/stripped_black_bloc/img',
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
  if (defined('RVTS_VERSION'))
  {
    $template->func_combine_script( array(
        'id'=> 'sc_tscroller',
        'load'=> 'async',
        'path'=> PHPWG_THEMES_PATH.'stripped_black_bloc/js/tscroller.min.js',
        'require' => 'jquery',
      ), $template->smarty);
  }
  
  $config = unserialize( $conf['stripped_black_bloc'] );
  $template->assign( 'stripped_black_bloc', $config );
  $new_tplvar=array();
  $i=1;
  foreach ($tpl_thumbnails_var as $tplvar)
  {
    $tplvar['TN_CLASS']=($i==$config['starting_to']) ? "twocol" : "onecol";
    $new_tplvar[]=$tplvar;
    $i= ($i==$config['every_x']) ? 1 : $i+1 ;
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
  global $page;
  $search = "#\{\'Menu\'\|@translate\}#";  
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

  $search = '#\{\$PLUGIN_INDEX_CONTENT_AFTER\}</div>\{/if\}.*</div>#s';  
  $replacement = '{$PLUGIN_INDEX_CONTENT_AFTER}</div>{/if}
	</div>
  {if !empty($navbar) }
  {include file=\'navigation_bar.tpl\'|@get_extent:\'navbar\'}
  {/if}';
  $content = preg_replace($search, $replacement, $content);
  if ( isset($page['chronology_view']))
  {
    $search = '#\{if isset\(\$chronology\.TITLE\)#s';
    $replacement = '<div class="bloc_stuff">
{if isset($chronology.TITLE)';
    $content = preg_replace($search, $replacement, $content);
    $search = '#\{if \!empty\(\$PLUGIN_INDEX_CONTENT_BEGIN\)\}#s';
    $replacement = '</div>
{if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}';
    $content = preg_replace($search, $replacement, $content);
    $search = '#calendar_block"#s';
    if ($page['chronology_view']=='calendar')
    {
     $replacement = 'calendar_block" class="bloc_stuff" style="width:100%;padding:5px"';
    }
    else {
     $replacement = 'calendar_block" class="bloc_stuff" style="padding:5px 0"';
    }
    $content = preg_replace($search, $replacement, $content);
  }

  return $content;
}

?>
