<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Пользователи');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]);?>

    <p class="u-pull-right">
        <?= Html::a('<i class="zmdi zmdi-settings zmdi-hc-lg"></i>', ['/permit/access/role'], ['class' => 'btn btn-info btn-sm']) ?>
        <?= Html::a('<i class="zmdi zmdi-key zmdi-hc-lg"></i>', ['/permit/access/permission'], ['class' => 'btn btn-info btn-sm']) ?>
    </p>

    <?= GridView::widget([
        'tableOptions' => [
          'class' => 'table table-striped table-bordered table-notdborder table-mini',
        ],
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [

            'id',
            'username',
            'email:email',

            [
                'attribute' => 'created_at',
                'value' => function ($model) {
                    return Yii::$app->formatter->asDate($model->created_at, 'dd/MM/yyyy H:i:s');
                },
            ],
            [
                'attribute' => 'updated_at',
                'value' => function ($model) {
                    return Yii::$app->formatter->asDate($model->updated_at, 'dd/MM/yyyy H:i:s');
                },
            ],

            ['class' => 'yii\grid\ActionColumn',
             'template' => '{view}&nbsp;&nbsp;{update}&nbsp;&nbsp;{permit}&nbsp;&nbsp;{delete}',
             'buttons' => [
                     'permit' => function ($url, $model) {
                         return Html::a('<span class="glyphicon glyphicon-wrench"></span>',
                                Url::to(['/permit/user/view', 'id' => $model->id]),
                                ['title' => Yii::t('yii', 'Change user role')]);
                     },
                 ],
            ],
        ],
    ]); ?>

</div>
