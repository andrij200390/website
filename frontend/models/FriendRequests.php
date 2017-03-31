<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%friend_requests}}".
 *
 * @property string $id
 * @property string $owner
 * @property string $user
 * @property integer $status
 * @property string $text
 * @property string $created
 */
class FriendRequests extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%friend_requests}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['owner', 'user', 'text'], 'required'],
            [['owner', 'user', 'status'], 'integer'],
            [['created'], 'safe'],
            [['text'], 'string', 'max' => 255],
            [['text'], 'filter', 'filter' => 'trim'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'owner' => Yii::t('app', 'Владелец'),
            'user' => Yii::t('app', 'Пользователь'),
            'status' => Yii::t('app', 'Статус'),
            'text' => Yii::t('app', 'Сообщение'),
            'created' => Yii::t('app', 'Создан'),
        ];
    }

    public static function setStatus(){
        return [
            0 => Yii::t('app', 'Новое'),
            1 => Yii::t('app', 'Ждет ответа'),
            2 => Yii::t('app', 'Отказ'),
        ];
    }

    public static function getStatus($id = null){
        $r = self::setStatus();
        if($id !== null){
           return isset($r[$id]) ? $r[$id] : null;
        }
        return $r;
    }

    public function getOwners()
    {
        return $this->hasOne(User::className(), ['id' => 'owner']);
    }

    public function getUsers()
    {
        return $this->hasOne(User::className(), ['id' => 'user']);
    }

    
}
