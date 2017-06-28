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

echo Html::beginTag('div', ['class' => 'user__videos u-window-box--medium']);

  # Widget settings button
  echo ElementsHelper::widgetButton();

  # Widget title
  echo Html::tag('h4', Yii::t('app', 'Videos'));


  foreach ($videos as $video) {
      echo Html::tag('div',

        # Video image
        Html::a(Html::img($video['url_img'], ['class' => 'o-image video__thumbnail']), Url::toRoute('/video-'.$video['hash'], true)).

        # Video title
        Html::a($video['title'], Url::toRoute('/video-'.$video['hash'], true),
          [
            'class' => 'video__title',
            'ic-action' => 'userShowVideoModal',
            'ic-get-from' => Url::toRoute('/video-'.$video['hash']),
            'ic-select-from-response' => '#content',
            'ic-target' => '#content',
            'ic-push-url' => true,
          ]
        ).

        # Video date and provider
        Html::tag('div',

          Yii::t('app', '{video_date} via {video_provider}', [
            'video_date' => Yii::$app->formatter->asDateTime(strtotime($video['created']), Yii::$app->params['date']),
            'video_provider' => $video['service'],
          ]),

          [
            'class' => 'video__date'
          ]
        ),

        [
          'class' => 'u-letter-box--medium user__video',
        ]
      );
  }

echo Html::endTag('div');
