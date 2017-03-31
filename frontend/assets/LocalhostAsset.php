<?php 
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class LocalhostAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';

    public $css = [
        'css/font/fonts.css',
        'css/jquery-ui.min.css',
        'css/bootstrap.min.css',
        'css/bootstrap-theme.min.css',
        'css/jquery.jscrollpane.css',
        'css/slick-theme.css',
        'css/slick.css',
        'css/site.css',
        'css/outstyle.css',
    ];   
    public $js = [
        'js/bootstrap-editable.min.js',
        'js/autosize.min.js',
        'js/jquery.ellipsis.js',
        '//npmcdn.com/imagesloaded@4.1/imagesloaded.pkgd.min.js',
        '//maps.googleapis.com/maps/api/js?key=AIzaSyA0_VDB748HU0g2x8QjuemKdXbcNuwbKj0&amp;extension=.js',
        'js/masonry.pkgd.js',
        'js/functions.js',
        'js/for_modal.js',
        'js/topNav.js',
        'js/slick.js',
        'js/scriptD.js',
        'js/portal.js',
        '//cdn.intercoolerjs.org/intercooler-1.0.0.min.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
    ];
} 