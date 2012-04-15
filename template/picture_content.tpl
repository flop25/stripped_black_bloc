{php}
	global $pwg_loaded_plugins, $conf, $stripped;
	$this->assign('HDShadowbox_loaded', isset($pwg_loaded_plugins[ 'HDShadowbox' ]));
	$this->assign( 'stripped', $stripped );
{/php}
{if isset($high)}
	{if ($HDShadowbox_loaded)}
		{assign var='pwghigh' value=true}
	{else}
		{assign var='winhigh' value=true}
	{/if}
{/if}
<div id="theImg" {if ($stripped.imageFrame)}class="img_frame"{/if}>
	{if isset($high)}
		{if isset($pwghigh)}<a href="{$high.U_HIGH}" rel="shadowbox" class="hd_link">&nbsp;</a>{/if}
		{if isset($winhigh)}<div onclick="openDisplayHigh('{$high.U_HIGH}');" class="hd_link">&nbsp;</div>{/if}
		{if ($stripped.imagePreloadHD)}<div class="preload" style="display:none;">{$high.U_HIGH}</div>{/if}
	{/if}
	{if ($stripped.imageArrows) }
		{if isset($previous)}
			<a href="{$previous.U_IMG}" class="img_nav img_prev">&nbsp;</a>
		{/if}
		{if isset($next)}
			<a href="{$next.U_IMG}" class="img_nav img_next">&nbsp;</a>
		{/if}
	{/if}
  {define_derivative name='derivative_stripped_pict' type='xlarge'}
  {assign var=derivative value=$pwg->derivative($derivative_stripped_pict, $current.src_image)}
	<img src="{$derivative->get_url()}" {$derivative->get_size_htm()} alt="{$ALT_IMG}" id="theMainImage" class="hideTabs">
</div>
