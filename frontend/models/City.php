<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "z_city".
 *
 * @property integer $id
 * @property string $name
 */
class City extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'z_city';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
          [['name'], 'required'],
          [['name'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            // 'id' => 'ID',
          'name' => 'Name',
        ];
    }

    public static function getCity()
    {
        $model = self::find()->where(['country_id' => $country_id])->orderBy('name')->asArray()->all();
        return $model;
    }

    public static function getToSelect( $countryId = null, $withSchools = false )
    {
        if ( $countryId ) {
            // Выводить по стране только те города, в которых есть школы
            if ( $withSchools ) {
    //            $countCity = City::find()
    //                ->leftJoin('z_school', '`z_school`.`city` = `z_city`.`city_id`')
    //                ->where(['`z_school`.`country`' => $id])
    //                ->count();
                $cities = City::find()
                    ->leftJoin('z_school', '`z_school`.`city` = `z_city`.`city_id`')
                    ->where(['`z_school`.`country`' => $countryId])
                    ->orderBy('name')
                    ->all();
            } else { // Выводить по стране все города
    //            $countCity = City::find()->where(['country_id' => $id])->count();
                $cities = City::find()->where(['country_id' => $countryId])->orderby('name')->all();
            }
    //        echo "<option value='0'>-Не выбрано-</option>";
    //        if ( $countCity > 0 ) {
    //            foreach ($cities as $city) {
    //                echo "<option value='".$city->city_id."'>".$city->name."</option>";
    //            }
    //        }
    //        else {
    //            echo "<option value='0'>-Не выбрано-</option>";
    //        }
        } else {
            $cities = self::find()->orderBy('name')->asArray()->all();
        }
        return ArrayHelper::map($cities,'city_id', 'name');
    }

}
