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
  'orientation_option'         => 'none' //none - max_heigth -big_landscape
  );
  $query = "
INSERT INTO " . CONFIG_TABLE . " (param,value,comment)
VALUES ('stripped_black_bloc' , '".pwg_db_real_escape_string(serialize($config))."' , 'color_main#column_width#thumbnail_width#catthumb(none - same - all)');";
  pwg_query($query);
  load_conf_from_db();
}
elseif (count(unserialize( $conf['stripped_black_bloc'] ))!=7)
{
  $conff=unserialize($conf['stripped_black_bloc']);
  $config = array(
  'color_main'            => (isset($conff['color_main'])) ? $conff['color_main'] :'E6554F',
  'column_width'            => (isset($conff['column_width'])) ? $conff['column_width'] :170,
  'thumbnail_width'           => (isset($conff['thumbnail_width'])) ? $conff['thumbnail_width'] :150,
  'every_x'           => (isset($conff['every_x'])) ? $conff['every_x'] : 20,
  'starting_to'           => (isset($conff['starting_to'])) ? $conff['starting_to'] :1,
  'catthumb'         => (isset($conff['catthumb'])) ? $conff['catthumb'] :'none', //none - same - all
  'orientation_option'         => (isset($conff['orientation_option'])) ? $conff['orientation_option'] :'none' //none - max_heigth -big_landscape
  );
  conf_update_param('stripped_black_bloc', pwg_db_real_escape_string(serialize($config)));
  load_conf_from_db();
}
?>