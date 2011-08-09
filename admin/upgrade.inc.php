<?php

if (!defined('PHPWG_ROOT_PATH')) die('Hacking attempt!');

global $prefixeTable, $conf;

if (!isset($conf['stripped_black_bloc']))
{
	$config = array(
	'color_main'						=> 'E6554F',
	'column_width'						=> 170,
	'thumbnail_width'						=> 150,
	'thumbnail'					=> 'piwigo' //generated - auto - piwigo
      );
     $query = "
INSERT INTO " . CONFIG_TABLE . " (param,value,comment)
VALUES ('stripped_black_bloc' , '".pwg_db_real_escape_string(serialize($config))."' , 'color_main#column_width#thumbnail_width#thumbnail(generated - auto - piwigo)');";
     

    pwg_query($query);
		load_conf_from_db();
}
elseif (count(unserialize( $conf['stripped_black_bloc'] ))!=4) {
	$config = array(
	'color_main'						=> 'E6554F',
	'column_width'						=> 170,
	'thumbnail_width'						=> 150,
	'thumbnail'					=> 'piwigo' //generated - auto - piwigo
      );
      

	conf_update_param('stripped_black_bloc', pwg_db_real_escape_string(serialize($config)));
		load_conf_from_db();
}
?>