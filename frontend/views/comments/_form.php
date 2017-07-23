<?php
/**
 * Comments form (used at particular single pages)
 * Questions? Feel free to ask: <scsmash3r@gmail.com> or skype: smash3rs
 * Also used by widgets/WidgetComments.php
 */

use yii\helpers\Url;
use yii\helpers\Html;

use app\models\UserAvatar;
use common\components\helpers\ElementsHelper;

/* @var $modelElemId */

# COMMENTS FORM: we are showing the comment FORM input only for registered users
if (!Yii::$app->user->isGuest && $modelElemId) {
    echo Html::tag('form',

      # COMMENTS FORM USER AVATAR
      Html::tag('div',

        Html::img(
          UserAvatar::getAvatarPath(Yii::$app->user->id),
          [
            'alt' => Yii::$app->user->identity->userdescription->name.' '.Yii::$app->user->identity->userdescription->last_name,
            'class' => 'roundborder u-pull-right color-'.Yii::$app->user->identity->userdescription->culture.'--border avatar avatar--smallest',
          ]
        ),

        [
          'class' => 'o-grid__cell o-grid__cell--top o-grid__cell--width-20 comments_add__avatar'
        ]
      ).

      # COMMENTS INPUT
      Html::tag('div',

        # COMMENTS TEXTFIELD
        Html::tag('div',
          Html::tag('textarea',
            '',
            [
              'id' => 'comments_message',
              'name' => 'comments_message',
              'class' => 'c-field u-xsmall c-field--ordinary',
              'placeholder' => Yii::t('app', 'Enter your comment...')
            ]
          ).
          '<i class="zmdi zmdi-plus zmdi-hc-2x c-icon" style="display:none"></i>',
          [
            'class' => 'o-field o-field--icon-right'
          ]
        ),

        [
          'class' => 'o-grid__cell o-grid__cell--width-60 o-grid__cell--no-gutter comments_add__body'
        ]
      ).

      # COMMENTS ADD BUTTON
      Html::tag('div',
        ElementsHelper::commentAddButton(Yii::$app->controller->id, $modelElemId),
        ['class' => 'o-grid__cell o-grid__cell--width-20']
      ),

      [
        'class' => 'o-grid o-grid--wrap o-grid--center u-letter-box--xlarge comments_add',
        'way-data' => 'comment',
        'way-persistent' => true
      ]
    );
}
