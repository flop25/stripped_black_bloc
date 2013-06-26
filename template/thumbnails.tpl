{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='ajaxloader' path='themes/stripped_black_bloc/js/ajaxloader.js' require='jquery.ajaxmanager' load='footer'}
{define_derivative name='derivative_stripped_black_bloc' width=$stripped_black_bloc.thumbnail_width height=9999 crop=false}
{define_derivative name='derivative_stripped_black_bloc_big' width=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width height=9999 crop=false}
{define_derivative name='derivative_stripped_black_bloc_wide' width=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width+$stripped_black_bloc.column_width height=9999 crop=false}
{define_derivative name='derivative_stripped_black_bloc_vert' width=$stripped_black_bloc.thumbnail_width height=$stripped_black_bloc.thumbnail_width crop=false}
{define_derivative name='derivative_stripped_black_bloc_big_vert' width=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width height=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width crop=false}
{if !empty($thumbnails)}
  {foreach from=$thumbnails item=thumbnail}
    {assign var=triplehigh value=$thumbnail.height+$thumbnail.height+$thumbnail.height}
    {if ($thumbnail.width > $triplehigh) and ($thumbnail.width>$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width+$stripped_black_bloc.column_width)}
      {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_wide, $thumbnail.src_image)}
      {assign var=TN_CLASS value='threecol'}
    {elseif ($thumbnail.width > $triplehigh) and ($thumbnail.width>$stripped_black_bloc.column_width+$stripped_black_bloc.column_width)}
      {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big, $thumbnail.src_image)}
      {assign var=TN_CLASS value='twocol'}
    {elseif (($thumbnail.width < $thumbnail.height) and $stripped_black_bloc.orientation_option=="max_heigth")}
      {if $thumbnail.TN_CLASS=="twocol" and $thumbnail.width>$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big_vert, $thumbnail.src_image)}
        {assign var=TN_CLASS value='twocol'}
      {else}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_vert, $thumbnail.src_image)}
        {assign var=TN_CLASS value='onecol'}
      {/if}
    {elseif $stripped_black_bloc.orientation_option=="big_landscape"}
      {if ($thumbnail.TN_CLASS=="twocol" or $thumbnail.width > $thumbnail.height) and ($thumbnail.width>$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width)}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big, $thumbnail.src_image)}
        {assign var=TN_CLASS value='twocol'}
      {else}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc, $thumbnail.src_image)}
        {assign var=TN_CLASS value='onecol'}
      {/if}
    {else}
      {if $thumbnail.TN_CLASS=="twocol" and $thumbnail.width>$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big, $thumbnail.src_image)}
        {assign var=TN_CLASS value='twocol'}
      {else}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc, $thumbnail.src_image)}
        {assign var=TN_CLASS value='onecol'}
      {/if}
    {/if}
     {assign var='size' value=$derivative->get_size()}
  <div class="bloc {$TN_CLASS}">
    <a title="{$thumbnail.TN_TITLE}" href="{$thumbnail.URL}" style="background: url({if $derivative->is_cached()}{$derivative->get_url()}{else}{$ROOT_URL}{$themeconf.img_dir}/loading.gif{/if}) no-repeat scroll center center transparent; height: {$size[1]}px; width: {$size[0]}px;" {if !$derivative->is_cached()}data-src="{$derivative->get_url()}"{/if}>
    {if isset($thumbnail.NAME)}{$thumbnail.NAME}{else}{$thumbnail.TN_TITLE}{/if}
    </a>
	  {if $SHOW_THUMBNAIL_CAPTION }
    <div class="title">{if isset($thumbnail.NAME)}{$thumbnail.NAME}{/if}</div>
    {/if}
  </div>
  {/foreach}
{/if}
