<?php

namespace common\models;

use Yii;
use common\components\helpers\ModelHelper;
use common\components\helpers\StringHelper;

/**
 * This is the model class for table "{{%photoalbum}}".
 *
 * @property string $id
 * @property string $user
 * @property string $name
 * @property string $url
 * @property string $text
 * @property string $created
 * @property int $privacy
 * @property int $cover
 */
class Photoalbum extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%photoalbum}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user', 'name', 'url'], 'required'],
            [['user', 'privacy', 'cover'], 'integer'],
            [['text'], 'string'],
            [['text'], 'default', 'value' => ''],
            [['created'], 'safe'],
            [['name', 'url'], 'string', 'max' => 64],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'user' => Yii::t('app', 'User'),
            'name' => Yii::t('app', 'Name'),
            'url' => Yii::t('app', 'Url'),
            'text' => Yii::t('app', 'Description'),
            'created' => Yii::t('app', 'Created'),
            'privacy' => Yii::t('app', 'Privacy'),
            'cover' => Yii::t('app', 'Cover'),

        ];
    }

    /**
     * Creates new photoalbum for another model.
     *
     * @param string $controllerId Another related controller ID (required)
     * @param int    $modelId      Another related model object (required)
     *
     * @return int $photoalbumId    Created album ID on success, false (0) on failure
     */
    public function create($controllerId = '', $modelId = 0)
    {
        /* Getting model obj to populate photoalbum */
        $model = ModelHelper::findBy($controllerId, $modelId);

        $this->user = Yii::$app->user->id;
        $this->name = isset($model->title) ? $model->title : Yii::t('app', 'Photoalbum description');
        $this->url = isset($model->url) ? $model->url : StringHelper::slugify($this->name);
        $this->created = date('Y-m-d H:i:s');

        if ($this->validate() && $model->validate()) {
            $this->save();

            /* Setting photoalbum ID for related model */
            $model->album = $this->id;
            $model->save();
        }
    }

    /* Relations */
    public function getPhoto()
    {
        return $this->hasMany(Photo::className(), ['album' => 'id']);
    }

    public function getSchool()
    {
        return $this->hasMany(School::className(), ['album' => 'id']);
    }
}
