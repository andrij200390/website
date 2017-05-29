<?php
/**
 * @link http://www.yiiframework.com/
 *
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 *
 * @since 2.0
 */
class PortalAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';

    public $css = [
        'css/blaze.min.css',
        'css/select2.min.css',
        'css/font/fonts.css',
        'css/portal.css',

        'css/owlcarousel/owl.carousel.min.css',
        'css/owlcarousel/owl.theme.default.min.css',
        'css/fancybox/jquery.fancybox.min.css',
    ];
    public $js = [
        'js/jquery.easyModal.js',
        'js/packery.pkgd.min.js',
        'js/intercooler-1.0.3.min.js',
        'js/select2/select2.full.min.js',
        'js/owlcarousel/owl.carousel.min.js',
        'js/fancybox/jquery.fancybox.min.js',

        'js/misc/autosize.min.js',
        'js/misc/ohsnap.min.js',
        'js/misc/echo.min.js',
        'js/misc/preciseTextResize.js',
        'js/misc/way.min.js',

        'js/outstyle.analytics.js',

    ];
    public $depends = [
        'yii\web\YiiAsset',
    ];
}
