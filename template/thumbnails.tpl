{if !empty($thumbnails)}
  {foreach from=$thumbnails item=thumbnail}
  <div class="bloc">
        <a href="{$thumbnail.URL}" style="background: url({$thumbnail.TN_SRC}) no-repeat scroll center center transparent; height: {$thumbnail.TN_HEIGHT}px; width: {$thumbnail.TN_WIDTH}px; opacity: 0.75; max-width:150px;" >
          {if isset($thumbnail.NAME)}{$thumbnail.NAME}{else}{$thumbnail.TN_TITLE}{/if}
        </a>
        <div class="title">{if isset($thumbnail.NAME)}{$thumbnail.NAME}{else}{$thumbnail.TN_TITLE}{/if}</div>
	</div>
  {/foreach}
{/if}
