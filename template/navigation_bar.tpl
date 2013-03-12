<div class="navigationBar bloc twocol">
	<span class="nav_bulle">{'Page'|@translate} {$navbar.CURRENT_PAGE}{if isset($navbar.NB_PAGE)}/ {$navbar.NB_PAGE}{/if}</span>
  {if isset($navbar.URL_FIRST)}
  <a href="{$navbar.URL_FIRST}" rel="first" class="first nav_bulle">{'First'|@translate}</a>
  <a href="{$navbar.URL_PREV}" rel="prev" class="newer nav_bulle">«</a>
  {/if}

  {assign var='prev_page' value=0}
  {foreach from=$navbar.pages key=page item=url}
    {if $page > $prev_page+1}...{/if}
    {if $page == $navbar.CURRENT_PAGE}
    <span class="current nav_bulle">{$page}</span>
    {else}
    <a href="{$url}" class="nav_bulle" >{$page}</a>
    {/if}
    {assign var='prev_page' value=$page}
  {/foreach}

  {if isset($navbar.URL_NEXT)}
   <a href="{$navbar.URL_NEXT}" rel="next" class="older nav_bulle">»</a>
   <a href="{$navbar.URL_LAST}" rel="last" class="last nav_bulle">{'Last'|@translate}</a>
  {/if}
</div>
