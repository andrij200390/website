<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%user_description}}".
 *
 * @property string $id
 * @property string $name
 * @property string $status
 * @property string $birthday
 * @property string $phone
 * @property string $site
 */
class UserDescription extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_description}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'status', 'phone', 'site', 'skype', 'city', 'culture', 'about'], 'filter', 'filter' => 'trim'],
            [['id'], 'required'],
            [['id', 'country', 'family', 'language'], 'integer'],
            [['birthday'], 'safe'],
            ['birthday', 'date', 'format' => 'yyyy-M-d'],
            [['name', 'status', 'phone', 'site', 'skype', 'city', 'culture', 'about'], 'string', 'max' => 255],
            ['site', 'url'],
            ['sex', 'in', 'range' => ['male', 'female']],
            ['family', 'in', 'range' => range(0, 8)],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Ф.И.О.'),
            'status' => Yii::t('app', 'Статус'),
            'birthday' => Yii::t('app', 'День рождения'),
            'phone' => Yii::t('app', 'Телефон'),
            'site' => Yii::t('app', 'Сайт'),
            'skype' => Yii::t('app', 'Skype'),
            'city' => Yii::t('app', 'Город'),
            'about' => Yii::t('app', 'Кратко о себе'),
            'culture' => Yii::t('app', 'Я в культуре'),

            'sex' => Yii::t('app', 'Пол'),
            'family' => Yii::t('app', 'Семейное положение'),
            'language' => Yii::t('app', 'Язык'),
            'country' => Yii::t('app', 'Страна'),
        ];
    }

    public static function setSexList(){
        return [
            'male' => Yii::t('app', 'Мужской'),
            'female' => Yii::t('app', 'Женский'),
        ];
    }

    public static function getSexList($id = null){
        $r = self::setSexList();
        if($id !== null){
            return (isset($r[$id]))?$r[$id]:'';
        }
        return $r;
    }


    public static function setFamilyList(){
        return [
            0 => Yii::t('app', '- не выбрано -'),
            1 => Yii::t('app', 'Замужем'),
            2 => Yii::t('app', 'Женат'),
            3 => Yii::t('app', 'Не замужем'),
            4 => Yii::t('app', 'Не женат'),
            5 => Yii::t('app', 'Встречаюсь'),
            6 => Yii::t('app', 'Любовь'),
            7 => Yii::t('app', 'Все сложно'),
            8 => Yii::t('app', 'В активном поиске'),
        ];
    }

    public static function getFamilyList($id = null){
        $r = self::setFamilyList();
        if($id !== null){
            return (isset($r[$id]) && $id > 0)?$r[$id]:null;
        }
        return $r;
    }

    public function getCountries()
    {
        return $this->hasOne(Country::className(), ['country_id' => 'country']);
    }

    public function afterFind(){

    }
}
