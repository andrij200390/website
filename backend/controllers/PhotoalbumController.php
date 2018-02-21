<?php

namespace backend\controllers;

use Yii;
use yii\helpers\Json;
use yii\web\Controller;
use yii\web\Response;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\widgets\ActiveForm;
use common\models\Photoalbum;
use backend\models\search\PhotoalbumSearch;
use common\models\Photo;
use yii\web\UploadedFile;

/**
 * PhotoalbumController implements the CRUD actions for Photoalbum model.
 */
class PhotoalbumController extends Controller
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

    /**
     * Lists all Photoalbum models.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PhotoalbumSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Photoalbum model.
     *
     * @param int $id
     *
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
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
        /* Data init: getting $_POST data */
        $data = Yii::$app->request->post();

        $model = new Photoalbum();
        $model->create($controllerId, $modelId);

        if ($model->save()) {
            return $this->redirect(['update', 'id' => $model->id]);
        }

        /* Default response in JSON */
        Yii::$app->response->format = Response::FORMAT_JSON;

        return [
            'errors' => $model->errors,
        ];
    }

    /**
     * Updates an existing Photoalbum model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @param int $id
     *
     * @return mixed
     */
    public function actionUpdate($id)
    {
        /* Data init: getting $_POST data */
        $data = Yii::$app->request->post();
        $model = $this->findModel($id);

        /* Getting Photos for Photoalbum */
        $existingPhotos = Photo::find()->where(['album' => $id])->all();

        /* Creating Photo model for adding more photos */
        $photo = new Photo();

        /* Active form validation (AJAX) */
        if (Yii::$app->request->isAjax && $model->load($data)) {
            if (isset($data['ajax']) && ($data['ajax'] == 'form-create-photoalbum')) {
                return Json::encode(ActiveForm::validate($model));
            }
        }

        /* Both models validation, since photo is always related as a child to photoalbum */
        if ($model->load($data) && $photo->load($data)) {
            $photo->album = $model->id;

            $isValid = $model->validate();
            $isValid = $photo->validate() && $isValid;

            if ($isValid) {
                /* Saving photoalbum */
                $model->save();

                /* Saving each uploaded image as a photo, each as a new instance after whole validation */
                $images = UploadedFile::getInstances($photo, 'img');
                if (isset($images)) {
                    foreach ($images as $image) {
                        $photo = new Photo();

                        $photo->album = $model->id;
                        $photo->user = Yii::$app->user->id;
                        $photo->img = $image;

                        $photo->save(false);
                    }
                }
            }

            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
            'existingPhotos' => $existingPhotos,
            'photo' => $photo,
        ]);
    }

    /**
     * Deletes an existing Photoalbum model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     *
     * @param int $id
     *
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Photoalbum model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param int $id
     *
     * @return Photoalbum the loaded model
     *
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = Photoalbum::find()->where(['id' => $id])->with(['school'])->one();

        if ($model !== null) {
            return $model;
        }
        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
