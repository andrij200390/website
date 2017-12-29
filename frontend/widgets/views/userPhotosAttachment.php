<?php
/**
 * User photos attachments view
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
use common\components\helpers\html\AttachmentsHelper;

/* @see @frontend/widgets/UserPhotosBlock for vars */
/* @var $photos */
/* @var $options */

echo Html::beginTag('div', ['class' => $options['class']]);

  foreach ($photos as $photo) {
      echo Html::tag('div',

        # Photo attachment image
        AttachmentsHelper::attachmentAddLink($photo, $options['attachment']['elem_type'], '').
        $photo['name'],

        [
          'class' => trim($options['cell_class'].' u-letter-box--medium user__photo')
        ]
      );
  }

echo Html::endTag('div');
