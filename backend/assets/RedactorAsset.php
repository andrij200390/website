<?php
/**
 * Imperavi Plugins Redactor
 */

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * @author [SC]Smash3r <scsmash3r@gmail.com>
 * @since 1.0
 */
class RedactorAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $js = [
        'js/redactor/videos.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
