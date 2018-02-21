<?php

use common\components\helpers\ElementsHelper;

$this->title = Yii::t('app', 'Category');
$this->registerMetaTag([
  'name' => 'description',
  'content' => $this->title,
]);

/*
 * Main news grid, that must be wrapped by #ajax for Intercooler
 *
 * @var $modelNews              common/models/News
 * @var $newsCategories         common/models/News
 * @var $page                   common/models/News
 * @var $outstyle_news_height   common/models/News  needed for Packery layout
 */
echo '12345';
exit;

echo ElementsHelper::ajaxGridWrap(Yii::$app->controller->id, 'o-grid--no-gutter',
    $this->render('../_newsgrid',
    [
      'modelNews' => $modelNews,
      'newsCategories' => $newsCategories,
      'page' => $page,
      'outstyle_news_height' => $outstyle_news_height,
    ])
 );
