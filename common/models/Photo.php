<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%photo}}".
 *
 * @property string $id
 * @property string $user
 * @property string $album
 * @property string $name
 * @property string $img
 * @property string $created
 */
class Photo extends \yii\db\ActiveRecord
{
    /**
     * imageUploaderBehavior - https://github.com/demisang/yii2-image-uploader
     * Needed for 'Photo' image uploading.
     */
    public function behaviors()
    {
        return [
        'imageUploaderBehavior' => [
          'class' => 'demi\image\ImageUploaderBehavior',
          'imageConfig' => [
            'imageAttribute' => 'img',
            'savePathAlias' => Yii::$app->params['imagesPathDir'].'photoalbum',
            'rootPathAlias' => Yii::$app->params['imagesPathDir'],
            'noImageBaseName' => 'noimage.jpg',
            'imageSizes' => [
              '' => 2000, /* Also serves as a maxWidth limit for uploaded file and only for this set of image sizes */
              '150x150_' => 150, /* 1/1 aspect ratio */
            ],
            'imageValidatorParams' => [
              'minWidth' => 150,
              'minHeight' => 150,
              'maxWidth' => 2000,
              'maxHeight' => 2000,
            ],
            'aspectRatio' => [
              1 / 1,
            ],
            'imageRequire' => false,
            'uploadMultiple' => 3,
            'deleteRow' => true,
            'fileTypes' => 'jpg,jpeg,gif,png',
            'maxFileSize' => 3145728,
            'backendSubdomain' => 'admin.',
          ],
        ],
      ];
    }

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%photo}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user'], 'default', 'value' => Yii::$app->user->id],
            [['user', 'album'], 'required'],
            [['user', 'album'], 'integer'],
            [['name'], 'filter', 'filter' => 'trim'],
            [['created'], 'safe'],
            [['name'], 'string', 'max' => 255],
            [['img'], 'file', 'skipOnEmpty' => true, 'extensions' => 'png, jpg', 'maxFiles' => 3],
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
            'album' => Yii::t('app', 'Album'),
            'name' => Yii::t('app', 'Name'),
            'img' => Yii::t('app', 'Image'),
            'created' => Yii::t('app', 'Created'),
        ];
    }

    /**
     * Gets all photos by album ID
     *
     * @param string $album_id  ID of an album containing photos
     *
     * @return array Array containing all the links
     */
    public static function getByAlbumId($album_id)
    {
        $photos = self::find()->where(array('album' => $album_id))->select('img')->asArray()->all();
        foreach ($photos as $i => $photo) {
            $photos[$i]['img_thumbnail'] = self::addPrefixToPhoto($photo['img'], '150x150_');
        }

        return $photos;
    }

    /**
     * Adds a prefix to photo for getting thumbnails
     * @param string $path   Path to image (original)
     * @param string $prefix Needed prefix (size)
     *
     * @return string Modified path to file
     */
    public static function addPrefixToPhoto($path, $prefix = null)
    {
        if ($prefix === null || $prefix == '') {
            return $path;
        }

        $path = str_replace('\\', '/', $path);
        $dir = explode('/', $path);
        $lastIndex = count($dir) - 1;
        $dir[$lastIndex] = $prefix.$dir[$lastIndex];

        return implode('/', $dir);
    }

    /* ? */
    public static function getPhotoName($name, $userID, $in = '')
    {
        $url = Url::home(true).'images/photo/'.$userID.'/';
        if ($in == 'small') {
            return $url.'small_'.$name.'.jpg';
        } elseif ($in == 'normal') {
            return $url.'normal_'.$name.'.jpg';
        }

        return $url.''.$name.'.jpg';
    }

    /* Relations */
    public function getPhotoalbum()
    {
        return $this->hasOne(Photoalbum::className(), ['id' => 'album']);
    }

}
