<?php

namespace backend\controllers;

use Yii;
use yii\helpers\Json;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\Photo;

/**
 * PhotoalbumController implements the CRUD actions for Photoalbum model.
 */
class PhotoController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                    [
                        'allow' => false,
                        'roles' => ['*'],
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

    public function actions()
    {
        return [
            'deleteImage' => [
                'class' => 'demi\image\DeleteImageAction',
                'modelClass' => Photo::className(),
                'redirectUrl' => function ($model) {
                    return ['photoalbum/update', 'id' => $model->primaryKey];
                },
                'afterDelete' => function ($model) {
                    /* @var $model \yii\db\ActiveRecord */
                        if (Yii::$app->request->isAjax) {
                            Yii::$app->response->getHeaders()->set('Vary', 'Accept');
                            Yii::$app->response->format = yii\web\Response::FORMAT_JSON;

                            return ['status' => 'success', 'message' => 'Image deleted'];
                        } else {
                            return Yii::$app->response->redirect(['photoalbum/view', 'id' => $model->primaryKey]);
                        }
                },
            ],
            'cropImage' => [
                'class' => 'demi\image\CropImageAction',
                'modelClass' => Photo::className(),
                'redirectUrl' => function ($model) {
                    /* @var $model Post */
                    // triggered on !Yii::$app->request->isAjax, else will be returned JSON: {status: "success"}
                    return ['photoalbum/update', 'id' => $model->id];
                },
            ],

        ];
    }
}
