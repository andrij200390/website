<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\models\Events;
use backend\models\StatusPublication;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\EventsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', ucfirst(Yii::$app->controller->id));
$this->params['breadcrumbs'][] = $this->title;

$status = StatusPublication::getStatusList();
?>
<div class="events-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p class="u-pull-right">
        <?= Html::a('<i class="glyphicon glyphicon-plus-sign"></i>', ['create'], ['class' => 'btn btn-info btn-sm']) ?>
    </p>

    <?= GridView::widget([
        'tableOptions' => [
            'class' => 'table table-striped table-bordered table-notdborder table-mini',
          ],
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
              'attribute' => 'id',
              'contentOptions' => [
                  'style' => 'width:40px;max-width: 40px;',
                ],
            ],
            'title',
            [
                'attribute' => 'category',
                'value' => function ($model) {
                    return $model->categories->name;
                },
                'filter' => $categories,
            ],
            [
                'attribute' => 'user',
                'value' => function ($model) {
                    return $model->getUser();
                },
            ],
            [
                'attribute' => 'status',
                'value' => function ($model) {
                    return StatusPublication::getStatus($model->status);
                },
                'filter' => $status,
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
