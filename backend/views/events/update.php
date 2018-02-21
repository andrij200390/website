<?php

use yii\helpers\Html;

/**
 * @var $this       yii\web\View
 * @var $model      common\models\Events   Events model with necessary data
 * @var $categories common\models\Events   Events categories array
 * @var $status     common\models\Events   Events post publish statuses array
 */

/* TODO: Yii:t() */
$this->title = 'Update Events: ' . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', ucfirst(Yii::$app->controller->id)), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';

?>
<div class="events-update">
    <h1><?= Html::encode($this->title) ?></h1>
    <?= $this->render('_form', [
        'model' => $model,
        'categories' => $categories,
        'status' => $status,
        'errors' => $errors
    ]) ?>
</div>
