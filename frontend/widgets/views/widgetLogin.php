<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use common\models\LoginForm;

?>
<?php if(Yii::$app->user->isGuest){ ?>
    <?php $login = new LoginForm(); ?>
<a href="javascript:void(0);" class="btn btn-primary" data-toggle="modal" data-target="#LoginFormModal"><?=Yii::t('app', 'Вход (виджет)')?></a>
<div class="modal fade" id="LoginFormModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <?php $form = ActiveForm::begin(['id' => 'login-form', 'action' => Url::toRoute('site/login')]); ?>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><?=Yii::t('app', 'Вход')?></h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12">
                        <input type="hidden" name="returnUrl" value="<?=$returnUrl?>">
                        <?= $form->field($login, 'username') ?>
                        <?= $form->field($login, 'password')->passwordInput() ?>
                        <?= $form->field($login, 'rememberMe')->checkbox() ?>
                        <div style="color:#999;margin:1em 0">
                            <?= Yii::t('app', 'Если вы забыли свой пароль вы можете') ?> <?= Html::a(Yii::t('app', 'восстановить пароль'), ['site/requestPasswordReset']) ?>.
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary"><?=Yii::t('app', 'Войти')?></button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><?=Yii::t('app', 'Отмена')?></button>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
<?php } ?>
