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
/* @var $options */

if (!empty($videos)) {

    # Widget wrapper
    if (isset($options['class'])) {
        echo Html::beginTag('div', ['class' => $options['class']]);
    }

    # Widget title
    if (isset($options['title'])) {
        echo Html::tag($options['titleTag'], $options['title']);
    }

    # Videos wrapper
    if (isset($options['cell_wrap'])) {
        echo Html::beginTag('div', ['class' => $options['cell_wrap']]);
    }

    # Working with each video
    foreach ($videos as $key => $video) {
        echo Html::tag('div',

          # Widget settings button
          ElementsHelper::widgetButton(
            $options['widgetButton']['action'],
            $options['widgetButton']['position'],
            $options['widgetButton']['size'],
            $options['widgetButton']['indicator']
          ).

          # Video image
          ElementsHelper::videoLink(
            $video['hash'],
            Html::img($video['video_img'], ['class' => 'o-image u-full-width user__videothumbnail'])
          ).

          # Video title and link
          ElementsHelper::videoLink(
            $video['hash'],
            $video['video_title']
          ).

          # Video date and provider
          Html::tag('div',

            Yii::t('app', '{video_date} via {video_provider}', [
              'video_date' => Yii::$app->formatter->asDateTime(strtotime($video['created_at']), Yii::$app->params['date']),
              'video_provider' => $video['service_id'],
            ]),

            [
              'class' => 'user__videodate'
            ]
          ),

          [
            'class' => trim($options['cell_class'].' user__video'),
            'data-lc-key' => $options['attachment']['elem_type'], /* Data for working with localstorage attachment */
            'data-lc-elem' => $options['attachment']['elem_key']+$key /* Data for working with localstorage attachment */
          ]
        );
    }

    # Videos wrapper END
    if (isset($options['cell_wrap'])) {
        echo Html::endTag('div');
    }

    # Widget wrapper END
    if (isset($options['class'])) {
        echo Html::endTag('div');
    }
}
