<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\PasswordResetRequestForm */

$this->title = Yii::t('app', 'Восстановить пароль.').' - '.Yii::$app->name;
$this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
$this->params['breadcrumbs'][] = Yii::t('app', 'Восстановить пароль.');
?>
<div class="site-request-password-reset">
    <h1><?= Yii::t('app', 'Восстановить пароль.') ?></h1>

    <p><?= Yii::t('app', 'Пожалуйста, укажите email. Ссылка для восстановления пароля будет отправлена вам.') ?></p>

    <div class="row">
        <div class="col-lg-5">
            <?php $form = ActiveForm::begin(['id' => 'request-password-reset-form']); ?>
                <?= $form->field($model, 'email') ?>
                <div class="form-group">
                    <?= Html::submitButton(Yii::t('app', 'Отправить'), ['class' => 'btn btn-primary']) ?>
                </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
