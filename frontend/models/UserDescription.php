<?php

namespace app\models;

use app\models\City;

use Yii;

/**
 * This is the model class for table "z_user_description".
 *
 * @property string $id
 * @property string $name
 * @property string $last_name
 * @property string $nickname
 * @property string $status
 * @property integer $family
 * @property string $birthday
 * @property integer $birthday_show
 * @property string $country
 * @property string $city
 * @property int    $culture
 * @property string $team
 * @property string $phone
 * @property string $site
 * @property string $skype
 * @property string $music
 * @property string $film
 * @property string $shows
 * @property string $books
 * @property string $game
 * @property string $citation
 * @property string $about
 * @property string $politics
 * @property string $world_view
 * @property string $worth_life
 * @property string $worth_people
 * @property string $inspiration
 * @property string $language
 * @property string $sex
 * @property string $rating
 * @property string $avatar
 * @property string $avatar_small
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
    public $day;
    public $month;
    public $year;
    public $search;


    public function rules()
    {
        return [

          [['id','name', 'last_name', 'nickname'], 'required'],
          [['name', 'last_name', 'nickname', 'city', 'culture', 'team', 'phone', 'site', 'skype', 'politics', 'worth_life', 'worth_people', 'inspiration', 'day', 'month', 'year', 'birthday_show', 'rating', 'search', 'avatar', 'avatar_small'], 'filter', 'filter' => 'trim'],
          [['id', 'family', 'country', 'language','day', 'month', 'year', 'birthday_show', 'rating'], 'integer'],
          [['birthday'], 'safe'],
          ['birthday', 'date', 'format' => 'yyyy-M-d'],
          [['name', 'last_name', 'nickname', 'city', 'culture', 'team', 'phone', 'site', 'skype', 'politics', 'worth_life', 'worth_people', 'inspiration'], 'string', 'max' => 255],
          ['site', 'url'],
          [['status', 'music', 'film', 'shows', 'books', 'game', 'citation', 'about', 'world_view', 'sex', 'search', 'avatar', 'avatar_small'], 'string'],
          ['sex', 'in', 'range' => ['male', 'female']],
          ['family', 'in', 'range' => range(0, 8)],
        ];
    }

    public function attributeLabels()
    {
        return [
          'id' => Yii::t('app', 'ID'),
          'name' => Yii::t('app', 'Имя'),
          'last_name' => Yii::t('app', 'Фамилия'),
          'nickname' => Yii::t('app', 'Никнейм'),
          'status' => Yii::t('app', 'Статус'),
          'family' => Yii::t('app', 'Отношения'),
          'birthday' => Yii::t('app', 'День рождения'),
          'birthday_show' => Yii::t('app', ''),
          'country' => Yii::t('app', 'Страна'),
          'city' => Yii::t('app', 'Город'),
          'culture' => Yii::t('app', 'Кто Вы в культуре'),
          'team' => Yii::t('app', 'Название команды'),
          'phone' => Yii::t('app', 'Телефон'),
          'site' => Yii::t('app', 'Сайт'),
          'skype' => Yii::t('app', 'Скайп'),
          'music' => Yii::t('app', 'Музыка'),
          'film' => Yii::t('app', 'Фильмы'),
          'shows' => Yii::t('app', 'Шоу'),
          'books' => Yii::t('app', 'Книги'),
          'game' => Yii::t('app', 'Игры'),
          'citation' => Yii::t('app', 'Цитаты'),
          'about' => Yii::t('app', 'О себе'),
          'politics' => Yii::t('app', 'Политика'),
          'world_view' => Yii::t('app', 'Мировоззрение'),
          'worth_life' => Yii::t('app', 'Главное в жизни'),
          'worth_people' => Yii::t('app', 'Главное в людях'),
          'inspiration' => Yii::t('app', 'Источники вдохновения'),
          'sex' => Yii::t('app', 'Пол'),
          'day' => Yii::t('app', ''),
          'month' => Yii::t('app', ''),
          'year' => Yii::t('app', ''),
          'rating' => Yii::t('app', ''),
          'search' => Yii::t('app', ''),
        ];
    }

    public static function listLabels()
    {
        return [
          'name' => Yii::t('app', 'Имя'),
          'last_name' => Yii::t('app', 'Фамилия'),
          'nickname' => Yii::t('app', 'Никнейм'),
          'status' => Yii::t('app', 'Статус'),
          'rating' => Yii::t('app', 'Рейтинг'),
          'family' => Yii::t('app', 'Отношения'),
          'birthday' => Yii::t('app', 'День рождения'),
          'country' => Yii::t('app', 'Страна'),
          'city' => Yii::t('app', 'Город'),
          'culture' => Yii::t('app', 'Кто Вы в культуре'),
          'team' => Yii::t('app', 'Название команды'),
          'phone' => Yii::t('app', 'Телефон'),
          'site' => Yii::t('app', 'Сайт'),
          'skype' => Yii::t('app', 'Скайп'),
          'music' => Yii::t('app', 'Музыка'),
          'film' => Yii::t('app', 'Фильмы'),
          'shows' => Yii::t('app', 'Шоу'),
          'books' => Yii::t('app', 'Книги'),
          'game' => Yii::t('app', 'Игры'),
          'citation' => Yii::t('app', 'Цитаты'),
          'about' => Yii::t('app', 'О себе'),
          'politics' => Yii::t('app', 'Политика'),
          'world_view' => Yii::t('app', 'Мировоззрение'),
          'worth_life' => Yii::t('app', 'Главное в жизни'),
          'worth_people' => Yii::t('app', 'Главное в людях'),
          'inspiration' => Yii::t('app', 'Источники вдохновения'),
          'sex' => Yii::t('app', 'Пол'),
        ];
    }

    public static function setSexList()
    {
        return [
          'male' => Yii::t('app', 'Мужской'),
          'female' => Yii::t('app', 'Женский'),
        ];
    }

    public static function getSexList($id = null)
    {
        $r = self::setSexList();
        if ($id !== null) {
            return (isset($r[$id]))?$r[$id]:false;
        }
        return $r;
    }


    public static function setFamilyList()
    {
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

    public static function showInfo($field, $model, $show = '1')
    {
        $r = null;
        switch ($field) {
            case 'country':
                $r = (isset($model->countries->name))?$model->countries->name : false;
                break;
            case 'sex':
                $r = ($model->{$field})?self::getSexList($model->{$field}):false;
                break;
            case 'family':
                $r = ($model->{$field})?self::getFamilyList($model->{$field}):false;
                break;
            case 'culture':
                $r = ($model->{$field})?self::getCultureList($model->{$field}):false;
                break;
            case 'city':
                $r = ($model->{$field})?self::getCityList($model->{$field}):false;
                break;
            case 'birthday':
                if ($show == '1') {
                    $r = ($model->{$field}) ? Yii::$app->formatter->asDate($model->{$field}, Yii::$app->params['dateMini']) : false;
                } else {
                    $r = false;
                }
                break;
            default:
                $r = $model->{$field};
        }
        return $r;
    }

    public static function getFamilyList($id = null)
    {
        $r = self::setFamilyList();
        if ($id !== null) {
            return (isset($r[$id]) && $id > 0)?$r[$id]:null;
        }
        return $r;
    }

    public function getCountries()
    {
        return $this->hasOne(Country::className(), ['country_id' => 'country']);
    }

/**
 * Culture names list
 * These 2 functions below are needed to convert INT representation of cultures into human-readable STRING.
 *
 * @param  boolean  $forCSS If set to true, the names will be returned as a class name representation in CSS file.
 * @return array    culture names
 */
    public static function cultureList($forCSS = false)
    {
        /* --- NOTICE: If you will change this values, don't forget to change the corresponding classes in CSS file! --- */
        if ($forCSS == true) {
            return [
              0 => 'default',
              1 => 'breaking',
              2 => 'graffiti',
              3 => 'mc',
              4 => 'dj',
            ];
        }

        return [
          0 => Yii::t('app', '- не выбрано -'),
          1 => Yii::t('app', 'b-boy/b-girl'),
          2 => Yii::t('app', 'mc'),
          3 => Yii::t('app', 'dj'),
          4 => Yii::t('app', 'graffiti writer'),
        ];
    }

/**
 * Gets a corresponding value by it's array key from 'cultureList' function
 *
 * @param  $key             Corresponding array key from 'cultureList' function
 * @param  boolean $forCSS  If set to true, the names will be returned as a class name representation in CSS file.
 * @return string           Returns value from 'cultureList' func
 */
    public static function getCultureList($key = null, $forCSS = false)
    {
        $r = self::cultureList($forCSS);
        if ($key !== null) {
            return (isset($r[$key]) && $key > 0)?$r[$key]:'default';
        }
        return $r;
    }

/**
 * Gets user culture by his ID
 *
 * @param  int          $userId                User ID
 * @param  boolean      $forCSS                If set to true, the culture name will be returned as a class name representation in CSS file.
 * @return string|int                          User nickname or false (if guest)
 */
    public static function getCulture($userId, $forCSS = false)
    {
        $model = self::find()->where(['id'=>$userId])->one();
        if (!empty($model)) {
            if ($forCSS) {
                return self::getCultureList($model->culture, $forCSS);
            }
            return $model->culture;
        }
        return false;
    }

    public static function cityList()
    {
        // $model = City::find()->asArray()->all();
      // return $model;
        return [
          0 => Yii::t('app', '- не выбрано -'),
          1 => Yii::t('app', 'Киев'),
          2 => Yii::t('app', 'Москва'),
          3 => Yii::t('app', 'Минск'),
        ];
    }

/**
 * Get user nickname by his ID
 *
 * @param  int      $userId     User ID
 * @return string               User nickname or false (if guest)
 */
    public static function getNickname($userId)
    {
        $userNickname = self::getDb()->cache(function ($db) use ($userId) {
            return self::findOne(['id' => $userId]);
        }, 3600);

        if (!empty($userNickname)) {
            return $userNickname->nickname;
        }
        return false;
    }


    public static function getCityList($id)
    {
        $model = City::find()->where(['city_id' => $id])->one();
        return $model->name;
    }

    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'id']);
    }

    public function getCity()
    {
        return $this->hasOne(City::className(), ['city_id' => 'city']);
    }

    public function getComments()
    {
        return $this->hasOne(Comments::className(), ['user_id' => 'id']);
    }
}
