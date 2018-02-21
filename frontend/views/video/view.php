<?php

use yii\helpers\Html;
use yii\helpers\Url;

use common\components\helpers\ElementsHelper;
use common\components\helpers\SEOHelper;

/**
 * Single video preview
 *
 * @var $this                   yii\web\View
 * @var $video                  @frontend/models/Video
*/

SEOHelper::setMetaInfo($this);

echo ElementsHelper::ajaxGridWrap(Yii::$app->controller->id, 'o-grid--no-gutter',
    $this->render('_videosingle', ['video' => $video]),
    ['class' => 'video__container']
 );
