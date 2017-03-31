<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\Breadcrumbs;
use common\components\helpers\ElementsHelper;
use common\components\helpers\StringHelper;
use common\models\geolocation\Geolocation;

echo
Html::tag('div',

  // BREADCRUMBS
  Breadcrumbs::widget(
    [
      'tag' => 'ol',
      'homeLink' => false,
      'options' => [
        'class' => 'c-breadcrumbs u-cf',
      ],
      'itemTemplate' => '<li class="c-breadcrumbs__crumb">{link}<i class="icon-right-open-big zmdi-hc-small"></i></li>',
      'links' => [
          [
            'label' => Yii::t('app', ucfirst(Yii::$app->controller->id)),
            'url' => ['/'.Yii::$app->controller->id],
            'ic-get-from' => Url::to('/'.Yii::$app->controller->id),
            'ic-indicator' => ElementsHelper::DEFAULT_AJAX_LOADER,
          ],
          [
            'label' => $modelEvents[0]['category'],
            'url' => [Yii::$app->controller->id.'/'.$modelEvents[0]['categoryUrl']],
            'ic-get-from' => Url::toRoute(Yii::$app->controller->id.'/'.$modelEvents[0]['categoryUrl']),
            'ic-indicator' => ElementsHelper::DEFAULT_AJAX_LOADER,
          ],
          [
            'label' => $modelEvents[0]['title'],
          ],
      ],
    ]
  ),

  [
    'class' => 'o-grid__cell o-grid__cell--width-100',
  ]
);

// SEPARATOR
echo ElementsHelper::separatorDiamond(Yii::t('app', 'Event author')),

// AUTHORBOX WITH LIKES AND HASHTAGS
Html::tag('div',
  Html::tag('div',
    Html::tag('div',

      //cell 1
      Html::tag('div',

        //category circle icon
        Html::tag('i',
          '',
          ['class' => "zmdi zmdi-circle color-{$modelEvents[0]['categoryUrl']}"]
        ).

        //category name
        Html::tag('span',
          Yii::t('app', $modelEvents[0]['category']),
          ['class' => 'authorbox__category']
        ),

        ['class' => 'o-grid__cell o-grid__cell--no-gutter o-grid__cell--bottom o-grid__cell--width-25 color-default u-l']
      ).

      //cell 2
      Html::tag('div',

        //username and avatar
        Html::a(
          Html::img(
            $modelEvents[0]['userAvatar'],
            [
              'class' => "roundborder color-{$modelEvents[0]['userCulture']}--border avatar avatar--smallest",
              'alt' => Yii::t('app', 'Аватар пользователя {user}', ['user' => $modelEvents[0]['userName']]),
            ]
          ).
          $modelEvents[0]['userName'],
          Url::toRoute('profile/'.$modelEvents[0]['userId']),
          [
            'class' => "user-name user-name--withavatar color-{$modelEvents[0]['userCulture']} authorbox__author",
          ]
        ).

        //hashtags
        Html::tag('div',
          /*HashtagHelper::processHashtagsFromText($events['text'])*/'#hashTag1 #hashTag 2',
          [
            'class' => 'authorbox__hashtags u-letter-box--medium color-default u-c',
          ]
        ),

        ['class' => 'o-grid__cell o-grid__cell--no-gutter o-grid__cell--width-50 u-c']
      ).

      //cell 3
      Html::tag('div',
        Html::tag('div',
          ElementsHelper::linkElement('views', 0, false, 'zmdi-eye').
          ElementsHelper::linkElement('comment', $modelEvents[0]['countComments'], Url::toRoute(Yii::$app->controller->id.'/'.$modelEvents[0]['id']), 'zmdi-comment-text-alt').
          ElementsHelper::likeButton(Yii::$app->controller->id, $modelEvents[0]['id'], $modelEvents[0]['likesCount'], $modelEvents[0]['myLike']),
          ['class' => 'authorbox__actions u-pull-left']
        ).
        Html::tag('div',
          ElementsHelper::linkElement('repost', '', '#', 'icon-megaphone'),
          ['class' => 'authorbox__actions u-pull-right']
        ),

        ['class' => 'o-grid__cell o-grid__cell--no-gutter o-grid__cell--bottom o-grid__cell--width-25 color-default u-r authorbox__actionbox']
      ),

      ['class' => 'o-grid o-grid--wrap o-grid--center u-window-box--large']
    ),
    ['class' => 'u-pillar-box--super authorbox']
  ),

  ['class' => 'o-grid__cell o-grid__cell--width-100']
),

// EVENT DATE BOX
Html::tag('div',
  Html::tag('div',
    Html::tag('div',
      Html::tag('div',

        //cell 1
        Html::tag('div',

          //date number
          Html::tag('b',
            StringHelper::convertTimestampToHuman(strtotime($modelEvents[0]['events_date']), 'd'),
            ['class' => 'c-text__color--redshadow number']
          ).

          //date month
          Html::tag('span',
            StringHelper::convertTimestampToHuman(strtotime($modelEvents[0]['events_date']), 'F'),
            ['class' => 'c-text__color--blackshadow month']
          ).

          //date day
          Html::tag('span',
            StringHelper::convertTimestampToHuman(strtotime($modelEvents[0]['events_date']), 'l'),
            ['class' => 'color-default day']
          ).

          //date H:i
          Html::tag('span',
            StringHelper::convertTimestampToHuman(strtotime($modelEvents[0]['events_date']), 'H:i'),
            ['class' => 'hour']
          ),

          ['class' => 'o-grid__cell o-grid__cell--no-gutter o-grid__cell--width-25 datebox__date']
        ).

        //cell 2
        Html::tag('div',
          Html::tag('div',
            $modelEvents[0]['title'],
            ['class' => 'u-pillar-box--large']
          ),
          ['class' => 'o-grid__cell o-grid__cell--width-50 c-text__color--blackshadow c-text__color--darklight u-c datebox__title']
        ).

        //cell 3 TODO: link to geolocation (place, school, etc - must be a link)
        Html::tag('div',

          //hostname
          Html::tag('div',
            empty($modelEvents[0]['geolocation']['name']) ? Yii::t('app', 'Unknown location') : $modelEvents[0]['geolocation']['name'],
            ['class' => 'c-text__color--redshadow datebox__host']
          ).

          //address
          Html::tag('div',
            $modelEvents[0]['geolocation']['address'],
            ['class' => 'c-text__color--blackshadow datebox__address']
          ).

          //country and city
          Html::tag('div',
            $modelEvents[0]['geolocation']['city'].', '.
            $modelEvents[0]['geolocation']['country'],
            ['class' => 'color-default datebox__city']
          ),

          ['class' => 'o-grid__cell o-grid__cell--no-gutter o-grid__cell--width-25 datebox__place']
        ),

        ['class' => 'o-grid o-grid--wrap o-grid--center datebox__wrap']
      ),

      ['class' => 'u-window-box--large u-bordered-box u-bordered-box--top datebox']
    ).

    // GOOGLE MAP PLACEHOLDER
    Html::tag('div',
      '',
      [
        'id' => 'map__canvas',
        'data-country' => $modelEvents[0]['geolocation']['country'],
        'data-city' => $modelEvents[0]['geolocation']['city'],
        'data-address' => $modelEvents[0]['geolocation']['address'],
        'data-lat' => $modelEvents[0]['geolocation']['lat'],
        'data-lng' => $modelEvents[0]['geolocation']['lng'],
      ]
    ).

    // SEPARATOR / MAP SHOW HIDE
    ElementsHelper::separatorDiamond(
      '<b>'.Yii::t('app', 'Show map').'</b>'.
      '<b>'.Yii::t('app', 'Hide map').'</b>',
      '', false, 'right toggleable'
    ),

    ['class' => 'u-pillar-box--super']
  ),
  ['class' => 'o-grid__cell o-grid__cell--width-100 map']
),

/* Event main area */
Html::tag('div',
  Html::tag('div',

    /* Event main big image */
    Html::img(
      $modelEvents[0]['img_big'],
      ['class' => 'o-image events__bigimage']
    ).

    /* Event main text */
    Html::tag('div',
      $modelEvents[0]['description'],
      ['class' => 'u-letter-box--medium events__body']
    ),

    ['class' => 'u-window-box--super']
  ),
  ['class' => 'o-grid__cell o-grid__cell--width-100 c-text--usual']
),

// SEPARATOR
ElementsHelper::separatorDiamond(Yii::t('app', 'Recommended events')),

// SIMILAR EVENTS
Html::beginTag('div',
  [
    'id' => Yii::$app->controller->id.'-single-recommended',
    'class' => 'o-grid o-grid--wrap u-full-width u-window-box--medium recommended',
    'ic-target' => '#'.ElementsHelper::DEFAULT_TARGET_ID,
    'ic-push-url' => 'true',
    'ic-select-from-response' => '#'.ElementsHelper::DEFAULT_AJAX_ID,
  ]
);

foreach ($modelEvents[0]['recommended'] as $recommendedEvents) {
    $url = Url::toRoute(Yii::$app->controller->id.'/'.$recommendedEvents['id']);

    //recommended events single instance
    echo
    Html::tag('div',
      Html::tag('div',
        Html::a('<img class="o-image grayscale" src="'.$recommendedEvents['img'].'"><span class="recommended__title">'.$recommendedEvents['title'].'</span>',
          $url,
          [
            'class' => 'recommended__link',
            'ic-get-from' => $url,
            'ic-indicator' => ElementsHelper::DEFAULT_AJAX_LOADER,
          ]
        ),
        ['class' => 'u-window-box--small']
      ),
      ['class' => 'o-grid__cell o-grid__cell--no-gutter']
    );
}

echo Html::endTag('div');

// SHARE LINE
echo
Html::tag('div',
  Html::tag('div',
    Html::tag('div',

      //sharetext
      Html::tag('div',
        Yii::t('app', 'Enjoyed reading this stuff? Tell your man to check it out too or leave your opinion!'),
        ['class' => 'o-grid__cell o-grid__cell--no-gutter o-grid__cell--center o-grid__cell--width-75']
      ).

      //buttons
      Html::tag('div',
        Html::tag('div',
          ElementsHelper::linkElement('comment', $modelEvents[0]['countComments'], Url::toRoute($modelEvents[0]['id']), 'zmdi-comment-text-alt').
          ElementsHelper::likeButton(Yii::$app->controller->id, $modelEvents[0]['id'], $modelEvents[0]['likesCount'], $modelEvents[0]['myLike']).
          ElementsHelper::linkElement('repost', '', '#', 'icon-megaphone'),
          ['class' => 'news__actions u-pull-right']
        ),
        ['class' => 'o-grid__cell o-grid__cell--no-gutter o-grid__cell--center o-grid__cell--width-25 color-default u-r']
      ),

      ['class' => 'o-grid o-grid--wrap o-grid--center']
    ),
    ['class' => 'u-window-box--medium color-lighter--bg']
  ),
  ['class' => 'o-grid__cell o-grid__cell--width-100 u-letter-box--xlarge shareline branded']
);

// COMMENTS
echo
Html::tag('div',
  $this->render('../comments/_form',
    [
      'modelComments' => $modelEvents[0]['comments'],
      'modelElemId' => $modelEvents[0]['id'],
    ]
  ),
  [
    'id' => 'comments_section',
    'class' => 'u-full-width c-comments',
  ]
);

/*
    JS stuff, that is related ONLY to this view
    Used:
    - PreciseTextResize for text:       @frontend/web/js/misc/preciseTextResize.js
    - Google Maps API
*/
?>
<script>
jQuery(document).ready(function () {

  function init_events_single() {
  }
  init_events_single();

  /* GOOGLE MAPS INIT */
  function initGoogleMap(mapDiv) {
    var location = {lat: Number(mapDiv.attr('data-lat')),lng: Number(mapDiv.attr('data-lng'))};
    var options = {
      center: location,
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      styles: [{"featureType":"all","elementType":"labels","stylers":[{"visibility":"on"}]},{"featureType":"all","elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#000000"},{"lightness":40}]},{"featureType":"all","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#000000"},{"lightness":16}]},{"featureType":"all","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]},{"featureType":"administrative.country","elementType":"labels.text.fill","stylers":[{"color":"#e5c163"}]},{"featureType":"administrative.locality","elementType":"labels.text.fill","stylers":[{"color":"#c4c4c4"}]},{"featureType":"administrative.neighborhood","elementType":"labels.text.fill","stylers":[{"color":"#e5c163"}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":21},{"visibility":"on"}]},{"featureType":"poi.business","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#e5c163"},{"lightness":"0"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"visibility":"off"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"road.highway","elementType":"labels.text.stroke","stylers":[{"color":"#e5c163"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#575757"}]},{"featureType":"road.arterial","elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"road.arterial","elementType":"labels.text.stroke","stylers":[{"color":"#2c2c2c"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":16}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#999999"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":17}]}]
    };
    var map = new google.maps.Map(mapDiv[0], options);
    var marker = new google.maps.Marker({position: location, map: map});
  }

  /* GOOGLE MAPS SHOW EVENT */
  jQuery(".map .toggleable").click(function() {

    var mapDiv = jQuery('#map__canvas');
    mapDiv.toggleClass('visible');
    initGoogleMap(mapDiv);

    jQuery(this).find('i').toggleClass('zmdi-chevron-down').toggleClass('zmdi-chevron-up');
    jQuery(this).find('b').toggle();

  });

  /* EVENT TITLE RESIZE */
  jQuery('.datebox__title').preciseTextResize({
    parent: '.datebox__wrap',
    grid : [{
      0 : {60 : {1:72,4:58,10:46,15:40,20:38,25:34}}
    }],
  });


});
</script>
