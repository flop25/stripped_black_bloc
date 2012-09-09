{define_derivative name='derivative_stripped_black_bloc' width=$stripped_black_bloc.thumbnail_width height=9999 crop=false}
{define_derivative name='derivative_stripped_black_bloc_big' width=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width height=9999 crop=false}
{define_derivative name='derivative_stripped_black_bloc_wide' width=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width+$stripped_black_bloc.column_width height=9999 crop=false}
{define_derivative name='derivative_stripped_black_bloc_vert' width=$stripped_black_bloc.thumbnail_width height=$stripped_black_bloc.thumbnail_width crop=false}
{define_derivative name='derivative_stripped_black_bloc_big_vert' width=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width height=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width crop=false}

{foreach from=$category_thumbnails item=cat}
{assign var=triplehigh value= $cat.representative.height+$cat.representative.height+$cat.representative.height}
  {if $cat.representative.width gt $triplehigh}
    {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_wide, $cat.representative.src_image)}
    {assign var='size' value=$derivative->get_size()}
	<div class="bloc_big album">
			<a href="{$cat.URL}" style="background: url({$derivative->get_url()}) no-repeat scroll center center transparent; height: {$size[1]}px; width: {$size[0]}px; opacity: 0.75;" >
				{$cat.NAME}
			</a>
				<div class="title">{$cat.NAME}</div>
	</div>
  {else}
    {if $cat.representative.width < $cat.representative.height and $stripped_black_bloc.catthumb=="yes"}
      {if $cat.TN_CLASS=="bloc_big" and $stripped_black_bloc.catthumb=="same"}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big_vert, $cat.representative.src_image)}
      {elseif $stripped_black_bloc.catthumb=="all"}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big_vert, $cat.representative.src_image)}
      {else}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_vert, $cat.representative.src_image)}
      {/if}
    {else}
      {if $cat.TN_CLASS=="bloc_big" and $stripped_black_bloc.catthumb=="same"}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big, $cat.representative.src_image)}
      {elseif $stripped_black_bloc.catthumb=="all"}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big, $cat.representative.src_image)}
      {else}
        {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc, $cat.representative.src_image)}
        {/if}
    {/if}
    {assign var='size' value=$derivative->get_size()}
	<div class="{if $stripped_black_bloc.catthumb=="all"}bloc_big{else}{$cat.TN_CLASS}{/if} album">
			<a href="{$cat.URL}" style="background: url({$derivative->get_url()}) no-repeat scroll center center transparent; height: {$size[1]}px; width: {$size[0]}px; opacity: 0.75;" >
				{$cat.NAME}
			</a>
				<div class="title">{$cat.NAME}</div>
	</div>
  {/if}
  {/foreach}
