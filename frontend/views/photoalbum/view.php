<?php

use yii\helpers\Html;
use yii\helpers\Url;

use frontend\widgets\UserPhotosBlock;

/**
 * Album photos list
 *
 * @var $this                     yii\web\View
 * @var $photos                   @frontend/models/Photoalbum
 * @var $album_id                 PhotoalbumController -> actionView() | $_POST param
 * @var $album_name               PhotoalbumController -> actionView() | $_POST param
*/

echo Html::tag('div',

    # PHOTOS widget | @frontend/widgets/UserPhotosBlock.php
    UserPhotosBlock::widget([
      'photos' => $photos,
      'options' => [
        'title' => $album_name ? $album_name : Yii::t('app', 'Photos'),
        'titleTag' => 'h1',
        'titlePlusButton' => true,
        'class' => 'o-grid o-grid--wrap '.Yii::$app->controller->id.'__photos',
        'cell_wrap' => 'o-grid o-grid--wrap u-window-box--small '.Yii::$app->controller->id.'__wrap',
        'cell_class' => 'o-grid__cell o-grid__cell--width-33 u-window-box--small',
        'widgetButton' => [
          'action' => 'edit',
          'position' => 'bottomright',
          'size' => '2x'
        ],
      ]
    ]).

    # PHOTOS ADD FORM
    # We also need to pass $album_id, cause photo can not be added without being tied to photoalbum
    Html::tag('div',

      $this->render('../photo/_form', [
        'photos' => $photos,
        'album_id' => $album_id,
      ]),

    [
      'class' => 'photo__add'
    ]),

    ['id' => 'photos_list']
);
