<?php

namespace common\components\helpers;

use Yii;

/**
 * PrivacyHelper provides a set of static methods for working with everything that is related to 'privacy' entity.
 *
 * @author [SC]Smash3r <scsmash3r@gmail.com>
 *
 * @since 1.0
 */
class PrivacyHelper
{
    /**
     * Privacy array, that describes all available states of privacy policy (i.e. friends relationships, etc)
     *
     * @var array
     */
    const PRIVACY_OPTIONS = [
      0 => 'All users',
      1 => 'Only friends',
      2 => 'Friends and their friends',
      3 => 'Only me',
    ];

    /**
     * Returns all available privacy options for user relations that we're using.
     *
     * @return array
     */
    public static function getPrivacyList()
    {
        return array_map(function ($p) {
            return Yii::t('app', $p);
        }, self::PRIVACY_OPTIONS);
    }

    /**
     * Returns all available privacy options as a numric array.
     *
     * @return array
     */
    public static function getPrivacyArrayKeys()
    {
        return array_keys(self::PRIVACY_OPTIONS);
    }
}
