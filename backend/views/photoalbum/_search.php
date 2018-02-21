<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\search\Photoalbum */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="photoalbum-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'user') ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'url') ?>

    <?= $form->field($model, 'text') ?>

    <?php // echo $form->field($model, 'created') ?>

    <?php // echo $form->field($model, 'privacy_album') ?>

    <?php // echo $form->field($model, 'portal_album') ?>

    <?php // echo $form->field($model, 'privacy_comments') ?>

    <?php // echo $form->field($model, 'cover') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
