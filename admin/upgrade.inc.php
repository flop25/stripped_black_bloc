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
  'catthumb'         => 'none' //none - same - all
  );
  $query = "
INSERT INTO " . CONFIG_TABLE . " (param,value,comment)
VALUES ('stripped_black_bloc' , '".pwg_db_real_escape_string(serialize($config))."' , 'color_main#column_width#thumbnail_width#thumbnail(generated - auto - piwigo)');";
  pwg_query($query);
  load_conf_from_db();
}
elseif (count(unserialize( $conf['stripped_black_bloc'] ))!=6)
{
  $config = array(
  'color_main'            => 'E6554F',
  'column_width'            => 170,
  'thumbnail_width'           => 150,
  'every_x'           => 20,
  'starting_to'           => 1,
  'catthumb'         => 'none' //none - same - all
  );
  conf_update_param('stripped_black_bloc', pwg_db_real_escape_string(serialize($config)));
  load_conf_from_db();
}
elseif ($conff=unserialize($conf['stripped_black_bloc']) and ( !isset($conff['catthumb']) or empty($conff['catthumb'])) )
{
  $config = array(
  'color_main'            => $conff['color_main'],
  'column_width'            => $conff['column_width'],
  'thumbnail_width'           => $conff['thumbnail_width'],
  'every_x'           => $conff['every_x'],
  'starting_to'           => $conff['starting_to'],
  'catthumb'         => 'none' //none - same - all
  );
  conf_update_param('stripped_black_bloc', pwg_db_real_escape_string(serialize($config)));
  load_conf_from_db();
}
?>