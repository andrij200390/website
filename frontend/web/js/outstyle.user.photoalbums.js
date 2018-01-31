var photoalbum_container = '#userphotoalbum';
var photoalbum_area = '#albums_area';
var photoalbum_form = '#form-create-photo';
var photoalbum_upload = '#form-upload-to-photoalbum';
var photoalbum_loader = '<div class="loader--smallest u-pull-right"></div>';

/*
  Initialize photoalbums. This needs to be done after every AJAX call
  @see: photoalbum/index
*/
function photoalbumsInit() {

  /* Check if we already have our scrollbars initialized (we need to rely on setTimeout for history support) */
  /* @see: https://github.com/KingSora/OverlayScrollbars */
  setTimeout(function() {
    var photosAlbumsInstance = jQuery(photoalbum_area).overlayScrollbars({}).overlayScrollbars();
    jQuery(photoalbum_area)
      .show()
      .prev()
      .remove();
  }, 75);

}

/* Photoalbums history.back() events */
jQuery(document).on("beforeHistorySnapshot.ic", function(evt, target) {

  /* We need to destroy OverlayScrollbars instance in order to reinitialize it back from history cache */
  var photosAlbumsInstance = jQuery(photoalbum_area).overlayScrollbars({}).overlayScrollbars();
  if (typeof photosAlbumsInstance !== 'undefined') {
      photosAlbumsInstance.destroy();
  }

});

/**
 * Fires on photoalbum creation modal window
 */
function userShowPhotoalbumModal() {
    jQuery(photoalbum_container).trigger('openModal');
    appendNotification(photoalbum_container); /* outstyle.notifications.js */
}
function userHidePhotoalbumModal() {
    jQuery(photoalbum_container).trigger('closeModal');
}

/**
 * Fires on attachments modal close
 */
jQuery(photoalbum_container).on('closeModal', function(e) {
    removeNotification(photoalbum_container); /* outstyle.notifications.js */
});

/* Create new photoalbum event */
jQuery(photoalbum_form).on('beforeSubmit', function(event, jqXHR, settings) {
    var form = jQuery(this);
    if(form.find('.has-error').length) {
        return false;
    }

    jQuery.ajax({
        url: form.attr('action'),
        type: 'post',
        data: form.serialize(),

        beforeSend: function() {
            jQuery('#createphotoalbum-submit')
              .hide()
              .after(photoalbum_loader);
        },

        complete: function(){
            jQuery('#createphotoalbum-submit')
              .show()
              .next()
              .remove();
        },

        success: function(data) {

            /* Clearing the form itself */
            form.find('#photoalbum-name').val('');
            form.find('#photoalbum-text').val('');

            /* Hiding photoalbum creation modal window */
            userHidePhotoalbumModal();

            /* Appending new album into the albums area + flickering effect */
            jQuery(data)
              .prependTo(photoalbum_area + ' .os-content')
              .addClass('album__added album__highlight')
              .hide()
              .fadeIn("slow", function() {
                  jQuery(this).removeClass('album__highlight');
              });

            /* Init Intrcooler stuff on element */
            Intercooler.processNodes(photoalbum_area + ' .os-content');
        }
    });

    return false;
});
