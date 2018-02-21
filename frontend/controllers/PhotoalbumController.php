<?php

namespace frontend\controllers;

use Yii;
use yii\helpers\Json;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\Photoalbum;

/**
 * PhotoalbumController implements the CRUD actions for Photoalbum model.
 */
class PhotoalbumController extends Controller
{
    public $layout = 'portal';

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                  [
                    'actions' => [
                      'create',
                    ],
                    'allow' => Yii::$app->user->can($this->module->requestedRoute),
                    'roles' => ['@'],
                  ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Creates a new Photoalbum model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @see: @frontend/main.php -> urlManager
     *
     * @param string $controllerId
     * @param int    $modelId
     *
     * @return mixed
     */
    public function actionCreate($controllerId, $modelId)
    {
        $model = new Photoalbum();
        $model->create($controllerId, $modelId);

        if ($model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        /* Default response in JSON */
        Yii::$app->response->format = Response::FORMAT_JSON;

        return [
            'errors' => $model->errors,
        ];
    }
}
