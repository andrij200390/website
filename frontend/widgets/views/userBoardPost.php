<?php
/**
 * Comments form (used at particular single pages)
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

/* @see @frontend/widgets/UserBoardPost for vars */
/* @var $posts */

echo
Html::beginTag('div', [
    'id' => 'posts_section',
    'class' => 'o-grid o-grid--no-gutter'
  ]
);

  # POST
  echo $this->render('../../views/board/_boardpost',
    ['posts' => $posts ?? '']
  );

echo Html::endTag('div');

/* JS: @see js/outstyle.userboard.posts.js */
?>
<script>jQuery(document).ready(function(){userboardPostsInit();});</script>
