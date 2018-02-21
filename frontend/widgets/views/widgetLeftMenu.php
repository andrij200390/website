<?php

use yii\helpers\Html;
use yii\helpers\Url;

?>
<?php if(is_array($menu) && sizeof($menu) > 0){ ?>
<ul class="nav nav-pills nav-stacked">
<?php foreach($menu AS $name => $url){ ?>
    <li<?=((Url::current() == $url)?' class="active"':'')?>><a href="<?=$url?>" title="<?=Html::encode($name)?>"><?=$name?></a></li>
<?php } ?>
</ul>
<?php } ?>
