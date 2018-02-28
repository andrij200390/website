/**
 * Modal related stuff
 * Depends on: misc/jquery.easyModal.js
 * TODO: ref[+], const values remove, review?
 *
 * @param  {string} modalId             Element ID (i.e. #myModal)
 * @param  {bool}   canBeOpenedByHash   If set to 'true', can be initiated by hash
 */
function modalInit(modalId, canBeOpenedByHash) {



  var modal_width = jQuery(modalId).data('modal-width');
  var modal_height = jQuery(modalId).data('modal-height');
  var input_width = jQuery(modalId).data('input-width');

  if (modal_width) {
      jQuery(modalId).find('.modal__content').css({'width':modal_width+'px'});
  }
  if (modal_height) {
      jQuery(modalId).find('.modal__content').css({'min-height':modal_height+'px'});
  }
  if (input_width) {
      jQuery(modalId).find('input').css({'width':input_width+'px'});
  }

  jQuery(modalId).easyModal({
    overlayOpacity: 0.9,
    overlayColor: '#1b2022',
    overlayClose: true,
    onOpen: function(myModal){

        jQuery(myModal)
          .addClass('modal-visible')
          .appendTo('body');

        var widest = 0;
        var help_block_offset = 6;
        jQuery('.modal-visible .form-group label').each(function () { widest = Math.max(widest, jQuery(this).outerWidth()); }).width(widest);
        jQuery('.help-block').css({'margin-left':widest+help_block_offset+'px'});

        var modal_top = jQuery(myModal).data('modal-top');
        if (modal_top) {
            jQuery(myModal).css({'top':modal_top+'px','margin-top':0});
        }
    },
    onClose: function(myModal){
      jQuery(myModal).removeClass('modal-visible');
    }
  });

  jQuery('.modal-open').bind('click', function(e) {
      var target = jQuery(this).attr('href');
      jQuery(target).trigger('openModal');
      e.preventDefault();
  });

  jQuery('.modal-close').bind('click', function(e) {
      jQuery('.modal').trigger('closeModal');
  });

  if(window.location.hash) {
      var hash = window.location.hash;
      if (hash == modalId && canBeOpenedByHash) {
          jQuery(hash).trigger('openModal');
      }
  }
}


/* History.back support for closing up modal (IC) TODO: evt.currentTarget.URL.indexOf to handle video modal show up when going historyback */
jQuery(document).on("handle.onpopstate.ic", function(evt) {
    jQuery('.modal').trigger('closeModal');
    jQuery('.lean-overlay').remove();
});
jQuery(document).on("beforeHistorySnapshot.ic", function(evt) {
    jQuery('.lean-overlay').remove();
});
