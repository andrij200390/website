<?php

use common\components\helpers\ElementsHelper;

$this->title = Yii::t('app', 'Articles');
$this->registerMetaTag([
  'name' => 'description',
  'content' => $this->title,
]);


/*
 * Main articles grid, that must be wrapped in #ajax for Intercooler
 * Here we are using 'news' model since articles is only a representation of news, having the same data
 * TODO: clean and make more readable (work with ElementsHelper)
 *
 * @var $modelNews       common/models/News
 * @var $categories      common/models/News
 * @var $page            common/models/News
 * @var $category        common/models/News
*/

echo ElementsHelper::ajaxGridWrap('articles', 'news',
    $this->render('_articlegrid',
    [
      'modelNews' => $modelNews,
      'newsCategories' => $newsCategories,
      'page' => $page,
      'category' => $category ?? '',
    ])
  );
