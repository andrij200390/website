<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Photoalbum */
/* @var $existingPhotos common\models\Photo */
/* @var $photo common\models\Photo */

/* Check on this Yii::t() proper way */
$this->title = Yii::t('app', '{action} {modelClass}', [
    'action' => Yii::t('app','Update'),
    'modelClass' => Yii::$app->controller->id,
]).': '.$model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Photoalbums'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Edit');
?>
<div class="photoalbum-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'existingPhotos' => $existingPhotos,
        'photo' => $photo,
        'errors' => $errors ?? '',
    ]) ?>

</div>
