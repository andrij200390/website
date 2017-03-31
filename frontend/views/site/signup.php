<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\SignupForm */

$this->title = Yii::t('app', 'Регистрация').' - '.Yii::$app->name;
$this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
$this->params['breadcrumbs'][] = Yii::t('app', 'Регистрация');
?>
<div class="site-signup">
    <h1><?= Yii::t('app', 'Регистрация') ?></h1>
    <p><?= Yii::t('app', 'Пожалуйста, заполните следующие поля, чтобы зарегистрироваться') ?>:</p>
    <div class="row">
        <div class="col-lg-5">
            <?php $form = ActiveForm::begin(['id' => 'form-signup']); ?>
                <?= $form->field($model, 'username') ?>
                <?= $form->field($model, 'email') ?>
                <?= $form->field($model, 'password')->passwordInput() ?>
                <?//= $form->field($model, 'captcha')->widget(Captcha::className()) ?>

                <div class="form-group">
                    <?= Html::submitButton(Yii::t('app', 'Зарегистрироваться'), ['class' => 'btn btn-primary', 'name' => 'signup-button']) ?>
                </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
