{define_derivative name='derivative_stripped_black_bloc' width=$stripped_black_bloc.thumbnail_width height=9999 crop=false}
{define_derivative name='derivative_stripped_black_bloc_big' width=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width height=9999 crop=false}
{if !empty($thumbnails)}
  {foreach from=$thumbnails item=thumbnail}
    {if $thumbnail.TN_CLASS=="bloc"}
      {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc, $thumbnail.src_image)}
    {else}
      {assign var=derivative value=$pwg->derivative($derivative_stripped_black_bloc_big, $thumbnail.src_image)}
    {/if}
    {assign var='size' value=$derivative->get_size()}
 <div class="{$thumbnail.TN_CLASS}">
    <a href="{$thumbnail.URL}" style="background: url({$derivative->get_url()}) no-repeat scroll center center transparent; height: {$size[1]}px; width: {$size[0]}px; opacity: 0.75;" >
      {if isset($thumbnail.NAME)}{$thumbnail.NAME}{else}{$thumbnail.TN_TITLE}{/if}
    </a>
    <div class="title">{if isset($thumbnail.NAME)}{$thumbnail.NAME}{/if}</div>
  </div>
  {/foreach}
{/if}
