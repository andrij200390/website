<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%user_search}}".
 *
 * @property string $id
 * @property string $username
 * @property string $email
 * @property string $name
 */
class UserSearch extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_search}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'username', 'email'], 'required'],
            [['id'], 'integer'],
            [['username', 'email', 'name'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'username' => Yii::t('app', 'Username'),
            'email' => Yii::t('app', 'Email'),
            'name' => Yii::t('app', 'Name'),
        ];
    }

    public function getUsers()
    {
        return $this->hasOne(User::className(), ['id' => 'id']);
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
