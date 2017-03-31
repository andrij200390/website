<?php 
/**
 * User restore password modal
 * Used in portal.php layout
 * Modal related stuff: /js/jquery.easyModal.js
 */

use yii\widgets\ActiveForm;
use yii\helpers\Html;
use frontend\models\PasswordResetRequestForm;

$model = new PasswordResetRequestForm();
$modal_id = 'passwordrestore';

?>
	<div class="modal" id="<?=$modal_id;?>" role="dialog" data-modal-width="330" data-input-width="200">
		<div class="modal__content">
            <div class="modal__header modal__header--branded u-window-box--medium">
                <span class="modal__caption c-text--shadow"><?=Yii::t('app', 'Восстановление пароля');?></span>
                <button type="button" class="c-button c-button--close modal-close" title="<?=Yii::t('app', 'Закрыть');?>"><i class="zmdi zmdi-close"></i></button>
            </div>
            <?php $form = ActiveForm::begin([
                    'id' => 'form-'.$modal_id,
                    'enableAjaxValidation' => true,
                    'action' => ['api/main/passwordrestore'],
                    'options' => ['enctype' => 'multipart/form-data']
                ]); 
            ?>
            <div class="modal__body">
                <div class="u-pillar-box--super">
                    <div class="clearfix"></div>
                    <?php
                        echo '<p>'.Yii::t('app', 'Введите e-mail, указанный при регистрации:').'</p>';
                        echo $form->field($model, 'email')->label('E-mail<sup>*</sup>');
                        echo '<p>'.Yii::t('app', 'На этот адрес будет выслано письмо с временным паролем, который вы сможете поменять в настройках профайла.').'</p>';
                    ?>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="modal__footer modal__footer--centered u-window-box--medium">
                <?php echo Html::submitButton(Yii::t('app', 'Выслать пароль'), ['id'=>$modal_id.'-submit', 'class' => 'c-button c-button--large']); ?>
            </div>
            <?php ActiveForm::end(); ?>
		</div>
	</div>