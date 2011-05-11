<div class="titrePage">
	<div class="browsePath">
		<span id="menuswitcher" title="{'Show/hide menu'|@translate}">Menu</span><span class="arrow"> »</span>
		<h2>{$TITLE}</h2>
	</div>
	{if isset($U_EDIT) or isset($U_SLIDESHOW) or !empty($PLUGIN_INDEX_ACTIONS)}
		<ul class="categoryActions">
			{if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
			{if isset($U_EDIT)}
				<li><a href="{$U_EDIT}" title="{'edit'|@translate}">{'edit'|@translate}</a></li>
			{/if}
			{if isset($U_CADDIE) }
				<li><a href="{$U_CADDIE}" title="{'add to caddie'|@translate}">{'caddie'|@translate}</a></li>
			{/if}
			{if isset($U_SLIDESHOW)}
				<li><a href="{$U_SLIDESHOW}" title="{'slideshow'|@translate}" rel="nofollow">{'slideshow'|@translate}</a></li>
			{/if}
		</ul>
	{/if}
	{php}
		global $pwg_loaded_plugins;
		$this->assign('GMaps_loaded', isset($pwg_loaded_plugins[ 'GMaps' ]));
	{/php}
	{if ($GMaps_loaded)}<div id="text_gmaps" style="display:none">{'GMap'|@translate}</div>{/if}
</div>
<table id="content" {if !$stripped.hideMenu}class="menuShown"{/if} cellpadding="0px" cellspacing="0px">
	<tbody>
  <tr>
	{$MENUBAR}
	<td id="subcontent">
		{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}
		{if isset($chronology.TITLE) }
			<h2>{$chronology.TITLE}</h2>
		{/if}
		{if isset($chronology_views) }
			{if isset($U_MODE_POSTED) }
				<a href="{$U_MODE_POSTED}" rel="nofollow">{'display a calendar by posted date'|@translate}</a>
			{/if}
			{if isset($U_MODE_CREATED) }
				<a href="{$U_MODE_CREATED}" rel="nofollow">{'display a calendar by creation date'|@translate}</a>
			{/if}
			<div class="calendarViews">{'View'|@translate}:
				<select onchange="document.location = this.options[this.selectedIndex].value;">
					{foreach from=$chronology_views item=view}
						<option value="{$view.VALUE}"{if $view.SELECTED} selected="selected"{/if}>{$view.CONTENT}</option>
					{/foreach}
				</select>
			</div>
		{/if}

		{if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}<div class="content_block">{$PLUGIN_INDEX_CONTENT_BEGIN}</div>{/if}
		{if !empty($category_search_results) }
			<div>{'Album results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
				{foreach from=$category_search_results item=res name=res_loop}
				{if !$smarty.foreach.res_loop.first} &mdash; {/if}
				{$res}
				{/foreach}
			</div>
		{/if}
		{if !empty($tag_search_results) }
			<div>{'Tag results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
				{foreach from=$tag_search_results item=res name=res_loop}
					{if !$smarty.foreach.res_loop.first} &mdash; {/if}
					{$res}
				{/foreach}
			</div>
		{/if}
		{if isset($FILE_CHRONOLOGY_VIEW) }
			{include file=$FILE_CHRONOLOGY_VIEW}
		{/if}

		{if !empty($CATEGORIES) }{$CATEGORIES}{/if}
		{if !empty($THUMBNAILS) }
					{$THUMBNAILS}
					{if !empty($navbar) }
						{include file='navigation_thumb.tpl'|@get_extent:'navbar'}
					{/if}
					{if !empty($navbar) }
						{include file='navigation_bar.tpl'|@get_extent:'navbar'}
					{/if}
		{/if}
		{if !empty($PLUGIN_INDEX_CONTENT_END) }{$PLUGIN_INDEX_CONTENT_END}{/if}
		{if !empty($CONTENT_DESCRIPTION) }
			<div class="content_block"><div class="additional_info">
				{$CONTENT_DESCRIPTION}
			</div></div>
		{/if}
		{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}
	<div style="clear: both;"></div>
	</td>
  </tr> <!-- subContent -->
  </tbody>
</table> <!-- content -->