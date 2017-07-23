way.restore();

/* COMMENT DELETE */
jQuery("body").on("commentDelete", function(event, data) {
    if (jQuery.type(data) === "number") {
        jQuery(".user-registered div[data-comment-id='"+data+"']").addClass('comment__deleted').fadeOut('slow');
    }
});

/* COMMENT ADD */
jQuery("body").on("commentAdd", function(event, data) {

    setTimeout(function(){
        if (jQuery.type(data) === "number") {

            /* Make freshly added message flicker */
            jQuery(".user-registered div[data-comment-id='"+data+"']")
            .addClass('comment__added comment__highlight')
            .hide()
            .fadeIn("slow", function() {
                jQuery(this).removeClass('comment__highlight');
            });

            way.restore();
            way.remove('comment'); /* Removing old comment contents from localStorage */
            way.backup();

            jQuery('#comments_message').html(); /* Clearing message textarea */
            jQuery('#ohsnap').empty();

        } else {
          /* --- If we encounter an error --- */
          ohSnap(data[Object.keys(data)[0]], {'color':'red'});
        }

    },50);

});


/* OVERALL COMMENTS INITIALIZATION */
function commentsInit() {

    /* --- Showing 'delete' icon on single comment area hover [ONLY FOR REGISTERED] --- */
    jQuery('.user-registered .comment__wrap').hover(function() {
         jQuery(this).find('.comment__delete').show();
    }, function() {
         jQuery(this).find('.comment__delete').hide();
    });

    /* --- Autosizing for textareas: http://www.jacklmoore.com/autosize/ --- */
    autosize(jQuery('textarea'));

    way.restore();
    var comment = way.get('comment.comments_message');
    if (comment) {
        jQuery('#comments_message').html(comment);
    }

    /* COMMENT BEFORE SEND */
    jQuery(document).on("beforeAjaxSend.ic", function(event, settings) {

        /* --- Before sending our Intercooler AJAX request, we check for stored values from way.js and pass them too */
        way.restore();
        var comment = way.get("comment");

        if (comment) {
            comment = jQuery.param(comment);
            settings.data = settings.data+'&'+comment;
        }

    });

}
