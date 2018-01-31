<?php

use yii\helpers\Html;
use yii\helpers\Url;

use common\components\helpers\ElementsHelper;
use common\components\helpers\SEOHelper;

/**
 * Single photo preview
 *
 * @var $this                   yii\web\View
 * @var $photo                  @frontend/models/Photo
*/

SEOHelper::setMetaInfo($this);

echo ElementsHelper::ajaxGridWrap(Yii::$app->controller->id, 'o-grid--no-gutter',
    $this->render('_photosingle', ['photo' => $photo]),
    ['class' => 'photo__container']
 );
