<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use common\components\helpers\ElementsHelper;
use common\models\Photo;

/**
 * @var $this        yii\web\View
 * @var $model       common\models\Photoalbum
 * @var $photos      common\models\Photo
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

  # In case if we don't have any images in album, showing a message
  if (!$photos) {
      ElementsHelper::uploadBox(
        '<i class="zmdi zmdi-cloud-upload zmdi-hc-5x color-dj"></i><p>'.
          Yii::t('app', 'This album has no photos yet.').'<br>'.
          Yii::t('app', 'Drag and drop files into this area to upload').
        '</p>'.

        /* Add new photos widget */
        $form->field($model, 'img')->widget('demi\image\FormImagesWidget')->label('')

      );
  }

  ActiveForm::end();

?>
<ul class="list-unstyled p-2 d-flex flex-column col" id="files">
  	<li class="text-muted text-center empty">No files uploaded.</li>
  </ul>
  <?php

/* JS: @see js/outstyle.files.upload.js */
?>
<script>jQuery(document).ready(function(){uploadFormInit('#form-upload-to-photoalbum');});</script>
