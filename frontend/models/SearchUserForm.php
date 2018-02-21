<?php

namespace frontend\models;

use Yii;
use yii\base\Model;


class SearchUserForm extends Model {

    public $search;
    public $country;
    public $sex;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['search'], 'required'],
            [['country', 'sex'], 'safe'],
            [['search'], 'string', 'max' => 255],
            [['country'], 'integer'],
            ['sex', 'in', 'range' => ['male', 'female']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'search' => Yii::t('app', 'Поиск'),
            'country' => Yii::t('app', 'Страна'),
            'sex' => Yii::t('app', 'Пол'),
        ];
    }
}