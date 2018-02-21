<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\School */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Школы', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="school-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Редактировать', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Удалить', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'title',
            'geolocation_id',
            'price',
            'phone',
            'site',
            'description',
            'created',
        ],
    ]) ?>

    <?php

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
