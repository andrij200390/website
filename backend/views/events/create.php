<?php

use yii\helpers\Html;

/*
 * @var $this       yii\web\View
 * @var $model      backend\models\Events   Events model with necessary data
 * @var $categories backend\models\Events   Events categories array
 * @var $status     backend\models\Events   Events post publish statuses array
 */

$this->title = Yii::t('app', 'Add Event');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', ucfirst(Yii::$app->controller->id)), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="events-create">
    <h1><?= Html::encode($this->title) ?></h1>
    <?= $this->render('_form', [
        'model' => $model,
        'categories' => $categories,
        'status' => $status,
        'errors' => $errors,
    ]) ?>
</div>
