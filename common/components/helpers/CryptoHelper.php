<?php

namespace common\components\helpers;

use Yii;

/**
 * CryptoHelper provides a set of static methods for working with everything that is related to 'cryptography'.
 *
 * @author [SC]Smash3r <scsmash3r@gmail.com>
 *
 * @since 1.0
 */
class CryptoHelper
{
    /**
      * Simple encrypt and decrypt
      *
      * @param string $string string to be encrypted/decrypted
      * @param string $action what to do with this? e for encrypt, d for decrypt
      */
    public static function simpleEncryptDecrypt($string, $action = 'e')
    {
        $secret_key = Yii::$app->params['CryptoHelper']['hashKeys'][0];
        $secret_iv = Yii::$app->params['CryptoHelper']['hashKeys'][1];

        $output = false;
        $encrypt_method = Yii::$app->params['CryptoHelper']['encryptMethod'];
        $key = hash(Yii::$app->params['CryptoHelper']['hashAlgo'], $secret_key);
        $iv = substr(hash(Yii::$app->params['CryptoHelper']['hashAlgo'], $secret_iv), 0, 16);

        if (strlen($iv) == 8) {
            $iv = $iv.Yii::$app->params['CryptoHelper']['hash8bits'];
        }

        if ($action == 'e') {
            $output = base64_encode(openssl_encrypt($string, $encrypt_method, $key, 0, $iv));
        } elseif ($action == 'd') {
            $output = openssl_decrypt(base64_decode($string), $encrypt_method, $key, 0, $iv);
        }

        return $output;
    }
}
