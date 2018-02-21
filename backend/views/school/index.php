<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\models\Category;
use backend\models\StatusPublication;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\SchoolSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Школы';
$this->params['breadcrumbs'][] = $this->title;

$controllerId = Yii::$app->controller->id;
$categories = [1, 2, 3, 4, 9]; /* TODO */
$status = StatusPublication::getStatusList();
?>
<div class="<?=$controllerId; ?>-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p class="u-pull-right">
        <?= Html::a('<i class="glyphicon glyphicon-plus-sign"></i>', ['create'], ['class' => 'btn btn-info btn-sm']) ?>
    </p>

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
            'title',
            [
                'attribute' => 'category',
                'value' => function ($model) {
                    return $model->categories->name;
                },
                'filter' => $categories,
            ],
            [
                'attribute' => 'status',
                'value' => function ($model) {
                    return StatusPublication::getStatus($model->status);
                },
                'filter' => $status,
            ],
            [
                'attribute' => 'created',
            ],
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
