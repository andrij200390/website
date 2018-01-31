<?php

use yii\helpers\Html;
use yii\helpers\Url;

use frontend\widgets\UserVideosBlock;

use common\components\helpers\ElementsHelper;
use common\components\helpers\SEOHelper;

/**
 * User videos page
 *
 * @var $this                    yii\web\View
 * @var $videos                  @frontend/models/Video
*/

SEOHelper::setMetaInfo($this);

# VIDEOS widget | @frontend/widgets/UserVideosBlock.php
echo UserVideosBlock::widget([
  'videos' => $videos,
  'options' => [
    'title' => Yii::t('app', 'Videos'),
    'titleTag' => 'h1',
    'class' => 'o-grid o-grid--wrap '.Yii::$app->controller->id.'__videos',
    'cell_wrap' => 'o-grid o-grid--wrap u-window-box--small '.Yii::$app->controller->id.'__wrap',
    'cell_class' => 'o-grid__cell o-grid__cell--width-33 u-window-box--small',
    'widgetButton' => [
      'action' => 'delete',
      'position' => 'bottomright',
      'size' => '2x'
    ],
  ]
]);
