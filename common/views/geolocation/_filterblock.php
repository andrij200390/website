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
    ['class' => "form-group field-{$controllerId}-city"]).

    # category select (shows only after city is selected)
    Html::tag('div',
      Html::tag('label', Yii::t('app', 'School type'),
        [
          'class' => 'control-label',
          'for' => 'category'
        ]
      ).
      Html::dropDownList('category', null,
        ArrayHelper::map($categories, 'id', 'text'),
        [
          'id' => 'geolocation_category',
          'class' => "form-control select-{$controllerId}-category"
        ]
      ),
      ['class' => "form-group field-{$controllerId}-category"]
    ),

  [
    'id' => 'geolocation__filter',
    'class' => 'u-letter-box--small'
  ]),

Html::endTag('div');

/*
    ----------------------------------------------------------------------------
    JS stuff, that is related ONLY to this view
    ----------------------------------------------------------------------------
*/
?>

<script>
jQuery(document).ready(function () {

  /* Select2 country stuff */
  var country = jQuery('#geolocation_country'),
      city = jQuery("#geolocation_city"),
      category = jQuery("#geolocation_category");

  /* Initially everything is hidden */
  country.parent('.field-school-country').hide();
  city.parent('.field-school-city').hide();
  category.parent('.field-school-category').hide();

  /* Initial list of countries to work with */
  jQuery.ajax({
    dataType: "json",
    url: "/api/school/get?geodata",
    success: function(data) {

        /* If we received everything we needed... */
        var countries = '',
            cities = '';

        /* Show countries list */
        country.parent('.field-school-country').show();
        country.select2({data: data.countries});


        /**
         * Show corresponding cities of chosen country
         * [city.empty().trigger('change')] is needed for reinit Select2 data.
         * @see http://stackoverflow.com/a/35773629
         */
        country.on('select2:select', function (evt) {
          var country_id = parseInt(jQuery(this).val());

          if (country_id) {
            city.parent('.field-school-city').show();
            category.parent('.field-school-category').hide();

            city.empty().trigger('change');
            city.select2({
              data: data.cities[country_id],
              escapeMarkup: function (markup) { return markup; },
              templateResult: formatDropdownCity,
              templateSelection: formatDropdownCitySelection
            });

          } else {
            city.parent('.field-school-city').hide();
            category.parent('.field-school-category').hide();
          }
        });

        /**
         * Show categories after country has been chosen
         * @see: https://select2.github.io/options.html#events for 'select2:select' event
         * @see: http://intercoolerjs.org/examples/typeahead.html for 'Intercooler.triggerRequest' function
         */
        city.on('select2:select', function (evt) {
          var country_id = parseInt(country.val()),
              chosen_city_id = parseInt(jQuery(this).val());

          jQuery.each(data.cities[country_id], function(key, city) {
              if (city.id == chosen_city_id) {
                  var objects = city.objects.join();
                  jQuery('#geolocation_cities_query').val(objects);
              }
          });
          Intercooler.triggerRequest(jQuery('#geolocation_cities_query'));

          if (chosen_city_id) {
            city.parent('.field-school-city').show();
            category.parent('.field-school-category').show();
            category.select2();

          } else {
            category.parent('.field-school-category').hide();
          }

        });

    }
  });


  /* AJAX ACTION: sorting out our schools by category*/
  category.on('select2:select', function (evt) {
    var category_id = parseInt(jQuery(this).val());
    if (category_id) {
      category.select2();
    }
  });


  /* TODO: Select2 visual stuff */
  function formatDropdownCity (data) {
    if (data.loading) return data.text;
    var markup = "<div class='select2-result-datacity clearfix'>"+ data.text + "</div>";
    return markup;
  }

  function formatDropdownCitySelection (data) {
    return data.text;
  }

});
</script>
