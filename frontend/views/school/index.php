<?php
use yii\helpers\Html;
use common\components\helpers\ElementsHelper;

$this->title = Yii::t('app', 'Schools');
$this->registerMetaTag([
  'name' => 'description',
  'content' => $this->title
]);

/**
 * Main schools grid, that must be wrapped in #ajax for Intercooler
 *
 * @var $model           common/models/School
 * @var $categories      common/models/School
 * @var $page            common/models/School
 */

echo ElementsHelper::ajaxGridWrap('school', 'o-grid--no-gutter',
    $this->render('_schoolgrid',
    [
      'model' => $model,
      'categories' => $categories,
      'page' => $page,
      'page_height' => $page_height,
    ])
  );
