<?php

namespace common\components\helpers;

use Yii;
use yii\helpers\Html;

/**
 * TooltipsHelper provides a set of static methods for working with everything that is related to 'tooltip' entity.
 *
 * @author [SC]Smash3r <scsmash3r@gmail.com>
 *
 * @since 1.0
 */
class TooltipsHelper
{
    /**
     * Tooltip template for photoalbum
     * @see: http://iamceege.github.io/tooltipster/
     *
     * @return HTML
     */
    public static function tooltipContainerForPhotoalbum()
    {
        return Html::tag('div',

            # for: #photo__editbutton
            Html::tag('span',

                Html::a(Yii::t('app', 'Add photo'),
                  'javascript:void(0)',
                  [
                    'href' => 'javascript:void(0)'
                  ]
                ).

                Html::a(Yii::t('app', 'Add album'),
                  'javascript:void(0)',
                  [
                    'href' => 'javascript:void(0)',
                    'ic-action' => 'userShowPhotoalbumModal'
                  ]
                ),

              ['id' => 'photos_edit_tooltip_content']
            ),

          ['class' => 'tooltip_templates']
        );
    }
}
