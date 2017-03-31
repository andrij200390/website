<?php

namespace app\models;

use Yii;
use frontend\controllers\BoardController;

/**
 * This is the model class for table "{{%board}}".
 *
 * @property string $id
 * @property string $user
 * @property string $created
 * @property string $text
 * @property string $photo
 * @property string $notice
 * @property string $repost
 * @property string $repost_type
 */
class Board extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    
    public static function tableName()
    {
        return '{{%board}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['text'], 'filter', 'filter' => 'trim', 'skipOnArray' => true],
            [['user', 'owner'], 'required'],
            [['user', 'owner', 'repost'], 'integer'],
            [['created'], 'safe'],
            [['repost_type'], 'string', 'length' => [0, 255]],
            [['text'], 'string', 'length' => [0, 65535]],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'user' => Yii::t('app', 'Ползователь'),
            'owner' => Yii::t('app', 'Владелец'),
            'created' => Yii::t('app', 'Создан'),
            'text' => Yii::t('app', ''),
        ];
    }

    public function getOwneruser(){
        return $this->hasOne(User::className(), ['id' => 'owner']);
    }
    public function getOwnerDescription() {
        return $this->hasOne(UserDescription::className(), ['id' => 'owner']);
    }

    public function getBoardRepost() {
        return $this->hasOne(self::className(), ['id' => 'repost', 'repost_type' => 'repost_type']);
    }

    public function getPhotoRepost() {
        return $this->hasOne(Photo::className(), ['id' => 'repost', 'repost_type' => 'repost_type']);
    }

    public function getVideoRepost() {
        return $this->hasOne(Video::className(), ['id' => 'repost', 'repost_type' => 'repost_type']);
    }

    public function attachments(){
        return $this->hasMany(Attahments::className(),['elem_id' => 'id', 'elem_type' => 'board']);
    }
    public function comments(){
        return $this->hasMany(Comments::className(),['elem_id' => 'id'])->andWhere([ 'elem_type' => 'board']);
    }
}
