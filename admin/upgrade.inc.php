<?php

if (!defined('PHPWG_ROOT_PATH')) die('Hacking attempt!');

global $prefixeTable, $conf;

if (!isset($conf['stripped_black_bloc']))
{
  $config = array(
  'color_main'            => 'E6554F',
  'column_width'            => 170,
  'thumbnail_width'           => 150,
  'every_x'           => 20,
  'starting_to'           => 1,
  'catthumb'         => 'none', //none - same - all
  'orientation_option'         => 'none', //none - max_heigth - big_landscape
  'hover_action'         => 'fadein', //fadein - fadeout - border - none
  );

  conf_update_param('stripped_black_bloc', $config, true);
}
elseif (count(safe_unserialize( $conf['stripped_black_bloc'] ))!=8)
{
  $conff = safe_unserialize($conf['stripped_black_bloc']);
  $config = array(
  'color_main'            => (isset($conff['color_main'])) ? $conff['color_main'] :'E6554F',
  'column_width'            => (isset($conff['column_width'])) ? $conff['column_width'] :170,
  'thumbnail_width'           => (isset($conff['thumbnail_width'])) ? $conff['thumbnail_width'] :150,
  'every_x'           => (isset($conff['every_x'])) ? $conff['every_x'] : 20,
  'starting_to'           => (isset($conff['starting_to'])) ? $conff['starting_to'] :1,
  'catthumb'         => (isset($conff['catthumb'])) ? $conff['catthumb'] :'none', //none - same - all
  'orientation_option'         => (isset($conff['orientation_option'])) ? $conff['orientation_option'] :'none', //none - max_heigth -big_landscape
  'hover_action'         => (isset($conff['hover_action'])) ? $conff['hover_action'] :'fadein' //fadein - fadeout - border - none
  );

  conf_update_param('stripped_black_bloc', $config, true);
}
?>