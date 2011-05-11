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

jQuery(document).ready(function(){
	$('#subcontent').masonry({
		  singleMode: true, 
		columnWidth: 200, 
		itemSelector: '.bloc',
		animate: true
	});
	
$(".bloc a").hover(function() { $(this).fadeTo(500, 1); }, function() { $(this).fadeTo(500, 0.75);  });
});
	jQuery("#menuswitcher").click(function(){

});
  </script> 
{/literal}
{/html_head}
{/if}
