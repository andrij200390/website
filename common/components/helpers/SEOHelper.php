<?php

namespace common\components\helpers;

use Yii;

/**
 * SEOHelper provides a set of static methods for working with everything that is related to 'SEO' entity.
 *
 * @author [SC]Smash3r <scsmash3r@gmail.com>
 *
 * @since 1.0
 */
class SEOHelper
{

    /**
     * Sets all the needed SEO info for model
     * @param obj $model  Model object
     */
    public static function setMetaInfo($model)
    {
        if (!isset($model->title)) {
            $model->title = Yii::t('app', Yii::$app->controller->id);
            $description = Yii::t('app', Yii::$app->controller->id);
        }

        if (isset(Yii::$app->opengraph->title)) {
            $model->title = Yii::$app->opengraph->title;
        }

        if (isset(Yii::$app->opengraph->description)) {
            $description = Yii::$app->opengraph->description;
        }

        $model->registerMetaTag([
          'name' => 'description',
          'content' => $description,
        ]);

        return $model;
    }
}
