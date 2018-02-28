<?php

use yii\helpers\Html;
use yii\helpers\Url;
use common\components\helpers\StringHelper;
use common\components\helpers\ElementsHelper;

/**
 * User photoalbums list
 *
 * @var $this                    yii\web\View
 * @var $photoalbums             @frontend/models/Photoalbum
*/

foreach ($photoalbums as $photoalbum) {
    $photos_count = isset($photoalbum['photo']) ? count($photoalbum['photo']) : 0;

    echo Html::tag('div',

      # Album delete button
      Html::button(
          Html::tag('i', '', [
            'class' => "zmdi zmdi-close zmdi-hc-lg",
          ]),
        [
          'class' => 'zmdi-icon--hoverable i-widgetbutton i-widgetbutton--topright',
          'title' => Yii::t('app', 'Delete'),
          'ic-action' => 'userShowPhotoalbumDeleteModal:'.$photoalbum['id'],
        ]
      ).

      # Album container
      Html::tag('div',

        # Album image
        $photoalbum['cover'].

        # Album title
        Html::tag('div',
          '<span>'.StringHelper::cutString($photoalbum['name'], 26).'</span>'.
          '<div><i class="zmdi zmdi-collection-folder-image zmdi-hc-lg"></i>&nbsp;<span>'.$photos_count.'</span></div>',
        [
          'class' => 'album__title',
          'title' => $photoalbum['name']
        ]),

      [
        'id' => 'album-'.$photoalbum['id'],
        'class' => 'album',
        'ic-indicator' => '#outstyle_loader',
        'ic-target' => '#photos_area',
        'ic-trigger-delay' => '200ms',
        'ic-include' => '{"album_name":"'.$photoalbum['name'].'","album_id":'.$photoalbum['id'].',"album_count":'.$photos_count.'}',
        'ic-post-to' => Url::toRoute(['photoalbum/view']),
        'ic-push-url' => 'false',
        'ic-select-from-response' => '#photos_list'
      ]),


      ['class' => 'album-wrap']
    );
}

echo $this->render('@modals/userPhotoalbum');
echo $this->render('@modals/userPhotoalbumDelete');
