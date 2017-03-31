<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\PortalAsset;
use frontend\widgets\Alert;
use frontend\widgets\WidgetLogin;
use frontend\widgets\WidgetRegistry;
use frontend\widgets\WidgetLeftMenu;
use app\models\Friend;
use app\models\Message;



/* @var $this \yii\web\View */
/* @var $content string */

PortalAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <?= Html::csrfMetaTags() ?>

    <title><?= Html::encode($this->title) ?></title>

    <link href="<?php echo Yii::$app->homeUrl; ?>css/font/fonts.css" rel="stylesheet">
    <link href="/css/jquery-ui.min.css" rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <link rel="shortcut icon" href="/css/favicon.ico">

    <link type="text/css" rel="stylesheet" href="<?php echo Yii::$app->homeUrl; ?>css/jquery.jscrollpane.css"/>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="/js/autosize.min.js"></script>
    <script src="/js/functions.js"></script>
</head>
<body>
<?php $this->beginBody() ?>
<header class="toHeader"></header>
<section class="sectionMain">
    <header class="secondHeader">
        <a href="/" title="OutStyle"><img src="<?php echo Yii::$app->homeUrl; ?>css/img/logo.png" class="logo" alt="OutStyle"></a>
<!--         <div class="player">
            <a href="javascript:void(0);"><img src="<?//php echo Yii::$app->homeUrl; ?>css/img/player_row_left.png" alt="back"></a>
            <a href="javascript:void(0);"><img src="<?//php echo Yii::$app->homeUrl; ?>css/img/player_go.png" alt="go"></a>
            <a href="javascript:void(0);"><img src="<?//php echo Yii::$app->homeUrl; ?>css/img/player_row_right.png" alt="next"></a>
            <a href="javascript:void(0);" class="repeat">1</a>
            <span>0:46</span>
            <img src="<?//php echo Yii::$app->homeUrl; ?>css/img/player_girl.png" alt="photo">
            <div class="progressDiv">
                <span>Lana Del Rey – Serial Killer (K Theory Remix)</span>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                </div>
            </div>
            <span>4:19</span>
            <a href="javascript:void(0);"><img src="<?//php echo Yii::$app->homeUrl; ?>css/img/player_volume.png" alt="volume"></a>
            <a href="javascript:void(0);"><img src="<?//php echo Yii::$app->homeUrl; ?>css/img/player_list.png" alt="listing track"></a>
        </div> -->
    </header>
    <div class="sidebar">
        <div class="sidebarClear"></div>
        <ul class="sidebarMenu">
            <li><a href="/myprofile/" title="Стена"><i class="icons icons-wall"></i> Стена</a></li>
            <li><a href="<?=Url::toRoute('/myprofile/friends');?>" title="Друзья"><i class="icons icons-friends"></i> Друзья
            <?php if ($count = Friend::getRequest()) {?>
                <span class="sidebarBadge"><?=$count?></span>
            <?php } ?>

            </a></li>
            <li><a href="<?=Url::toRoute('/myprofile/photos');?>" title="Фото"><i class="icons icons-photo"></i> <span class="menu-size">Фото <!--<div class="rectangle">11</div> --></span> </a></li>
            <li><a href="<?=Url::toRoute('/myprofile/video');?>" title="Видео"><i class="icons icons-video"></i> Видео</a></li>
            <!-- <li><a href="/" title="Аудио"><i class="icons icons-audio"></i> Аудио</a></li> -->
            <li><a href="<?php echo Url::toRoute('/myprofile/chat');?>" title="Сообщения 9873"><i class="icons icons-messages"></i> Сообщения
            <?php if ($countMessage = Message::getNewMessage()) {?>
                <span class="sidebarBadge2"><?=$countMessage?></span>
            <?php } ?>
            </a></li>
            <!-- <li><a href="<?//php echo Url::toRoute('/groups/index');?>" title="Группы"><i class="icons icons-groups"></i> Группы</a></li> -->
            <li><a href="<?php echo Url::toRoute('/myprofile/newsfeed');?>" title="Новости"><i class="icons icons-news"></i> Новости</a></li>
            <li><a href="<?=Url::toRoute('/events/');?>" title="События"><i class="icons icons-events"></i> События</a></li>
            <li><a href="<?php echo Url::toRoute('/myprofile/settings');?>" title="Настройки"><i class="icons icons-settings"></i> Настройки</a></li>
        </ul>
        <div class="sidebarForm">
            <form action="/" method="post" accept-charset="UTF-8" id="search-form">
                <input type="submit" value="" id="searchSubmit">
                <label for="searchText"> </label>
                <input type="text" name="" value="" id="searchText">
            </form>
        </div>
        <div class="listLaws">
            <a href="<?=Url::toRoute('/page/rules');?>" title="Правила">Правила</a> &#9675
            <a href="<?=Url::toRoute('/page/advertising');?>" title="Реклама">Реклама</a>
            <a href="<?=Url::toRoute('/page/confidentiality');?>" title="Конфеденциальность">Конфеденциальность</a>
            <a href="<?=Url::toRoute('/page/feedback');?>" title="Обратная связь">Обратная связь</a>
        </div>
    </div>
    <main class="content">
<!--     <?//php if(Yii::$app->session->hasFlash('cess')):?>
    <div class="info">
        <?//php echo Yii::$app->session->getFlash('cess'); ?>
    </div>
<?//php endif; ?> -->
         <?=$content;?>
    </main>
    
</section>
<!--<script src="/js/vue.js"></script>-->
<script type="text/javascript" src="/js/sitebar.js"></script>
<script type="text/javascript" src="/js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery.jscrollpane.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/home.js"></script>
<script src="/js/for_modal.js"></script>
<script src="/js/underscore.js"></script>
<script src="/js/scriptD.js"></script>
<script src="/js/social.js"></script>
<script src="/js/users.js"></script>
<script src="/js/users-index.js"></script>
<!--<script src="/js/vue/filters.js"></script>-->
<!--<script src="/js/vue/components.js"></script>-->
<!--<script src="/js/app.js"></script>-->
<div id="scrollup"><img alt="Прокрутить вверх" src="<?php echo Yii::$app->homeUrl; ?>css/img/view-foto-arrow.png"></div>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
