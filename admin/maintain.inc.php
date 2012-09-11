<?php

function theme_activate($id, $version, &$errors)
{
  global $prefixeTable, $conf;

  if (!isset($conf['stripped_black_bloc']))
  {
    $config = array(
  'color_main'            => 'E6554F',
  'column_width'            => 170,
  'thumbnail_width'           => 150,
 	'every_x'						=> 20,
	'starting_to'						=> 1,
  'catthumb'         => 'none', //none - same - all
  'orientation_option'         => 'none' //none - max_heigth - big_landscape
      );
      
    $query = "
INSERT INTO " . CONFIG_TABLE . " (param,value,comment)
VALUES ('stripped_black_bloc' , '".pwg_db_real_escape_string(serialize($config))."' , 'color_main#column_width#thumbnail_width#catthumb(none - same - all)');";
    pwg_query($query);
  }
}

function theme_deactivate()
{
  global $prefixeTable;

  $query = 'DELETE FROM ' . CONFIG_TABLE . ' WHERE param="stripped_black_bloc" ;';
  pwg_query($query);
}

?>