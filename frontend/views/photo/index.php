<?php

use yii\helpers\Html;
use yii\helpers\Url;

use frontend\widgets\UserPhotosBlock;

use common\components\helpers\ElementsHelper;
use common\components\helpers\SEOHelper;

/**
 * User photos page
 *
 * @var $this                    yii\web\View
 * @var $photos                  @frontend/models/Photo
*/

SEOHelper::setMetaInfo($this);

echo ElementsHelper::ajaxGridWrap(Yii::$app->controller->id, 'o-grid--no-gutter',

    # USER PHOTOALBUMS SIDEBAR - 25%
    Html::tag('div',

      # Photoalbums list
      '<div class="albums_area--loader loader--smallest"></div>'.
      Html::beginTag('div', ['id' => 'albums_area']).
        $this->render('../photoalbum/index', [
          'photoalbums' => $photoalbums
        ]).
      Html::endTag('div'),

    [
      'class' => 'o-grid__cell o-grid__cell--width-25 photos__albums'
    ]).

    # USER PHOTOS AREA - 75%
    Html::tag('div',

      # PHOTOS widget | @frontend/widgets/UserPhotosBlock.php
      UserPhotosBlock::widget([
        'photos' => $photos,
        'options' => [
          'title' => Yii::t('app', 'Photos'),
          'titleTag' => 'h1',
          'titleButtons' => [
            'addNewPhotoalbum'
          ],
          'class' => 'o-grid o-grid--wrap '.Yii::$app->controller->id.'__photos',
          'cell_wrap' => 'o-grid o-grid--wrap u-window-box--small '.Yii::$app->controller->id.'__wrap',
          'cell_class' => 'o-grid__cell o-grid__cell--width-33 u-window-box--small',
          'widgetButton' => [
            'action' => 'edit',
            'position' => 'bottomright',
            'size' => '2x'
          ],
        ]
      ]),

    [
      'id' => 'photos_area',
      'class' => 'o-grid__cell o-grid__cell--width-75 photos__list'
    ]),

    ['class' => 'photos__container']
);

/* JS: @see js/outstyle.user.photoalbums.js */
?>
<script>jQuery(document).ready(function(){photoalbumsInit()});</script>
