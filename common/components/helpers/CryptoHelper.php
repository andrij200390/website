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

/**
 * PseudoCrypt by KevBurns (http://blog.kevburnsjr.com/php-unique-hash)
 * Reference/source: http://stackoverflow.com/a/1464155/933782
 */

    /* Key: Next prime greater than 62 ^ n / 1.618033988749894848 */
    /* Value: modular multiplicative inverse */
    private static $golden_primes = array(
        '1'                  => '1',
        '41'                 => '59',
        '2377'               => '1677',
        '147299'             => '187507',
        '9132313'            => '5952585',
        '566201239'          => '643566407',
        '35104476161'        => '22071637057',
        '2176477521929'      => '294289236153',
        '134941606358731'    => '88879354792675',
        '8366379594239857'   => '7275288500431249',
        '518715534842869223' => '280042546585394647'
    );

    /* Ascii :                    0  9,         A  Z,         a  z     */
    /* $chars = array_merge(range(48,57), range(65,90), range(97,122)) */
    private static $chars62 = array(
        0=>48,1=>49,2=>50,3=>51,4=>52,5=>53,6=>54,7=>55,8=>56,9=>57,10=>65,
        11=>66,12=>67,13=>68,14=>69,15=>70,16=>71,17=>72,18=>73,19=>74,20=>75,
        21=>76,22=>77,23=>78,24=>79,25=>80,26=>81,27=>82,28=>83,29=>84,30=>85,
        31=>86,32=>87,33=>88,34=>89,35=>90,36=>97,37=>98,38=>99,39=>100,40=>101,
        41=>102,42=>103,43=>104,44=>105,45=>106,46=>107,47=>108,48=>109,49=>110,
        50=>111,51=>112,52=>113,53=>114,54=>115,55=>116,56=>117,57=>118,58=>119,
        59=>120,60=>121,61=>122
    );

    public static function base62($int)
    {
        $key = "";
        while (bccomp($int, 0) > 0) {
            $mod = bcmod($int, 62);
            $key .= chr(self::$chars62[$mod]);
            $int = bcdiv($int, 62);
        }
        return strrev($key);
    }

    public static function hash($num, $len = 8)
    {
        $ceil = bcpow(62, $len);
        $primes = array_keys(self::$golden_primes);
        $prime = $primes[$len];
        $dec = bcmod(bcmul($num, $prime), $ceil);
        $hash = self::base62($dec);
        return str_pad($hash, $len, "0", STR_PAD_LEFT);
    }

    public static function unbase62($key)
    {
        $int = 0;
        foreach (str_split(strrev($key)) as $i => $char) {
            $dec = array_search(ord($char), self::$chars62);
            $int = bcadd(bcmul($dec, bcpow(62, $i)), $int);
        }
        return $int;
    }

    public static function unhash($hash)
    {
        $len = strlen($hash);
        $ceil = bcpow(62, $len);
        $mmiprimes = array_values(self::$golden_primes);
        $mmi = $mmiprimes[$len];
        $num = self::unbase62($hash);
        $dec = bcmod(bcmul($num, $mmi), $ceil);
        return $dec;
    }

    /**
     * Converts string to integer
     * @param  string $str
     * @param  string $action e - encrypt, d - decrypt back to string
     * @return int
     */
    public static function simpleIntStrConvert($str, $action = 'e')
    {
        if ($action == 'e') {
            return join(array_map(function ($n) {
                return sprintf('%03d', $n);
            }, unpack('C*', $str)));
        } elseif ($action == 'd') {
            return join(array_map('chr', str_split($str, 3)));
        }

        return 0;
    }

    /**
     * Base62 encoder/decoder
     */
    public static function base62encode($val, $base=62, $chars='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
    {
        // can't handle numbers larger than 2^31-1 = 2147483647
        $str = '';
        do {
            $i = $val % $base; // fmod($val, $base) for handling larger numbers
            $str = $chars[$i] . $str;
            $val = ($val - $i) / $base;
        } while ($val > 0);
        return $str;
    }

    public static function base62decode($str, $base=62, $chars='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
    {
        $len = strlen($str);
        $val = 0;
        $arr = array_flip(str_split($chars));
        for ($i = 0; $i < $len; ++$i) {
            $val += $arr[$str[$i]] * pow($base, $len-$i-1);
        }
        return $val;
    }
}
