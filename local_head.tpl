{if ($BODY_ID=='theCategoryPage')}
{combine_script id='jquery.masonry' load='header' require='jquery' path='themes/stripped_black_bloc/js/masonry.js'}
{html_head}{literal} 
<script type="text/javascript">
function tnb_resize() {
	$('#subcontent').masonry({
		singleMode: true, 
		columnWidth: 200, 
		itemSelector: '.bloc',
		animate: true
	});

}
jQuery(document).ready(function(jQuery){
	
	jQuery(".bloc a").hover(function() { jQuery(this).fadeTo(500, 1); }, function() { jQuery(this).fadeTo(500, 0.75);  });
	var sidemenu = jQuery.cookie('side-menu');
	var isdisplayed;
		// if cookie says the menu is hiding, keep it hidden!
	if (sidemenu == 'hiding') {
		jQuery("#subcontent").css({'margin-left' : '0'});
		isdisplayed=false;
	}
	if (sidemenu == 'showing') {
		jQuery("#subcontent").css({'margin-left' : '20em'});
		isdisplayed=true;
	}
	// creates a variable with the contents of the cookie side-menu
	jQuery("#menuswitcher").click(function(){
		if (jQuery("#menubar").is(":hidden") || isdisplayed==false ) {
			jQuery("#subcontent").css({'margin-left' : '20em'});
			isdisplayed=true;
		} else {
			jQuery("#subcontent").css({'margin-left' : '0'});
			isdisplayed=false;
		}
	});

	jQuery('#subcontent').masonry({
		  singleMode: true, 
		columnWidth: 200, 
		itemSelector: '.bloc',
		animate: true
	});
});
  </script> 
{/literal}
{/html_head}
{/if}
