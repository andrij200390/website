<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;


$this->title = Yii::t('app', 'Главная').' - '.Yii::$app->name;
$this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
?>
<div class="site-index">
    <div class="jumbotron">
        <h1><?=Yii::t('app', 'Главная')?></h1>
    </div>

</div>
