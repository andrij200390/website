<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
$this->title = Yii::t('app', 'О нас').' - '.Yii::$app->name;
$this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
$this->params['breadcrumbs'][] = Yii::t('app', 'О нас');
?>
<div class="site-about">
    <h1><?= Yii::t('app', 'О нас') ?></h1>

    <p>This is the About page. You may modify the following file to customize its content:</p>

</div>
