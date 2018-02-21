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
     *
     * @param obj $model  Model object
     * @param array $metaTags  Array of metatags (metaname => metavalue)
     */
    public static function setMetaInfo($model)
    {
        # MetaTags: default
        $description = Yii::t('app', Yii::$app->controller->id);
        $title = Yii::t('app', Yii::$app->controller->id);

        # OG Title
        if (isset(Yii::$app->opengraph->title)) {
            $title = Yii::$app->opengraph->title;
        }

        # OG Description
        if (isset(Yii::$app->opengraph->description)) {
            $description = Yii::$app->opengraph->description;
        }

        # Assigning to model
        if (!isset($model->metaTags['description'])) {
            $model->registerMetaTag([
              'name' => 'description',
              'content' => $description,
            ]);
        }

        $model->title = $title;

        return $model;
    }
}
