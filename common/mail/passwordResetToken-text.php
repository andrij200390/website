<?php

/* @var $this yii\web\View */
/* @var $user common\models\User */

$resetLink = Yii::$app->urlManager->createAbsoluteUrl(['news/index', 'token' => $user->password_reset_token]);
?>
<?=Yii::t('app', 'Добрый день')?> <?= $user->username ?>,

<?=Yii::t('app', 'Перейдите по ссылке ниже, чтобы восстановить пароль')?>:

<?= $resetLink ?>
