var photoalbum_container = '#userphotoalbum';
var photoalbum_delete_container = '#userphotoalbumdelete';
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

  /* Activating tooltip on "+" button */
  /* @see: http://iamceege.github.io/tooltipster/ */
  jQuery('#photo__editbutton').tooltipster({
      trigger: 'click',
      side: 'bottom',
      distance: -3,
      contentAsHTML: true,
      interactive: true
  });

  sidebarHighlightActiveMenuItem('#menu__item-photo');

}

/* On succesfull opening of album, when clicking the album div */
jQuery("body").on("photoalbumOpen", function(event, data) {

  var activeOpenedAlbum = jQuery("#album-"+data.album);
  jQuery(photoalbum_area)
    .find('.album')
    .parent()
    .removeClass('album-active');
  activeOpenedAlbum
    .parent()
    .addClass('album-active');
});

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
jQuery(photoalbum_container).on('closeModal', function(e) {
    removeNotification(photoalbum_container); /* outstyle.notifications.js */
});

/**
 * Fires on photoalbum delete modal window
 */
function userShowPhotoalbumDeleteModal(albumId) {
    var activeAlbum = jQuery("#album-"+albumId);
    var activeAlbumTitle = activeAlbum.find('.album__title span').html();

    jQuery(photoalbum_delete_container).trigger('openModal');
    jQuery(photoalbum_delete_container).find('h3').html(activeAlbumTitle);
}
function userHidePhotoalbumDeleteModal() {
    jQuery(photoalbum_delete_container).trigger('closeModal');
}

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

            /* Prevent any actions if albums limit reached - show notice instead */
            if (data.photoalbumsLimit) {
              ohSnapX();
              ohSnap(data.photoalbumsLimit[0], {'color':'red'});
              return;
            }

            /* Clearing the form itself */
            form.find('#photoalbum-name').val('');
            form.find('#photoalbum-text').val('');

            /* Hiding photoalbum creation modal window */
            userHidePhotoalbumModal();

            /* Moving scrollbar of albums list to top, so we could see new album appearance */
            jQuery(photoalbum_area)
              .overlayScrollbars({})
              .overlayScrollbars()
              .scroll({x:0,y:0});

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
