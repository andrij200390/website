<?php
/**
 * User photos block view
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
use common\components\helpers\TooltipsHelper;

/* @see @frontend/widgets/UserPhotosBlock for vars */
/* @var $photos */
/* @var $options */

# Widget wrapper
echo Html::beginTag('div', ['class' => $options['class']]);

# Widget "+" button for title
if (isset($options['titlePlusButton'])) {
    $options['title'] .= Html::button(
      '<i class="zmdi zmdi-plus zmdi-hc-lg"></i>',
    [
      'id' => 'photo__editbutton',
      'class' => 'c-button c-button--white c-button--large tooltip u-pull-right',
      'data-tooltip-content' => '#photos_edit_tooltip_content',
      'title' => Yii::t('app', 'Edit'),
    ]);

    # Widget "+" tooltip container, shown on click (binds via 'data-tooltip-content')
    echo TooltipsHelper::tooltipContainerForPhotoalbum();
}

# Widget title
if (isset($options['title'])) {
    echo Html::tag(
      $options['titleTag'],
      $options['title']
    );
}

# Working with each image
if (!empty($photos)) {
    foreach ($photos as $key => $photo) {
        echo Html::tag('div',

          # Widget settings button
          ElementsHelper::widgetButton(
            $options['widgetButton']['action'],
            $options['widgetButton']['position'],
            $options['widgetButton']['size'],
            $options['widgetButton']['indicator']
          ).

          # Photo image
          ElementsHelper::photoLink($photo['id'], Html::img($photo['img'], ['class' => 'o-image u-full-width user__photothumbnail'])).

          # Photo title and link
          ElementsHelper::photoLink($photo['id'], $photo['name']).

          # Photo date and provider
          Html::tag('div',

            Yii::t('app', '{photo_date} via outstyle', [
              'photo_date' => Yii::$app->formatter->asDateTime(strtotime($photo['created']), Yii::$app->params['date'])
            ]),

            [
              'class' => 'user__photodate'
            ]
          ),

          [
            'class' => trim($options['cell_class'].' user__photo'),
            'data-lc-key' => $options['attachment']['elem_type'], /* Data for working with localstorage attachment */
            'data-lc-elem' => $options['attachment']['elem_key']+$key /* Data for working with localstorage attachment */
          ]
        );
    }
}

# Widget wrapper END
echo Html::endTag('div');


/* JS: @see js/outstyle.user.photoalbums.js */
?>
<script>jQuery(document).ready(function(){photoalbumsInit()});</script>
