<?php

use yii\helpers\Html;

/*
 * @var $this       yii\web\View
 * @var $model      common\models\School   School model with necessary data
 * @var $photoalbum common\models\School   Photoalbum model with necessary data
 * @var $categories common\models\School   School categories array
 * @var $status     common\models\School   School post publish statuses array
 */

$this->title = 'Редактирование школы: '.' '.$model->title;
$this->params['breadcrumbs'][] = ['label' => 'Школы', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Редактирование школы';
?>
<div class="school-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'photoalbum' => $photoalbum,
        'categories' => $categories,
        'status' => $status,
        'errors' => $errors,
    ]) ?>

</div>
