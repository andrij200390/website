<?php

use yii\helpers\Html;
use yii\helpers\Url;

use common\components\helpers\ElementsHelper;
use frontend\widgets\UserVideosBlock;
use frontend\widgets\UserPhotosBlock;

/**
 * Active user attachments preview
 *
 * @var object  $this                   yii\web\View
 * @var array   $attachments            @frontend/controllers/AttachmentsController
 * @var integer $elem_type              @frontend/controllers/AttachmentsController
 * @var string  $elem_type_parent       @frontend/controllers/AttachmentsController
*/

/**
 * This param is needed for localstorage sync, when user deletes attachment, that is not yet sent
 * It is a common variable for all attachment types
 * This is needed because attachment can be of the same type + repeat, or can be of different types (with or without repeat)
 * We must always know the position of localstorage data and currently active attachments
 * @var integer
 */
$order_key = 0;

if (!empty($attachments)) {

    # Common wrap for all attachments
    echo Html::beginTag('div', ['class' => 'o-grid o-grid--wrap']);

    foreach ($attachments as $attachment_type => $attachment) {
        # VIDEOS widget | @frontend/widgets/UserVideosBlock.php
        if ($attachment_type == 8) {
            echo UserVideosBlock::widget([
              'videos' => $attachments[8],
              'options' => [
                'cell_class' => (count($attachments[8]) > 1 || count($attachments) > 1) ? 'o-grid__cell user__attachment' : 'o-grid__cell--no-wrap user__attachment',
                'widgetButton' => [
                  'action' => 'delete',
                  'position' => 'topright',
                  'size' => '2x',
                  'indicator' => '#'.$elem_type_parent.'_attachments_loader'
                ],
                'attachment' => [
                  'elem_type' => $elem_type,
                  'elem_key' => $order_key
                ]
              ]
            ]);
        }

        # PHOTOS widget | @frontend/widgets/UserPhotosBlock.php
        if ($attachment_type == 7) {
            echo UserPhotosBlock::widget([
              'photos' => $attachments[7],
              'options' => [
                'cell_class' => (count($attachments[7]) > 1 || count($attachments) > 1) ? 'o-grid__cell user__attachment' : 'o-grid__cell--no-wrap user__attachment',
                'widgetButton' => [
                  'action' => 'delete',
                  'position' => 'topright',
                  'size' => '2x',
                  'indicator' => '#'.$elem_type_parent.'_attachments_loader'
                ],
                'attachment' => [
                  'elem_type' => $elem_type,
                  'elem_key' => $order_key
                ]
              ]
            ]);
        }

        $order_key++;
    }

    # Common wrap for all attachments END
    echo Html::endTag('div');
}
