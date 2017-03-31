<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use common\components\helpers\ElementsHelper;

/*
 * @var $this        yii\web\View
 * @var $model       common\models\Photoalbum
 * @var $photos      common\models\Photo
 */

/* If we're having an errors, that are sent by another model - displaying it after ajaxified validation */
if ($errors) {
    echo ElementsHelper::errorsContainer($errors);
}

echo Html::beginTag('div', ['class' => Yii::$app->controller->id.'-form']);

  $form = ActiveForm::begin(
    [
      'id' => 'form-create-'.Yii::$app->controller->id,
      'enableAjaxValidation' => true,
      'options' => ['enctype' => 'multipart/form-data'],
    ]
  );

echo
    /* Form fields */
    $form->field($model, 'user')->textInput(),
    $form->field($model, 'name')->textInput(['maxlength' => true]),
    $form->field($model, 'url')->textInput(['maxlength' => true]),
    $form->field($model, 'text')->textarea(['rows' => 6]),
    $form->field($model, 'created')->textInput(),
    $form->field($model, 'privacy')->textInput(),
    $form->field($model, 'cover')->textInput();

    /* Add new photos */
    echo $form->field($photo, 'img')->widget('demi\image\FormImagesWidget', [
      'images' => $existingPhotos,
      'thumbnailSize' => '150x150_',
    ]);

echo
    /* Submit button */
    Html::tag('div',
      Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']),
      [
        'class' => 'form-group',
      ]
    );

  ActiveForm::end();

echo Html::endTag('div');
