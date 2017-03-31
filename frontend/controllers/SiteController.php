<?php
namespace frontend\controllers;

use Yii;
use yii\captcha\CaptchaAction;
use yii\filters\AccessControl;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;

use app\models\AuthMisstep;
use app\models\ConfirmEmail;
use common\models\LoginForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use frontend\models\ResetPasswordForm;
use frontend\models\PasswordResetRequestForm;

use frontend\components\ParentController;

class SiteController extends ParentController
{
    /**
     * @inheritdoc
     */ 
    public $layout='portal';
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
//            'photoloade' => [
//                'class' => 'frontend\widgets\ImageUpload\UploadAction',
////                'successCallback' => [$this, 'successCallback'],
////                'beforeStoreCallback' => [$this,'beforeStoreCallback']
//            ],
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                //'fixedVerifyCode' => true ? 'owdfre' : null,
                //'transparent'=>false,
                'testLimit' => 1,
                'minLength'=>3,
                'maxLength'=>4
            ],
        ];
    }

    public function actionIndex()
    {
        if(!Yii::$app->user->isGuest){
            $this->redirect(['/users']);
        }
        $model = null;
        
        return $this->render('index', [
            'model' => $model,
        ]);
    }

    public function actionLogin()
    {
        //если авторизован 
        if (!\Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $misstep = AuthMisstep::find()->where("ip = :ip", [':ip' => Yii::$app->request->userIP])->one();
        $attempt = false;
        
        if(!empty($misstep)){
            if ($misstep->created != 0 && time() - $misstep->created < 86400) {
                $time = ($misstep->created + 86400 - time());
                $endTime = date("H:i", mktime(0, 0, $time));
                Yii::$app->session->setFlash('cess', Yii::t('app', 'Возможность авторизации появится через '.$endTime));
            }elseif($misstep){
                $misstep->delete();
            }
        }
        $model = new LoginForm();
       
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            //если авторизация успешна - удаляем из таблицы ошибок ввода модель данного ip
            if($misstep){
                $misstep->delete();
            }
            //переводим на урл от куда пришел
            if(!isset($_POST['returnUrl']) || !$_POST['returnUrl']){
                return $this->goBack();
            }else{
                return $this->redirect($_POST['returnUrl']);
            }

        //если введенные данные не верны
        }elseif($model->load(Yii::$app->request->post()) && !$model->login()) {
            
            if($misstep){
                if($misstep->attempt == 10){
                    $misstep->created = time();
                    $misstep->save();
                }elseif($misstep->attempt >= 4){
                    $attempt = true;
                }

                $misstep->attempt += 1;
                $misstep->save();

            }else{
                $misstep = new AuthMisstep();
                $misstep->ip = Yii::$app->request->userIP;
                $misstep->attempt = 1;
                $misstep->save();
            }
        }

        return $this->render('login', [
            'model' => $model,
            'attempt' => $attempt,

        ]);
    }

    public function actionLogout()
    {
        Yii::$app->user->logout();
        return $this->goHome();
    }

    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', Yii::t('app', 'Благодарим Вас за обращение к нам. Мы ответим вам как можно скорее.'));
            } else {
                Yii::$app->session->setFlash('error', Yii::t('app', 'Был ошибка при отправке по электронной почте.'));
            }
            return $this->refresh();
        } else {
            return $this->render('contact', [
                'model' => $model, 
            ]);
        }
    }

    public function actionAbout()
    {
        return $this->render('about');
    }

    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->request->post())) {
            if ($user = $model->signup()) {

                $confirmEmail = new ConfirmEmail();
                $confirmEmail->confirm_key = Yii::$app->security->generateRandomString();
                $confirmEmail->email = $model->email;
                $confirmEmail->created = time();
                    Yii::$app->mailer->compose()
                        ->setFrom(Yii::$app->params['adminEmail'])
                        ->setTo($model->email)
                        ->setSubject('Outstyle - robot')
                        ->setTextBody("Для подтверждения своего email перейдите по ссылке http://outstyle.dev/auth/confirm/".$confirmEmail->confirm_key.'/')
                        ->send();
                    Yii::$app->session->setFlash('cess', Yii::t('app', 'На Вашу почту была отправлена ссылка для подтверждения email адреса'));
                if($confirmEmail->validate()){
                    $confirmEmail->save();
                }
               
                if (Yii::$app->getUser()->login($user)) {
                    if(!isset($_POST['returnUrl']) || !$_POST['returnUrl']){
                        return $this->goHome();
                    }else{
                        return $this->redirect($_POST['returnUrl']);
                    }
                }
            }

        }
        return $this->render('signup', [
            'model' => $model,
        ]);
    }

    public function actionRequestpasswordreset()
    {
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->getSession()->setFlash('success', Yii::t('app', 'Проверьте вашу электронную почту для получения дальнейших инструкций'));
                return $this->goHome();
            } else {
                Yii::$app->getSession()->setFlash('error', Yii::t('app', 'К сожалению, мы не в состоянии сбросить пароль.'));
            }
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    public function actionResetpassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->getSession()->setFlash('success', Yii::t('app', 'Новый пароль был сохранен.'));

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }
}
