<?php

use yii\helpers\Html;
use common\components\classes\Multiplayer;

# Video: https://github.com/felixgirault/multiplayer
$Multiplayer = new Multiplayer();

echo Html::tag('div',

  # Dynamic video container TODO: Link
  Html::tag('div',
    $Multiplayer->html('http://rutube.ru/play/embed/0081a91b6a80c85239647f62e0299749/', $options),
    [
      'class' => 'video__multicontainer'
    ]
  ),

  [
    'class' => 'o-grid__cell--width-100'
  ]
);
