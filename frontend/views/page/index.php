<?php

use common\components\helpers\ElementsHelper;

/*
 * Ordinary page view
 */

echo ElementsHelper::ajaxGridWrap(Yii::$app->controller->id, 'o-grid--no-gutter', $this->render($layout));
