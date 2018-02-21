<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = Yii::t('app', 'Главная').' - '.Yii::$app->name;
$this->registerMetaTag(['name' => 'description', 'content' => $this->title]);

?>
<div class="site-index">
  <h4 class="u-c"><?=Yii::t('app', 'Welcome to {sitename}', ['sitename' => Yii::$app->name]); ?></h4>

  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-4 col-md-3 sidebar">
        <h6>- <?=Yii::t('app', 'Essentials'); ?> -</h6>
        <ul class="nav nav-sidebar">
          <li class="active"><a href="#"><span class="glyphicon glyphicon-file" aria-hidden="true"></span> Backend overview</a></li>
          <li><a href="#"><span class="glyphicon glyphicon-file" aria-hidden="true"></span> For developers</a></li>
          <li><a href="#"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> Contacts</a></li>
        </ul>
        <h6>- <?=Yii::t('app', 'Settings'); ?> -</h6>
        <ul class="nav nav-sidebar">
          <li><a href="<?=Url::to(['/category']); ?>"><span class="glyphicon glyphicon-fire" aria-hidden="true"></span> Elements (Categories)</a></li>
          <li><a href="<?=Url::to(['/photoalbum']); ?>"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span> Photoalbums</a></li>
        </ul>
      </div>
      <div class="col-sm-8 offset-sm-3 col-md-9 offset-md-2 main">
        <h1>Backend Overview</h1>
        Some text with instructions will be here.

        Some hints:
        <ul>
          <li>body tag will have '.user-guest' class for any unregistered user and 'user-registered' class for any logged in user.</li>
          <li><strong>common\components\helpers\ElementsHelper</strong> is for rendering common outstyle tags (like buttons, comment buttons, etc.)</li>
        </ul>

      </div>
    </div>
  </div>

</div>
