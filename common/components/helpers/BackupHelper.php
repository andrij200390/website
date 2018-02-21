<?php
namespace common\components\helpers;

use Yii;

class BackupHelper
{
    const THIRDPARTY_JSON_DIR = '/common/thirdparty/json/';
    /**
     * Makes a backup of received data from certain provider (VK API or GOOGLE API, etc.) to .JSON file
     * @param  string $key           Filename
     * @param  array  $data          Valid json_decode'd array to store
     * @return num_of_bytes|FALSE    See: http://php.net/function.file-put-contents
     */
    public static function saveJSON($key, $data)
    {
        $dir = $_SERVER['DOCUMENT_ROOT'].self::THIRDPARTY_JSON_DIR;
        if (!file_exists($dir)) {
            @mkdir($dir, 0777);
        }
        return file_put_contents($dir.$key.'.json', json_encode($data, JSON_UNESCAPED_UNICODE));
    }

    public static function getJSON($key)
    {
        $dir = $_SERVER['DOCUMENT_ROOT'].self::THIRDPARTY_JSON_DIR;
        return json_decode(file_get_contents($dir.$key.'.json'));
    }
}
