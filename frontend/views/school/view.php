<?php

use common\components\helpers\ElementsHelper;

/*
 * Single school view, that must be wrapped by #ajax for Intercooler
 * @var $model      common/models/School -> getSchools()
 * @var $this       yii\web\View
 */

$this->title = $model[0]['title'];
$description = isset($model[0]['description']) ? $model[0]['description'] : $this->title;

$this->registerMetaTag([
  'name' => 'description',
  'content' => $description,
]);

echo
ElementsHelper::ajaxGridWrap('school school_single', 'o-grid--no-gutter color-content--bg',
  $this->render('_schoolsingle',
    [
      'school' => $model,
      'categories' => 0,
      'page' => 0,
    ])
);
