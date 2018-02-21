<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

use frontend\widgets\Alert;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

$this->title = Yii::t('app', 'Вход').' - '.Yii::$app->name;
$this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
$this->params['breadcrumbs'][] = Yii::t('app', 'Вход');
?>
<div class="site-login">
    <h1><?= Yii::t('app', 'Вход') ?></h1>
    <p><?= Yii::t('app', 'Пожалуйста, заполните следующие поля для входа') ?>:</p>
    <div class="row">
        <div class="col-lg-5">
        
            <?php if(Yii::$app->session->hasFlash('cess')){?>
                <div class="info">
                    <?php echo Yii::$app->session->getFlash('cess'); ?>
                </div>
            <?php }else{ ?>
                <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>
                    <?= $form->field($model, 'username') ?>
                    <?= $form->field($model, 'password')->passwordInput() ?>
                    <?= $form->field($model, 'rememberMe')->checkbox() ?>

                    <?php 
                        if($attempt){
                           echo $form->field($model, 'captcha')->widget(Captcha::className());
                        }  
                    ?>

                    <div style="color:#999;margin:1em 0">
                        <?= Yii::t('app', 'Если вы забыли свой пароль вы можете') ?> <?= Html::a(Yii::t('app', 'восстановить пароль'), ['site/requestPasswordReset']) ?>.
                    </div>
                    <div class="form-group">
                        <?= Html::submitButton(Yii::t('app', 'Войти'), ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
                    </div>
                <?php ActiveForm::end(); ?>
            <?php }?>
        </div>
    </div>
</div>
