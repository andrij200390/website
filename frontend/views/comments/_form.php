<?php
/**
 * Comments form (used at particular single pages)
 * Questions? Feel free to ask: <scsmash3r@gmail.com> or skype: smash3rs
 */

use app\models\UserAvatar;

use yii\helpers\Url;
use yii\helpers\Html;

use common\components\helpers\ElementsHelper;

/* --- We are showing the comment form input only for registered users --- */
    if (!Yii::$app->user->isGuest) {
        ?>
        <form class="o-grid o-grid--wrap o-grid--center u-letter-box--xlarge comments_add" way-data="comment" way-persistent>
            <div class="o-grid__cell o-grid__cell--top o-grid__cell--width-20 comments_add__avatar">
                <?=UserAvatar::getImg(Yii::$app->user->id, 'small', 'roundborder u-pull-right avatar--smallest'); ?>
            </div>
            <div class="o-grid__cell o-grid__cell--width-60 o-grid__cell--no-gutter comments_add__body">
                <div class="o-field o-field--icon-right">
                    <textarea id="comments_message"
                              name="comments_message"
                              class="c-field u-xsmall c-field--ordinary"
                              placeholder="<?=Yii::t('app', 'Введите ваш комментарий...'); ?>"></textarea>
                    <i class="zmdi zmdi-plus zmdi-hc-2x c-icon" style="display:none"></i>
                </div>
            </div>
            <div class="o-grid__cell o-grid__cell--width-20">
                <?=ElementsHelper::commentAddButton(Yii::$app->controller->id, $modelElemId);?>
            </div>
        </form>
    <?php

    }

    /**
     * -------------- COMMENTS LIST BLOCK --------------
     */

    echo Html::beginTag('div', ['id' => 'outstyle_comments']),
            Html::beginTag('div', ['class' => 'o-grid o-grid--wrap o-grid--center comments_list']),
                Html::tag('div', '', ['class' => 'o-grid__cell o-grid__cell--width-10']),
                Html::beginTag('div', ['class' => 'o-grid__cell o-grid__cell--width-80 o-grid__cell--no-gutter comments_body']),
                    $this->render('_commentblock', [
                        'modelComments' => $modelComments,
                    ]),
                Html::endTag('div'),
                    Html::tag('div', '', ['class' => 'o-grid__cell o-grid__cell--width-10']),
            Html::endTag('div'),
         Html::endTag('div');

/*
    JS stuff, that is related ONLY to this form
*/
?>
<script>
jQuery(document).ready(function () {

    /* --- Restoring the values in case user side error (i.e. browser window refresh to prevent data loss) --- */
    way.restore();

    /* --- Showing 'delete' icon on single comment area hover [ONLY FOR REGISTERED] --- */
    jQuery('.user-registered .comment__wrap').hover(function() {
         jQuery(this).find('.comment__delete').show();
    }, function() {
         jQuery(this).find('.comment__delete').hide();
    });

    /* --- Some bindings to the news view page --- */
    /* off.on is necessary to prevent event duplicate, when getting from another page to this one and back and so on */

    jQuery("body").off("commentDelete").on("commentDelete", function(event, data) {
        if (jQuery.type(data) === "number") {
            jQuery(".user-registered div[data-comment-id='"+data+"']").addClass('comment__deleted').fadeOut('slow');
        }
    });

    jQuery("body").off("commentAdd").on("commentAdd", function(event, data) {

        jQuery('#comments_message').html(); /* Also clearing message textarea */
        jQuery('#ohsnap').empty();

        setTimeout(function(){
            if (jQuery.type(data) === "number") {
                way.remove("comment"); /* Removing old comment contents from localStorage */
                jQuery(".user-registered div[data-comment-id='"+data+"']")
                .addClass('comment__added comment__highlight')
                .hide()
                .fadeIn("slow", function() {
                    jQuery(this).removeClass('comment__highlight');
                });
            } else {
              /* --- If we encounter an error --- */
              ohSnap(data[Object.keys(data)[0]], {'color':'red'});
            }
        },50);

    });

    /* --- Autosizing for textareas: http://www.jacklmoore.com/autosize/ --- */
    autosize(jQuery('textarea'));

    var comment = way.get('comment.comments_message');
    if (comment) {
        jQuery('#comments_message').html(comment);
    }

    /* --- Before sending our Intercooler AJAX request, we check for stored values from way.js and pass them too --- */
    jQuery(document).on("beforeAjaxSend.ic", function(event, settings) {
        var comment = way.get("comment");
        if (comment) {
            comment = jQuery.param(comment);
            settings.data = settings.data+'&'+comment;
        }
    });

});
</script>
