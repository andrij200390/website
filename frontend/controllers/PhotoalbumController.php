<?php

namespace frontend\controllers;

use Yii;
use yii\helpers\Json;
use yii\web\Controller;
use yii\web\Response;
use yii\web\HttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

use app\models\Photo;
use app\models\Photoalbum;

class PhotoalbumController extends Controller
{
    public $layout = false;

    /**
     * @inheritdoc
     */
    public function beforeAction($event)
    {
        /* Since we don't want direct access to content, we should perform token check every time we access the controller */
        $csrf_token = Yii::$app->request->headers->get('x-csrf-token');
        $user_token = Yii::$app->request->post('_csrf');

        if (!$user_token) {
            throw new HttpException(400, Yii::t('err', 'Token empty!'));
        }
        if ($user_token != $csrf_token) {
            throw new HttpException(400, Yii::t('err', 'Token is invalid!'));
        }

        return parent::beforeAction($event);
    }

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                  [
                    'allow' => true,
                    'actions' => [
                      'create',
                      'view'
                     ],
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
     * Lists photos from an album
     *
     * @return HTML
     */
    public function actionView()
    {
        /* WHERE clause - @see: Photo::getPhotos parameters */
        $where = Yii::$app->request->post('album_id') ? ['album' => Yii::$app->request->post('album_id')] : [];

        $photos = Photo::getPhotos($where);

        return $this->renderPartial('view', [
            'photos' => $photos,
            'album_id' => Yii::$app->request->post('album_id'), /* Photoalbum ID */
            'album_name' => Yii::$app->request->post('album_name'), /* Photoalbum title */
        ]);
    }


    /**
     * Creates a new Photoalbum model.
     * Renders: photoalbum creation form
     *
     * @see: route @frontend/urls.php -> photoalbum/create
     *
     * @param string $controllerId
     * @param int    $modelId
     *
     * @return mixed
     */
    public function actionCreate()
    {
        $photoalbum = new Photoalbum();

        if ($photoalbum->load($_POST) && $photoalbum->validate()) {
            $photoalbum->save();
            return $this->renderPartial('index', [
                'photoalbums' => [$photoalbum]
            ]);
        } else {
            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return $photoalbum->errors;
        }
    }
}
