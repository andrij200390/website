<?php
namespace frontend\controllers;

use Yii;
use yii\helpers\Url;
use yii\web\Controller;
use yii\data\Pagination;
use yii\web\UploadedFile;
use common\CImageHandler;
use yii\web\HttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\captcha\CaptchaAction;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\Response;
use yii\widgets\ActiveForm;

use app\models\UserPrivacy;
use app\models\ConfirmEmail;
use common\models\AuthMisstep;
use common\models\LoginForm;

use app\models\UserDescription;
use frontend\models\SignupForm;
use frontend\models\UserAvatar;
use frontend\models\ContactForm;
use frontend\models\ResetPasswordForm;
use frontend\models\PasswordResetRequestForm;

use frontend\components\ParentController;

use app\models\City;
use app\models\SchoolCategory;

class MainController extends ParentController {

    public $layout = false;
    
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login','passwordrestore'],
                        'allow' => true,
                    ],
                    [
                        'actions' => [],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }
    

    /**
     * Performs user login, getting data from @views/_forms/headerLoginForm.php
     */
    public function actionLogin()
    {
        
        $model = new LoginForm();
        
        $data = Yii::$app->request->post();
        
        $model->username = $data['username'];
        $model->password = $data['password'];
        
           /* Check for attempts */
            $misstep = AuthMisstep::find()->where("ip = :ip", [':ip' => Yii::$app->request->userIP])->one();
            if ($misstep) {
                if ($misstep->created != 0 && time() - $misstep->created < 86400) {
                    $time = ($misstep->created + 86400 - time());
                    $endTime = date("H:i", mktime(0, 0, $time));
                    $model->addError('misstep', Yii::t('app', 'Возможность авторизации появится через '.$endTime));
                } else {
                    $misstep->attempt += 1;
                    
                    /* If we step over limit - block user from further logins and throw error */
                    if ($misstep->attempt == 10) {
                        $misstep->created = time();
                        $model->addError('misstep', Yii::t('app', 'Вы неверно ввели свой пароль 10 раз. Возможность входа заблокирована на сутки!'));
                    }
                    $misstep->save();
                    
                    /* If the user has tried again after block, we check for errors and delete + check for login validation again */
                    if ($misstep->attempt > 10 && !$model->errors) {
                        $misstep->delete();
                        $model->login();
                    }
                }

            } else {
                    $misstep = new AuthMisstep();
                    $misstep->ip = Yii::$app->request->userIP;
                    $misstep->created = 0;
                    $misstep->attempt = 1;
                    $misstep->save();
            }
        
        /* We will try to login only if attempts are not overlimited */
        if ($misstep->attempt < 10) 
        {
            /* If data is valid, and we don't have any errors - proceed to login */
            if ($model->validate() && !$model->errors) {
                if ($model->login()) {
                    /* If we logged in, we need to delete previous attempts, if there are any + redirect user to his profile page */
                    if ($misstep) $misstep->delete();
                    return $this->redirect(['/myprofile']);
                }
            } else {
                $response = ['error' => $model->errors];
            }
        } else {
            $response = ['error' => $model->errors];
        }
           
        /**
         * http://intercoolerjs.org/docs.html 
         * Intercooler headers to trigger certain events 
         */
        
        if (isset($response)) {
            $headers = Yii::$app->response->headers;
            $headers->add('X-IC-Trigger', '{"form-login":['.json_encode($response).']}');
        }
        
        /* If we making a request via Intercooler, we're not sending anything to the element, that have made a request (button) to prevent content rewrite */
        if (isset($data['ic-request'])) return;
    }

    public function actionPasswordrestore()
    {
        
        $data = Yii::$app->request->post();
        $model = new PasswordResetRequestForm();
        
        if (Yii::$app->request->isAjax && $model->load( $data )) {
            if ( isset($data['ajax']) && ( $data['ajax'] == 'form-passwordrestore') ) {
                Yii::$app->response->format = Response::FORMAT_JSON;
                return ActiveForm::validate($model);
            }
        }
        
        if ( $model->load( $data ) && $model->validate() ) {
            if ($model->sendEmail()) {
                return [
                        'error' => false,
                        'message' => Yii::t('app', 'Проверьте вашу электронную почту для получения дальнейших инструкций'),
                    ];
            } else {
                $message = '';
                foreach ($model->getErrors() as $key => $value) {
                    $message .= ' ' . $key.': '.$value[0];
                }
                return [
                        'error' => true,
                        'message' => Yii::t('app', 'Обнаружены ошибки: ') . $message
                    ];
            }
            
        }
        return $this->redirect(['/']);
    }
    
    public function actionResetpassword()
    {
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        
        $data = Yii::$app->request->post();

        if ( isset( $data['token'] ) ) {
            
            $model = new ResetPasswordForm($data['token']);
        
            if (Yii::$app->request->isAjax && $model->load( $data )) {
                if ( isset($data['ajax']) && ( $data['ajax'] == 'form-reset-password') ) {
                    // Валидация формы
                    return ActiveForm::validate($model);
                } else {
                    // Форма отправлена по кнопке
                    //var_dump($data);die();
                }
            }

            if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
                return [
                    'error' => false,
                    'message' => Yii::t('app', 'Новый пароль сохранен.'),
                ];                
            }

        } else {
            return [
                'error' => true,
                'message' => Yii::t('app', 'Отсутствует token.'),
            ];
        }
    }
    
    public function actionSignup()
    {
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        
        $model = new SignupForm();
        $data = Yii::$app->request->post();

        if (Yii::$app->request->isAjax && $model->load( $data )) {
            if ( isset($data['ajax']) && ( $data['ajax'] == 'form-registrate') ) {
                // Валидация формы
                return ActiveForm::validate($model);
            } else {
                // Форма отправлена по кнопке
            }
        }
        
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {

            if ($user = $model->signup()) {

                $confirmEmail = new ConfirmEmail();
                $confirmEmail->confirm_key = Yii::$app->security->generateRandomString();
                $confirmEmail->email = $model->email;
                $confirmEmail->created = time();
                Yii::$app->mailer->compose()
                    ->setFrom(Yii::$app->params['adminEmail'])
                    ->setTo($model->email)
                    ->setSubject('Outstyle - robot')
                    ->setTextBody("Для подтверждения своего email перейдите по ссылке http://".$_SERVER['SERVER_NAME']."/auth/confirm/".$confirmEmail->confirm_key.'/')
                    ->send();

                if($confirmEmail->validate()){
                    $confirmEmail->save();
                }

                $modelDescription = UserDescription::findOne($user->id);
                if ($modelDescription->load(Yii::$app->request->post())) {
                    $modelDescription->nickname = $model->username;

                    ////////загрузка аватара
                    $dir = Yii::getAlias('@frontend/web/images/avatar/');
                    if(!file_exists($dir)){
                        @mkdir($dir, 0777);
                    }
                    $uploaded = false;
                    $modelAvatar = new UserAvatar();
                    if ($modelAvatar->load($_POST)) {
                        $fullName = $dir . $user->id . '.jpg';
                        $fullNameMini = $dir . $user->id . '_small.jpg';
                        if( $file = UploadedFile::getInstance($modelAvatar, 'image') ){
                            $modelAvatar->image = $file;
                            if ( $modelAvatar->validate() ) {
                                
                                $uploaded = $file->saveAs( $fullName );
                                $ih = new CImageHandler();
                                $ih->load($fullName)
                                    ->thumb(120, 120, true)
                                    ->crop(80, 80, false, false)

                                    ->save($fullNameMini)
                                    ->reload()
                                    ->thumb(200, 200, true)
                                    ->crop(200, 200, false, false)

                                    ->save($fullName);
                                
                                $modelDescription->avatar = $user->id . '.jpg';
                                $modelDescription->avatar_small = $user->id . '_small.jpg';
                            }
                        } else {
                            // Если аватар не добавлен, то делаем его из дефолтной картинки
//                            @copy( $dir . 'def_avatar.jpg', $fullName);
//                            @copy( $dir . 'def_avatar_small.jpg', $fullNameMini);
                        }
//                        $modelDescription->avatar = $user->id . '.jpg';
//                        $modelDescription->avatar_small = $user->id . '_small.jpg';
                    }

                    if($modelDescription->validate()){
                        $modelDescription->save();
                    }
                }

                if (Yii::$app->getUser()->login($user)) {
//                    if(!isset($_POST['returnUrl']) || !$_POST['returnUrl']){
//                        return $this->goHome();
//                    }else{
//                        return $this->redirect($_POST['returnUrl']);
//                    }
                    return [
                        'error' => false,
                        'message' => Yii::t('app', 'На ваш почтовый ящик отправлено письмо для подтверждения пароль.'),
                    ];
                }
            } else {
                return [
                    'error' => true,
                    'message' => Yii::t('app', 'Пользователь не добавлен по непонятным причинам.'),
                ];
            }
        } else {
            $messages = array();
            foreach ($model->getErrors() as $key => $value) {
//                $message .= ' ' . $key.': '.$value[0];
                $messages[] = $value[0];
            }
            return [
                    'error' => true,
                    'message' => implode(',', $messages) //Yii::t('app', 'Обнаружены ошибки: ') . $message
                ];
        }   

        return $this->redirect(['/news/index']);
    }
    
    public function actionCity( $id, $withSchools = false ) {
        $cities = City::getToSelect( $id, $withSchools );
        //var_dump($cities);die();
        echo "<option value=''>-Любой город-</option>";
        foreach ($cities as $id => $city) {
            echo "<option value='".$id."'>".$city."</option>";
        }
    }
    
    public function actionCategories( $cityId, $withSchools = false ) {
        $categories = SchoolCategory::getToSelect( $cityId, $withSchools );
        echo "<option value=''>-Все категории-</option>";
        if ( count( $categories ) > 0 ) {
            foreach ( $categories as $id => $category ) {
                echo "<option value='".$id."'>".$category."</option>";
            }
        }
    }
}
