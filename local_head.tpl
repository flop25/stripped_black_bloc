{if ($BODY_ID=='theCategoryPage')}
{combine_script id='jquery.isotope' load='header' require='jquery' path='themes/stripped_black_bloc/js/isotope.js'}
{html_head}{literal}
<style>
#theHeader a, .titrePage a, .footer_login a, .navigationBar a {
	color: {/literal}{if $stripped_black_bloc.color_main}#{$stripped_black_bloc.color_main}{/if}{literal};
}
.bloc, .gmapsMarkup {
	max-width: {/literal}{if $stripped_black_bloc.thumbnail_width}{$stripped_black_bloc.thumbnail_width}{/if}{literal}px;
}
.bloc a{
	max-width:{/literal}{if $stripped_black_bloc.thumbnail_width}{$stripped_black_bloc.thumbnail_width}{/if}{literal}px;
}
.bloc_big {
	max-width: {/literal}{if $stripped_black_bloc.thumbnail_width}{$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width}{/if}{literal}px;
}
.bloc_big a {
	max-width:{/literal}{if $stripped_black_bloc.thumbnail_width}{$stripped_black_bloc.thumbnail_width+$stripped_black_bloc.column_width}{/if}{literal}px;
}
.content_block, .bloc_stuff, .two_columns {
	width:{/literal}{if $stripped_black_bloc.thumbnail_width}{$stripped_black_bloc.column_width*2-10}{/if}{literal}px;
}
.stuffs_thumbnails, .stuffs_thumbnails #thumbnails, .one_column {
	width:{/literal}{if $stripped_black_bloc.thumbnail_width}{$stripped_black_bloc.thumbnail_width-10 }{/if}{literal}px;
}
.bloc, .bloc_big {
{/literal}
    margin-top: {math equation="( x - y - 10)/2" y=$stripped_black_bloc.thumbnail_width x=$stripped_black_bloc.column_width}px;
		margin-bottom:{math equation="( x - y - 10)/2" y=$stripped_black_bloc.thumbnail_width x=$stripped_black_bloc.column_width}px;
{literal}
}
{/literal}{if isset($chronology_calendar)}{literal}
#subcontent {
	min-height: inherit;
}
{/literal}{/if}{literal}

</style>
<script type="text/javascript">
/**
* jQuery Cookie plugin
*
* Copyright (c) 2010 Klaus Hartl (stilbuero.de)
* Dual licensed under the MIT and GPL licenses:
* http://www.opensource.org/licenses/mit-license.php
* http://www.gnu.org/licenses/gpl.html
*
*/
jQuery.cookie = function (key, value, options) {

    // key and at least value given, set cookie...
    if (arguments.length > 1 && String(value) !== "[object Object]") {
        options = jQuery.extend({}, options);

        if (value === null || value === undefined) {
            options.expires = -1;
        }

        if (typeof options.expires === 'number') {
            var days = options.expires, t = options.expires = new Date();
            t.setDate(t.getDate() + days);
        }

        value = String(value);

        return (document.cookie = [
            encodeURIComponent(key), '=',
            options.raw ? value : encodeURIComponent(value),
            options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
            options.path ? '; path=' + options.path : '',
            options.domain ? '; domain=' + options.domain : '',
            options.secure ? '; secure' : ''
        ].join(''));
    }

    // key and possibly options given, get cookie...
    options = value || {};
    var result, decode = options.raw ? function (s) { return s; } : decodeURIComponent;
    return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
};

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


jQuery(document).ready(function(jQuery){

	// fade onmouseover
	jQuery(".bloc a").hover(function() { jQuery(this).fadeTo(500, 1); }, function() { jQuery(this).fadeTo(500, 0.75);  });

	// sidemenu managment
	var sidemenu = jQuery.cookie('side-menu');
	var isdisplayed;
		// if cookie says the menu is hiding, keep it hidden!
	{/literal} {if $stripped.hideMenu} {literal} 
	if (sidemenu == 'showing') {
		jQuery("#content_cell").css({'margin-left' : '20em'});
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
		jQuery("#content_cell").css({'margin-left' : '20em'});
		isdisplayed=true;
	}
	{/literal} {/if} {literal} 
	// creates a variable with the contents of the cookie side-menu
	jQuery("#menuswitcher").click(function(){
		if (jQuery("#menubar").is(":hidden") || isdisplayed==false ) {
			jQuery("#content_cell").css({'margin-left' : '20em'});
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
