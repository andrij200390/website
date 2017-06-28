<?php

namespace app\models;

use Yii;

/**
* This is the model class for table "z_video".
*
* @property integer $id
* @property string $user
* @property string $service
* @property string $video_id
* @property string $title
* @property string $description
* @property string $url_img
* @property string $url_iframe
* @property integer $created
* @property integer $privacy_video
* @property integer $privacy_comments
*/

class Video extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%video}}';
    }

    /**
     * @inheritdoc
     */

    public function rules()
    {
        return [
           [
             [
               'user',
               'service',
               'video_id',
               'title',
               'url_img',
               'url_iframe',
               'created'
             ],
             'required'
           ],
           [['privacy_video', 'privacy_comments', 'user'], 'integer'],
           [['service', 'video_id', 'title', 'description', 'url_img', 'url_iframe'], 'string', 'max' => 255],
           [['created'], 'safe']
       ];
    }

    /**
    * @inheritdoc
    */
    public function attributeLabels()
    {
        return [
           'id' => 'ID',
           'user' => 'User',
           'service' => 'Service',
           'video_id' => 'Video ID',
           'title' => 'Title',
           'description' => 'Description',
           'url_img' => 'Url Img',
           'url_iframe' => 'Url Iframe',
           'created' => 'Created',
           'privacy_video' => 'Privacy Video',
           'privacy_comments' => 'Privacy Comments',
        ];
    }

    public function comments()
    {
        return $this->hasMany(Comments::className(), ['elem_id' => 'id'])->andWhere([ 'elem_type' => 'video']);
    }

    public static function getUserNickname($id)
    {
        return UserDescription::findOne(['id' => $id])->nickname;
    }
}
