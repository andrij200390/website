<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $user common\models\User */

$resetLink = Yii::$app->urlManager->createAbsoluteUrl(['news/index', 'token' => $user->password_reset_token]);
?>
<div class="password-reset">
    <p><?=Yii::t('app', 'Добрый день')?> <?= Html::encode($user->username) ?>,</p>

    <p><?=Yii::t('app', 'Перейдите по ссылке ниже, чтобы восстановить пароль')?>:</p>

    <p><?= Html::a(Html::encode($resetLink), $resetLink) ?></p>
</div>
