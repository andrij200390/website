<?php

use yii\helpers\Html;
use yii\helpers\Url;
use common\components\helpers\ElementsHelper;
use common\models\geolocation\Geolocation;

/**
 * Single school block view.
 *
 * @see school/view.php for @var used
 */
$controllerId = Yii::$app->controller->id;
$school_url = Url::toRoute($school[0]['id']);

/*
 * Main school block with preview picture 500x500
 * TODO: 'Photo' model (attach?)
 */
echo
Html::tag('div',

  Html::tag('div',

    /* Image */
    Html::img(
      Yii::$app->params['preloaderPictureBase64'],
      [
        'class' => "{$controllerId}__image block__image o-image",
        'alt' => Html::encode($school[0]['title']),
        'data-echo' => $school[0]['img'],
      ]
    ).

    /* Overlay with all the elements */
    Html::tag('div',

      /* Filter button */
      Html::tag('div', '',
        ['class' => "{$controllerId}__filter-button block__filter-button block__filter-button--inactive color-{$school[0]['categoryUrl']}--bg"]
      ).

    /* Category title */
    Html::tag('div',
      Yii::t('app', 'School').' ⟶ '.$school[0]['category'],
      ['class' => "{$controllerId}__category block__category u-window-box--small c-text--shadow"]
    ).

    /* Link to single instance of school */
    Html::tag('h1',
      '<span>'.$school[0]['title'].'</span>',
      ['class' => 'title c-text--shadow block__title school__title']
    ).

    /* Separator/divider [horizontal] */
    Html::tag('hr', '',
    ['class' => 'u-letter-box--small']
    ).

    /* Description block body */
    Html::tag('div',
      isset($school[0]['description']) ? $school[0]['description'] : '',
      ['class' => "{$controllerId}__body block__body u-pillar-box--medium c-text--darkshadow"]
    ).

    /* Block footer */
    Html::tag('div',

      /* Actions box (like, view count, comment buttons) */
      Html::tag('div',
        Html::tag('div',
          ElementsHelper::likeButton($controllerId, $school[0]['id'], $school[0]['likesCount'], $school[0]['myLike']),
          ['class' => 'u-pull-left']
        ).
        Html::tag('div',
          ElementsHelper::linkElement('comment', $school[0]['countComments'], $school_url, 'zmdi-comment-text-alt zmdi-hc-small'),
          ['class' => 'u-pull-left u-pillar-box--large']
        ),
        ['class' => "{$controllerId}__actionbox block__actionbox"]
      ),

      ['class' => "{$controllerId}__footer block__footer u-window-box--medium c-text--darkshadow o-shadow-bottomtop"]
    ),

      ['class' => "{$controllerId}__overlay overlay"]
    ),

    ['class' => 'block__item--500x500 block__item--abs']
  ),

  ['class' => "o-grid__cell o-grid__cell--width-50 {$controllerId}__item {$controllerId}__item--{$school[0]['categoryUrl']} block__item"]
);

/*
 * Map block 500x500
 * GOOGLE MAP PLACEHOLDER
 */
echo
Html::tag('div',
  '',
  [
    'id' => 'map__canvas--single',
    'class' => "o-grid__cell o-grid__cell--500x500 o-grid__cell--width-50 {$controllerId}__item {$controllerId}__item--{$school[0]['categoryUrl']} block__item",
    'data-country' => $school[0]['geolocation']['country'],
    'data-city' => $school[0]['geolocation']['city'],
    'data-address' => $school[0]['geolocation']['address'],
    'data-lat' => $school[0]['geolocation']['lat'],
    'data-lng' => $school[0]['geolocation']['lng'],
  ]
);

/*
 * MAIN SCHOOL TEXT
 */
echo
Html::tag('div',
  Html::tag('div',

    /* School geolocation and phone/site */
    Html::ul(
      [
        Yii::t('app', 'Country').': '.$school[0]['geolocation']['country'],
        Yii::t('app', 'City').': '.$school[0]['geolocation']['city'],
        Yii::t('app', 'Address').': '.$school[0]['geolocation']['address'],
        Yii::t('app', 'Phone').': '.$school[0]['phone'],
        isset($school[0]['site']) ? Yii::t('app', 'Website').': '.$school[0]['site'] : '',
        isset($school[0]['trainingTime']) ? Yii::t('app', 'Training time').': '.$school[0]['trainingTime'] : '',
      ],
      [
        'class' => 'u-window-box--xlarge',
      ]
    ).

    /* Separator */
    ElementsHelper::separatorDiamond(Yii::t('app', 'Equipment'), 'super', true).

    /* School detailed description */
    Html::tag('div',

      /* School parameters */
      Html::tag('div',
        Html::ul(
          [
            isset($school[0]['price']) ? Yii::t('app', 'Price').': '.$school[0]['price'] : '',
            isset($school[0]['square']) ? Yii::t('app', 'Training room size').': '.$school[0]['square'] : '',
            isset($school[0]['floor']) ? Yii::t('app', 'Floor surface').': '.$school[0]['floor'] : '',
            isset($school[0]['mirrors']) ? Yii::t('app', 'Mirrors').': '.$school[0]['mirrors'] : '',
            isset($school[0]['traininer']) ? Yii::t('app', 'Coaches').': '.$school[0]['traininer'] : '',
            isset($school[0]['trains']) ? Yii::t('app', 'Instructor').': '.$school[0]['trains'] : '',
            isset($school[0]['equipment']) ? Yii::t('app', 'Equipment').': '.$school[0]['equipment'] : '',
            isset($school[0]['materials']) ? Yii::t('app', 'Materials').': '.$school[0]['materials'] : '',
            isset($school[0]['soundSoft']) ? Yii::t('app', 'Soundworks').': '.$school[0]['soundSoft'] : '',
          ],
          ['class' => 'u-window-box--xlarge']
        ),

        ['class' => 'o-grid__cell o-grid__cell--width-40 o-grid__cell--center school__parameters']
      ).

      /* School gallery */
      Html::tag('div',
        Html::tag('div',
          ElementsHelper::galleryBlock(32, 24),
          ['class' => 'owl-carousel owl-theme']
        ),
        ['class' => 'o-grid__cell o-grid__cell--width-60 o-grid__cell--center school__gallery']
      ),

      ['class' => 'o-grid o-grid--no-gutter']
    ),

    [
      'class' => 'school__details',
    ]
  ),
  [
    'class' => 'o-grid__cell o-grid__cell--width-100 school__body',
  ]
);

/*
 * SHARE LINE
 */
echo
Html::tag('div',
  Html::tag('div',
    Html::tag('div',

      /* Share line text */
      Html::tag('div',
        Yii::t('app', 'What do you think about this school? Leave your opinion!'),
        ['class' => 'o-grid__cell o-grid__cell--no-gutter o-grid__cell--center o-grid__cell--width-75']
      ).

      /* Share line action buttons */
      Html::tag('div',
        Html::tag('div',
          ElementsHelper::linkElement('comment', $school[0]['countComments'], Url::toRoute($school[0]['id']), 'zmdi-comment-text-alt').
          ElementsHelper::likeButton(Yii::$app->controller->id, $school[0]['id'], $school[0]['likesCount'], $school[0]['myLike']).
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

/*
 * COMMENTS FORM
 */
echo
Html::tag('div',
  Html::tag('div',
    $this->render('../comments/_form',
      [
        'modelComments' => $school[0]['comments'],
        'modelElemId' => $school[0]['id'],
      ]
    ),
    [
      'id' => 'comments_section',
      'class' => 'u-full-width c-comments',
    ]
  ),
[
  'class' => 'o-grid o-grid__cell--width-100 o-grid--wrap o-grid--no-gutter comments',
]
);

/*
    JS stuff, that is related ONLY to this view
    Used:
    - echoJS for lazy load images:          https://www.npmjs.com/package/echo-js
    - PreciseTextResize for text:           @frontend/web/js/misc/preciseTextResize.js
    - wayjs for two-way data-binding:       https://github.com/gwendall/way.js
    - jQuery Mousewheel for OwlCarousel:    https://github.com/jquery/jquery-mousewheel (Owl Carousel built-in)
    - jQuery OwlCarousel:                   https://owlcarousel2.github.io/OwlCarousel2/
*/
?>
<script>
jQuery(document).ready(function () {

  var mapDiv = jQuery('#map__canvas--single');
  var carouselDiv = jQuery('.owl-carousel');

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

  /* OWL CAROUSEL INIT */
  function initOwlCarousel(carouselDiv) {
    carouselDiv.owlCarousel({
      loop:true,
      lazyLoad:true,
      items:4,
      nav: false,
    });
    carouselDiv.on('mousewheel', '.owl-stage', function (e) {
        if (e.deltaY>0) {
            carouselDiv.trigger('next.owl');
        } else {
            carouselDiv.trigger('prev.owl');
        }
        e.preventDefault();
    });
  }

  /* SCHOOL SINGLE PAGE INIT */
  function init_school_single() {

    jQuery('.block__item .overlay').show();

    /* --- Now to init images lazy loading, Google Maps and carousel --- */
    echo.init({offset:1000});
    initGoogleMap(mapDiv);
    initOwlCarousel(carouselDiv);
  }

  init_school_single();

});
</script>
