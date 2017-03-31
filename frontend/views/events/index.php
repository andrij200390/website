<?php

use yii\helpers\Html;
use common\components\helpers\ElementsHelper;

$this->title = Yii::t('app', 'Events');
$this->registerMetaTag([
  'name' => 'description',
  'content' => $this->title
]);

/**
 * Main events grid, that must be wrapped in #ajax for Intercooler
 *
 * @var $model       common/models/Events
 * @var $categories  common/models/Events
 * @var $page        common/models/Events
 */

echo ElementsHelper::ajaxGridWrap(Yii::$app->controller->id, 'o-grid--no-gutter',
    $this->render('_eventsgrid',
      [
        'modelEvents' => $modelEvents,
        'eventsCategories' => $eventsCategories,
        'page' => $page,
        'category' => $category ?? ''
      ]
    )
  );
