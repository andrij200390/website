<?php

use yii\helpers\Html;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

$this->title = Yii::t('app', '404 - Page not found');
?>
<div id="banksy_was_here">
  <h1><?php echo $exception->statusCode.' '.Yii::t('app', 'Page not found!'); ?></h1>
  <img src="<?php echo Yii::$app->homeUrl; ?>css/i/outstyle_404_overlay.png">
  <?=Html::a('← '.Yii::t('app', 'Get back to tha hood!'), Url::to(['/']), ['id' => 'steal_this_link']);?>
</div>
