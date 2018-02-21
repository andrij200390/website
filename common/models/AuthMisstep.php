<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "z_auth_misstep".
 *
 * @property integer $id
 * @property string $ip
 * @property integer $attempt
 */
class AuthMisstep extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'z_auth_misstep';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ip', 'attempt'], 'required'],
            [['attempt', 'created'], 'integer'],
            [['ip'], 'string', 'max' => 255]
        ];
    }
    
    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ip' => 'Ip',
            'attempt' => 'Attempt',
            'created' => 'Created',
        ];
    }
    
    /**
     * Checks for user IP in DB and attempts to login. If more than 10 times unsuccessfull, will block user from triggering login event
     * @returns string
     */
    public static function checkIp()
    {  
        return self::find()->where("ip = :ip", [':ip' => Yii::$app->request->userIP])->one();
    }
}
