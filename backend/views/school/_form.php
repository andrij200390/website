<?php

/*
 * @var $this       yii\web\View
 * @var $model      common\models\School   School model with necessary data
 * @var $photoalbum common\models\School   Photoalbum model with necessary data
 * @var $categories common\models\School   School categories array
 * @var $status     common\models\School   School post publish statuses array
 */

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use backend\models\StatusPublication;
use common\models\School;
use common\components\helpers\StringHelper;
use common\components\helpers\PriceHelper;
use common\components\helpers\ElementsHelper;

use common\components\helpers\BlocksHelper;

/* Working with initial values */
$addFields = json_decode($model->additional);
$model->mirrors = $addFields->mirrors ?? $model->mirrors;
$model->materials = $addFields->materials ?? $model->materials;
$model->soundSoft = $addFields->soundSoft ?? $model->soundSoft;

/* If we're having an errors, that are sent by another model - displaying it after ajaxified validation */
if ($errors) {
    echo ElementsHelper::errorsContainer($errors);
}

/* Link to photoalbum edit */
if ($photoalbum) {
  echo
  Html::tag('p',
    Html::a(
      Yii::t('app','Edit photoalbum'),
      [('/photoalbum/'.$photoalbum->id.'/update')],
      ['class' => 'btn btn-primary']),
    [
      'class' => 'u-pull-right'
    ]
  );
} else {
  echo
  Html::tag('p',
    Html::a(
      Yii::t('app','Create photoalbum'),
      [('/photoalbum/create/'.Yii::$app->controller->id.'/'.$model->id)],
      ['class' => 'btn btn-primary']),
    [
      'class' => 'u-pull-right'
    ]
  );
}

echo Html::beginTag('div', ['class' => Yii::$app->controller->id.'-form cb']);

  $form = ActiveForm::begin(
    [
      'id' => 'form-create-'.Yii::$app->controller->id,
      'enableAjaxValidation' => true,
      'options' => ['enctype' => 'multipart/form-data']
    ]
  );

echo
    /* Form fields */
    $form->field($model, 'title')->textInput(['maxlength' => 64]),
    $form->field($model, 'category')->dropDownList($categories, ['prompt' => Yii::t('app', 'Не указана')]),

    /* Price and currency stuff */
    Html::beginTag('div', ['class' => 'row']),
      $form->field($model, 'price', ['options' => ['class' => 'col-md-6']])->textInput(['maxlength' => 255]),
      $form->field($model, 'price_currency', ['options' => ['class' => 'col-md-6']])->dropDownList(PriceHelper::getPriceCurrenciesList()),
    Html::endTag('div'),

    /* Geolocation dropdowns */
    $this->render('@common/views/geolocation/_form', [
      'geolocation_id' => $model->geolocation_id,
      'geolocation' => $model->geolocation
    ]),

    $form->field($model, 'phone')->textInput(['maxlength' => 255]),
    $form->field($model, 'site')->textInput(['maxlength' => 255]),
	  $form->field($model, 'description')->textArea(['rows' => 5]),

  	$form->field($model, 'trainingTime')->textInput(['value' => $addFields->trainingTime ?? '']),
  	$form->field($model, 'square')->textInput(['value' => $addFields->square ?? '']),
  	$form->field($model, 'floor')->textInput(['value' => $addFields->floor ?? '']),
  	$form->field($model, 'mirrors')->radioList([0 => Yii::t('app', 'No'), 1 => Yii::t('app', 'Yes')]),
  	$form->field($model, 'traininer')->textInput(['value' => $addFields->traininer ?? '']),
  	$form->field($model, 'equipment')->textInput(['value' => $addFields->equipment ?? '']),
  	$form->field($model, 'trains')->textInput(['value' => $addFields->trains ?? '']),
  	$form->field($model, 'materials')->radioList([0 => Yii::t('app', 'Own materials'), 1 => Yii::t('app', 'Provided by school')]),
  	$form->field($model, 'soundSoft')->radioList([0 => Yii::t('app', 'No'), 1 => Yii::t('app', 'Yes')]),

    $form->field($model, 'status')->dropDownList(StatusPublication::getStatusList()),
    $form->field($model, 'img_block_size')->dropDownList(BlocksHelper::getBlockSizeList());

    /* School main photo */
    if (strpos($model->getImageSrc(), 'noimage') !== false) {
        echo $form->field($model, 'img')->widget('demi\image\FormImageWidget', [
          'imageSrc' => $model->getImageSrc('250_'),
          'deleteUrl' => ['deleteImage', 'id' => $model->getPrimaryKey()],
          'cropUrl' => ['cropImage', 'id' => $model->getPrimaryKey()],
        ]);
    }

echo
    /* Submit button */
    Html::tag('div',
      Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']),
      [
        'class' => 'form-group'
      ]
    );

  ActiveForm::end();

echo Html::endTag('div');

/*
    ----------------------------------------------------------------------------
    JS stuff, that is related ONLY to this view
    ----------------------------------------------------------------------------
*/
?>
<script>
jQuery(document).ready(function () {

  /* Masked input: phone */
  $("#school-phone").mask("+9(999)999-99-99?99");


});
</script>
