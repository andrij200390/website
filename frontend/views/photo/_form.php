<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use common\components\helpers\html\UploadHelper;
use common\models\Photo;

/**
 * @var $this        yii\web\View
 * @var $model       common\models\Photoalbum
 * @var $photos      common\models\Photo
 * @var $album_id    PhotoalbumController -> actionView() | $_POST param
**/

/**
* Model for form to work with
* @var object $model
*/

$model = new Photo();

$form = ActiveForm::begin(
  [
    'id' => 'form-upload-to-'.Yii::$app->controller->id,
    'action' => Url::toRoute(['api/photo/upload']),
    'enableAjaxValidation' => false,
    'options' => [
      'class' => 'dm-uploader',
      'enctype' => 'multipart/form-data'
    ],
  ]
);

  echo UploadHelper::uploadBox(
    '<i class="zmdi zmdi-cloud-upload zmdi-hc-5x color-dj"></i><p>'.
      Yii::t('app', 'This album has no photos yet.').'<br>'.
      Yii::t('app', 'Drag and drop files into this area to upload').
    '</p>'.

    /* Add new photos widget */
    $form->field($model, 'img')->widget('demi\image\FormImagesWidget')->label(false).
    $form->field($model, 'album')->hiddenInput(['value'=> $album_id])->label(false).
    $form->field($model, 'album_photos_count')->hiddenInput(['value'=> count($photos)])->label(false)

  );

ActiveForm::end();

echo UploadHelper::uploadFilesTemplate();

/* JS: @see js/outstyle.files.upload.js */
?>
<script>jQuery(document).ready(function(){uploadPhotoFormInit('#form-upload-to-photoalbum');});</script>
