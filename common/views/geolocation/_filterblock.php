<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;

/**
 * Geolocation filter form (frontend)
 * DB tables relation: 'geolocation', 'geolocation_cities', 'geolocation_countries'
 *
 * @var $categories   array with a categories to use in filter dropdown (can be empty)
 */

$controllerId = Yii::$app->controller->id;

/* Intercooler data, needed for AJAX requests */
$target_el = '#outstyle_school .school';
$url = Url::toRoute($controllerId.'/show');

echo
Html::beginTag('div', ['class' => 'geolocation__box form']),

  # country list
  Html::tag('div',
    Html::tag('div',
      Html::tag('label', Yii::t('app', 'Country'),
        [
          'class' => 'control-label',
          'for' => 'country'
        ]
      ).
      Html::dropDownList('country', null, [],
        [
          'id'    => 'geolocation_country',
          'class' => "form-control select-{$controllerId}-country",
        ]
      ),
    ['class' => "form-group field-{$controllerId}-country"]).

    # city select (shows only after country is selected)
    Html::tag('div',
      Html::tag('label', Yii::t('app', 'City'),
        [
          'class' => 'control-label',
          'for' => 'city'
        ]
      ).
      Html::dropDownList('city', null, [],
        [
          'id'            => 'geolocation_city',
          'class'         => "form-control select-{$controllerId}-city"
        ]
      ).
      Html::hiddenInput('city_query', null,
        [
          'id'            => 'geolocation_cities_query',
          'class'         => "form-control select-{$controllerId}-cities",
          'ic-target'     => $target_el,
          'ic-push-url'   => "false",
          'ic-get-from'   => $url
        ]
      ),
    ['class' => "form-group field-{$controllerId}-city"]),

  [
    'id' => 'geolocation__filter',
    'class' => 'u-letter-box--small'
  ]),

Html::endTag('div');
