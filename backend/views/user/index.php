<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;
use common\models\User;

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
        'rowOptions' => function($user) {
            if (isset($user->status)) return ['class' => 'status_'.$user->status];
        },
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
              'attribute' => 'id',
              'contentOptions' => [
                  'style' => 'width:40px;max-width: 40px;',
                ],
            ],
            'username',
            'email:email',

            [
                'attribute' => 'created_at',
                'value' => function ($user) {
                    return Yii::$app->formatter->asDate($user->created_at, 'dd/MM/yyyy H:i:s');
                },
            ],
            [
                'attribute' => 'updated_at',
                'value' => function ($user) {
                    return Yii::$app->formatter->asDate($user->updated_at, 'dd/MM/yyyy H:i:s');
                },
            ],

            [
              'class' => 'yii\grid\ActionColumn',
              'contentOptions' => ['style' => 'width:150px;'],
              'template' => '<div class="admin authorbox__actionbox">{view}{update}{permit}{delete}</div>',
              'buttons' =>
                [
                  'view' => function ($url, $user) {
                    return Html::a('<i class="zmdi zmdi-eye zmdi-hc-lg"></i>',
                      Url::to(['/user/view', 'id' => $user->id]),
                      [
                        'class' => 'i-icon i-icon--circle',
                        'title' => Yii::t('app', 'View')
                      ]
                    );
                  },
                  'update' => function ($url, $user) {
                    return Html::a('<i class="zmdi zmdi-edit zmdi-hc-lg"></i>',
                      Url::to(['/user/update', 'id' => $user->id]),
                      [
                        'class' => 'i-icon i-icon--circle',
                        'title' => Yii::t('app', 'Update')
                      ]
                    );
                  },
                  'permit' => function ($url, $user) {
                    return Html::a('<i class="zmdi zmdi-wrench zmdi-hc-lg"></i>',
                      Url::to(['/permit/user/view', 'id' => $user->id]),
                      [
                        'class' => 'i-icon i-icon--circle',
                        'title' => Yii::t('app', 'Change user role')
                      ]
                    );
                  },
                  'delete' => function($url, $user) {

                    /* Do not show button if active user */
                    if (Yii::$app->user->id == $user->id) return;

                    if ($user->status != User::STATUS_DELETED) {

                        /* Delete button, if user is not in User::STATUS_DELETED */
                        return Html::a('<i class="zmdi zmdi-close zmdi-hc-lg"></i>',
                          Url::to(['/user/delete', 'id' => $user->id, 'soft' => 'true']),
                          [
                            'data' => [
                                'confirm' => Yii::t('app', 'Are you sure you want to softly delete this user?'),
                                'method' => 'post',
                            ],
                            'class' => 'i-icon i-icon--circle i-icon--red',
                            'title' => Yii::t('app', 'Delete user: soft')
                          ]
                        );

                    } else {

                        /* Recovery button */
                        return Html::a('<i class="zmdi zmdi-time-restore-setting zmdi-hc-lg"></i>',
                          Url::to(['/user/delete', 'id' => $user->id, 'soft' => 'restore']),
                          [
                            'data' => [
                                'confirm' => Yii::t('app', 'Are you sure you want to restore this user?'),
                                'method' => 'post',
                            ],
                            'class' => 'i-icon i-icon--circle i-icon--green',
                            'title' => Yii::t('app', 'Restore user to active')
                          ]
                        );

                    }
                  }
                ],
            ],
        ],
    ]); ?>

</div>
