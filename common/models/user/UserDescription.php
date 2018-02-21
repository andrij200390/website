<?php

namespace common\models\user;

use Yii;
use yii\helpers\ArrayHelper;
use common\models\User;

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
          'team' => Yii::t('app', 'Команда'),
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
          'rating' => Yii::t('app', 'Rating'),
        ];
    }

    public static function showInfo($field, $model, $show = '1')
    {
        $r = null;
        switch ($field) {
            case 'country':
                $r =  false;
                break;
            case 'sex':
                $r = ($model->{$field})?ArrayHelper::getValue(self::sexList(), $model->{$field}):false;
                break;
            case 'family':
                $r = ($model->{$field})?ArrayHelper::getValue(self::familyList(), $model->{$field}):false;
                break;
            case 'culture':
                $r = ($model->{$field})?ArrayHelper::getValue(self::cultureList(), $model->{$field}):false;
                break;
            case 'city':
                $r = false;
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

    /**
     * Family status list
     * @return array
     */
    public static function familyList()
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

    /**
     * Sex status list
     * @return array
     */
    public static function sexList()
    {
        return [
          'male' => Yii::t('app', 'Мужской'),
          'female' => Yii::t('app', 'Женский'),
        ];
    }

    /**
     * Culture names list
     *
     * @param  boolean  $forCSS If set to true, the names will be returned as a class name representation in CSS file.
     * @return array
     */
    public static function cultureList($forCSS = false)
    {
        if ($forCSS == true) {
            return [
              0 => 'default',
              1 => 'breaking',
              2 => 'graffiti',
              3 => 'rap',
              4 => 'dj',
            ];
        }

        return [
          0 => Yii::t('app', '- не выбрано -'),
          1 => Yii::t('app', 'b-boy/b-girl'),
          2 => Yii::t('app', 'graffiti writer'),
          3 => Yii::t('app', 'mc/rapper'),
          4 => Yii::t('app', 'dj'),
        ];
    }

    /* Relations */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'id']);
    }

}
