<?php

function theme_activate($id, $version, &$errors)
{
  global $prefixeTable, $conf;

  if (!isset($conf['stripped_black_bloc']))
  {
    $config = array(
	'column_width'						=> 170,
	'thumbnail_width'						=> 150,
	'thumbnail'					=> 'piwigo' //generated - auto - piwigo
      );
      
    $query = '
INSERT INTO ' . CONFIG_TABLE . ' (param,value,comment)
VALUES ("stripped_black_bloc" , "'.pwg_db_real_escape_string(serialize($config)).'" ,  "column_width#thumbnail_width#thumbnail(generated - auto - piwigo)");';

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