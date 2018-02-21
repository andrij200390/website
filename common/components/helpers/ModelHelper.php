<?php

namespace common\components\helpers;

use Yii;
use yii\web\ForbiddenHttpException;
use common\models\School;
use common\models\Photoalbum;

class ModelHelper
{
    /**
     * Finds model by provided model ID and controller ID.
     *
     * @param string $controllerId
     * @param int    $modelId
     *
     * @return obj $model      Returns model obj or throws an exception in case of failure
     */
    public static function findBy($controllerId, $modelId)
    {
        if (in_array($controllerId, ElementsHelper::$allowedElements)) {
            if ($controllerId == 'school') {

                /* Check if we do have an active photoalbum, tied to School model */
                $model = School::findOne($modelId);
                $photoalbum = Photoalbum::findOne($model->album);

                if ($model->album && $photoalbum) {
                    throw new ForbiddenHttpException(Yii::$app->controller->id.' '.$model->album.' already exists');
                }

                /* If we have some validation errors on the School model side, we won't create our photoalbum */
                if (!$model->validate()) {
                    throw new ForbiddenHttpException('model cannot be validated');
                }
            }

            /* Check if logged user is the owner of model */
            if (Yii::$app->user->id == $model->user) {
                return $model;
            }

            throw new ForbiddenHttpException('User ID mismatch');
        }
    }
}
