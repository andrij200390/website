<?php

namespace app\models;

use Yii;
use yii\helpers\Html;

class UserAvatar extends UserDescription
{
    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'image' => Yii::t('app', 'Аватар'),
        ];
    }

    /**
     * Gets an avatar relative path.
     *
     * @param int    $userId     User ID
     * @param string $avatarSize Avatar's size (small, medium, big) (?custom)
     *
     * @return string Path to the user's avatar image
     */
    public static function getAvatarPath($userId, $avatarSize = 'small')
    {
        return Yii::$app->params['avatarPathUrl'].$userId.'_'.$avatarSize.'.jpg';
    }

    /**
     * Gets an image of avatar.
     *
     * @param int    $userId     User ID
     * @param string $avatarSize Avatar's size (small, medium, big) (?custom)
     * @param string $tagClass   Custom classes for <img> tag
     *
     * @return string An HTML <img> tag with all the necessary parameters
     *
     * TODO: Caching
     */
    public static function getImg($userId, $avatarSize = 'small', $tagClass = '')
    {
        $user_avatar_path = Yii::$app->params['avatarPathUrl'].$userId.'_'.$avatarSize.'.jpg';
        $user_nickname = UserDescription::getNickname($userId);
        $user_culture = UserDescription::getCulture($userId);

        $tagClass .= ' culture_'.$user_culture;

        $user_avatar_img = Html::img($user_avatar_path, [
            'class' => $tagClass,
            'alt' => Yii::t('app', 'Аватар пользователя {user}', ['user' => $user_nickname]),
        ]);

        return $user_avatar_img;
    }
}
