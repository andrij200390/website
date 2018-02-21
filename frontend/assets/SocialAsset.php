<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * @author [SC]Smash3r <scsmash3r@gmail.com>
 *
 * @since 1.0
 */
class SocialAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';

    public $css = [
        'css/blaze.min.css',
        'css/select2.min.css',
        'css/font/fonts.css',
        'css/owlcarousel/owl.carousel.min.css',
        'css/owlcarousel/owl.theme.default.min.css',
        'css/fancybox/jquery.fancybox.min.css',

        'css/outstyle/base.layout.css',
        'css/outstyle/base.boxes.css',
        'css/outstyle/misc.layout.css',
        'css/outstyle/misc.modal.css',
        'css/outstyle/social.layout.css',
        'css/outstyle/social.header.css',
        'css/outstyle/social.sidebar.css',
        'css/outstyle/social.user.css',
        'css/outstyle/social.user.attachments.css',
        'css/outstyle/social.video.css',
        'css/outstyle/social.friends.css',
        'css/outstyle/social.comments.css',
        'css/outstyle/social.board.post.css',

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

        'js/outstyle.social.sidebar.js',
        'js/outstyle.user.video.js',
        'js/outstyle.user.friends.js',
        'js/outstyle.user.attachments.js',
        'js/outstyle.userboard.js',
        'js/outstyle.userboard.posts.js',
        'js/outstyle.modal.js',
        'js/outstyle.comments.js',

        'js/outstyle.notifications.js',
        #'js/outstyle.googletags.js',

    ];
    public $depends = [
        'yii\web\YiiAsset',
    ];
}
