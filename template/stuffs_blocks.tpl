{foreach from=$blocks item=block key=key}
  {if !isset($block.thumbnails)}
    <div id="stuffs_block_{$block.ID}" class="content bloc_stuff {$block.CLASS} {$block.TEMPLATE|replace:'.tpl':''}" {if !empty($block.WIDTH)}style="width: {$block.WIDTH}%;"{/if}>
    {if isset($block.TITLE)}
      <div class="titrePage">
        {if !empty($block.U_EDIT)}
        <ul class="categoryActions">
          <li><a href="{$block.U_EDIT}" title="{'edit'|@translate}" class="pwg-state-default pwg-button">
            <span class="pwg-icon pwg-icon-category-edit"> </span><span class="pwg-button-text">{'edit'|@translate}</span>
	         	</a></li>
        </ul>
        {/if}
      {if isset($block.TITLE_URL)}
      <h2><a href="{$block.TITLE_URL}">{$block.TITLE}</a></h2>
      {else}
      <h2>{$block.TITLE}</h2>
      {/if}
      </div>
    {/if}
  {/if}
    {include file=$block.TEMPLATE}
  {if !isset($block.thumbnails)}
  </div>
  {/if}
{/foreach}
