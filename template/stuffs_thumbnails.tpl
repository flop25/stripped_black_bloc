{assign var='thumbnails' value=$block.thumbnails}
{if !empty($thumbnails)}
  {foreach from=$thumbnails item=thumbnail}
  <div class="{$thumbnail.TN_CLASS}">
        <a href="{$thumbnail.URL}" style="background: url({$thumbnail.TN_SRC}) no-repeat scroll center center transparent; height: {$thumbnail.TN_HEIGHT}px; width: {$thumbnail.TN_WIDTH}px; opacity: 0.75;" >
          RECENT
        </a>
        <div class="title">{if isset($block.TITLE)}{$block.TITLE}{elseif isset($thumbnail.NAME)}{$thumbnail.NAME}{/if}</div>
	</div>
  {/foreach}
{/if}
