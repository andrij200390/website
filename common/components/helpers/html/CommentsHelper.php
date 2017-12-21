<?php

namespace common\components\helpers\html;

use Yii;
use yii\helpers\Html;
use yii\helpers\Url;

use common\components\helpers\ElementsHelper;

/**
 * Provides all the needed HTML tag elements for better work with comments
 * @see: @common\components\helpers\ElementsHelper
 */
class CommentsHelper extends ElementsHelper
{
    /**
     * Generates an active button element to send API requests for comments.
     *
     * @param string     $elem_type    elem_type from DB (see self::$allowedElements)
     * @param int        $elem_id      elem_id from DB (taxonomy/relations)
     *
     * @return html the generated HTML button tag
     */
    public static function commentAddButton($elem_type = '', $elem_id = 0)
    {
        $class = preg_replace('!\s+!', ' ', trim("c-button u-small i-send u-pull-right"));

        return
        Html::button(
          Yii::t('app', 'Send'),
        [
          'class' => $class,
          'title' => Yii::t('app', 'Send'),
          'ic-indicator' => self::DEFAULT_AJAX_LOADER,
          'ic-include' => '{"elem_type":"'.$elem_type.'","elem_id":'.(int) $elem_id.'}',
          'ic-target' => '#'.$elem_type.'_comments .comments_body',
          'ic-get-from' => Url::toRoute(['comments/add']),
          'ic-append-from' => Url::toRoute(['comments/add']),
          'ic-push-url' => 'false',
          'ic-select-from-response' => '#new_comment'
        ]);
    }

    /**
     * Comments form show link
     *
     * @param  string  $controllerId Current controller
     * @param  int     $elem_id      elem_id from DB (taxonomy/relations)
     *
     * @return html the generated HTML button tag
     */
    public static function commentShowFormLink($controllerId = '', $elem_id = 0)
    {
        return
        Html::a('<i class="zmdi zmdi-comment-text-alt"></i><span>'.Yii::t('app', 'Post comment').'</span></a>',
          'javascript:void(0)',
          [
            'class' => 'i-icon show-comment-form-link',
            'ic-include' => '{"elem_type":"'.$controllerId.'","elem_id":'.(int)$elem_id.',"'.Yii::$app->request->csrfParam.'":"'.AttachmentsHelper::getCSRFToken().'"}',
            'ic-target' => '#comments-'.$elem_id,
            'ic-indicator' => "#outstyle_loader",
            'ic-get-from' => Url::toRoute(['comments/show']),
          ]
        );
    }
}
