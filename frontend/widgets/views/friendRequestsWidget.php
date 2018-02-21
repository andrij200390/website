<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;

?>
<?php if(!Yii::$app->user->isGuest){ ?>
    <div class="modal fade" id="<?=$idDOM?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <?php $form = ActiveForm::begin(['id' => 'friend-form', 'action' => Url::toRoute('friend/new')]); ?>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><?=Yii::t('app', 'Добавить в друзья')?> <?$user->userdescriptions->name?> (<?=$user->username?>)</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <?= $form->field($model, 'user')->textInput(['type' => 'hidden', 'value' => $user->id])->label('') ?>
                            <?= $form->field($model, 'text')->textarea() ?>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary"><?=Yii::t('app', 'Отправить запрос')?></button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><?=Yii::t('app', 'Отмена')?></button>
                </div>
                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>
<?php } ?>