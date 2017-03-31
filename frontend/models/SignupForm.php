<?php
namespace frontend\models;


use Yii;
use common\models\User;
use yii\helpers\Url;
use yii\base\Model;


/**
 * Signup form
 */
class SignupForm extends Model
{
    public $username;
    public $email;
    public $password;
    public $repeatPassword;

    //public $captcha;

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            //'captcha' => Yii::t('app', 'Код подтверждения'),
            'username' => Yii::t('app', 'Логин'),
            'password' => Yii::t('app', 'Пароль'),
            'repeatPassword' => Yii::t('app', 'Ещё раз'),
            'email' => Yii::t('app', 'Email'),

        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'filter', 'filter' => 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\common\models\User', 'message' => Yii::t('app', 'Этот никнейм пользователя уже занят.')],
            ['username', 'string', 'min' => 4, 'max' => 255],
            ['username', 'match', 'pattern' => '/^[a-zA-Z0-9_\-]*$/i', 'message' => Yii::t('app', 'Допустимы только латинский буквы, цифры и знаки "-", "_"')],

            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => Yii::t('app', 'Этот адрес электронной почты уже занят.')],

            ['password', 'required'],
            ['password', 'string', 'min' => 6],

            ['repeatPassword', 'required'],
            ['repeatPassword', 'string', 'min' => 6],
            ['repeatPassword', 'compare', 'compareAttribute'=>'password', 'skipOnEmpty' => false, 'message'=>Yii::t('app', 'Пароли не совпадают')],

            // ['captcha', 'required'],
            // ['captcha', 'captcha'],
        ];
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function signup()
    {
        if ($this->validate()) {
            
            $user = new User();
            $user->username = $this->username;
            $user->email = $this->email;
            $user->setPassword($this->password);
            $user->generateAuthKey();

            if ($user->save()) {
                return $user;
            }
        }

        return null;
    }
}
