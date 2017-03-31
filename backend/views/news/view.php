<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\News */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Новости'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="news-view">

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

    <?= DetailView::widget([ // Users
        'model' => $model,
        'attributes' => [
            [
                'attribute' => 'category',
                'value' => (isset($model->categories->name)) ? $model->categories->name : '',
            ],
            'name',
            [
                'attribute' => 'user',
                'value' => (isset($model->users->username)) ? $model->users->username : '',
            ],
            'title',
            'description',
            'created',
            'small:ntext',
            'text:ntext',
            [
                'attribute' => 'img_block_size',
                'value' => $model->img_block_size,
            ],
        ],
    ]);

    if (strpos($model->getImageSrc(), 'noimage') === false) {
        $form = ActiveForm::begin([
          'id' => 'form-news-create',
          'enableAjaxValidation' => true,
          'options' => ['enctype' => 'multipart/form-data'],
        ]);

        echo $form->field($model, 'img')->widget('demi\image\FormImageWidget',
          [
            'imageSrc' => $model->getImageSrc(),
            'deleteUrl' => ['deleteImage', 'id' => $model->getPrimaryKey()],
            'cropUrl' => ['cropImage', 'id' => $model->getPrimaryKey()],
          ]);

        ActiveForm::end();
    }
    ?>

</div>
