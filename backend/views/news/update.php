<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\News */

$this->title = Yii::t('app', 'Редактировать {modelClass}: ', [
    'modelClass' => 'новость',
]) . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Новости'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Редактировать');
?>
<div class="news-update">

    <h1><i class="glyphicon glyphicon-pencil"></i> <?= $model->name; ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
