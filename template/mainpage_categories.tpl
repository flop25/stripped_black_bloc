{define_derivative name='derivative_stripped_black_bloc' width=$stripped_black_bloc.thumbnail_width height=9999 crop=false}
{define_derivative name='derivative_stripped_black_bloc_big' width=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width height=9999 crop=false}
{foreach from=$category_thumbnails item=cat}
  {if $cat.TN_CLASS=="bloc_big" and $stripped_black_bloc.catthumb=="same"}
    {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big, $cat.representative.src_image)}
  {elseif $stripped_black_bloc.catthumb=="all"}
    {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big, $cat.representative.src_image)}
  {else}
    {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc, $cat.representative.src_image)}
  {/if}
  {assign var='size' value=$derivative->get_size()}
	<div class="{if $stripped_black_bloc.catthumb=="all"}bloc_big{else}{$cat.TN_CLASS}{/if} album">
			<a href="{$cat.URL}" style="background: url({$derivative->get_url()}) no-repeat scroll center center transparent; height: {$size[1]}px; width: {$size[0]}px; opacity: 0.75;" >
				{$cat.NAME}
			</a>
				<div class="title">{$cat.NAME}</div>
	</div>
  {/foreach}
