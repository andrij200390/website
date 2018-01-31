<?php

/**
 * New Photoalbum creation form
 *
 * @var $this       yii\web\View
 * @var $model      common\models\Photoalbum
**/

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use common\components\helpers\ElementsHelper;
use common\components\helpers\PrivacyHelper;

use common\models\Photoalbum;

/**
 * Model for form to work with
 * @var object $model
 */
$model = new Photoalbum();

echo
Html::beginTag('div', [
  'class' => Yii::$app->controller->id.'-form u-window-box--super'
]);

  $form = ActiveForm::begin(
    [
      'id' => 'form-create-'.Yii::$app->controller->id,
      'action' => Url::toRoute(['api/photoalbum/create']),
      'enableAjaxValidation' => false,
      'options' => ['enctype' => 'multipart/form-data']
    ]
  );

echo
    /* Form fields */
    $form->field($model, 'name')->textInput(['maxlength' => 64]),
    $form->field($model, 'text')->textarea(['maxlength' => 255, 'rows' => 8]),

    $form->field($model, 'privacy', [
      'options' => ['class' => 'form-group form-group--transparent form-group--small form-group--separated']
    ])->dropDownList(PrivacyHelper::getPrivacyList()),

    $form->field($model, 'privacy_comments', [
      'options' => ['class' => 'form-group form-group--transparent form-group--small']
    ])->dropDownList(PrivacyHelper::getPrivacyList()),

    /* Submit button */
    Html::tag('div',
        Html::submitButton(
            Yii::t('app', 'Create album'),
            [
                'id' => 'createphotoalbum-submit',
                'class' => 'c-button u-small i-createphotoalbum u-pull-right',
                'title' => Yii::t('app', 'Create album')
            ]
        ),
        ['class' => 'modal__footer modal__footer--centered u-letter-box--large clearfix']
    );

  ActiveForm::end();

echo Html::endTag('div');
