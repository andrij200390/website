<?php

namespace frontend\controllers;

use Yii;
use common\components\helpers\StringHelper;

class AwayController extends \yii\web\Controller
{
    public $layout = false;

    public function actionIndex()
    {
        $url = Yii::$app->request->get('to');

        # If our URL is not a valid one, redirecting user back to the page where link was clicked
        if (!StringHelper::checkExternalUrlValidity($url)) {
            $this->redirect(Yii::$app->request->referrer);
        };

        return $this->render('index', [
            'url' => $url
        ]);
    }
}
