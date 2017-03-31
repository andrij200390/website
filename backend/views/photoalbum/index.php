<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\Photoalbum */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Photoalbums');
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="photoalbum-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'tableOptions' => [
          'class' => 'table table-striped table-bordered table-notdborder table-mini',
        ],
        'columns' => [
            [
              'attribute' => 'id',
              'contentOptions' => [
                  'style' => 'width:40px;max-width: 40px;',
              ],
            ],
            [
              'label' => Yii::t('app', 'Photoalbum name'),
              'attribute' => 'name',
            ],
            [
              'attribute' => 'model',
              'label' => Yii::t('app', 'Linked with...'),
              'format' => 'raw',
              'value' => function ($data) {
                  if (isset($data->school[0])) {
                      return Html::a(Yii::t('app', 'School'), Url::to(['school/'.$data->school[0]->id.'/update']));
                  }

                  return '';
              },
            ],
            [
              'attribute' => 'count',
              'label' => Yii::t('app', 'Photos count'),
              'value' => function ($data) {
                  return count($data->photo);
              },
              'contentOptions' => [
                  'style' => 'width:40px;max-width: 40px;',
              ],
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
