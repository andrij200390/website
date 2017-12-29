<?php

use yii\helpers\Html;
use yii\helpers\Url;

use common\components\helpers\ElementsHelper;
use frontend\widgets\UserPhotosBlock;

/**
 * Attachments to choose preview (in modal window)
 *
 * @var $this                   yii\web\View
 * @var $model                  @frontend/controllers/AttachmentsController
 * @var $elem_type              @frontend/controllers/AttachmentsController
*/

echo ElementsHelper::ajaxGridWrap(Yii::$app->controller->id.'_photo', 'o-grid--no-gutter u-window-box--medium',

    # PHOTOS widget | @frontend/widgets/UserPhotosBlock.php
    UserPhotosBlock::widget([
      'photos' => $model,
      'options' => [
        'class' => 'o-grid o-grid--wrap',
        'cell_class' => 'o-grid__cell o-grid__cell--width-25',
        'view' => 'userPhotosAttachment',
        'attachment' => [
          'elem_type' => $elem_type
        ]
      ]
    ])

);
