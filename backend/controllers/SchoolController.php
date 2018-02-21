<?php

namespace backend\controllers;

use Yii;
use yii\helpers\Json;
use yii\widgets\ActiveForm;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\web\NotFoundHttpException;

use common\models\School;
use backend\models\search\SchoolSearch;
use backend\models\Category;
use backend\models\StatusPublication;
use common\models\geolocation\Geolocation;
use common\models\Photoalbum;

/**
 * SchoolController implements the CRUD actions for School model.
 */
class SchoolController extends Controller
{
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
                  'delete' => ['post'],
              ],
          ],
        ];
    }

    public function actions()
    {
        return [
            'deleteImage' => [
                'class' => 'demi\image\DeleteImageAction',
                'modelClass' => School::className(),
                'redirectUrl' => function ($model) {
                    return [Yii::$app->controller->id.'/update', 'id' => $model->primaryKey];
                },
                'afterDelete' => function ($model) {
                    if (Yii::$app->request->isAjax) {
                        Yii::$app->response->getHeaders()->set('Vary', 'Accept');
                        Yii::$app->response->format = yii\web\Response::FORMAT_JSON;

                        return ['status' => 'success', 'message' => 'Image deleted'];
                    } else {
                        return Yii::$app->response->redirect([Yii::$app->controller->id.'/view', 'id' => $model->primaryKey]);
                    }
                },
            ],
            'cropImage' => [
                'class' => 'demi\image\CropImageAction',
                'modelClass' => School::className(),
                'redirectUrl' => function ($model) {
                    return [Yii::$app->controller->id.'/update', 'id' => $model->id];
                },
            ],

        ];
    }

    /**
     * Lists all School models.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SchoolSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single School model.
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
     * Creates a new School model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionCreate()
    {
        /* Data init: getting $_POST data */
        $data = Yii::$app->request->post();

        $model = new School();
        $categories = Category::getCategories(['id' => School::SCHOOL_CATEGORIES], '', true);
        $status = StatusPublication::getStatusList();

        /* Active form validation (AJAX) */
        if (Yii::$app->request->isAjax && $model->load($data)) {
            if (isset($data['ajax']) && ($data['ajax'] == 'form-create-school')) {
                return Json::encode(ActiveForm::validate($model));
            }
        }

        /*
         * Boot up our model with data
         * If validation from our model passes, continue with writing to DB and redirecting to further view
         */
        if ($model->load($data) && $model->validate()) {
            $model = $this->setData($data, $model);
            $model->created = date('Y-m-d H:i:s');

            /* If our model passes the validation, redirecting to view - otherwise showing JSON error output */
            if ($model->validate()) {

                $model->id;
                $model->save();

                return $this->redirect(['view', 'id' => $model->id]);
            }
        }

        /* Default view */
        return $this->render('create', [
            'model' => $model,
            'categories' => $categories,
            'status' => $status,
            'errors' => $model->errors,
        ]);
    }

    /**
     * Updates an existing School model.
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
        $categories = Category::getCategories(['id' => School::SCHOOL_CATEGORIES], '', true);
        $status = StatusPublication::getStatusList();

        /* Additional photoalbum model for school */
        $photoalbum = Photoalbum::findOne($model->album);

        /* Active form validation (AJAX) */
        /* TODO: http://www.yiiframework.com/doc-2.0/guide-input-multiple-models.html */
        if (Yii::$app->request->isAjax && $model->load($data)) {
            if (isset($data['ajax']) && ($data['ajax'] == 'form-create-school')) {
                return Json::encode(ActiveForm::validate($model));
            }
        }

        /*
         * Boot up our model with data
         * If validation from our model passes, continue with writing to DB and redirecting to further view
         */
        if ($model->load($data) && $model->validate()) {
            $model = $this->setData($data, $model);

            /* If our model passes the validation, redirecting to view - otherwise showing JSON error output */
            if ($model->validate()) {
                $model->save();

                return $this->redirect(['view', 'id' => $model->id]);
            }
        }

        /* If everything is okay - returning 'update' view */
        return $this->render('update', [
            'model' => $model,
            'photoalbum' => $photoalbum,
            'categories' => $categories,
            'status' => $status,
            'errors' => $model->errors,
        ]);
    }

    /**
     * Deletes an existing School model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * TODO: Check on permissions!
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
     * Finds the School model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param int $id
     *
     * @return School the loaded model
     *
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = School::findOne($id);
        if ($model) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /**
     * Populates model with user data.
     *
     * @see @common/models/School for validation rules
     *
     * @param array $data  Data to pupolate model with
     * @param array $model Initiated model to populate
     *
     * @return array $model Populated model
     */
    protected function setData($data, $model)
    {
        /* Main necessary data */
        $model->user = $model->user ? $model->user : Yii::$app->user->id;
        $model->price = $data['School']['price'];

        $model->site = $data['School']['site'];
        $model->description = $data['School']['description'];

        /* These are additional parameters for school. They are stored as a JSON array in DB @ 'additional' column */
        $arrayAdditional = [
          'trainingTime' => $data['School']['trainingTime'],
          'square' => $data['School']['square'],
          'floor' => $data['School']['floor'],
          'mirrors' => isset($data['School']['mirrors'][0]) ? $data['School']['mirrors'][0] : null,
          'traininer' => $data['School']['traininer'],
          'equipment' => $data['School']['equipment'],
          'trains' => $data['School']['trains'],
          'materials' => isset($data['School']['materials'][0]) ? $data['School']['materials'][0] : null,
          'soundSoft' => isset($data['School']['soundSoft'][0]) ? $data['School']['soundSoft'][0] : null,
        ];
        $additional = json_encode($arrayAdditional);

        $model->additional = $additional;
        $model->status = isset($data['School']['status']) ? $data['School']['status'] : School::STATUS_MODERATED;
        $model->date_redact = time();
        $model->redactor_id = Yii::$app->user->id;

        /* Saving geocode data + also setting a new geolocation name, if school name has changed*/
        $model->geolocation_id = Geolocation::validateData($data) ?? $model->geolocation_id;
        Geolocation::setGeolocationName($model->geolocation_id, $model->title);

        $model->img_block_size = $data['School']['img_block_size'];

        return $model;
    }
}
