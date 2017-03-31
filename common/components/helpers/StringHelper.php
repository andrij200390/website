<?php

namespace common\components\helpers;

use Yii;

class StringHelper
{
    /**
     * Reduce Multiples
     * Reduces multiple instances of a particular character. Example:
     * Fred, Bill,, Joe, Jimmy
     * becomes:
     * Fred, Bill, Joe, Jimmy.
     *
     * @param	string
     * @param	string	the character you wish to reduce
     * @param	bool	TRUE/FALSE - whether to trim the character from the beginning/end
     *
     * @return string
     */
    public static function reduceMultiples($str, $character = ',', $trim = false)
    {
        $str = preg_replace('#'.preg_quote($character, '#').'{2,}#', $character, $str);
        if ($trim === true) {
            $str = trim($str, $character);
        }

        return $str;
    }

    /**
     * Creates a slug out of string. Example:
     * slugify('название для статьи') will return:
     * 'nazvanie-dlja-statii'.
     *
     * Currently supports only CYR strings
     *
     * @param $str
     *
     * @return string
     */
    public static function slugify($str)
    {
        $search = '_';
        $replace = '-';
        $go = "а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш щ ъ ы ь э ю я А Б В Г Д Е Ё Ж З И Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ы Ь Э Ю Я ' \" ( ) [ ] { } . ,";
        $to = 'a b v g d e yo zh z i j k l m n o p r s t u f h c ch sh shh i y i ye yu ya A B V G D E Yo Zh Z I J K L M N O P R S T U F H C Ch Sh Shh II Y II YE YU YA _ _ _ _ _ _ _ _ - -';
        $go = explode(' ', $go);
        $to = explode(' ', $to);
        $str = str_replace($go, $to, trim($str));
        $trans = array(
            '&\#\d+?;' => '',
            '&\S+?;' => '',
            '\s+' => $replace,
            '[^a-z0-9\-\._]' => '',
            $search.'+' => $replace,
            $search.'$' => $replace,
            '^'.$search => $replace,
            '\.+$' => '',
        );
        $str = strip_tags($str);
        foreach ($trans as $key => $val) {
            $str = preg_replace('#'.$key.'#i', $val, $str);
        }
        $str = mb_strtolower($str, 'UTF-8');
        $str = self::reduceMultiples($str, '-', true);

        return trim(stripslashes($str));
    }

    /**
     * Cuts a string to a given amount of characters, leaving last whole words uncut.
     *
     * @param string
     * @param number
     *
     * @return string
     */
    public static function cutString($string, $maxlen)
    {
        $len = (mb_strlen($string) > $maxlen)
            ? mb_strripos(mb_substr($string, 0, $maxlen), ' ')
            : $maxlen
        ;
        $cutStr = strip_tags(mb_substr($string, 0, $len));

        return (mb_strlen($string) > $maxlen)
            ? $cutStr.'...'
            : $cutStr
        ;
    }

    /**
     * Converts timestamp to human readable string
     * Using 'datetime.php' messages translations.
     *
     * @param int     UNIX timestamp
     * @param string  date() format (http://php.net/manual/en/function.date.php)
     *
     * @return string
     */
    public static function convertTimestampToHuman($time, $format = '')
    {
        /* If we do not have predefined format */
        if (empty($format)) {
            if (date('d m Y', time()) === date('d m Y', $time)) {
                return Yii::t('datetime',
                  'Today @ {time}',
                  [
                    'time' => date('H:i', $time),
                  ]
                );
            } elseif ((date('d', time()) - date('d', $time)) == 1 && date('m Y', time()) == date('m Y', $time)) {
                return Yii::t('datetime',
                  'Yesterday @ {time}',
                  [
                    'time' => date('H:i', $time),
                  ]
                );
            }

            /* For events we simply pass the text, indicating that event is passed long time ago TODO: RELOCATE FROM HERE! */
            if (Yii::$app->controller->id == 'events' && ($time < time())) {
                return Yii::t('app', 'Event passed');
            }

            /* If our year is already passed one */
            if (date('Y', $time) != date('F', time()) && Yii::$app->controller->id != 'events') {
                return date('d', $time).' '.Yii::t('datetime', 'of '.date('F', $time)).' '.date('Y', $time);
            }

            return date('d', $time).' '.Yii::t('datetime', 'of '.date('F', $time)).' <span>'.date('H:i', $time).'</span>';
        }

        /* Working with different date formats for converting to suit our needs */
        switch ($format) {
            case 'F':
            return Yii::t('datetime', 'of '.date('F', $time));

            default:
            return Yii::t('datetime', date($format, $time));
        }
    }
}
