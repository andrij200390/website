<?php

use yii\helpers\Html;
use common\components\helpers\ElementsHelper;

/* @var $this yii\web\View */
$this->title = $modelEvents[0]['title'];
$this->registerMetaTag([
  'name' => 'description',
  'content' => (($modelEvents[0]['description']) ? $modelEvents[0]['description'] : $modelEvents[0]['name'])
]);

/**
 * Single event view, that must be wrapped by #ajax for Intercooler
 * @var $modelEvents      common/models/Events -> getEvents()
 */

echo
ElementsHelper::ajaxGridWrap('events-single', 'o-grid--no-gutter color-content--bg '.Yii::$app->controller->id,
  $this->render('_eventssingle',

    [
      'modelEvents' => $modelEvents
    ])
);
