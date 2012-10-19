{if ($BODY_ID=='theCategoryPage')}
{combine_script id='jquery.isotope' load='header' require='jquery' path='themes/stripped_black_bloc/js/isotope.js'}
{combine_script id='jquery.cookie' load='header' require='jquery' path='themes/stripped_black_bloc/js/jquery.ck.min.js'}
{assign var='one_column' value=$stripped_black_bloc.thumbnail_width}
{assign var='two_columns' value=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width}
{assign var='three_columns' value=$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width+$stripped_black_bloc.column_width}
{html_style}{literal}
.bloc {
display:block;
}
#theHeader a, .titrePage a, .footer_login a, .navigationBar a, #calendar_block A {
	color: {/literal}{if $stripped_black_bloc.color_main}#{$stripped_black_bloc.color_main}{/if}{literal};
}
.album a {
  border: 1.5px solid #{/literal}{$stripped_black_bloc.color_main}{literal};
  margin:-2px;
}

.onecol, .gmapsMarkup, .onecol a {
	max-width: {/literal}{$one_column}{literal}px;
}
.twocol, .twocol a {
	max-width: {/literal}{$two_columns}{literal}px;
}
.threecol, .threecol a {
	max-width: {/literal}{$three_columns}{literal}px;
}
.stuffs_thumbnails, .stuffs_thumbnails #thumbnails, .one_column {
	width:{/literal}{$one_column}{literal}px;
}
.content_block, .bloc_stuff, .two_columns {
	width:{/literal}{$two_columns}{literal}px;
}
.bloc_stuff #comments ul.commentList {
	width:{/literal}{$two_columns-30}{literal}px;
}
.content_block, #the_page .middle_block {
  margin-left:5px !important;
{/literal}
    margin-top: {math equation="( x - y )/2" y=$stripped_black_bloc.thumbnail_width x=$stripped_black_bloc.column_width}px !important;
		margin-bottom:{math equation="( x - y )/2" y=$stripped_black_bloc.thumbnail_width x=$stripped_black_bloc.column_width}px !important;
{literal}
}
.bloc, .stuffs_thumbnails, .stuffs_thumbnails #thumbnails {
{/literal}
    margin-top: {math equation="( x - y - 10)/2" y=$stripped_black_bloc.thumbnail_width x=$stripped_black_bloc.column_width}px;
		margin-bottom:{math equation="( x - y - 10)/2" y=$stripped_black_bloc.thumbnail_width x=$stripped_black_bloc.column_width}px;
{literal}
}
{/literal}{if isset($chronology_calendar)}{literal}
#subcontent {
	min-height: inherit;
}
{/literal}{/if}
{/html_style}

{footer_script load="async"}
{literal}
jQuery(window).bind("rvtsUp", function() {
jQuery('#rvtsUp').remove();
});
{/literal}
{/footer_script}

{html_head}
{literal}
<script type="text/javascript">

    // MASONRY

function tnb_resize() {
	$('#content_cell').isotope({
	 masonry: {
		columnWidth: {/literal} {if $stripped_black_bloc.column_width}{$stripped_black_bloc.column_width}{/if}{literal}
 },
		itemSelector: '.bloc, .bloc_big, .content_block, .bloc_stuff',
		isAnimated: true
	});
}
function FadeSC() {
jQuery(".bloc a").hover(function() { jQuery(this).fadeTo(500, 1); }, function() { jQuery(this).fadeTo(500, 0.75);  });
jQuery(".bloc_big a").hover(function() { jQuery(this).fadeTo(500, 1); }, function() { jQuery(this).fadeTo(500, 0.75);  });
}
jQuery(window).bind("RVTS_loaded", FadeSC);


jQuery(document).ready(function(jQuery){
  jQuery('#rvtsUp').remove();

	// fade onmouseover
	jQuery(".bloc a").hover(function() { jQuery(this).fadeTo(500, 1); }, function() { jQuery(this).fadeTo(500, 0.75);  });
  jQuery(".bloc_big a").hover(function() { jQuery(this).fadeTo(500, 1); }, function() { jQuery(this).fadeTo(500, 0.75);  });
  
	// sidemenu managment
	var sidemenu = jQuery.cookie('side-menu');
	var isdisplayed;
		// if cookie says the menu is hiding, keep it hidden!
	{/literal} {if $stripped.hideMenu} {literal} 
	if (sidemenu == 'showing') {
		jQuery("#content_cell").css({'margin-left' : '18em'});
		isdisplayed=true;
	}
	else {
		jQuery("#content_cell").css({'margin-left' : '0'});
		isdisplayed=false;
	}
	{/literal} {else} {literal} 
	if (sidemenu == 'hiding') {
		jQuery("#content_cell").css({'margin-left' : '0'});
		isdisplayed=false;
	}
	else {
		jQuery("#content_cell").css({'margin-left' : '18em'});
		isdisplayed=true;
	}
	{/literal} {/if} {literal} 
	// creates a variable with the contents of the cookie side-menu
	jQuery("#menuswitcher").click(function(){
		if (jQuery("#menubar").is(":hidden") || isdisplayed==false ) {
			jQuery("#content_cell").css({'margin-left' : '18em'});
			isdisplayed=true;
		} else {
			jQuery("#content_cell").css({'margin-left' : '0'});
			isdisplayed=false;
		}
	});
	tnb_resize();

});
  </script> 
{/literal}
{/html_head}
{/if}
