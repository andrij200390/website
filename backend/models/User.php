<?php

namespace backend\models;



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
    public function rules()
    {
        return [
            [['username', 'auth_key', 'password_hash','password_reset_token'], 'filter', 'filter' => 'trim'],
            [['username', 'auth_key', 'password_hash', 'email', 'created_at', 'updated_at'], 'required'],
            [['status', 'created_at', 'updated_at'], 'integer'],
            [['username', 'password_reset_token', 'email'], 'string', 'max' => 255],
            [['auth_key'], 'string', 'max' => 32],
            [['email'], 'email'],
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
            'email' => Yii::t('app', 'Email'),
            'status' => Yii::t('app', 'Status'),
            'created_at' => Yii::t('app', 'Зарегистрирован'),
            'updated_at' => Yii::t('app', 'Последнее посещение'),
        ];
    }


    public static function usersSelect(){
        $model = self::find()->orderBy('username')->all();
        $r = [];
        foreach($model AS $v){
            $r[$v->id] = $v->username;
        }
        return $r;
    }

    public function getUserdescriptions()
    {
        return $this->hasOne(UserDescription::className(), ['id' => 'id']);
    }
}