/*
Don't use directly. Compile on http://closure-compiler.appspot.com/home
*/
if (window.jQuery && window.RVTS)
(function($){
$('.navigationBar').hide();
if (RVTS.start>0) {
	var $f = $('.navigationBar A[rel=first]');
	var f = '<a href="'+$f.attr("href")+'">'+$f.html()+'</a> | ';
	$('#content_cell').before( '<div id=rvtsUp_sc style="text-align:center;font-size:120%;margin:10px">'+f+'<a href="javascript:RVTS.loadUp()">'+RVTS.prevMsg+"</a></div>" );
  $(window).trigger('rvtsUp');
}
 RVTS.doAutoScroll = undefined;
 RVTS.checkAutoScroll = undefined;
 RVTS.engage = undefined;
 RVTS.loadUp = undefined;

RVTS = $.fn.extend( RVTS, {
loading: 0,
loadingUp: 0,
adjust: 0,

loadUp: function() {
	if (RVTS.loadingUp || RVTS.start <= 0) return;
	var newStart = RVTS.start-RVTS.perPage,
		reqCount = RVTS.perPage;
	if (newStart<0)
	{
		reqCount += newStart;
		newStart = 0;
	}
	var url = RVTS.ajaxUrlModel.replace('%start%', newStart).replace('%per%', reqCount);
	$('#ajaxLoader').show();
	RVTS.loadingUp = 1;
	$.ajax({
		type:'GET', dataType:'html', 'url': url,
		success: function(htm) {
			RVTS.start = newStart;
			//RVTS.$thumbs.prepend(htm);
      var $newItems = $(htm);
      //$('#content_cell').prepend( $newItems ).isotope( 'reloadItems' ).isotope({ sortBy: 'original-order' });
      $('#thumbnails').prepend( $newItems );
      $('#content_cell').isotope( 'reloadItems' ).isotope({ sortBy: 'original-order' });
			if (RVTS.start<=0)
				$("#rvtsUp").remove();
		},
		complete: function() {
			RVTS.loadingUp = 0;
			RVTS.loading || $('#ajaxLoader').hide();
			$(window).trigger('RVTS_loaded');
			if (typeof pwg_ajax_thumbnails_loader != 'undefined')
				pwg_ajax_thumbnails_loader();
			}
		});
},

doAutoScroll: function() {
	if (RVTS.loading || RVTS.next >= RVTS.total) return;
	var url = RVTS.ajaxUrlModel.replace('%start%', RVTS.next).replace('%per%', RVTS.perPage);
	if (RVTS.adjust) {
		url += '&adj=' + RVTS.adjust;
		RVTS.adjust=0;
	}
	$('#ajaxLoader').show();
	RVTS.loading = 1;
	$.ajax({
		type:'GET', dataType:'html', 'url': url,
		success: function(htm) {
			RVTS.next+=RVTS.perPage;
			//RVTS.$thumbs.append(htm);
      var $newItems = $(htm);
      $('#content_cell').append( $newItems ).isotope( 'appended', $newItems );
      
			if (RVTS.next-RVTS.start>500 && RVTS.total-RVTS.next>50) {
				RVTS.$thumbs.after(
					'<div style="text-align:center;font-size:180%;margin:0 0 20px"><a href="'
					+RVTS.moreUrlModel.replace('%start%', RVTS.next)+'">'
					+RVTS.moreMsg.replace('%d', RVTS.total-RVTS.next)
					+'</a></div>');
				RVTS.total = 0;
			}
		},
		complete: function() {
			RVTS.loading = 0;
			RVTS.loadingUp || $('#ajaxLoader').hide();
			$(window).trigger('RVTS_loaded');
			if (typeof pwg_ajax_thumbnails_loader != 'undefined')
				pwg_ajax_thumbnails_loader();
			}
		});
},

checkAutoScroll: function(evt) {
	var tBot=$('#content_cell').position().top+$('#content_cell').outerHeight()
		,wBot=$(window).scrollTop()+$(window).height();
	tBot -= !evt ? 0:100; //begin 100 pixels before end
	return tBot <= wBot ? (RVTS.doAutoScroll(),1) : 0;
},

engage: function() {
	var $w = $(window);
	RVTS.$thumbs = $('#thumbnails');
	RVTS.$thumbs.after('<div id="ajaxLoader" style="display:none;position:fixed;bottom:32px;right:1%;z-index:999"><img src="'+ RVTS.ajaxLoaderImage + '" width="128" height="15" alt="~"></div>');

	$w.scrollTop(0);
	if ( RVTS.$thumbs.outerHeight() < $w.height() )
		RVTS.adjust = 1;
	else if ( RVTS.$thumbs.height() > 2*$w.height() )
		RVTS.adjust = -1;
	$w.bind('scroll resize', RVTS.checkAutoScroll);
	if (RVTS.checkAutoScroll())
		window.setTimeout(RVTS.checkAutoScroll,1500);
}
} );//end extend

$(document).ready( function() {
	window.setTimeout(RVTS.engage,250);
});



})(jQuery);