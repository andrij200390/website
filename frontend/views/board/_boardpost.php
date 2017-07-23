<?php
use yii\helpers\Html;
use yii\helpers\Url;
use common\components\helpers\ElementsHelper;

/**
* Single board post
*
* @author [SC]Smash3r <scsmash3r@gmail.com>
*
* @version 1.0
*
* @link https://github.com/Outstyle/website
* @license Beerware
**/

/* @see @frontend/widgets/UserBoardPost for vars */
/* @var $posts */

echo

# POST WRAP
Html::tag('div',

  # POST HEADER
  Html::tag('div',

    123,

    [
      'class' => 'o-grid__cell o-grid__cell--width-100 o-grid__cell--no-gutter post__header'
    ]
  ),

  [
    'class' => 'o-grid__cell o-grid__cell--width-100 post'
  ]
);
