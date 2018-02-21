<?php

use common\components\helpers\ElementsHelper;
use common\components\helpers\SEOHelper;

/*
 * Single school view, that must be wrapped by #ajax for Intercooler
 * @var $model      common/models/School -> getSchools()
 * @var $this       yii\web\View
 */

SEOHelper::setMetaInfo($this);

echo
ElementsHelper::ajaxGridWrap('school school_single', 'o-grid--no-gutter color-content--bg',
  $this->render('_schoolsingle',
    [
      'school' => $model,
      'categories' => 0,
      'page' => 0,
    ])
);
