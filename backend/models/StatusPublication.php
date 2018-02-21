<?php

namespace backend\models;

use Yii;
use yii\base\Model;


class StatusPublication extends Model
{

    public static function getStatusList(){
        return [
            0 => Yii::t('app', 'На модерации'),
            1 => Yii::t('app', 'Опубликовано'),
            2 => Yii::t('app', 'В черновиках'),
            3 => Yii::t('app', 'Удалено'),
        ];
    }

    public static function getStatus($id = null){
        $r = self::getStatusList();
        if(isset($r[$id])){
            return $r[$id];
        }
        return $r;
    }
    
}
