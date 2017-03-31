<?php

use yii\helpers\Html;
use yii\helpers\Url;
use frontend\widgets\WidgetProfileUserMenu;
use yii\widgets\ActiveForm;
use frontend\models\UserAvatar;
use app\models\UserDescription;
use app\models\User;
use app\models\Photo;
use app\models\Country;
use app\models\City;
use app\models\UserPrivacy;
use yii\helpers\Json;

use kartik\depdrop\DepDrop;

/* @var $this yii\web\View */
$this->title = Yii::t('app', 'Моя страница');
$this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
// $this->params['breadcrumbs'][] = Yii::t('app', '');

$this->params['breadcrumbs'][] = [Yii::t('app', ''), 'url' => Url::toRoute('users/')];

?>

<div class="leftBlock">
  <div class="profileDiv">
    <span><?php echo $statusMy; ?></span> <!--Был сегодня в 17:45?-->

    <div class="profileImg">
      <div class="ava-back">
        <img class="ava-img" src="<?= UserAvatar::getImg(Yii::$app->user->id) ?>"
             alt="<?= Html::encode(Yii::$app->user->identity->username) ?>">
        <img class="ava-progress" src="<?php echo Yii::$app->homeUrl; ?>css/img/ava-progress.png" alt="avatar">
        <img class="ava-border" src="<?php echo Yii::$app->homeUrl; ?>css/img/ava-border.png" alt="avatar">
        <img class="ava-title" src="<?php echo Yii::$app->homeUrl; ?>css/img/ava-title.png" alt="avatar">
        <a class="ava-level" href="javascript:void(0);">
          <img src="<?php echo Yii::$app->homeUrl; ?>css/img/ava_d.png" alt="">

          <div class="title-character">Если тыц сюда, то откроется меню прокачки персонажа и статистика прокачанных
            скилов
          </div>
        </a>
      </div>
    </div>
    <!--<?php echo print_r($model); ?>-->
    <!--<p class="profileFullName">
                  <span><?= $modelDescription->name . " " . $modelDescription->last_name; ?></span>
                </p>-->
    <p class="profileNickName"><?= $modelDescription->nickname; ?></p>

    <p class="user-link">http://<?= $_SERVER['SERVER_NAME'] ?>/profile/<?= $model->id ?>/</p>

    <ul class="profileUl js-active-1">

      <?php
      foreach (UserDescription::listLabels() AS $name => $v) {
        if (!UserDescription::showInfo($name, $modelDescription, $birthdayShow)) {
          continue;
        } 
        
        if ( $name == 'rating' ) { ?>
            <li><span><?= $v ?>:</span> <?= number_format((UserDescription::showInfo($name, $modelDescription, $birthdayShow))/27*100, 0) . ' %' ?></li>
        <?php } else {?>
            <li><span><?= $v ?>:</span> <?= UserDescription::showInfo($name, $modelDescription, $birthdayShow) ?></li>
        <?php } ?>
      <?php } ?>


      <!-- <a href="#modal-edit-settings" onclick="modalUse()" class="open_modal"><li><h4>Редактировать</h4></li></a> -->
      <!--  <a href="#modal-login-regisration" onclick="modalUse()" class="open_modal"><li>Вход/Регистрация</li></a>
       <a href="#modal-forgot-password" onclick="modalUse()" class="open_modal"><li>Забыли пароль</li></a> -->

    </ul>

  </div>
  <div class="push-wrap clearfix">
    <a href="#modal-edit-settings" onclick="modalUse()" class="open_modal"><!-- <li><h4> -->Редактировать
      <!-- </h4></li> --></a>

    <p class="push">подробнее</p>

    <p class="push-item">скрыть</p>
  </div>
  <div class="blockJ friends">
    <!--<img src="<?php echo Yii::$app->homeUrl; ?>css/img/blockJ_l.jpg" alt="" class="blockJ_l">
    <img src="<?php echo Yii::$app->homeUrl; ?>css/img/blockJ_r.jpg" alt="" class="blockJ_r">-->
    <h3><a href="<?php echo Yii::$app->homeUrl; ?>myprofile/friends/">Друзья</a></h3>
    <span><?php echo $friendsCnt; ?></span>

    <?php foreach ($friendsMy as $key => $val): ?>
      <div class="friendsList">
        <a href="<?= Url::toRoute('profile/' . $friendsMy[$key]['id']) ?>">
          <img src="<?php echo Yii::$app->homeUrl; ?>images/avatar/<?= $friendsMy[$key]['id']; ?>_small.jpg"
               class="img-circle imgFrendS" alt="<?= $friendsMy[$key]['nickname']; ?>">
          <?= $friendsMy[$key]['nickname']; ?>
          <?php if ($friendsMy[$key]['onlineInd'] == 1) { ?>
            <i class="greenI"></i>
          <?php } ?>
        </a>
      </div>
    <?php endforeach; ?>

<script>
    $('.imgFrendS').error(function() {
        $(this).attr( "src", "http://devoutstyle.org/images/avatar/def_avatar.jpg" );
    });
</script>

    <div class="clearfix"></div>
    <div class="bootomImg"><a class="add-friend" href="<?php echo Yii::$app->homeUrl; ?>search/index/"><img
          src="<?php echo Yii::$app->homeUrl; ?>css/img/friendsList1.jpg" alt=""></a></div>
  </div>
  <div class="blockJ groups">
    <h3><a href="#">Группы</a></h3>
    <span>25</span>
    <ul class="froups">
      <li><a href="#"><img src="<?php echo Yii::$app->homeUrl; ?>css/img/froups1.jpg"> Best bboys ever
          <small>Группа лучших</small>
        </a></li>
      <li><a href="#"><img src="<?php echo Yii::$app->homeUrl; ?>css/img/froups2.jpg"> Powermove tut...
          <small>Уроки мастеров</small>
        </a></li>
      <li><a href="#"><img src="<?php echo Yii::$app->homeUrl; ?>css/img/froups3.jpg"> Графити гик
          <small>Лучшие техники</small>
        </a></li>
    </ul>
    <div class="clearfix"></div>
    <div class="bootomImg"><img src="<?php echo Yii::$app->homeUrl; ?>css/img/friendsList2.jpg" alt=""></div>
  </div>
  <div class="blockJ">
    <h3><a href="<?= Url::toRoute('/myprofile/video'); ?>">Видео</a></h3>
    <span><?= $countVideo ?></span>

    <?php if (!empty($modelVideo)) {
      foreach ($modelVideo AS $key => $val) { ?>
        <div class="small-video">
          <a href='#modal2' id="<?= $modelVideo[$key]['id'] ?>" class='open_modal open-div-user-video'>
            <div class="video-play"></div>
          </a>
          <!-- <div class="small-video-time">4:02</div> -->
          <img src="<?= $modelVideo[$key]['urlImg'] ?>" alt="<?= $modelVideo[$key]['title'] ?>" width="178px"
               height="97">
        </div>
        <div class="small-video-title"><?= $modelVideo[$key]['title'] ?></div>
        <div class="small-video-date"><?= $modelVideo[$key]['created'] ?>
          через <?= $modelVideo[$key]['service'] ?></div>
      <?php }
    } ?>
    <div class="clearfix"></div>
    <a class="add-video open_modal" href="#modal3" class="open_modal">
      <div class="bootomImg"><img src="<?php echo Yii::$app->homeUrl; ?>css/img/friendsList3.jpg" alt=""></div>
    </a>

  </div>
  <div class="blockJ musik">
    <h3><a href="#">Музыка</a></h3>
    <span>270</span>

    <div class="track">
      <img src="<?php echo Yii::$app->homeUrl; ?>css/img/track1.jpg" alt="">

      <div class="track-avtor">Michael Jackson</div>
      <div class="track-date">3:55</div>
      <div class="track-title">Do You Know Where Your ...</div>
    </div>

    <div class="track">
      <img src="<?php echo Yii::$app->homeUrl; ?>css/img/track1.jpg" alt="">

      <div class="track-avtor">Michael Jackson</div>
      <div class="track-date">3:55</div>
      <div class="track-title">Do You Know Where Your ...</div>
    </div>

    <div class="track">
      <img src="<?php echo Yii::$app->homeUrl; ?>css/img/track1.jpg" alt="">

      <div class="track-avtor">Michael Jackson</div>
      <div class="track-date">3:55</div>
      <!--<div class="clear"></div>-->
      <div class="track-title">Do You Know Where Your ...</div>
    </div>

    <div class="clearfix"></div>
    <div class="bootomImg"><img src="<?php echo Yii::$app->homeUrl; ?>css/img/friendsList4.jpg" alt=""></div>
  </div>
</div>
<div class="rightBlock">
  <?php if (!empty($modelPhotoCount)) { ?>


    <div class="random-foto">

      <?php if ($modelPhotoCount == 1) { ?>
        <div class="random-foto-users foto-own">
          <a href='#modal1' id="<?= $modelPhoto[0]['idPhoto'] ?> " class='open_modal open-div-user-foto'>
            <img
              src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?= $modelPhoto[0]['idOwner'] ?>/<?= $modelPhoto[0]['idAlbum'] ?>/small_<?= $modelPhoto[0]['nameImg'] ?>">
          </a>
        </div>
        <a href="<?php echo Yii::$app->homeUrl; ?>myprofile/photos/">
          <div class="cvadr"></div>
        </a>
      <?php } ?>


      <?php if ($modelPhotoCount == 2) { ?>
        <div class="random-foto-users fotos-own">
          <a href='#modal1' id="<?= $modelPhoto[0]['idPhoto'] ?> " class='open_modal open-div-user-foto'>
            <img
              src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?= $modelPhoto[0]['idOwner'] ?>/<?= $modelPhoto[0]['idAlbum'] ?>/small_<?= $modelPhoto[0]['nameImg'] ?>">
          </a>
        </div>
        <a href="<?php echo Yii::$app->homeUrl; ?>myprofile/photos/">
          <div class="cvadr"></div>
        </a>
        <div class="random-foto-users fotos-own">
          <a href='#modal1' id="<?= $modelPhoto[1]['idPhoto'] ?> " class='open_modal open-div-user-foto'>
            <img
              src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?= $modelPhoto[1]['idOwner'] ?>/<?= $modelPhoto[1]['idAlbum'] ?>/small_<?= $modelPhoto[1]['nameImg'] ?>">
          </a>
        </div>
      <?php } ?>


      <?php if($modelPhotoCount == 3){?>
                        <div class="random-foto-users">
                            <a href='#modal1' id="<?=$modelPhoto[0]['idPhoto']?> " class='open_modal open-div-user-foto'>
                            <img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhoto[0]['idOwner']?>/<?=$modelPhoto[0]['idAlbum']?>/small_<?=$modelPhoto[0]['nameImg']?>">
                            </a>
                        </div></a>
                       <div class="random-foto-users">
                         <a href='#modal1' id="<?=$modelPhoto[1]['idPhoto']?> " class='open_modal open-div-user-foto'>
                            <img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhoto[1]['idOwner']?>/<?=$modelPhoto[1]['idAlbum']?>/small_<?=$modelPhoto[1]['nameImg']?>">
                            </a>
                        </div>
                        <a href="<?php echo Yii::$app->homeUrl; ?>myprofile/photos/"><div class="cvadr"></div></a>
                        <div class="random-foto-users">
                            <a href='#modal1' id="<?=$modelPhoto[2]['idPhoto']?> " class='open_modal open-div-user-foto'>
                            <img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhoto[2]['idOwner']?>/<?=$modelPhoto[2]['idAlbum']?>/small_<?=$modelPhoto[2]['nameImg']?>"></a>
                        </div> 
                    <?php } ?>



      <?php if ($modelPhotoCount >= 4) { ?>
        <div class="random-foto-users">
          <a href='#modal1' id="<?= $modelPhoto[0]['idPhoto'] ?> " class='open_modal open-div-user-foto'><img
              src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?= $modelPhoto[0]['idOwner'] ?>/<?= $modelPhoto[0]['idAlbum'] ?>/small_<?= $modelPhoto[0]['nameImg'] ?>"></a>
        </div>
        <div class="random-foto-users">
          <div class="random-foto-user">
            <a href='#modal1' id="<?= $modelPhoto[1]['idPhoto'] ?> " class='open_modal open-div-user-foto'> <img
                src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?= $modelPhoto[1]['idOwner'] ?>/<?= $modelPhoto[1]['idAlbum'] ?>/small_<?= $modelPhoto[1]['nameImg'] ?>"></a>
          </div>
          <div class="random-foto-user">
            <a href='#modal1' id="<?= $modelPhoto[2]['idPhoto'] ?> " class='open_modal open-div-user-foto'><img
                src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?= $modelPhoto[2]['idOwner'] ?>/<?= $modelPhoto[2]['idAlbum'] ?>/small_<?= $modelPhoto[2]['nameImg'] ?>"></a>
          </div>
        </div>
        <a href="<?php echo Yii::$app->homeUrl; ?>myprofile/photos/">
          <div class="cvadr"></div>
        </a>
        <div class="random-foto-users">
          <a href='#modal1' id="<?= $modelPhoto[3]['idPhoto'] ?> " class='open_modal open-div-user-foto'><img
              src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?= $modelPhoto[3]['idOwner'] ?>/<?= $modelPhoto[3]['idAlbum'] ?>/small_<?= $modelPhoto[3]['nameImg'] ?>"></a>
        </div>
      <?php } ?>

    </div>
  <?php } ?>
  <!--         <div class="about">
            <div class="astatus">
                <? //php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]) ?>

                    <? //= $form->field($newBoard, 'text')->textInput( [ 'placeholder' => "О чем вы думаете?" ] )->label(false, ['style'=>'display:none']) ?>
                    <div class="astatus-form">
                        <div class="form-selection">
                            <img src="<? //php echo Yii::$app->homeUrl; ?>css/img/location.jpg" alt="">
                            <img src="<? //php echo Yii::$app->homeUrl; ?>css/img/addition.jpg" alt="">
                        </div>
                        <button type="submit"></button>
                    </div>
                    <div class="about-menu">
                    </div>
                <? //php ActiveForm::end() ?>
            </div>
        </div> -->

  <div class="about">
    <!-- <div class="astatus"> -->
    <textarea name="" id="message" rows="1" placeholder="О чем вы думаете?"></textarea>

    <!--<img class="astatus_location" src="<?php echo Yii::$app->homeUrl; ?>css/img/location.jpg" alt=""> -->
    <span class="astatus_plus"></span>
    <div class="about-menu">
      <a onclick="fotoAttachment('#send-on-board');" class="open_modal foto-atachment" href="#modal4">
        <div class="img-in" id="a1"></div>
      </a>
      <a onclick="videoAttachment('#send-on-board');" class="open_modal video-atachment" href="#modal5">
        <div class="img-in" id="a2"></div>
      </a>
    </div>

    <!-- </div> -->
    <button class="superBtn" type="submit" id="send-on-board" data-atype="" data-id=""></button>
  </div>

    <? if (empty($boards)) { ?>
        <div class="new-uzer">
            У Вас еще нет записей. <br>
            <span>Сделайте первую</span>
        </div>
    <? } ?>


  <script type="text/javascript">

    var homeUrl = "<?php echo Yii::$app->homeUrl; ?>";
    var userId = "<?=Yii::$app->user->id?>";

    $(document).ready(function () {

      /////прогрузка стены
      var data = {
        idOwnerBoard: <?=Yii::$app->user->id;?>,
        page: 1
      };
      console.log(data);
      $.ajax({
        dataType: 'JSON',
        type: 'get',
        data: data,
        url: '/board/loadboard/'
      }).then(function (data) {
        if (data.board) {
          var board = data.board;
          var count = board.length;
          //console.log(data);
          for (var i = 0; i < count; i++) {
            var likeActive2 = (board[i].myLike == 1) ? 'likeActive2' : '';
            var comments = board[i].comments;
            var comentLength = board[i].comments.length;
            var repost = board[i].repost;
            var attachment = board[i].attachment;
            var url = (board[i].idOwner != <?=Yii::$app->user->id?>) ? '/profile/' + board[i].idOwner + '/' : '/myprofile/';
            if (repost != null) {
              //console.log(data);

              var repostId = repost.idOwner;
              var repostName = repost.nameOwner;
              var repostUserId = repost.idOwner;
              var attachment = repost.attachment;
              var ComText = getBrString(repost['text']);
              var urlRepost = (repostUserId != <?=Yii::$app->user->id?>) ? '/profile/' + repostUserId + '/' : '/myprofile/';

              $('.board').append("<div id='post-" + board[i]['id'] + "' class='blockM'><div class='zoom'></div><div class='massage-avatar'><a href='" + url + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + board[i].idOwner + "_small.jpg" + " alt=''></a></div><div class='message-repost'><div class='share-repost'></div><div class='massage-repost-avatar'><a href='" + urlRepost + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + repostId + "_small.jpg" + " alt=''></a></div><div class='message-rep'><a href='../profile/" + repostUserId + "/'><div class='massage-repost-avtor'>" + repostName + "</div></a><div class='massage-repost-date' id=''>" + board[i]['timeRecord'] + "</div><div class='massage-repost-text'><div class='text'>" + ComText + "</div><div class='message-repost-attachment'></div></div><div class='like " + likeActive2 + "' id=" + board[i]['id'] + "><div class='like-Count'>" + board[i].likeCount + "</div></div><div id=" + board[i]['id'] + " class='delete-repost'>Удалить репост</div></div><div class='add-comment'></div><div class='show-all-coment'>Показать все <span class='coment-count-news'>" + comentLength + "</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='all-coments'><div class='coment-mes'></div><div class='comment-plus'><div class='small-ava'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg" + " alt=''></div>" +
                "<textarea  class='coment-message' rows='1'></textarea>" +
                "<div id=" + board[i]['id'] + " class='m-top superBtn'></div>" +
                "</div></div></div></div>");

              if (attachment != null) {
                //console.log(attachment);
                if (attachment.type == 'photo') {
                  $('.message-repost-attachment:last').append("<a id='" + attachment[0].id + "' class='js-photo'><div class='foto-in-album'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/photo/" + attachment[0].user + "/" + attachment[0].album + "/normal_" + attachment[0].img + "></div></a>");
                }
                if (attachment.type == 'video') {
                  $('.message-repost-attachment:last').append("<iframe width='413' height='200' src=" + attachment.modelVideo.url_iframe + " frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><div class='video-title'>" + attachment.modelVideo.title + "</div>");
                }
              }
              for (var x = 0; x < comentLength; x++) {
                var coment = comments[x];
                var likeActive2 = (coment['myLike'] == 1) ? 'likeActive2' : '';
                var ComText = getBrString(coment.comment);

                $('#post-' + board[i]['id'] + ' .message-repost > .all-coments  > .coment-mes').append("<div class='comment'><div id=" + coment.id + "  class='close'></div><div class='comment-ava'>" +
                  "<a href='" + url + "'/'>" +
                  "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt=''></a></div><div class='comment-massage'>" +
                  "<a href='" + url + "'/'>" +
                  "<div class='comment-avtor'>" + coment.user_name + "</div></a><div class='comment-date'>" + coment.created + "</div><div id='' class='comment-text'>" + ComText + "</div><div id=" + coment.id + " class='like-coment " + likeActive2 + "'><div class='like-Count'>" + coment.likeCount + "</div></div></div></div>");
              }
              var thisShowEl = $('#post-' + board[i]['id'] + ' .message-repost >  .show-all-coment');
              var thisHideEl = $('#post-' + board[i]['id'] + ' .message-repost >  .hide-all-coments');

              if (comentLength <= 2) {
                $(thisShowEl).hide();
              } else {
                $(thisShowEl).show();
                $('#post-' + board[i]['id'] + ' .message-repost > .all-coments > .coment-mes > .comment').hide();
                $('#post-' + board[i]['id'] + ' .message-repost > .all-coments > .coment-mes > .comment:last').show();
                $('#post-' + board[i]['id'] + ' .message-repost > .all-coments > .coment-mes > .comment:last').prev().show();
              }

              $('.show-all-coment').on("click", function () {
                $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').show();
                $(this).parent().children('.hide-all-coments').show();
                $(this).hide();
              });

              $('.hide-all-coments').on("click", function () {
                $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').hide();
                $(this).hide();
                $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').show();
                $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').prev().show();
                $(this).parent().children('.show-all-coment').show();
              });

              var num = comentLength;
              num = num.toString();
              var numLast = num.charAt(num.length - 1);
              var numLasts = num.slice(-2);

              if (numLasts == 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
                $('#post-' + board[i]['id'] + ' .message-repost > .show-all-coment > .word').text("отзывов");
              }
              else {
                if (numLast == 2 || numLast == 3 || numLast == 4) {
                  $('#post-' + board[i]['id'] + ' .message-repost > .show-all-coment > .word').text("отзыва");
                } else if (numLast == 0 || numLast >= 5) {
                  $('#post-' + board[i]['id'] + ' .message-repost > .show-all-coment > .word').text("отзывов");
                } else {
                  $('#post-' + board[i]['id'] + ' .message-repost > .show-all-coment > .word').text("отзыв");
                }
              }
              ;
            } else {
              var comText = getBrString(board[i]['text']);

              $('.board').append("<div id='post-" + board[i]['id'] + "' class='blockM'><div class='zoom'></div><div class='massage-avatar'><a href='" + url + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + board[i].idOwner + "_small.jpg" + " alt=''></a></div><div class='massage'><div id=" + board[i]['id'] + " class='delete'>Удалить сообщение</div><a href='" + url + "'/'><div class='massage-avtor'>" + board[i]['nameOwner'] + "</div></a><div class='massage-date' id=''>" + board[i]['timeRecord'] + "</div><div class='massage-text'><div class='text'>" + comText + "</div><div class='message-repost-attachment'></div></div><div class='add-comment'></div><div class='like " + likeActive2 + "' id=" + board[i]['id'] + "><div class='like-Count'>" + board[i]['likeCount'] + "</div></div><div class='edit'>редактировать сообщение<div class='edit-mes'><textarea class='edit-message' rows='1' autofocus></textarea>" +
                "<button id='" + board[i]['id'] + "' class='save'>" +
                "<div id='" + board['id'] + "' class='m-top superBtn'></div>" +
                "</button></div></div><div class='show-all-coment'>Показать все <span class='coment-count-news'>" + comentLength + "</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='all-coments'><div class='coment-mes'></div><div class='comment-plus'><div class='small-ava'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg" + " alt=''></div><textarea class='coment-message' rows='1'></textarea>" +
                
                "<span class=\"astatus_plus\"></span>"+
                "<div class=\"about-menu\">"+
                "<a onclick=\"fotoAttachment( '#attach_"+board[i]['id']+"');\" class=\"open_modal foto-atachment\" href=\"#modal4\">"+
                "<div class=\"img-in\" id=\"a1\"></div>"+
                "</a>"+
                "<a onclick=\"videoAttachment();\" class=\"open_modal video-atachment\" href=\"#modal5\">"+
                "<div class=\"img-in\" id=\"a2\"></div>"+
                "</a>"+
                "</div>"+
    
                "<div id='" + board[i]['id'] + "' class='m-top superBtn'></div>" +
                "<div id='attach_" + board[i]['id'] + "' style=\"clear:both;\"></div>" +
                "</div></div></div></div>");


              // <div class='about-menu'><a onclick='modalUse()' class='open_modal foto-coment-atachment' href='#modal6'><div class='img-in' id='a1'></div></a><a onclick='modalUse()' class='open_modal video-coment-atachment' href='#modal7'><div class='img-in' id='a2'></div></a><div class='img-in' id='a3'></div><div class='img-in' id='a4'></div></div>

              // $('.comment-title').show();
              if (attachment != null) {
                //console.log(attachment);
                if (attachment.type == 'photo') {
                  $('.message-repost-attachment:last').append("<a id='" + attachment[0].id + "' class='js-photo'><div class='foto-in-album'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/photo/" + attachment[0].user + "/" + attachment[0].album + "/normal_" + attachment[0].img + "></div></a>");
                }
                if (attachment.type == 'video') {
                  $('.message-repost-attachment:last').append("" +
                    "<iframe width='528' height='250' src=" + attachment.modelVideo.url_iframe + " frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><div class='video-title'>" + attachment.modelVideo.title + "</div>");
                }
              }
              if (board[i].idOwner == <?=Yii::$app->user->id?>) {
                $('.edit:last').show();
              } else {
                $('.edit:last').hide();
              }

              for (var x = 0; x < comentLength; x++) {
                var coment = comments[x];
                var likeActive2 = (coment['myLike'] == 1) ? 'likeActive2' : '';
                var ComText = getBrString(coment.comment);
                var url = (coment.user_id != <?=Yii::$app->user->id?>) ? '/profile/' + coment.user_id + '/' : '/myprofile/';

                $('#post-' + board[i]['id'] + ' .massage > .all-coments  > .coment-mes').append("<div class='comment'><div id=" + coment.id + "  class='close'></div><div class='comment-ava'>" +
                  "<a href='/profile/" + coment.user_id + "/'>" +
                  "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt=''></a></div><div class='comment-massage'>" +
                  "<a href='/profile/" + coment.user_id + "/'>" +
                  "<div class='comment-avtor'>" + coment.user_name + "</div></a><div class='comment-date'>" + coment.created + "</div><div id='' class='comment-text'>" + ComText + "</div><div id=" + coment.id + " class='like-coment " + likeActive2 + "'><div class='like-Count'>" + coment.likeCount + "</div></div></div></div>");
              }

              var thisShowEl = $('#post-' + board[i]['id'] + ' .massage > .show-all-coment');
              var thisHideEl = $('#post-' + board[i]['id'] + ' .massage > .hide-all-coments');

              if (comentLength <= 2) {
                $(thisShowEl).hide();
              } else {
                $(thisShowEl).show();
                $('#post-' + board[i]['id'] + ' .massage > .all-coments > .coment-mes > .comment').hide();
                $('#post-' + board[i]['id'] + ' .massage > .all-coments > .coment-mes > .comment:last').show();
                $('#post-' + board[i]['id'] + ' .massage > .all-coments > .coment-mes > .comment:last').prev().show();
              }

              $('.show-all-coment').on("click", function () {
                $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').show();
                $(this).parent().children('.hide-all-coments').show();
                $(this).hide();
              });

              $('.hide-all-coments').on("click", function () {
                $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').hide();
                $(this).hide();
                $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').show();
                $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').prev().show();
                $(this).parent().children('.show-all-coment').show();
              });

              var num = comentLength;
              num = num.toString();
              var numLast = num.charAt(num.length - 1);
              var numLasts = num.slice(-2);

              if (numLasts == 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
                $('#post-' + board[i]['id'] + ' .massage > .show-all-coment > .word').text("отзывов");
              }
              else {
                if (numLast == 2 || numLast == 3 || numLast == 4) {
                  $('#post-' + board[i]['id'] + ' .massage > .show-all-coment > .word').text("отзыва");
                } else if (numLast == 0 || numLast >= 5) {
                  $('#post-' + board[i]['id'] + ' .massage > .show-all-coment > .word').text("отзывов");
                } else {
                  $('#post-' + board[i]['id'] + ' .massage > .show-all-coment > .word').text("отзыв");
                }
              }
              ;
            }
          }

            ///появление поля для коментария
            $('.add-comment').on('click', function () {
                var allComents = $(this).nextAll(".all-coments");
                var curInput = $(this).nextAll(".all-coments").children(".comment-plus").children(".coment-message");
                $(allComents).show();
                $(curInput).focus();
            });

          /// Лайки для коментариев
          $('.like-coment').on('click', likeInitBoardUser);
          // //// добавление комментария
          // $('.m-top').on('click', function(){

          // });
          //// добавление комментария
          $('.m-top').on('click', function () {
            var commentMessage = $(this).prevAll(".coment-message").val();
            var thisComent = $(this).parent('.comment-plus:last');
            $('.preview-box').remove();
        
            var aid = $(this).attr('data-id');
            var atype = $(this).attr('data-atype');
            var data = {
              idOwnerBoard: <?=Yii::$app->user->id;?>,
              page: 1,
            };
            if ($("#message").val() != "") {
              data.text = $("#message").val();
            }
            if (atype != "") {
              data.atype = atype;
              data.aid = aid;
            }
            
            if ($.trim(commentMessage) == "") {

            } else {
              //console.log(thisComent);
              var data = {
                id: $(this).attr('id'),
                text: commentMessage
              };
              $.ajax({
                dataType: 'JSON',
                type: 'post',
                data: data,
                url: '/board/comment/'
              }).then(function (data) {
                //console.log(data);
                var ComText = getBrString(data.comment);
                $(thisComent).before("<div class='comment'><div id=" + data.idComment + " class='close'></div><div class='comment-ava'>" +
                  "<a href='" + url + "'/'>" +
                  "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + data.user_id + "_small.jpg" + " alt=''></a></div><div class='comment-massage'>" +
                  "<a href='" + url + "'/'>" +
                  "<div class='comment-avtor'>" + data.user_name + "</div></a><div class='comment-date'>" + data.created + "</div><div id='' class='comment-text'>" + ComText + "</div><div id=" + data.idComment + " class='like-coment'><div class='like-Count'>" + data.likeCount + "</div></div></div></div>");
                $(".coment-message").val("");

                /// Лайки для коментариев
                $('.like-coment').off();
                $('.like-coment').on('click', likeInitBoardUser);

                titleInit();
                textareaInit('.send-icon, #send-on-board');
                
                //// Удаление комментария
                $('.close').on('click', function () {
                    var isDel = confirm('Вы желаете удалить комментарий?');
                    if (isDel) {
                        var thisComent = $(this).parent();
                        var data = {
                           id: $(this).attr('id')
                        };
                        //console.log(data);
                        $.ajax({
                            dataType: 'JSON',
                            type: 'get',
                            data: data,
                            url: '/board/delcomment/'
                        }).then(function (data) {
                            $(thisComent[0]).fadeOut('slow');
                        });
                    }
                });

              });
            }
          });

        //// Удаление комментария
        $('.close').on('click', function () {
            var thisComent = $(this).parent();
            var data = {
                id: $(this).attr('id')
            };
            console.log(data);
            $.ajax({
                dataType: 'JSON',
                type: 'get',
                data: data,
                url: '/board/delcomment/'
            }).then(function (data) {
                $(thisComent[0]).fadeOut('slow');
            });
        });

        //// лайки
        $('.like').on('click', likeInitBoardUserMessage);

        ////удаление сообщений
        $('.delete').on('click', function () {
            var isDel = confirm('Вы желаете удалить сообщение?');
            if (isDel) {
                var that = $(this).parent().parent();
                var data = {
                    idRecord: $(this).attr('id'),
                    idOwnerBoard: <?=Yii::$app->user->id;?>,
                    page: 1,
                };

                $.ajax({
                    dataType: 'JSON',
                    type: 'get',
                    data: data,
                    url: '/board/delboard/'
                }).then(function (data) {
                    $(that[0]).fadeOut('slow');
                });
            }
        });

        ////удаление репостов
        $('.delete-repost').on('click', function () {
            var isDel = confirm('Вы желаете удалить сообщение?');
            if (isDel) {
                var thisRepost = $(this).parent().parent().parent();
                var data = {
                  idRecord: $(this).attr('id'),
                  idOwnerBoard: <?=Yii::$app->user->id;?>,
                  page: 1
                };
                $.ajax({
                  dataType: 'JSON',
                  type: 'get',
                  data: data,
                  url: '/board/delboard/'
                }).then(function (data) {
                  //console.log(data);
                  $(thisRepost[0]).fadeOut('slow');
                });
            }
        });

          ////редактирование сообщений (только владельцы записи )
          $('.edit').on('click', function () {
            var ShowMessageArea = $(this).children(".edit-mes");
            var EditMessageText = $(this).parent().children('.massage-text').children(".text").text();
            var EditMessageArea = $(this).parent().children('.massage-text').children('.text:last');
            $(this).children(".edit-mes").children(".edit-message").val(EditMessageText);
            ShowMessageArea.show().focus();
            var thisButoon = $(this).children('.edit-mes').children('button');
            $(thisButoon).on('click', function () {
              var newMessage = $(this).parent(".edit-mes").children('.edit-message').val();
              var data = {
                editText: newMessage,
                idRecord: $(this).attr('id'),
                idOwnerBoard: <?=Yii::$app->user->id;?>,
                page: 1
              };
              var edMes = getBrString(data.editText);
              $.ajax({
                dataType: 'JSON',
                type: 'post',
                data: data,
                url: '/board/editboard/'
              }).then(function (data) {
                $(EditMessageArea).html(edMes);
                ShowMessageArea.hide();
              });
            });
          });

          textareaInit('.m-top');
          photoOutput();
        } //////////////////////////////////////////////////////////end  if(data.board)

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// infinite scroll
        var page = 1;
        var loadMore = true;
        $(window).on('scroll wheel', function () {

          if ($(window).scrollTop() == $(document).height() - $(window).height() && loadMore == true) {
            page = page + 1;
            var data = {
              idOwnerBoard: <?=Yii::$app->user->id;?>,
              page: page
            };
            console.log(data);
            $.ajax({
              dataType: 'JSON',
              type: 'get',
              data: data,

              url: '/board/loadboard/',
              success: function (data) {
                loadMore = data.loadMore;
                // console.log(loadMore);
                if (loadMore == false) {
                  $('div#loadmoreajaxloader').hide();
                } else {
                  $('div#loadmoreajaxloader').show();
                }
                if (data.board) {
                  var board = data.board;
                  var count = board.length;
                  for (var i = 0; i < count; i++) {
                    var comments = board[i].comments;
                    var comentLength = board[i].comments.length;
                    var repost = board[i].repost;
                    var attachment = board[i].attachment;
                    var likeActive2 = (board[i].myLike == 1) ? 'likeActive2' : '';
                    var url = (board[i].idOwner != <?=Yii::$app->user->id?>) ? '/profile/' + board[i].idOwner + '/' : '/myprofile/';
                    if (repost != null) {
                      var repostId = repost.idOwner;
                      var repostName = repost.nameOwner;
                      var repostUserId = repost.idOwner;
                      var ComText = getBrString(repost['text']);
                      var urlRepost = (repostUserId != <?=Yii::$app->user->id?>) ? '/profile/' + repostUserId + '/' : '/myprofile/';

                      $('.board').append("<div id='post-" + board[i]['id'] + "' class='blockM'><div class='zoom'></div><div class='massage-avatar'><a href='" + url + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + board[i].idOwner + "_small.jpg" + " alt=''></a></div><div class='message-repost'><div class='share-repost'></div><div class='massage-repost-avatar'><a href='" + urlRepost + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + repostId + "_small.jpg" + " alt=''></a></div><div class='message-rep'><a href='../profile/" + repostUserId + "/'><div class='massage-repost-avtor'>" + repostName + "</div></a><div class='massage-repost-date' id=''>" + board[i]['timeRecord'] + "</div><div class='massage-repost-text'><div class='text'>" + ComText + "</div><div class='message-repost-attachment'></div></div><div class='like " + likeActive2 + "' id=" + board[i]['id'] + "><div class='like-Count'>" + board[i].likeCount + "</div></div><div id=" + board[i]['id'] + " class='delete-repost'>Удалить репост</div></div><div class='add-comment'></div><div class='show-all-coment'>Показать все <span class='coment-count-news'>" + comentLength + "</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='all-coments'><div class='coment-mes'></div><div class='comment-plus'><div class='small-ava'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg" + " alt=''></div><textarea class='coment-message' rows='1'></textarea>" +
                        "<div id=" + board[i]['id'] + " class='m-top superBtn'></div>" +
                        "</div></div></div></div>");

                      if (attachment != null) {
                        console.log(attachment);
                        if (attachment.type == 'photo') {
                          $('.message-repost-attachment:last').append("<a id='" + attachment[0].id + "' class='js-photo'><div class='foto-in-album'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/photo/" + attachment[0].user + "/" + attachment[0].album + "/normal_" + attachment[0].img + "></div></a>");
                        }
                        if (attachment.type == 'video') {
                          $('.message-repost-attachment:last').append("" +
                            "<iframe width='413' height='200' src=" + attachment.modelVideo.url_iframe + " frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><div class='video-title'>" + attachment.modelVideo.title + "</div>");
                        }
                      }
                      for (var x = 0; x < comentLength; x++) {
                        var coment = comments[x];
                        var likeActive2 = (coment['myLike'] == 1) ? 'likeActive2' : '';
                        var ComText = getBrString(coment.comment);

                        $('#post-' + board[i]['id'] + ' .message-repost > .all-coments  > .coment-mes').append("<div class='comment'><div id=" + coment.id + "  class='close'></div><div class='comment-ava'>" +
                          "<a href='" + url + "'/'>" +
                          "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt=''></a></div><div class='comment-massage'>" +
                          "<a href='" + url + "'/'>" +
                          "<div class='comment-avtor'>" + coment.user_name + "</div></a><div class='comment-date'>" + coment.created + "</div><div id='' class='comment-text'>" + ComText + "</div><div id=" + coment.id + " class='like-coment " + likeActive2 + "'><div class='like-Count'>" + coment.likeCount + "</div></div></div></div>");
                      }
                      var thisShowEl = $('#post-' + board[i]['id'] + ' .message-repost >  .show-all-coment');
                      var thisHideEl = $('#post-' + board[i]['id'] + ' .message-repost >  .hide-all-coments');

                      if (comentLength <= 2) {
                        $(thisShowEl).hide();
                      } else {
                        $(thisShowEl).show();
                        $('#post-' + board[i]['id'] + ' .message-repost > .all-coments > .coment-mes > .comment').hide();
                        $('#post-' + board[i]['id'] + ' .message-repost > .all-coments > .coment-mes > .comment:last').show();
                        $('#post-' + board[i]['id'] + ' .message-repost > .all-coments > .coment-mes > .comment:last').prev().show();
                      }

                      $('.show-all-coment').on("click", function () {
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').show();
                        $(this).parent().children('.hide-all-coments').show();
                        $(this).hide();
                      });

                      $('.hide-all-coments').on("click", function () {
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').hide();
                        $(this).hide();
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').show();
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').prev().show();
                        $(this).parent().children('.show-all-coment').show();
                      });

                      var num = comentLength;
                      num = num.toString();
                      var numLast = num.charAt(num.length - 1);
                      var numLasts = num.slice(-2);


                      if (numLasts == 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
                        $('#post-' + board[i]['id'] + ' .message-repost > .show-all-coment > .word').text("отзывов");
                      }
                      else {
                        if (numLast == 2 || numLast == 3 || numLast == 4) {
                          $('#post-' + board[i]['id'] + ' .message-repost > .show-all-coment > .word').text("отзыва");
                        } else if (numLast == 0 || numLast >= 5) {
                          $('#post-' + board[i]['id'] + ' .message-repost > .show-all-coment > .word').text("отзывов");
                        } else {
                          $('#post-' + board[i]['id'] + ' .message-repost > .show-all-coment > .word').text("отзыв");
                        }
                      }
                      ;
                    } else {
                      var comText = getBrString(board[i]['text']);

                      $('.board').append("<div id='post-" + board[i]['id'] + "' class='blockM'><div class='zoom'></div><div class='massage-avatar'><a href='" + url + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + board[i].idOwner + "_small.jpg" + " alt=''></a></div><div class='massage'><div id=" + board[i]['id'] + " class='delete'>Удалить сообщение</div><a href='" + url + "'/'><div class='massage-avtor'>" + board[i]['nameOwner'] + "</div></a><div class='massage-date' id=''>" + board[i]['timeRecord'] + "</div><div class='massage-text'><div class='text'>" + comText + "</div><div class='message-repost-attachment'></div></div><div class='add-comment'></div><div class='like " + likeActive2 + "' id=" + board[i]['id'] + "><div class='like-Count'>" + board[i]['likeCount'] + "</div></div><div class='edit'>редактировать сообщение<div class='edit-mes'><textarea class='edit-message' rows='1' autofocus></textarea>" +
                        "<button id=" + board[i]['id'] + " class='save'>" +
                        "<div id=" + board['id'] + " class='m-top superBtn'></div>" +
                        "</button></div></div><div class='show-all-coment'>Показать все <span class='coment-count-news'>" + comentLength + "</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='all-coments'><div class='coment-mes'></div><div class='comment-plus'><div class='small-ava'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg" + " alt=''></div><textarea class='coment-message' rows='1'></textarea>" +
                        "<div id=" + board[i]['id'] + " class='m-top superBtn'></div>" +
                        "</div></div></div></div>");


                      if (attachment != null) {
                        if (attachment.type == 'photo') {
                          $('.message-repost-attachment:last').append("<a id='" + attachment[0].id + "' class='js-photo'><div class='foto-in-album'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/photo/" + attachment[0].user + "/" + attachment[0].album + "/normal_" + attachment[0].img + "></div></a>");
                        }
                        if (attachment.type == 'video') {
                          $('.message-repost-attachment:last').append("<iframe width='528' height='250' src=" + attachment.modelVideo.url_iframe + " frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><div class='video-title'>" + attachment.modelVideo.title + "</div>");
                        }
                      }
                      if (board[i].idOwner == <?=Yii::$app->user->id?>) {
                        $('.edit:last').show();
                      } else {
                        $('.edit:last').hide();
                      }

                      for (var x = 0; x < comentLength; x++) {
                        var coment = comments[x];
                        console.log('comments', coment);
                        var likeActive2 = (coment['myLike'] == 1) ? 'likeActive2' : '';
                        var ComText = getBrString(coment.comment);
                        var url = (coment.user_id != <?=Yii::$app->user->id?>) ? '/profile/' + coment.user_id + '/' : '/myprofile/';

                        $('#post-' + board[i]['id'] + ' .massage > .all-coments  > .coment-mes').append("<div class='comment'><div id=" + coment.id + "  class='close'></div><div class='comment-ava'>" +
                          "<a href='/profile/" + coment.user_id + "/'>" +
                          "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt=''></a></div><div class='comment-massage'>" +
                          "<a href='/profile/" + coment.user_id + "/'>" +
                          "<div class='comment-avtor'>" + coment.user_name + "</div></a><div class='comment-date'>" + coment.created + "</div><div id='' class='comment-text'>" + ComText + "</div><div id=" + coment.id + " class='like-coment " + likeActive2 + "'><div class='like-Count'>" + coment.likeCount + "</div></div></div></div>");
                      }

                      var thisShowEl = $('#post-' + board[i]['id'] + ' .massage > .show-all-coment');
                      var thisHideEl = $('#post-' + board[i]['id'] + ' .massage > .hide-all-coments');

                      if (comentLength <= 2) {
                        $(thisShowEl).hide();
                      } else {
                        $(thisShowEl).show();
                        $('#post-' + board[i]['id'] + ' .massage > .all-coments > .coment-mes > .comment').hide();
                        $('#post-' + board[i]['id'] + ' .massage > .all-coments > .coment-mes > .comment:last').show();
                        $('#post-' + board[i]['id'] + ' .massage > .all-coments > .coment-mes > .comment:last').prev().show();
                      }

                      $('.show-all-coment').on("click", function () {
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').show();
                        $(this).parent().children('.hide-all-coments').show();
                        $(this).hide();
                      });

                      $('.hide-all-coments').on("click", function () {
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').hide();
                        $(this).hide();
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').show();
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').prev().show();
                        $(this).parent().children('.show-all-coment').show();
                      });

                      var num = comentLength;
                      num = num.toString();
                      var numLast = num.charAt(num.length - 1);
                      var numLasts = num.slice(-2);

                      if (numLasts == 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
                        $('#post-' + board[i]['id'] + ' .massage > .show-all-coment > .word').text("отзывов");
                      }
                      else {
                        if (numLast == 2 || numLast == 3 || numLast == 4) {
                          $('#post-' + board[i]['id'] + ' .massage > .show-all-coment > .word').text("отзыва");
                        } else if (numLast == 0 || numLast >= 5) {
                          $('#post-' + board[i]['id'] + ' .massage > .show-all-coment > .word').text("отзывов");
                        } else {
                          $('#post-' + board[i]['id'] + ' .massage > .show-all-coment > .word').text("отзыв");
                        }
                      }
                      ;
                    }
                  }

                  ///появление поля для коментария
                  $('.add-comment').on('click', function () {
                    var allComents = $(this).nextAll(".all-coments");
                    var curInput = $(this).nextAll(".all-coments").children(".add-style").children(".coment-message");
                    $(allComents).show();
                    $(curInput).focus();
                  });

                  /// Лайки для коментариев
                  $('.like-coment').off();
                  $('.like-coment').on('click', likeInitBoardUser);

                  titleInit();
                  textareaInit('.send-icon, #send-on-board');
                  //// добавление комментария
                  $('.m-top').off();
                  $('.m-top').on('click', function () {
                    var commentMessage = $(this).prevAll(".coment-message").val();
                    var thisComent = $(this).parent('.comment-plus:last');
                    if ($.trim(commentMessage) == "") {

                    } else {
                      console.log(thisComent);
                      var data = {
                        id: $(this).attr('id'),
                        text: commentMessage
                      };
                      $.ajax({
                        dataType: 'JSON',
                        type: 'post',
                        data: data,
                        url: '/board/comment/'
                      }).then(function (data) {
                        console.log(data);
                        var ComText = getBrString(data.comment);

                        $(thisComent).before("<div class='comment'><div id=" + data.idComment + " class='close'></div><div class='comment-ava'>" +
                          "<a href='" + url + "'/'>" +
                          "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + data.user_id + "_small.jpg" + " alt=''></a></div><div class='comment-massage'>" +
                          "<a href='" + url + "'/'>" +
                          "<div class='comment-avtor'>" + data.user_name + "</div></a><div class='comment-date'>" + data.created + "</div><div id='' class='comment-text'>" + ComText + "</div><div id=" + data.idComment + " class='like-coment'><div class='like-Count'>" + data.likeCount + "</div></div></div></div>");
                        $(".coment-message").val("");

                        /// Лайки для коментариев
                        $('.like-coment').off();
                        $('.like-coment').on('click', likeInitBoardUser);

                        titleInit();
                        textareaInit('.send-icon, #send-on-board');
                        //// Удаление комментария
                        $('.close').on('click', function () {
                            var isDel = confirm('Вы желаете удалить комментарий?');
                            if (isDel) {
                                var thisComent = $(this).parent();
                                var data = {
                                  id: $(this).attr('id')
                                };
                                console.log(data);
                                $.ajax({
                                  dataType: 'JSON',
                                  type: 'get',
                                  data: data,
                                  url: '/board/delcomment/'
                                }).then(function (data) {
                                  $(thisComent[0]).fadeOut('slow');
                                });
                            }
                        });

                      });
                    }
                  });


                  titleInit();
                  textareaInit('.send-icon, #send-on-board');

                //// Удаление комментария
                $('.close').on('click', function () {
                    var thisComent = $(this).parent();
                    var data = {
                        id: $(this).attr('id')
                    };
                    $.ajax({
                        dataType: 'JSON',
                        type: 'get',
                        data: data,
                        url: '/board/delcomment/'
                    }).then(function (data) {
                        // console.log(data);
                        $(thisComent[0]).fadeOut('slow');
                    });
                });


                  // лайки
                  $('.like').off();
                  $('.like').on('click', likeInitBoardUserMessage);

                  titleInit();
                  textareaInit('.send-icon, #send-on-board');

                ////удаление сообщений
                $('.delete').on('click', function () {
                    var isDel = confirm('Вы желаете удалить сообщение?');
                    if (isDel) {
                        var that = $(this).parent().parent();
                        var data = {
                          idRecord: $(this).attr('id'),
                          idOwnerBoard: <?=Yii::$app->user->id;?>,
                          page: 1,
                        };
                        $.ajax({
                          dataType: 'JSON',
                          type: 'get',
                          data: data,
                          url: '/board/delboard/'
                        }).then(function (data) {
                          $(that[0]).fadeOut('slow');
                        });
                    }
                });

                ////удаление репостов
                $('.delete-repost').on('click', function () {
                    var isDel = confirm('Вы желаете удалить репост?');
                    if (isDel) {
                        var thisRepost = $(this).parent().parent().parent();
                        var data = {
                            idRecord: $(this).attr('id'),
                            idOwnerBoard: <?=Yii::$app->user->id;?>,
                            page: 1,
                        };
                        $.ajax({
                            dataType: 'JSON',
                            type: 'get',
                            data: data,
                            url: '/board/delboard/'
                        }).then(function (data) {
                            $(thisRepost[0]).fadeOut('slow');
                        });
                    }
                });
                  ////редактирование сообщений (только владельцы записи )
                  $('.edit').on('click', function () {
                    var ShowMessageArea = $(this).children(".edit-mes");
                    var EditMessageText = $(this).parent().children('.massage-text').children(".text").text();
                    var EditMessageArea = $(this).parent().children('.massage-text').children('.text:last');
                    $(this).children(".edit-mes").children(".edit-message").val(EditMessageText);
                    ShowMessageArea.show().focus();
                    var thisButoon = $(this).children('.edit-mes').children('button');
                    $(thisButoon).on('click', function () {
                      var newMessage = $(this).parent(".edit-mes").children('.edit-message').val();
                      var data = {
                        editText: newMessage,
                        idRecord: $(this).attr('id'),
                        idOwnerBoard: <?=Yii::$app->user->id;?>,
                        page: 1
                      };
                      var edMes = getBrString(data.editText);
                      $.ajax({
                        dataType: 'JSON',
                        type: 'post',
                        data: data,
                        url: '/board/editboard/'
                      }).then(function (data) {
                        $(EditMessageArea).html(edMes);
                        ShowMessageArea.hide();
                      });
                    });
                  });
                } //end  if(data.board) /////////////////////////////////////////////////////////////////////////////////////////////
                titleInit();
                textareaInit('.send-icon, #send-on-board');
                titleInit('.m-top');
                photoOutput();
              }
            });
          }

          textareaInit('.send-icon, #send-on-board');
          $('.photo-like').removeClass('likeActive');
        });
        //////////////////////////////////////////////////////END infinite scroll

        /////добавление записи
        $('#send-on-board').on('click', function () {
          $('.preview-box').remove();
          var aid = $(this).attr('data-id');
          var atype = $(this).attr('data-atype');
          var data = {
            idOwnerBoard: <?=Yii::$app->user->id;?>,
            page: 1,
          };
          if ($("#message").val() != "") {
            data.text = $("#message").val();
          }
          if (atype != "") {
            data.atype = atype;
            data.aid = aid;
          }
          //console.log(data);
          $.ajax({
            dataType: 'JSON',
            type: 'post',
            data: data,
            url: '/board/addboard/'
          }).then(function (data) {
            //console.log('asfasdfasdf', data);
            
            $('.new-uzer').css('display', 'none');
            
            if (data) {
              var attachment = data.attachment;
              var board = data;
              var url = (data.idOwner != <?=Yii::$app->user->id?>) ? '/profile/' + data.idOwner + '/' : '/myprofile/';
              var comText = getBrString(board['text']);

              $('.board').prepend("<div id='message-" + board.id + "' class='blockM'><div class='zoom'></div><div class='massage-avatar'><a href='" + url + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + board.idOwner + "_small.jpg" + " alt=''></a></div><div class='massage'><div id=" + board['id'] + " class='delete'>Удалить сообщение</div><a href='" + url + "'/'><div class='massage-avtor'>" + board['nameOwner'] + "</div></a><div class='massage-date' id=''>" + board['timeRecord'] + "</div><div class='massage-text'><div class='text'>" + comText + "</div><div class='message-repost-attachment'></div></div><div class='add-comment'></div><div class='like " + likeActive2 + "' id=" + board['id'] + "><div class='like-Count'>" + board['likeCount'] + "</div></div><div class='edit'>редактировать сообщение<div class='edit-mes'><textarea class='edit-message' rows='1' autofocus></textarea>" +
                "<button id=" + board['id'] + " class='save'>" +
                "<div id=" + board['id'] + " class='m-top superBtn'></div>" +
                "</button></div></div><div class='all-coments'><div class='comment-title'>Показать все " + comentLength + " комментария</div><div class='comment-plus'><div class='small-ava'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg" + " alt=''></div><textarea class='coment-message' rows='1'></textarea>" +
                "<div id=" + board['id'] + " class='m-top superBtn'></div>" +
                "</div></div></div>");


              if (attachment != null) {
                if (attachment.type == 'photo') {
                  $('#message-' + board.id + ' > .massage > .massage-text > .message-repost-attachment').append("<a id='" + attachment[0].id + "' class='js-photo'><div class='foto-in-album'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/photo/" + attachment[0].user + "/" + attachment[0].album + "/normal_" + attachment[0].img + "></div></a>");
                }
                if (attachment.type == 'video') {
                  $('#message-' + board.id + ' > .massage > .massage-text > .message-repost-attachment').append("<iframe width='528' height='250' src=" + attachment.modelVideo.url_iframe + " frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><div class='video-title'>" + attachment.modelVideo.title + "</div>");
                }
              }

              $("#message").val("");
              $('.all-coments:first').hide();
              if (comentLength == '0') {
                $('.all-coments:last').hide();
              } else {
                $('.add-comment:last').hide();
              }
            }

            //// лайки
            $('.like').off();
            $('.like').on('click', likeInitBoardUserMessage);

            titleInit();
            textareaInit('.send-icon, #send-on-board');
            
            //появление коментария
            $('.add-comment').on('click', function () {
              var allComents = $(this).nextAll(".all-coments");
              var curInput = $(this).nextAll(".all-coments").children(".comment-plus").children(".coment-message");
              $(allComents).show();
              $(curInput).focus();
            });

            //// добавление комментария
            $('.m-top').off();
            $('.m-top').on('click', function () {
              var commentMessage = $(this).prevAll(".coment-message").val();
              var thisComent = $(this).parent('.comment-plus:last');
              if ($.trim(commentMessage) == "") {

              } else {
                console.log(thisComent);
                var data = {
                  id: $(this).attr('id'),
                  text: commentMessage
                };
                $.ajax({
                  dataType: 'JSON',
                  type: 'post',
                  data: data,
                  url: '/board/comment/'
                }).then(function (data) {
                  console.log(data);
                  var ComText = getBrString(data.comment);

                  $(thisComent).before("<div class='comment'><div id=" + data.idComment + " class='close'></div><div class='comment-ava'><a href='" + url + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + data.user_id + "_small.jpg" + " alt=''></a></div><div class='comment-massage'><a href='" + url + "'/'><div class='comment-avtor'>" + data.user_name + "</div></a><div class='comment-date'>" + data.created + "</div><div id='' class='comment-text'>" + ComText + "</div><div id=" + data.idComment + " class='like-coment'><div class='like-Count'>" + data.likeCount + "</div></div></div></div>");
                  $(".coment-message").val("");

                  /// Лайки для коментариев
                  $('.like-coment').off();
                  $('.like-coment').on('click', likeInitBoardUser);

                  titleInit();
                  textareaInit('.send-icon, #send-on-board');
                  //// Удаление комментария
                $('.close').on('click', function () {
                    var isDel = confirm('Вы желаете удалить комментарий?');
                    if (isDel) {
                        var thisComent = $(this).parent();
                        var data = {
                          id: $(this).attr('id')
                        };
                        console.log(data);
                        $.ajax({
                          dataType: 'JSON',
                          type: 'get',
                          data: data,
                          url: '/board/delcomment/'
                        }).then(function (data) {
                          $(thisComent[0]).fadeOut('slow');
                        });
                    }
                });

                });
              }
            });

            titleInit();
            textareaInit('.send-icon, #send-on-board');
            ////удаление сообщений
            $('.delete').on('click', function () {
                var isDel = confirm('Вы желаете удалить сообщение?');
                if (isDel) {
                    var that = $(this).parent().parent();
                    var data = {
                      idRecord: $(this).attr('id'),
                      idOwnerBoard: <?=Yii::$app->user->id;?>,
                      page: 1,
                    };
                    $.ajax({
                      dataType: 'JSON',
                      type: 'get',
                      data: data,
                      url: '/board/delboard/'
                    }).then(function (data) {
                      $(that[0]).fadeOut('slow');
                    });
                }
            });

            ////редактирование сообщений (только владельцы записи )
            $('.edit').on('click', function () {
              var ShowMessageArea = $(this).children(".edit-mes");
              var EditMessageText = $(this).parent().children('.massage-text').children(".text").text();
              var EditMessageArea = $(this).parent().children('.massage-text').children('.text:last');
              $(this).children(".edit-mes").children(".edit-message").val(EditMessageText);
              ShowMessageArea.show().focus();
              var thisButoon = $(this).children('.edit-mes').children('button');
              $(thisButoon).on('click', function () {
                var newMessage = $(this).parent(".edit-mes").children('.edit-message').val();
                var data = {
                  editText: newMessage,
                  idRecord: $(this).attr('id'),
                  idOwnerBoard: <?=Yii::$app->user->id;?>,
                  page: 1
                };
                var edMes = getBrString(data.editText);
                $.ajax({
                  dataType: 'JSON',
                  type: 'post',
                  data: data,
                  url: '/board/editboard/'
                }).then(function (data) {
                  $(EditMessageArea).html(edMes);
                  ShowMessageArea.hide();
                });
              });
            });

            titleInit();
            textareaInit('.send-icon, #send-on-board');
          });

        });
        titleInit();
        textareaInit('.send-icon, #send-on-board');
      });
///добавление видео 
      $('.for-modal2').on('click', function () {
        var data = {
          url: $("#url").val(),
          name: $("#name").val(),
          description: $("#description").val(),
          privacyVideo: $("#privacy-video option:selected").val(),
          privacyComments: $("#privacy-comments option:selected").val(),
          repostBoard: $('#repost-board').prop("checked")
        };

        // console.log(data);

        $.ajax({
            dataType: 'JSON',
            type: 'get',
            data: data,
            url: '/video/loadvideo/'
        }).then(function (data) {
            //console.log(data);
        });
      });
// Запуск видео
      $('.open-div-user-video').on('click', function () {
        var data = {
          id: $(this).attr('id'),
        };
        //console.log(data);

        $.ajax({
            dataType: 'JSON',
            type: 'get',
            data: data,
            url: '/video/getvideoinfo/',
        }).then(function (data) {
            // var videoContent = " ";
            $('.modal-div-user-video').html(" ");
            console.log(data);
            var thisVideo = data.videoInfo.video.urlIframe;
            var titleVideo = data.videoInfo.video.title;
            var nameUserCreator = data.videoInfo.video.username;
            var videoCreated = data.videoInfo.video.created;
            var coments = data.videoInfo.comments;
            var comentLength = data.videoInfo.comments.length;
            var likeCount = data.videoInfo.countLikes;
            var likeActive2 = (data.videoInfo.video.myLike == 1) ? 'likeActive2' : '';

            //контент видео

            $('.modal-div-user-video').append("<div class='modal_close'><h2 class='video-title'>" + titleVideo + "</h2><div id='close_for_modal' class='close'></div></div><div  class='conten'><div class='for-user-video'><iframe width='910' height='511' src=" + thisVideo + " frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div><div class='for-user-coments'><div class='coments'><div class='show-all-coment'>Показать все <span class='coment-count-news'>" + comentLength + "</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='coment-message'></div><div class='write-message'><div class='ava-user'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg" + " alt=''></div>" +
              "<textarea id='write-message-area' rows='1'></textarea>" +
              "<div id=" + data.videoInfo.video.id + " class='send-icon'></div></div></div><div class='video-creator'><div class='user-creator-ava'><a href='/profile/" + data.videoInfo.video.user + "/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + data.videoInfo.video.user + "_small.jpg" + " alt=''></a></div><a href='/profile/" + data.videoInfo.video.user + "/'><div class='user-creator-name'>" + nameUserCreator + "</div></a><div class='add-time'>Добавлено " + videoCreated + "</div><div class='creator-dostig'>" +
              "<a href='#write-message-area' class='Add-comen'>" + data.videoInfo.comments.length + "</a>" +
              "<div id=" + data.videoInfo.video.id + " class='lik " + likeActive2 + "'><div class='count-like'>" + likeCount + "</div></div><div id=" + data.videoInfo.video.id + " class='Shar'></div></div></div></div></div>");

            modalUse();
            
            if (coments) {
                // alert('yo');
                for (var x = 0; x < comentLength; x++) {
                    var coment = coments[x];
                    var comText = getBrString(coment.comment);

                    console.log(coment);
                    var likeActive2 = (coment['myLike'] == 1) ? 'likeActive2' : '';
                    //коментарии для видео
                    $('.modal-div-user-video .coment-message').append("<div class='coment'><div class='user-ava'><a href='/profile/" + coment.user_id + "/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt=''></a></div><div class='info-user'><div class='for-user-vs-time'><a href='/profile/" + coment.user_id + "/'><div class='user-name'>" + coment.user_name + "</div></a><div class='time'>" + coment.created + "</div></div><div id=" + coment.id + " class='del-coment'></div><div class='user-message'>" + comText + "</div><div class='reply'></div><div id=" + coment.id + " class='like " + likeActive2 + "'><div class='like-count'>" + coment.likeCount + "</div></div></div></div>");
                }
                
                if (comentLength <= 2) {
                    $('.coments > .show-all-coment').hide();
                } else {
                    $(' .coments > .show-all-coment').show();
                    $(' .coments > .coment-message > .coment').hide();
                    $(' .coments > .coment-message > .coment:last').show();
                    $(' .coments > .coment-message > .coment:last').prev().show();
                }

                $('.show-all-coment').on("click", function () {
                    $(this).parent().children('.coment-message').children('.coment').show();
                    $(this).parent().children('.hide-all-coments').show();
                    $(this).hide();
                });

                $('.hide-all-coments').on("click", function () {
                    $(this).parent().children('.coment-message').children('.coment').hide();
                    $(this).hide();
                    $(this).parent().children('.coment-message').children('.coment:last').show();
                    $(this).parent().children('.coment-message').children('.coment:last').prev().show();
                    $(this).parent().children('.show-all-coment').show();
                });
                
                var num = data.videoInfo.comments.length;
                var str = num.toString();
                var numLast = str.charAt(str.length - 1);
                var numLasts = str.slice(-2);

                if (numLasts == 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
                    $('  .show-all-coment > .word').text("отзывов");
                } else {
                    if (numLast == 2 || numLast == 3 || numLast == 4) {
                        $(' .show-all-coment > .word').text("отзыва");
                    } else if (numLast == 0 || numLast >= 5) {
                        $('.show-all-coment > .word').text("отзывов");
                    } else {
                        $(' .show-all-coment > .word').text("отзыв");
                    }
                };
            }
            
            //Репост видео
            $('.Shar').on('click', function () {
                // var likeIns = $(this).parent().children(".count-like");
                // console.log(likeIns);
                var data = {
                    id: $(this).attr('id')
                };
                $.ajax({
                    dataType: 'JSON',
                    type: 'get',
                    data: data,
                    url: '/video/repost/',
                }).then(function (data) {
                    // $(likeIns).html(data.likeCount);
                    //console.log(data);
                    alert('Видео отправлено на вашу стену')
                });
            });

          //Лайки для видео
          $('.lik').off();
          $('.lik').on('click', function () {
            var likeIns = $(this).find(".count-like");
            var like = $(this);
            console.log(likeIns);
            var data = {
              id: $(this).attr('id'),
              elem_type: "video",
            };
            // console.log(data);
            $.ajax({
              dataType: 'JSON',
              type: 'get',
              data: data,
              url: '/video/like/',
            }).then(function (data) {
              likeIns.html(data.likeCount);
              var myLike = data.myLike;
              (myLike) ? like.addClass('likeActive2') : like.removeClass('likeActive2');
              // console.log(data);

            });
          });
          //Лайки для коментариев
          $('.like').off();
          $('.like').on('click', function () {
            var likeIns = $(this).find(".like-count");
            var like = $(this);
            // console.log(likeIns);
            // console.log($(this).attr('id'));
            var data = {
              id: $(this).attr('id'),
              elem_type: "comments"
            };
            // console.log(data);
            $.ajax({
              dataType: 'JSON',
              type: 'get',
              data: data,
              url: '/video/like/',
            }).then(function (data) {
              console.log(data);
              likeIns.html(data.likeCount);
              var myLike = data.myLike;
              (myLike) ? like.addClass('likeActive2') : like.removeClass('likeActive2');
              // console.log(likeIns);
              // console.log(data.likeCount);

            });
          });
        //// Удаление комментария для видео
        $('.del-coment').on('click', function () {
            var isDel = confirm('Вы желаете удалить комментарий?');
            if (isDel) {
                var thisComent = $(this).parent().parent();
                var data = {
                  id: $(this).attr('id')
                };
//                console.log(data);
                $.ajax({
                  dataType: 'JSON',
                  type: 'get',
                  data: data,
                  url: '/video/delcomment/'
                }).then(function (data) {
//                  console.log(data);
                    $(thisComent[0]).fadeOut('slow');
                });
            }
        });

          //Добавление коментария для видео
          $('.send-icon').off();
          $('.send-icon').on('click', function () {
            var $this = $(this);
            var comentText = $(this).parent().children('textarea').val();
            var thisArea = $(this).parent().children('textarea');
            if ($.trim(comentText) == "") {

            } else {
              var data = {
                id: $(this).attr('id'),
                text: comentText
              };
              console.log(data);
              $.ajax({
                dataType: 'JSON',
                type: 'post',
                data: data,
                url: '/video/comment/',
              }).then(function (data) {
                var comText = getBrString(data.comment);

                console.log(data);
                $this.closest('.coments').find('.coment-message').append("<div class='coment'><div class='user-ava'><a href='/profile/" + data.user_id + "/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + data.user_id + "_small.jpg" + " alt=''></a></div><div class='info-user'><div class='for-user-vs-time'><a href='/profile/" + data.user_id + "/'><div class='user-name'>" + data.user_name + "</div></a><div class='time'>" + data.created + "</div></div><div id=" + data.idComment + " class='del-coment'></div><div class='user-message'>" + comText + "</div><div class='reply'></div><div  id=" + data.idComment + " class='like'><div class='like-count'>" + data.likeCount + "</div></div></div>");
                $(thisArea).val("");

                //Лайки для коментариев
                $('.like').off();
                $('.like').on('click', function () {
                  var likeIns = $(this).find(".like-count");
                  var like = $(this);
                  // console.log(likeIns);
                  // console.log($(this).attr('id'));
                  var data = {
                    id: $(this).attr('id'),
                    elem_type: "comments"
                  };
                  // console.log(data);
                  $.ajax({
                    dataType: 'JSON',
                    type: 'get',
                    data: data,
                    url: '/video/like/',
                  }).then(function (data) {
                    likeIns.html(data.likeCount);
                    console.log('asfasdfasdf');
                    var myLike = data.myLike;
                    (myLike) ? like.addClass('likeActive2') : like.removeClass('likeActive2');

                    console.log(data);
                    // console.log(likeIns);

                  });
                });
                //// Удаление комментария для видео
                $('.del-coment').on('click', function () {
                    var isDel = confirm('Вы желаете удалить комментарий?');
                    if (isDel) {
                        var thisComent = $(this).parent().parent();
                        var data = {
                          id: $(this).attr('id')
                        };
                        console.log(data);
                        $.ajax({
                          dataType: 'JSON',
                          type: 'get',
                          data: data,
                          url: '/video/delcomment/'
                        }).then(function (data) {
                          console.log(data);
                          $(thisComent[0]).fadeOut('slow');

                        });
                    }
                });
                
              });
            }
          });

        });

      });


      // Функция открытия модалки
      $('.open-div-user-foto').on('click', function () {

        var data = {
          idPhoto: $(this).attr('id')
        };

        $.ajax({
            dataType: 'JSON',
            type: 'get',
            data: data,
            url: '/photos/photoinfo/'
        }).then(function (data) {
          $('.coment-messages').html(' ');
          var thisPhoto = "<?php echo Yii::$app->homeUrl;?>" + "images/photo/" + data.photoInfo.photo.idOwner + "/" + data.photoInfo.photo.idAlbum + "/" + data.photoInfo.photo.nameImg;
          console.log(data);
          var userCreatorAva = "<?php echo Yii::$app->homeUrl;?>" + "images/avatar/" + data.photoInfo.photo.idOwner + "_small.jpg";
          var userComentAva = "<?php echo Yii::$app->homeUrl;?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg";
          var likeActive = (data.photoInfo.photo.myLike == 1) ? 'likeActive' : '';
          $('.for-foto > img').attr("src", thisPhoto);
          $('.date-LikeShare > .date').html(data.photoInfo.photo.created);
          $('.creator > .user-name > a').html(data.photoInfo.photo.userName);
          $('.creator > .ava-creator > a > img').attr("src", userCreatorAva);
          $('.write-message > .ava-user > img').attr("src", userComentAva);
          $('.like-panel > .count-like').html(data.photoInfo.countLikes);
          $('.send-icon').attr("id", data.photoInfo.photo.idPhoto);
          $('.ava-creator > a').attr("href", "/profile/" + data.photoInfo.photo.idOwner + "/");
          $('.creator > .user-name > a').attr("href", "/profile/" + data.photoInfo.photo.idOwner + "/");
          $('.like-panel > .share-photo').attr("id", data.photoInfo.photo.idPhoto);
          $('.like-panel > .photo-like').attr("id", data.photoInfo.photo.idPhoto).addClass(likeActive);
          $('.like-panel > .photo-edit > .count-coment').text(data.photoInfo.comments.commentsCount);
          $('.like-panel > .photo-like > .count-like').text(data.photoInfo.countLikes);
          $('.content-view-foto > .creator > .del').attr("id", data.photoInfo.photo.idPhoto);
          $('.content-view-foto > .creator > .del').attr("data-idAlbum", data.photoInfo.photo.idAlbum);
          var curFoto = $('.foto-active').attr('data-id');
          $('.curentFoto').text(curFoto);
          var count = data.photoInfo.comments.commentsCount;
          if (data.photoInfo.comments) {
            for (var i = 0; i < count; i++) {
              var coment = data.photoInfo.comments[i];
              var likeActive2 = (coment['myLike'] == 1) ? 'likeActive2' : '';
              var comText = getBrString(coment.comment);

              $('.coments > .coment-messages').append("<div class='coment'><div class='user-ava'><a href='/profile/" + coment.user_id + "/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt=''></a></div><div class='info-user'><div id=" + coment.id + " class='del-coment'></div><div class='for-user-vs-time'><a href='/profile/" + coment.user_id + "/'><div class='user-name'>" + coment.user_name + "</div></a><div class='time'>" + coment.created + "</div></div><div class='user-message'>" + comText + "</div><div class='reply'></div><div id=" + coment.id + " class='like " + likeActive2 + "'><div class='count-like'>" + coment.likeCount + "</div></div></div></div>");
            }

            //Лайки для фото
            $('.photo-like').on('click', likeInitToFoto);

            if (data.photoInfo.comments.commentsCount <= 2) {
              $(".show-all-coments").hide();
            } else {
              $(".show-all-coments").show();
              $(".coment-messages > .coment").hide();
              $(".coment-messages > .coment:last").show();
              $(".coment-messages > .coment:last").prev().show();
            }
            $('.show-all-coments').click(function () {
              $('.coment-messages > .coment').show();
              $('.hide-all-coments').show();
              $('.show-all-coments').hide();
            });
            $('.hide-all-coments').click(function () {
              $('.coment-messages > .coment').hide();
              $('.hide-all-coments').hide();
              $(".coment-messages > .coment:last").show();
              $(".coment-messages > .coment:last").prev().show();
              $('.show-all-coments').show();
            });


            var num = data.photoInfo.comments.commentsCount;
            console.log(num)

            $(".show-all-coments > h1 > .coment-count-news").text(num);

            var numLast = num.charAt(num.length - 1);
            var numLasts = num.slice(-2);
            if (numLasts == 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
              $(".show-all-coments > h1 > .word").text("отзывов");
            } else {
              if (numLast == 2 || numLast == 3 || numLast == 4) {
                $(".show-all-coments > h1 > .word").text("отзыва");
              } else if (numLast == 0 || numLast >= 5) {
                $(".show-all-coments > h1 > .word").text("отзывов");
              } else {
                $(".show-all-coments > h1 > .word").text("отзыв");
              }
              ;
            }
            ;

            // удаление фото
            $('.del').on('click', function () {
                var isDel = confirm('Вы желаете удалить фото?');
                if (isDel) {
                    var data = {
                      idPhoto: $(this).attr('id'),
                      idAlbum: $(this).attr('data-idAlbum')
                    };
                    //console.log(data);
                    $.ajax({
                      dataType: 'JSON',
                      type: 'get',
                      data: data,
                      url: '/photos/delphoto/'
                    }).then(function (data) {
                      //console.log(data);
                      // $(thisPhoto).fadeOut('slow');
                      location.reload();
                    });
                }
            });

            /// Лайки для коментариев
            $('.like').on('click', likeInitToComentFoto);

            //Репост для фото
            $('.share-photo').on('click', function (event) {
              event.stopPropagation();
              var data = {
                id: $(this).attr('id')
              };
              // console.log(data);
              $.ajax({
                dataType: 'JSON',
                type: 'get',
                data: data,
                url: '/photos/repost/'
              }).then(function (data) {
                // console.log(data);
                alert('Репост отправлен на вашу стену');

              });
            });

            //// Удаление комментария
            $('.del-coment').on('click', function () {
              var thisComent = $(this).parent().parent();
              var data = {
                id: $(this).attr('id')
              };

              console.log(data);
              $.ajax({
                dataType: 'JSON',
                type: 'get',
                data: data,
                url: '/photos/delcomment/'
              }).then(function (data) {
                console.log(data);
                $(thisComent).fadeOut('slow');

              });
            });
          }

          titleInit();
          textareaInit('.send-icon, #send-on-board');
        });


        //// добавление комментария для фото
        $('.send-icon').off();
        $('.send-icon').on('click', ComentToFoto);

        function ComentToFoto() {
          var $this = $(this);
          var commentMessage = $(this).parent().children('textarea').val();
          if ($.trim(commentMessage) == "") {

          } else {
            var data = {
              id: $(this).attr('id'),
              text: commentMessage
            };
            // console.log(data);
            $.ajax({
              dataType: 'JSON',
              type: 'get',
              data: data,
              url: '/photos/comment/'
            }).then(function (data) {
              var comText = getBrString(data.comment);
              console.log(data);
              $this.closest('.coments').find('.coment-messages').append("<div class='coment'><div class='user-ava'><a href='/profile/" + data.user_id + "/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + data.user_id + "_small.jpg" + " alt=''></a></div><div class='info-user'><div id=" + data.idComment + " class='del-coment'></div><div class='for-user-vs-time'><a href='/profile/" + data.user_id + "/'><div class='user-name'>" + data.user_name + "</div></a><div class='time'>" + data.created + "</div></div><div class='user-message'>" + comText + "</div><div class='reply'></div><div id=" + data.idComment + " class='like'><div class='count-like'>" + data.likeCount + "</div></div></div></div>");
              $("textarea").val("");


              /// Лайки для коментариев
              $('.like').off();
              $('.like').on('click', likeInitToComentFoto);

              // //// Удаление комментария
              $('.del-coment').on('click', function () {
                var thisComent = $(this).parent().parent();
                var data = {
                  id: $(this).attr('id')

                };
                console.log(data);
                $.ajax({
                  dataType: 'JSON',
                  type: 'get',
                  data: data,
                  url: '/photos/delcomment/'
                }).then(function (data) {
                  console.log(data);
                  $(thisComent).fadeOut('slow');

                });
              });
              titleInit();
              textareaInit('.send-icon, #send-on-board');
            });
          }
        }

      });


      titleInit();
      textareaInit('.send-icon, #send-on-board');
    });


  </script>


  <script>
    window.onload = function () {
      $('.open-div-user-foto').on('click', function () {

        var topScrolled = document.body;
        $('#modal1').css({
            'top': topScrolled.scrollTop
        })

        var data = {
            idPhoto: $(this).attr('id')
        };

        $.ajax({
            dataType: 'JSON',
            type: 'get',
            data: data,
            url: '/photos/photoinfo/'
        }).then(function (data) {
          $('.coment-messages').html(' ');
          var thisPhoto = "<?php echo Yii::$app->homeUrl;?>" + "images/photo/" + data.photoInfo.photo.idOwner + "/" + data.photoInfo.photo.idAlbum + "/" + data.photoInfo.photo.nameImg;
          //console.log(data);
          var userCreatorAva = "<?php echo Yii::$app->homeUrl;?>" + "images/avatar/" + data.photoInfo.photo.idOwner + "_small.jpg";
          var userComentAva = "<?php echo Yii::$app->homeUrl;?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg";
          var likeActive = (data.photoInfo.photo.myLike == 1) ? 'likeActive' : '';
          $('.for-foto > img').attr("src", thisPhoto);
          $('.date-LikeShare > .date').html(data.photoInfo.photo.created);
          $('.creator > .user-name > a').html(data.photoInfo.photo.userName);
          $('.creator > .ava-creator > a > img').attr("src", userCreatorAva);
          $('.write-message > .ava-user > img').attr("src", userComentAva); //asdsadasdasdasdasd
          $('.like-panel > .count-like').html(data.photoInfo.countLikes);
          $('.send-icon').attr("id", data.photoInfo.photo.idPhoto);
          $('.ava-creator > a').attr("href", "/profile/" + data.photoInfo.photo.idOwner + "/");
          $('.creator > .user-name > a').attr("href", "/profile/" + data.photoInfo.photo.idOwner + "/");
          $('.like-panel > .share-photo').attr("id", data.photoInfo.photo.idPhoto);
          $('.like-panel > .photo-like').attr("id", data.photoInfo.photo.idPhoto).addClass(likeActive);
          $('.like-panel > .photo-edit > .count-coment').text(data.photoInfo.comments.commentsCount);
          $('.like-panel > .photo-like > .count-like').text(data.photoInfo.countLikes);
          $('.content-view-foto > .creator > .del').attr("id", data.photoInfo.photo.idPhoto);
          $('.content-view-foto > .creator > .del').attr("data-idAlbum", data.photoInfo.photo.idAlbum);
          var curFoto = $('.foto-active').attr('data-id');
          $('.curentFoto').text(curFoto);
          var count = data.photoInfo.comments.commentsCount;
          if (data.photoInfo.comments) {
            for (var i = 0; i < count; i++) {
              var coment = data.photoInfo.comments[i];
              var likeActive2 = (coment['myLike'] == 1) ? 'likeActive2' : '';
              var comText = getBrString(coment.comment);

              $('.coments > .coment-messages').append("<div class='coment'><div class='user-ava'><a href='/profile/" + coment.user_id + "/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt=''></a></div><div class='info-user'><div id=" + coment.id + " class='del-coment'></div><div class='for-user-vs-time'><a href='/profile/" + coment.user_id + "/'><div class='user-name'>" + coment.user_name + "</div></a><div class='time'>" + coment.created + "</div></div><div class='user-message'>" + comText + "</div><div class='reply'></div><div id=" + coment.id + " class='like " + likeActive2 + "'><div class='count-like'>" + coment.likeCount + "</div></div></div></div>");
            }

            //Лайки для фото
            $('.photo-like').on('click', likeInitToFoto);

            if (data.photoInfo.comments.commentsCount <= 2) {
              $(".show-all-coments").hide();
            } else {
              $(".show-all-coments").show();
              $(".coment-messages > .coment").hide();
              $(".coment-messages > .coment:last").show();
              $(".coment-messages > .coment:last").prev().show();
            }
            $('.show-all-coments').click(function () {
              $('.coment-messages > .coment').show();
              $('.hide-all-coments').show();
              $('.show-all-coments').hide();
            });
            $('.hide-all-coments').click(function () {
              $('.coment-messages > .coment').hide();
              $('.hide-all-coments').hide();
              $(".coment-messages > .coment:last").show();
              $(".coment-messages > .coment:last").prev().show();
              $('.show-all-coments').show();
            });

            var num = data.photoInfo.comments.commentsCount;
            //console.log(num)

            $(".show-all-coments > h1 > .coment-count-news").text(num);

            var numLast = num.charAt(num.length - 1);
            var numLasts = num.slice(-2);
            if (numLasts == 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
              $(".show-all-coments > h1 > .word").text("отзывов");
            } else {
              if (numLast == 2 || numLast == 3 || numLast == 4) {
                $(".show-all-coments > h1 > .word").text("отзыва");
              } else if (numLast == 0 || numLast >= 5) {
                $(".show-all-coments > h1 > .word").text("отзывов");
              } else {
                $(".show-all-coments > h1 > .word").text("отзыв");
              }
              ;
            }
            ;

            // удаление фото
            $('.del').on('click', function () {
              var data = {
                idPhoto: $(this).attr('id'),
                idAlbum: $(this).attr('data-idAlbum')
              };
              //console.log(data);
              $.ajax({
                dataType: 'JSON',
                type: 'get',
                data: data,
                url: '/photos/delphoto/'
              }).then(function (data) {
                //console.log(data);
                // $(thisPhoto).fadeOut('slow');
                location.reload();
              });
            });

            /// Лайки для коментариев
            $('.like').on('click', likeInitToComentFoto);

            //Репост для фото
            $('.share-photo').on('click', function (event) {
              event.stopPropagation();
              var data = {
                id: $(this).attr('id')
              };
              // console.log(data);
              $.ajax({
                dataType: 'JSON',
                type: 'get',
                data: data,
                url: '/photos/repost/'
              }).then(function (data) {
                // console.log(data);
                alert('Репост отправлен на вашу стену');

              });
            });

            //// Удаление комментария
            $('.del-coment').on('click', function () {
              var thisComent = $(this).parent().parent();
              var data = {
                id: $(this).attr('id')
              };

              console.log(data);
              $.ajax({
                dataType: 'JSON',
                type: 'get',
                data: data,
                url: '/photos/delcomment/'
              }).then(function (data) {
                console.log(data);
                $(thisComent).fadeOut('slow');

              });
            });
          }

          titleInit();
          textareaInit('.send-icon, #send-on-board');
        });

        //// добавление комментария для фото
        $('.send-icon').off();
        $('.send-icon').on('click', ComentToFoto);

        function ComentToFoto() {
          var $this = $(this);
          var commentMessage = $(this).parent().children('textarea').val();
          if ($.trim(commentMessage) == "") {

          } else {
            var data = {
              id: $(this).attr('id'),
              text: commentMessage
            };
            // console.log(data);
            $.ajax({
              dataType: 'JSON',
              type: 'post',
              data: data,
              url: '/photos/comment/'
            }).then(function (data) {
              var comText = getBrString(data.comment);
              console.log(data);
              $this.closest('.coments').find('.coment-messages').append("<div class='coment'><div class='user-ava'><a href='/profile/" + data.user_id + "/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + data.user_id + "_small.jpg" + " alt=''></a></div><div class='info-user'><div id=" + data.idComment + " class='del-coment'></div><div class='for-user-vs-time'><a href='/profile/" + data.user_id + "/'><div class='user-name'>" + data.user_name + "</div></a><div class='time'>" + data.created + "</div></div><div class='user-message'>" + comText + "</div><div class='reply'></div><div id=" + data.idComment + " class='like'><div class='count-like'>" + data.likeCount + "</div></div></div></div>");
              $("textarea").val("");


              /// Лайки для коментариев
              $('.like').off();
              $('.like').on('click', likeInitToComentFoto);

              // //// Удаление комментария
              $('.del-coment').on('click', function () {
                var thisComent = $(this).parent().parent();
                var data = {
                  id: $(this).attr('id')

                };
                console.log(data);
                $.ajax({
                  dataType: 'JSON',
                  type: 'get',
                  data: data,
                  url: '/photos/delcomment/'
                }).then(function (data) {
                  console.log(data);
                  $(thisComent).fadeOut('slow');

                });
              });
              titleInit();
              textareaInit('.send-icon, #send-on-board');
            });
          }
        }

      });


      titleInit();
      textareaInit('.send-icon, #send-on-board');
    }
  </script>

    <div class="board-load">
        <div class="board" id="board"></div>
        <div id="loadmoreajaxloader" style="display:none;">
            <center><img src="<?php echo Yii::$app->homeUrl; ?>css/img/ajax-loader.gif" alt=""></center>
        </div>
    </div>

</div>

<script type="text/javascript">
  $(document).ready(function () {
    $('.btn-settings').on('click', function () {
      var that = $(this);
      $('.btn-settings').removeClass('active');
      that.addClass('active');
      var index = that.data('index');
      $('.ModalSettings').hide();
      $('[data-content-index="' + index + '"]').show();
    });

    sendCtrlEnter('.m-top, .send-icon, #send-on-board');
    $('body').on('click', '.photo-like', likeInitToFoto);

  })
</script>

<div id="modal-edit-settings" class="modal-div-edit-settings">
  <div class="modal_close"><h1>Редактирование профиля</h1>

    <div id="close_for_modal" class="close-foto"></div>
  </div>
  <div class="content-edit-settings">
    <div class="tab-settings">
      <button id="MainSettings" data-index="1" class="btn-settings active">Основные</button>
      <button id="OtherSettings" data-index="2" class="btn-settings">Дополнительно</button>
    </div>
    <?php $form = ActiveForm::begin(['id' => 'form-resetDate', 'options' => ['enctype' => 'multipart/form-data']]); ?>

    <div data-content-index="1" class="main-settings ModalSettings ">

      <div class="download-ava">


        <p class="download-ava-title">Аватар</p>

        <!--                     <input class="choosefaile" id="imgFile" accept="image/*,image/jpeg" type="file"> -->
        <?= $form->field($modelin, 'image')->fileInput()->hint(Yii::t('app', 'Допустимые файлы: png,jpg,gif,jpeg, размер не более: {ras}МБ', ['ras' => 1]))->label(false, ['style' => 'display:none']) ?>
      </div>

      <div class="Full-name">
        <div class="Full-name-inputs">
          <div class="allname">
            <?= $form->field($modelDescription, 'name')->textInput() ?>
          </div>
          <div class="allname">
            <?= $form->field($modelDescription, 'last_name') ?>
          </div>
          <div class="allname">
            <?= $form->field($modelDescription, 'nickname') ?>
          </div>
          <div class="status">
            <?= $form->field($modelDescription, 'status') ?>
          </div>
          <div class="otnos">
            <?= $form->field($modelDescription, 'family')->dropDownList([
              0 => '- не выбрано -',
              1 => 'Замужем',
              2 => 'Женат',
              3 => 'Не замужем',
              4 => 'Не женат',
              5 => 'Встречаюсь',
              6 => 'Любовь',
              7 => 'Все сложно',
              8 => 'В активном поиске',
            ]); ?>
          </div>
          <div class="otnos">
            <?= $form->field($modelDescription, 'sex')->textInput()->dropDownList(
              UserDescription::getSexList(),
              ['prompt' => Yii::t('app', 'Не указан')]
            ) ?>
          </div>
        </div>
      </div>

      <div class="birthday">
        <div class="birthday-fields">
          <div class="birthday-date">

            <div class="wp-top-birthday-date">
              <p class="birthday-date-text">День рождения</p>
              <?= $form->field($modelDescription, 'day')->dropDownList($dayChoice, $optionsDay); ?>
              <?= $form->field($modelDescription, 'month')->dropDownList($monthChoice, $optionsMonth); ?>
              <?= $form->field($modelDescription, 'year')->dropDownList($yearsChoice, $optionsYear); ?>
            </div>
            <?= $form->field($modelDescription, 'birthday_show')->checkBox(['label' => 'Отображать день рождения в моём профиле']); ?>

            <?= $form->field($modelDescription, 'country')->dropDownList(
              Country::getToSelect(),
              [
                'prompt' => 'укажите страну',
                'onchange' => '
                                                                                        $.post( "/board/city/?id=' . '"+$(this).val(), function( data ){
                                                                                            $( "select#userdescription-city" ).html( data );
                                                                                        });'
              ]) ?>
            <?= $form->field($modelDescription, 'city')->dropDownList(
              City::getToSelect(),
              [
                'prompt' => 'укажите город'
              ]) ?>
            <div class="wp-team-name">
              <?= $form->field($modelDescription, 'culture')->dropDownList(UserDescription::getCultureList()); ?>
              <?= $form->field($modelDescription, 'team') ?>
              <span class="team-txt">Если есть</span>
            </div>
            <div class="clearboth"></div>
          </div>
        </div>
      </div>

      <div class="wp-list-bottom-form">
        <div class="wp-list-bottom-form-model">
          <?= $form->field($modelDescription, 'phone') ?>
          <?= $form->field($modelDescription, 'site') ?>
          <?= $form->field($modelDescription, 'skype') ?>
        </div>
        <div class="wp-bottom-list-i-select">
          <p class="wp-bottom-list-i-text-select">Виден</p>
          <?= $form->field($modelPrivacy, 'phone')->dropDownList($privacyChoice)->label(false); ?>
          <p class="wp-bottom-list-i-text-select">Виден</p>
          <?= $form->field($modelPrivacy, 'site')->dropDownList($privacyChoice)->label(false); ?>
          <p class="wp-bottom-list-i-text-select">Виден</p>
          <?= $form->field($modelPrivacy, 'skype')->dropDownList($privacyChoice)->label(false); ?>
        </div>
      </div>

    </div>

    <div data-content-index="2" style="display:none;" class="other-settings ModalSettings">
      <div class="interests-form-title">Интересы:</div>
      <div class="wp-interests-form">

        <div class="wp-interests-list-i">
          <?= $form->field($modelDescription, 'music') ?>
        </div>
        <div class="wp-interests-list-i">
          <?= $form->field($modelDescription, 'film') ?>
        </div>
        <div class="wp-interests-list-i">
          <?= $form->field($modelDescription, 'shows') ?>
        </div>
        <div class="wp-interests-list-i">
          <?= $form->field($modelDescription, 'books') ?>
        </div>
        <div class="wp-interests-list-i">
          <?= $form->field($modelDescription, 'game') ?>
        </div>
        <div class="wp-interests-list-i">
          <?= $form->field($modelDescription, 'citation') ?>
        </div>
        <div class="wp-interests-list-i">
          <?= $form->field($modelDescription, 'about') ?>
        </div>

      </div>
      <div class="wp-life-position-form">
        <div class="life-position-form-title">Жизненная позиция:</div>


        <div class="wp-life-position-list-i">
          <?= $form->field($modelDescription, 'politics') ?>
        </div>
        <div class="wp-life-position-list-i">
          <?= $form->field($modelDescription, 'world_view') ?>
        </div>
        <div class="wp-life-position-list-i">
          <?= $form->field($modelDescription, 'worth_life') ?>
        </div>
        <div class="wp-life-position-list-i">
          <?= $form->field($modelDescription, 'worth_people') ?>
        </div>
        <div class="wp-life-position-list-i">
          <?= $form->field($modelDescription, 'inspiration') ?>
        </div>

      </div>
    </div>
  </div>

  <div class="foot-modal">
    <?= Html::submitButton(Yii::t('app', 'Сохранить данные'), ['class' => 'btn-for-modal-edit-settings']) ?>
  </div>
  <?php ActiveForm::end() ?>
</div>

<div id="modal1" class="modal-div-view-foto modal-div-view-board-foto">
  <!--  <div class="modal-div-view-foto_prev">
       <div class="prev_btn"> </div>

   </div>
   <div class="modal-div-view-foto_next">
       <div class="next_btn"> </div>
   </div> -->
  <div class="modal_close">
    <!-- <h1>Фотография <span class="curentFoto"></span> из <span class="countFoto"></span></h1> -->
    <div id="close_for_modal" class="close"></div>
  </div>
  <div class="content-view-foto">
    <div class="for-foto">
      <img src="">
    </div>
    <div class="date-LikeShare">
      <h5 class="date"></h5>
    </div>
    <div class="coments">
      <div class="show-all-coments">
        <h1>Показать все <span class='coment-count-news'> </span> <span class="word"></span></h1>
      </div>
      <div class="hide-all-coments hide-comments">
        <h1>Cкрыть все отзывы</h1>
      </div>
      <div class="coment-messages">
      </div>
      <div class="write-message">
        <div class="ava-user">
          <img src="">
        </div>
        <!-- <div class="message-area"> -->
        <textarea rows='1'></textarea>
        <!-- <div class="add-setings">
                        <div class="drop-list">
                            <ul>
                                <li><img src="<? //php echo Yii::$app->homeUrl; ?>css/img/Graffity_ICO_add.png"></li>
                                <li><img src="<? //php echo Yii::$app->homeUrl; ?>css/img/Music_ICO_add.png"></li>
                                <li><img src="<? //php echo Yii::$app->homeUrl; ?>css/img/Video_ICO_add.png"></li>
                                <li><img src="<? //php echo Yii::$app->homeUrl; ?>css/img/Photo_ICO_add.png"></li>
                            </ul>
                            <img src="<? //php echo Yii::$app->homeUrl; ?>css/img/arrow_down.png">
                        </div>
                        <img src="<? //php echo Yii::$app->homeUrl; ?>css/img/Addition_ICO.png">
                    </div>
                    <div class="smile">
                        <img src="<? //php echo Yii::$app->homeUrl; ?>css/img/smile.png">
                    </div> -->
        <!-- </div> -->
        <div id="" class="send-icon"></div>
      </div>
    </div>
    <div class="creator">
      <div class="ava-creator">
        <a href=""><img src=""></a>
      </div>

      <div class="user-name">
        <a href=""></a>
      </div>

      <div class="name-album">
        <div class="like-panel">
          <div class="photo-edit">
            <div class='count-coment'></div>
          </div>
          <div class="photo-like">
            <div class='count-like'></div>
          </div>

          <div id="" class="share-photo">

          </div>
        </div>
      </div>
      <div class="text">
        Дествия
      </div>
      <div class="icons">
        <img src="<?php echo Yii::$app->homeUrl; ?>css/img/Location-ICO.png">
        <img src="<?php echo Yii::$app->homeUrl; ?>css/img/Wall-ICO.png">
      </div>
      <div id="" data-idAlbum="" class="del">
        Удалить фото
      </div>
    </div>
  </div>
</div>
<div id="modal4" class="modal_div_for_video">
  <div class="modal_close">
    <div id="close_for_modal" class="close"></div>
    <h1>Добавить фото</h1></div>
  <div class="foto-list-content">

  </div>
</div>
<div id="modal5" class="modal_div_for_video">
  <div class="modal_close">
    <div id="close_for_modal" class="close"></div>
    <h1>Добавить видео</h1></div>
  <div class="video-list-content">

  </div>
</div>

<!--       <div id="modal6" class="modal_div_for_video">
            <div class="modal_close"><div id="close_for_modal" class="close"></div> <h1>Добавить фото</h1></div>
            <div class="foto-list-content">

            </div>
    </div>
    <div id="modal7" class="modal_div_for_video">
            <div class="modal_close"><div id="close_for_modal" class="close"></div> <h1>Добавить видео</h1></div>
            <div class="video-list-content">

            </div>
    </div> -->
<div id="modal2" class="modal-div-user-video">


</div>
<div id="modal3" class="modal_div_for_video">
  <div class="modal_close">
    <div id="close_for_modal" class="close"></div>
    <h1>Ссылка на видео</h1></div>
  <div class="conten">
    <div class="add-link-for-video">
      Ссылка
      <input type="text" id='url'>
      Изображение
      <div class="img-for-video">
        <img src="<?php echo Yii::$app->homeUrl; ?>css/img/img-for-video.png">
      </div>
      Название
      <input type="text" id='name'>
      Описание
      <textarea type="text" id='description' rows="1"></textarea>
      <ul class="list1">
        <li>Кто может просматривать это видео?</li>
        <li>Кто может коментировать видеозаписи?</li>
      </ul>
      <ul class="list2">
        <li>
          <select id="privacy-video" class="video-privancy">
            <option value="0">Все пользователи</option>
            <option value="1">Только друзья</option>
            <option value="2">Друзья и друзья друзей</option>
            <option value="3">Только я</option>
          </select>
        </li>
        <li>
          <select id="privacy-comments" class="video-privancy">
            <option value="0">Все пользователи</option>
            <option value="1">Только друзья</option>
            <option value="2">Друзья и друзья друзей</option>
            <option value="3">Только я</option>
          </select>
        </li>
      </ul>
      <input class="checkbox" type="checkbox" id='repost-board'>

      <div class="checkbox-label"> Опубликовать на моей странице</div>
    </div>
  </div>
  <div class="foot-modal">
    <button class="for-modal2">Сохранить изменения</button>
  </div>
</div>
<div id="overlay"></div><!-- Подложка -->


<div id="modal-login-regisration" class="modal-div-login-regisration">
  <div class="modal_close"><h1>Регистрация</h1>

    <div id="close_for_modal" class="close-foto"></div>
  </div>
  <div class="content-login-regisration">

    <div class="wp-login-regisration-form1">
      <form action="">
        <div class="wp-login-regisration-list-i">
          <div class="wp-login-regisration-list-i-text">E-mail</div>
          <input class="wp-login-regisration-input" type="email">

          <div class="clearboth"></div>
        </div>
        <div class="wp-login-regisration-list-i">
          <div class="wp-login-regisration-list-i-text">Пароль</div>
          <input class="wp-login-regisration-input" type="password">

          <div class="clearboth"></div>
        </div>
        <div class="wp-login-regisration-list-i">
          <div class="wp-login-regisration-list-i-text">Еще раз</div>
          <input class="wp-login-regisration-input" type="password">

          <div class="clearboth"></div>
        </div>
      </form>

      <div class="wp-login-regisration-descpassword">Пароль должен содержать символы, буквы и зверюшек</div>
    </div>
    <div class="wp-login-regisration-form2">
      <div class="regisration-download-ava">
        <p class="regisration-download-ava-title">Аватар</p>

        <form action="">
          <input class="choosefaile" accept="image/*,image/jpeg" type="file">
        </form>
      </div>
      <form method="POST" class="login-regisration-form2-content">
        <div class="wp-login-regisration-list-i">
          <div class="wp-login-regisration-list-i-text">Имя</div>
          <input class="wp-login-regisration-input" type="text">

          <div class="clearboth"></div>
        </div>
        <div class="wp-login-regisration-list-i">
          <div class="wp-login-regisration-list-i-text">Фамилия</div>
          <input class="wp-login-regisration-input" type="text">

          <div class="clearboth"></div>
        </div>
        <div class="wp-login-regisration-list-i">
          <div class="wp-login-regisration-list-i-text">Никнейм</div>
          <input class="wp-login-regisration-input" type="text">

          <div class="clearboth"></div>
        </div>
        <div class="wp-login-regisration-list-item">
          <div class="wp-login-regisration-list-item-text">Кто вы в культуре</div>
          <div class="wp-login-regisration-popup-list">
            <select>
              <option>Бибой</option>
            </select>
          </div>
          <div class="clearboth"></div>
        </div>
      </form>
    </div>


  </div>
  <div class="foot-modal">
    <button class="btn-for-modal-login-regisration">Зарегистрироваться</button>
  </div>
</div>
<div id="modal-forgot-password" class="modal-div-forgot-password">
  <div class="modal_close"><h1>Восстановление пароля</h1>

    <div id="close_for_modal" class="close-foto"></div>
  </div>
  <div class="content-login-regisration">

    <div class="wp-forgot-password-form">
      <p class="forgot-password-form-descriptio1">Введите e-mail указанный при регистрации</p>

      <div class="clearboth"></div>

      <form action="">
        <div class="wp-forgot-password-list-i">
          <div class="wp-forgot-password-list-i-text">E-mail</div>
          <input class="wp-forgot-password-input" type="email">

          <div class="clearboth"></div>
        </div>
      </form>

      <p class="forgot-password-form-descriptio2">На этот адрес будет выслано письмо с временным паролем,
        который вы сможете поменять в настройках профайла позже.</p>

      <div class="clearboth"></div>

    </div>


  </div>
  <div class="foot-modal">
    <button class="btn-for-modal-forgot-password">Выслать пароль</button>
  </div>
</div>


<template id="fotoModal-template"></template>


<!-- <div id="modal2" class="modal-div-user-video">

</div>
<div id="overlay"></div> --><!-- Подложка -->



