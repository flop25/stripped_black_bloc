{define_derivative name='derivative_stripped_black_bloc' width=$stripped_black_bloc.thumbnail_width height=9999 crop=false}
{define_derivative name='derivative_stripped_black_bloc_big' width=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width height=9999 crop=false}
{define_derivative name='derivative_stripped_black_bloc_wide' width=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width+$stripped_black_bloc.column_width height=9999 crop=false}
{define_derivative name='derivative_stripped_black_bloc_vert' width=$stripped_black_bloc.thumbnail_width height=$stripped_black_bloc.thumbnail_width crop=false}
{define_derivative name='derivative_stripped_black_bloc_big_vert' width=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width height=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width crop=false}

{foreach from=$category_thumbnails item=cat}
{assign var=triplehigh value= $cat.representative.height+$cat.representative.height+$cat.representative.height}
  {if ($cat.representative.width > $triplehigh) and ($cat.representative.width>$stripped_black_bloc.column_width+$stripped_black_bloc.column_width+$stripped_black_bloc.column_width)}
    {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_wide, $cat.representative.src_image)}
    {assign var=TN_CLASS value="twocol"}
  {elseif ($cat.representative.width > $triplehigh) and ($cat.representative.width>$stripped_black_bloc.column_width+$stripped_black_bloc.column_width)}
    {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_wide, $cat.representative.src_image)}
    {assign var=TN_CLASS value="twocol"}
  {elseif $stripped_black_bloc.catthumb=="all"}
    {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big_vert, $cat.representative.src_image)}
    {assign var=TN_CLASS value="twocol"}
  {elseif $cat.representative.width < $cat.representative.height and $stripped_black_bloc.orientation_option=="max_heigth"}
      {if $cat.TN_CLASS=="twocol" and $stripped_black_bloc.catthumb=="same"}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big_vert, $cat.representative.src_image)}
        {assign var=TN_CLASS value="twocol"}
      {else}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_vert, $cat.representative.src_image)}
        {assign var=TN_CLASS value="onecol"}
      {/if}
  {elseif $stripped_black_bloc.orientation_option=="big_landscape"}
    {if (($cat.representative.TN_CLASS=="twocol" and $stripped_black_bloc.catthumb=="same") or $cat.representative.width > $cat.representative.height) and ($cat.representative.width>$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width) and $stripped_black_bloc.catthumb!="none"}
      {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big, $cat.representative.src_image)}
      {assign var=TN_CLASS value='twocol'}
    {else}
      {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc, $cat.representative.src_image)}
      {assign var=TN_CLASS value='onecol'}
    {/if}
  {else}
    {if $cat.TN_CLASS=="twocol" and $stripped_black_bloc.catthumb=="same"}
      {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big, $cat.representative.src_image)}
      {assign var=TN_CLASS value="twocol"}
    {else}
      {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc, $cat.representative.src_image)}
      {assign var=TN_CLASS value="onecol"}
    {/if}
  {/if}
    {assign var='size' value=$derivative->get_size()}
	<div class="bloc {$TN_CLASS} album">
			<a href="{$cat.URL}" style="background: url({$derivative->get_url()}) no-repeat scroll center center transparent; height: {$size[1]}px; width: {$size[0]}px; opacity: 0.75;" >
				{$cat.NAME}
			</a>
				<div class="title">{$cat.NAME}</div>
	</div>
  {/foreach}
