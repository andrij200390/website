<?php

use yii\helpers\Html;
use yii\helpers\Url;

/**
 * School backend view.
 *
 * @var yii\web\View
 * @var $model       backend\models\School   School model with necessary data
 * @var $categories  backend\models\School   School categories array
 * @var $status      backend\models\School   School post publish statuses array
 */
$controllerId = Yii::$app->controller->id;

$this->title = Yii::t('app', 'Create new school');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'School'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="<?=$controllerId; ?>-create">
    <h1><?= Html::encode($this->title) ?></h1>

    <?php if (Yii::$app->session->hasFlash('error')): ?>
      <?= Yii::$app->session->getFlash('error') ?>
    <?php endif; ?>

    <?= $this->render('_form', [
        'model' => $model,
        'categories' => $categories,
        'status' => $status,
        'errors' => $errors,
    ]) ?>

</div>
