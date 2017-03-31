<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use frontend\models\SignupForm;
use yii\captcha\Captcha;

?>
<?php if(Yii::$app->user->isGuest){ ?>
    <?php $model = new SignupForm(); ?>
    <a href="javascript:void(0);" class="btn btn-primary" data-toggle="modal" data-target="#RegistryFormModal"><?=Yii::t('app', 'Регистрация (виджет)')?></a>
    <div class="modal fade" id="RegistryFormModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <?php $form = ActiveForm::begin(['id' => 'login-form', 'action' => Url::toRoute('site/signup')]); ?>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><?=Yii::t('app', 'Регистрация')?></h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <input type="hidden" name="returnUrl" value="<?=$returnUrl?>">
                            <?= $form->field($model, 'username') ?>
                            <?= $form->field($model, 'email') ?>
                            <?= $form->field($model, 'password')->passwordInput() ?>
                            <?//= $form->field($model, 'captcha')->widget(Captcha::className()) ?>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary"><?=Yii::t('app', 'Зарегистрироваться')?></button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><?=Yii::t('app', 'Отмена')?></button>
                </div>
                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>


<?php } ?>