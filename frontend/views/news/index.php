<?php

use common\components\helpers\ElementsHelper;
use common\components\helpers\SEOHelper;

/**
 * Main news grid, that must be wrapped by #ajax for Intercooler
 *
 * @var $this            yii\web\View
 * @var $modelNews              common/models/News
 * @var $newsCategories         common/models/News
 * @var $page                   common/models/News
 * @var $outstyle_news_height   common/models/News  needed for Packery layout
 */

/**
 * if this news page are not home page, register canonical link.
 * setCanonicalForPage() - method in SEOHelper for set canonical link
*/

if(Yii::$app->request->url != Yii::$app->homeUrl){
    $this->registerLinkTag(['rel' => 'canonical', 'href' => SEOHelper::setCanonicalForPage()]);
}

SEOHelper::setMetaInfo($this);


echo ElementsHelper::ajaxGridWrap(Yii::$app->controller->id, 'o-grid--no-gutter',
    $this->render('_newsgrid',
    [
      'modelNews' => $modelNews,
      'newsCategories' => $newsCategories,
      'page' => $page,
      'outstyle_news_height' => $outstyle_news_height,
      'category' => $category ?? '',
    ])
 );
