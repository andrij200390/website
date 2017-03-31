<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%user}}".
 *
 * @property string $id
 * @property string $username
 * @property string $auth_key
 * @property string $password_hash
 * @property string $password_reset_token
 * @property string $email
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user}}';
    }

    /**
     * @inheritdoc
     */
    public $newPass;
    public $newPass_repeat;
    public $newEmail;

    public function rules()
    {

        return [
            [['username', 'auth_key', 'password_hash','password_reset_token', 'newPass', 'newPass_repeat', 'newEmail'], 'filter', 'filter' => 'trim'],
            [['username', 'auth_key', 'password_hash', 'email', 'created_at', 'updated_at'], 'required'],
            [['status', 'created_at', 'updated_at'], 'integer'],
            [['username', 'password_reset_token', 'email'], 'string', 'max' => 255],
            [['auth_key'], 'string', 'max' => 32],
            [['email', 'newEmail'], 'email'],

            [['newPass'], 'string', 'length' => [6, 255]],
            [['newPass_repeat'], 'string', 'length' => [6, 255]],

            [['password_reset_token'], 'safe'],
            [['password_hash'], 'string', 'length' => [6, 255]],

            [['username'], 'string', 'length' => [4, 30]],
            ['username', 'unique',  'message' => Yii::t('app', 'Это имя пользователя уже занято.')],
            ['email', 'unique', 'message' => Yii::t('app', 'Этот адрес электронной почты уже занят.')],
            ['username', 'match', 'pattern' => '/^[a-zA-Z0-9_\-]*$/i', 'message' => Yii::t('app', 'Допустимы только латинский буквы, цифры и знаки "-", "_"')],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'username' => Yii::t('app', 'Логин'),
            'auth_key' => Yii::t('app', 'Auth Key'),
            'password_hash' => Yii::t('app', 'Пароль'),
            'password_reset_token' => Yii::t('app', 'Password Reset Token'),

            'oldPass' => Yii::t('app', 'Старый пароль:'),
            'newPass' => Yii::t('app', 'Новый пароль:'),
            'newPass_repeat' => Yii::t('app', 'Повторите пароль:'),
            'newEmail' => Yii::t('app', 'Новый адресс:'),


            'email' => Yii::t('app', 'Email'),
            'status' => Yii::t('app', 'Status'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }

    public function getUserdescriptions()
    {
        return $this->hasOne(UserDescription::className(), ['id' => 'id']);
    }

    public function getUserprivacy()
    {
        return $this->hasOne(UserPrivacy::className(), ['id' => 'id']);
    }
 
}
