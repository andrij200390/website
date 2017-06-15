<?php
/**
 * User videos block view
 * Part of Outstyle network
 *
 * @author [SC]Smash3r <scsmash3r@gmail.com>
 *
 * @version 1.0
 *
 * @link https://github.com/Outstyle/website
 * @license Beerware
 */

use yii\helpers\Html;
use yii\helpers\Url;
use common\components\helpers\ElementsHelper;

/* @see @frontend/widgets/UserVideosBlock for vars */
/* @var $videos */

echo Html::tag('div',
  ElementsHelper::widgetButton().
  'Videos',

[
  'class' => 'user__videos u-window-box--medium'
]);
