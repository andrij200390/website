<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\Breadcrumbs;
use common\components\helpers\ElementsHelper;

if (empty($category)) {

    /* Filter box form wrap for articles */
    echo
      Html::beginTag('div', ['class' => 'o-grid o-grid--wrap o-grid--no-gutter', 'id' => 'articles-filter']),

          Html::beginForm('', '',
            [
              'id' => 'article-filter-form',
              'way-data' => 'article.filter',
              'way-persistent' => 'true',
            ]
          );

          /*
           * Getting all the categories for filtering
           * @var $modelNews    common/models/News  -> getNews()
           */
          foreach ($newsCategories as $c) {
              echo ElementsHelper::ajaxedCheckbox('categories[]', $c->id, Yii::t('app', $c->name), Url::toRoute('article/show'), '#outstyle_articles .articles__body', '#article-filter-form');
          }

    echo Html::endForm(),

    Html::endTag('div');

    echo ElementsHelper::separatorDiamond(Yii::t('app', 'New articles'));
} else {
    echo
    Html::tag('div',

      /* BREADCRUMBS */
      Breadcrumbs::widget(
        [
          'tag' => 'ol',
          'homeLink' => false,
          'options' => ['class' => 'c-breadcrumbs u-cf'],
          'itemTemplate' => '<li class="c-breadcrumbs__crumb">{link}<i class="icon-right-open-big zmdi-hc-small"></i></li>',
          'links' => [
              [
                'label' => Yii::t('app', ucfirst(Yii::$app->controller->id)),
                'url' => ['/'.Yii::$app->controller->id],
                'ic-get-from' => Url::to('/'.Yii::$app->controller->id),
                'ic-indicator' => ElementsHelper::DEFAULT_AJAX_LOADER,
              ],
              [
                'label' => $modelNews[0]['category'],
              ],
          ],
        ]
      ),

      [
        'class' => 'o-grid__cell o-grid__cell--width-100',
      ]
    );

    foreach ($newsCategories as $c) {
        if ($c->id == $category) {
            echo ElementsHelper::separatorDiamond(Yii::t('app', ucfirst($c->url).' articles'));
        }
    }
}

/*
* --- Main article blocks ---
* Notice, that we are passing $modelNews from 'NewsController', using News model.
* That's because 'article' is only a representation of 'news' and uses the same array of values.
*/

echo Html::tag('div',
  $this->render('_articleblock', [
      'modelNews' => $modelNews,
      'page' => $page,
      'category' => $category,
  ]),
[
  'class' => 'o-grid__cell o-grid__cell--width-100 u-pillar-box--super news-single articles__body',
]);

/* This input is for sending pages */
echo Html::hiddenInput('page', $page, ['id' => 'page']);

/*
    JS stuff, that is related ONLY to this view
    Used:
    - echoJS for lazy load images:      https://www.npmjs.com/package/echo-js
    - wayjs for two-way data-binding:   https://github.com/gwendall/way.js

    !!! IMPORTANT !!! DON'T FORGET to switch off active events to prevent event binding duplication! (make event .off().on())
*/
?>
<script>
jQuery(document).ready(function () {

  var checkboxes = jQuery('.checkbox__wrap'),
      fakeCheckboxes = jQuery('.checkbox__wrap--disabled');

  function init_articles() {

    way.restore();

    setTimeout(function(){
      echo.init({
        offset:1250,
        callback: function (element, op) {

          jQuery(element).load(function(){
            jQuery(element).next("img.article__image--overlay").show();
          });

          /* --- If we have 'broken' images - hide 'em --- */
          jQuery(element).error(function(){
            jQuery(this).hide();
            jQuery(this).next("img.article__image--overlay").hide();
          });

          /* --- This stuff is needed for triggering 'scroll-on-view' element, so it could be on a user's viewport! --- */
          jQuery('#outstyle_articles .article__item--initial').hide();
        }
      });
    },250);

    /* --- Restoring from way.js storage and modifying elements --- */
    var categories = way.get("article.filter.categories");
    if (categories) {

      jQuery.each(categories, function(key, value) {

        /* For usual checkboxes */
        jQuery("#article-filter-form input[type=checkbox][value="+value+"]").attr("checked", true);
        jQuery("#article-filter-form input[type=checkbox][value="+value+"]").parent().addClass('active');
        jQuery("#article-filter-form div[data-fake-id="+value+"]").parent().addClass('active');

      });

    }

    /* When all the stuff is finally done, we can hide fake checks and show active ones */
    fakeCheckboxes.hide();
    checkboxes.show();

    /* --- Also we need to prepend filter containter back to prevent it's disappearing after AJAX call --- */
    jQuery("#articles-filter").prependTo("#outstyle_articles").css({
      'visibility':'visible'
    });

  }

  init_articles();

  /* --- Getting stored values from way.js storage before sending our ajax request --- */
  jQuery(document).off("beforeAjaxSend.ic").on("beforeAjaxSend.ic", function(event, settings) {

      var article = way.get("article.filter");
      if (article) {
          article = jQuery.param(article);
          settings.data = settings.data+'&'+article;
      }

  });

  /**
   * Working with masked checkboxes
   * Triggering on 'change' event and toggling element's classes to show 'fake' checkbox element
   * This is needed to prevent multiple AJAX sends
   * Basically this substitutes an elements to a fake 'noninteractable' elements during AJAX call
   *
   * Since we are having two filters with same behaviour, we must connect the events to trigger each other
   * See line 104
   */
  jQuery('.checkbox__wrap input[type=checkbox]').off('change').on('change', function() {

      var otherFilter = jQuery(this).val();
      var activeCheckbox = jQuery("#article-filter-form input[type=checkbox][value="+otherFilter+"]");

      if (jQuery(this).is(":checked")) {
        jQuery(this).parent().addClass('active');
        jQuery(this).parent().next().addClass('active');
        activeCheckbox.next('i').removeClass('zmdi-circle-o').addClass('zmdi-circle');
      } else {
        jQuery(this).parent().removeClass('active');
        jQuery(this).parent().next().removeClass('active');
        activeCheckbox.next('i').removeClass('zmdi-circle').addClass('zmdi-circle-o');
      }
      /* --- Preventing other checkboxes to be triggered, while AJAX request is active --- */
      checkboxes.hide();
      fakeCheckboxes.show();

  });

  /**
   * Triggering on 'article' event from ArticleController
   * See X-IC-Trigger headers: http://intercoolerjs.org/reference.html
   */
  jQuery("body").off("article").on("article", function(event, data) {
    if (data.page) {
      jQuery('#page').val(data.page);
    }

    init_articles();

  });

  });
</script>
