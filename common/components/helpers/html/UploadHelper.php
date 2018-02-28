<?php

namespace common\components\helpers\html;

use Yii;
use yii\helpers\Html;
use yii\helpers\Url;

use common\components\helpers\ElementsHelper;

/**
 * Provides all the needed HTML tag elements for work with upload form elements
 * @see: @common\components\helpers\ElementsHelper
 */
class UploadHelper extends ElementsHelper
{

    /**
     * Generates a block for uploading files.
     *
     * @param string $message Message to display
     *
     * @return html Generated HTML output
     */
    public static function uploadBox($message = '')
    {
        return
        Html::tag('div',
          Html::tag('div',
            $message,
            ['class' => 'u-center-block__content']
          ).

          # Locale div is needed for JS script to get info from
          Html::tag('div',

            Html::tag('span', Yii::t('app', 'File size is too big!'),
              ['id' => 'uploadbox-locale__FileSizeError']
            ).

            Html::tag('span', Yii::t('app', 'File type is not supported'),
              ['id' => 'uploadbox-locale__FileTypeError']
            ).

            Html::tag('span', Yii::t('app', 'File extension is not supported'),
              ['id' => 'uploadbox-locale__FileExtError']
            ),

            ['id' => 'uploadbox-locale']
          ),
          ['class' => 'uploadbox u-center-block']
        );
    }

    /**
     * Generates a block for uploading files.
     *
     * @return html Generated HTML output
     */
    public static function uploadFilesTemplate()
    {
        # Files placeholder
        return Html::tag('ul', '', ['id' => 'files']).

        # Files template - changes via JS
        # @see: js\outstyle.files.upload.js
        Html::tag('script',
          Html::tag('li',

            # CELL 1 - Image
            Html::tag('div',

              Html::img(Yii::$app->params['UploadHelper']['uploadFilesEmptyImage'],
                ['class' => 'preview-img']
              ),

              ['class' => 'o-grid__cell o-grid__cell--width-15']
            ).

            # CELL 2 - Image name and progress bar
            Html::tag('div',

              '<strong>%%filename%%</strong> - Status: <span class="text-muted">Waiting</span>'.

              Html::tag('div',
                '',
                [
                  'class' => 'progress-bar progress-bar-animated bg-primary',
                  'role' => 'progressbar',
                  'aria-valuenow' => '0',
                  'aria-valuemin' => '0',
                  'aria-valuemax' => '100'
                ]
              ),

              ['class' => 'o-grid__cell o-grid__cell--width-85 preview-content']
            ),

            ['class' => 'o-grid files__media']
          ),

          [
            'type' => 'text/html',
            'id' => 'files__template'
          ]
        );
    }
}
