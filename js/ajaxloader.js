var thumbnails_queue = jQuery.manageAjax.create('queued', {
  queue: true,  
  cacheResponse: false,
  maxRequests: 3,
  preventDoubleRequests: false
});

function add_thumbnail_to_queue(link, loop) {
  thumbnails_queue.add({
    type: 'GET', 
    url: link.data('src'), 
    data: { ajaxload: 'true' },
    dataType: 'json',
    success: function(result) {
      link.css('background-image', 'url('+result.url+')');

    },
    error: function() {
      if (loop < 3)
        add_thumbnail_to_queue(link, ++loop); // Retry 3 times
    }
  }); 
}

function pwg_ajax_thumbnails_loader() {
  jQuery('a[data-src]').each(function() {
    add_thumbnail_to_queue(jQuery(this), 0);
  });
}

jQuery(document).ready(pwg_ajax_thumbnails_loader);