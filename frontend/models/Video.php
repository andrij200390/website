<?php

namespace app\models;

use Yii;
use yii\behaviors\TimestampBehavior;

class Video extends \common\models\Video
{
    /* RELATIONS */
    public function comments()
    {
        return $this->hasMany(Comments::className(), ['elem_id' => 'id'])->andWhere([ 'elem_type' => 'video']);
    }
}
