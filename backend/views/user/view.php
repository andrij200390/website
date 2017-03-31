<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use backend\models\UserDescription;

/* @var $this yii\web\View */
/* @var $model backend\models\User */

$this->title = $model->username;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Пользователи'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Редактировать'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Удалить'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Вы уверены, что хотите удалить этот пункт?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'username',
            'email:email',
            [
                'attribute' => 'created_at',
                'value'=> Yii::$app->formatter->asDate($model->updated_at, 'dd/MM/yyyy H:i:s'),
            ],
            [
                'attribute' => 'updated_at',
                'value'=> Yii::$app->formatter->asDate($model->updated_at, 'dd/MM/yyyy H:i:s'),
            ],
            [
                'label' => Yii::t('app', 'Ф.И.О'),
                'value'=> $model->userdescriptions->name,
            ],
            [
                'label' => Yii::t('app', 'Статус'),
                'value'=> $model->userdescriptions->status,
            ],
            [
                'label' => Yii::t('app', 'День рождения'),
                'value'=> $model->userdescriptions->birthday,
            ],
            [
                'label' => Yii::t('app', 'Пол'),
                'value'=> (isset($model->userdescriptions->sex) && $model->userdescriptions->sex)?UserDescription::getSexList($model->userdescriptions->sex):'',
            ],
            [
                'label' => Yii::t('app', 'Семейное положение'),
                'value'=> (isset($model->userdescriptions->family) && $model->userdescriptions->family)?UserDescription::getFamilyList($model->userdescriptions->family):'',
            ],
            [
                'label' => Yii::t('app', 'Телефон'),
                'value'=> $model->userdescriptions->phone,
            ],
            [
                'label' => Yii::t('app', 'Skype'),
                'value'=> $model->userdescriptions->skype,
            ],
            [
                'label' => Yii::t('app', 'Страна'),
                'value'=> (isset($model->userdescriptions->countries->name))?$model->userdescriptions->countries->name:'',
            ],
            [
                'label' => Yii::t('app', 'Город'),
                'value'=> $model->userdescriptions->city,
            ],
            [
                'label' => Yii::t('app', 'Сайт'),
                'value'=> $model->userdescriptions->site,
            ],
            [
                'label' => Yii::t('app', 'Я в культуре'),
                'value'=> $model->userdescriptions->culture,
            ],
            [
                'label' => Yii::t('app', 'Кратко о себе'),
                'value'=> $model->userdescriptions->about,
            ],
        ],
    ]) ?>

</div>
