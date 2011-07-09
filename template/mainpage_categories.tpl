  {foreach from=$category_thumbnails item=cat}
	<div class="bloc album">
			<a href="{$cat.URL}" style="background: url({$cat.TN_SRC}) no-repeat scroll center center transparent; height: {$cat.TN_HEIGHT}px; width: {$cat.TN_WIDTH}px; opacity: 0.75; max-width:150px;" >
				{$cat.NAME}
			</a>
				<div class="title">{$cat.NAME}</div>
	</div>
  {/foreach}
