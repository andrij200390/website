<?php 
/**
 * User restore password modal
 * Used in portal.php layout
 * Modal related stuff: /js/jquery.easyModal.js
 */

use yii\widgets\ActiveForm;
use yii\helpers\Html;
use app\models\UserDescription;
use frontend\models\UserAvatar;
use frontend\models\SignupForm;

$modelDescription = new UserDescription();
$modelAvatar = new UserAvatar();
$modelSignup = new SignupForm();

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
    
<div id="modal-login-regisration" class="modal-div-login-regisration">
    <div class="modal_close">
        <div id="close_for_modal" class="close-foto"></div>
        <h1>Регистрация</h1>
    </div>
    
    <div class="content-login-regisration">
        <?php $form = ActiveForm::begin([
                    'action' => ['main/signup'], 
                    'id' => 'form-registrate',
                    'enableAjaxValidation' => true,
                    'options' => ['enctype' => 'multipart/form-data']]); 
        ?>
        
        <!--<input type="hidden" name="process" value="1">-->
        
        <div class="wp-login-regisration-form1">  
              <div class="wp-login-regisration-list-i mail">
                  <div class="wp-login-regisration-list-i-text">E-mail</div>
                  <!-- <input class="wp-login-regisration-input" type="email"> -->
                  <?php echo $form->field($modelSignup, 'email', ['enableAjaxValidation' => true])->label(false); ?>
                  <div class="clearboth"></div>

              </div>
              <div class="wp-login-regisration-list-i">
                  <div class="wp-login-regisration-list-i-text">Пароль</div>
                  <!-- <input class="wp-login-regisration-input" type="password"> -->
                  <?php $form->field($modelSignup, 'password')->passwordInput()->label(false) ?>
                  <div class="clearboth"></div>
              </div>
              <div class="wp-login-regisration-list-i">
                  <div class="wp-login-regisration-list-i-text">Еще раз</div>
                  <!-- <input class="wp-login-regisration-input" type="password"> -->
                  <?php $form->field($modelSignup, 'repeatPassword')->passwordInput()->label(false)?>
                  <div class="clearboth"></div>
              </div>

<!--               <div class="wp-login-regisration-descpassword">Пароль должен содержать символы, буквы и зверюшек</div>-->
        </div>
        
        <div class="wp-login-regisration-form2">
            <div class="regisration-download-ava">
                <p class="regisration-download-ava-title">Аватар</p>
                <div class="regisration-download__btn">Выберите фаил</div>
                <span class="regisration-download__text">Выберите фаил</span>
                <!-- <input class="choosefaile" accept="image/*,image/jpeg" type="file"> -->
                <?php echo $form->field($modelAvatar, 'image', ['enableAjaxValidation' => true])->fileInput()->hint(Yii::t('app', 'Допустимые файлы: png,jpg,gif,jpeg, размер не более: {ras}МБ', ['ras' => 1]))->label(false, ['style'=>'display:none']); ?>
            </div>
            <div class="login-regisration-form2-content">
                <div class="wp-login-regisration-list-i">
                    <div class="wp-login-regisration-list-i-text">Имя</div>
                    <!-- <input class="wp-login-regisration-input" type="text"> -->
                    <?php echo $form->field($modelDescription, 'name')->label(false); ?>
                    <div class="clearboth"></div>
                </div>
                <div class="wp-login-regisration-list-i">
                    <div class="wp-login-regisration-list-i-text">Фамилия</div>
                    <!-- <input class="wp-login-regisration-input" type="text"> -->
                    <?php echo $form->field($modelDescription, 'last_name')->label(false); ?>
                    <div class="clearboth"></div>
                </div>
                <div class="wp-login-regisration-list-i">
                    <div class="wp-login-regisration-list-i-text">Никнейм</div>
                     <!--<input class="wp-login-regisration-input" type="text" required>-->
                    <?php echo $form->field($modelSignup, 'username', ['enableAjaxValidation' => true])->label(false); ?>

                    <div class="clearboth"></div>
                </div>
                <div class="wp-login-regisration-list-item">
                    <div class="wp-login-regisration-list-item-text">Пол</div>
                    <div class="wp-login-regisration-popup-list">
<!--                          <select>
                            <option>Бибой</option>
                        </select> -->
                        <?php echo $form->field($modelDescription, 'sex')->dropDownList(UserDescription::setSexList())->label(false); ?>
                    </div>
                    <div class="clearboth"></div>
                </div>
                <div class="wp-login-regisration-list-item">
                    <div class="wp-login-regisration-list-item-text">Кто вы в культуре</div>
                    <div class="wp-login-regisration-popup-list">
<!--                          <select>
                            <option>Бибой</option>
                        </select> -->
                        <?php echo $form->field($modelDescription, 'culture')->dropDownList(UserDescription::getCultureList())->label(false); ?>
                    </div>
                    <div class="clearboth"></div>
                </div>
            </div>
        </div>
        <div  class="foot-modal">
            <!-- <button class="btn-for-modal-login-regisration">Зарегистрироваться</button> -->
            <?php echo Html::submitButton(Yii::t('app', 'Зарегистрироваться'), ['class' => 'btn-for-modal-login-regisration']); ?>
        </div>
        <?php ActiveForm::end(); ?>
    </div>
</div>