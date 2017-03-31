<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use frontend\widgets\WidgetProfileUserMenu;
use frontend\models\UserAvatar;
use app\models\UserDescription;
use app\models\UserPrivacy;
use app\models\User;
use app\models\Photo;
use frontend\widgets\addMessageWidget;


/* @var $this yii\web\View */  
$this->title = $modelDescription->name;
$this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Друзья'), 'url' => ['/users/']];
$this->params['breadcrumbs'][] = $modelDescription->nickname;
?>
<div id="modal4" class="modal_div_for_video">
  <div class="modal_close"><div id="close_for_modal" class="close"></div> <h1>Добавить фото</h1></div>
  <div class="foto-list-content">

  </div>
</div>
<div id="modal5" class="modal_div_for_video">
  <div class="modal_close"><div id="close_for_modal" class="close"></div> <h1>Добавить видео</h1></div>
  <div class="video-list-content">

  </div>
</div>
<div class="leftBlock">
      <div class="profileDiv">
        <span><?php echo $userStatus;?></span> <!--Был сегодня в 17:45?-->
        
        <div class="profileImg">
          <div class="ava-back">
            <img class="ava-img" src="<?=UserAvatar::getImg($model->id)?>" alt="<?=Html::encode(Yii::$app->user->identity->username)?>">
            <img class="ava-progress" src="<?php echo Yii::$app->homeUrl; ?>css/img/ava-progress.png" alt="avatar">
            <img class="ava-border" src="<?php echo Yii::$app->homeUrl; ?>css/img/ava-border.png" alt="avatar">
            <img class="ava-title" src="<?php echo Yii::$app->homeUrl; ?>css/img/ava-title.png" alt="avatar">
            <a class="ava-level" href="javascript:void(0);" title="Если тыц сюда, то откроется <br>меню прокачки персонажа и <br> статистика прокачанных скилов"><img src="<?php echo Yii::$app->homeUrl; ?>css/img/ava_d.png" alt=""></a>
          </div>                  
        </div>
        <!--<?php echo print_r($model) ;?>-->
        <!--<p class="profileFullName">
          <span><?=$modelDescription->name." ".$modelDescription->last_name; ?></span>
        </p>-->
        <p class="profileNickName"><?=$modelDescription->nickname; ?></p>


        <ul class="profileUl js-active-1">
          <?php foreach($userList AS $name => $value){ ?>
            <?php if ($name == 'Рейтинг') {?>
                <li><span><?=$name?>:</span> <?= number_format($value/27*100, 0) . ' %'; ?></li>
            <?php } else {?>
                <li><span><?=$name?>:</span> <?=$value?></li>
            <?php } ?>
          <?php } ?>
          <!-- <a href="#modal-send-message" onclick="modalUse()" class="open_modal"><li><h4>Написать сообщение</h4></li></a> -->
        </ul>
      </div>
  <div class="push-wrap clearfix">
  <?php if($messagePrivacy){ ?>
      <a href="#modal-send-message" onclick="modalUse()" class="open_modal">Написать сообщение</a>
  <?php } ?>
    <p class="push">подробнее</p>
    <p class="push-item">скрыть</p>
  </div>
      <div class="blockJ">
        <img src="<?php echo Yii::$app->homeUrl; ?>css/img/blockJ_l.jpg" alt="" class="blockJ_l">
        <img src="<?php echo Yii::$app->homeUrl; ?>css/img/blockJ_r.jpg" alt="" class="blockJ_r">
        <h3><a href="<?=Url::toRoute('profile/'.$model->id.'/friends')?>">Друзья</a></h3>
        
        <span><?php echo $friendsCnt; ?></span>
        
        <?php foreach($userFriends as $key => $val): ?> 
          
          <div class="friendsList">
            <a href="<?=Url::toRoute('profile/'.$userFriends[$key]['id'])?>">
                <img src="<?= Yii::$app->homeUrl.'images/avatar/'.$userFriends[$key]['id'].'_small.jpg'; ?>" class="img-circle imgFrendS" alt="<?=$userFriends[$key]['nickname'];?>"> 
              <?=$userFriends[$key]['nickname'];?> 
              <?php if($userFriends[$key]['onlineInd']!=0){ ?>
                <i class="greenI"></i>
              <?php }?>
            </a>
          </div>
          
        <?php endforeach; ?>
        
<script>
    $('.imgFrendS').error(function() {
        $(this).attr( "src", "http://devoutstyle.org/images/avatar/def_avatar.jpg" );
    });
</script>
        
        <div class="clearfix"></div>
        
      </div>
      <!-- <div class="blockJ"> -->
      <!--  <h3><a href="#">Группы</a></h3>
        <span>25</span>
        <ul class="froups">
          <li><a href="#"><img src="<//?php echo Yii::$app->homeUrl; ?>css/img/froups1.jpg"> Best bboys ever <small>Группа лучших</small></a></li>
          <li><a href="#"><img src="<//?php echo Yii::$app->homeUrl; ?>css/img/froups2.jpg"> Powermove tut... <small>Уроки мастеров</small></a></li>
          <li><a href="#"><img src="<//?php echo Yii::$app->homeUrl; ?>css/img/froups3.jpg"> Графити гик <small>Лучшие техники</small></a></li>
        </ul>
        <div class="clearfix"></div> -->
        
      <!-- </div> -->
      <div class="blockJ">
        <h3><a href="<?=Url::toRoute('profile/'.$model->id.'/video')?>">Видео</a></h3>
        <span><?=$countVideo?></span>

        <?php foreach($modelVideo AS $key => $val){ 
          if(!$modelVideo[$key]['privacyVideo']){ continue; }
        ?>
            <div class="small-video">
              <a href='#modal2' id="<?=$modelVideo[$key]['id']?>" class='open_modal open-div-user-video'><div class="video-play"></div></a>
              <!-- <div class="small-video-time">4:02</div> -->
              <img src="<?=$modelVideo[$key]['urlImg']?>" alt="<?=$modelVideo[$key]['title']?>" width ="178px" height="97">
            </div>
            <div class="small-video-title"><?=$modelVideo[$key]['title']?></div>
            <div class="small-video-date"><?=$modelVideo[$key]['created']?> через <?=$modelVideo[$key]['service']?></div>
        <?php } ?>

        <div class="clearfix"></div>
        
<!--                 <div class="small-video"><div class="video-play"></div><div class="small-video-time">4:02</div><img src="<//?php echo Yii::$app->homeUrl; ?>css/img/video1.jpg" alt=""></div>
        <div class="small-video-title">Michael Jackson - Hollywood Toni...</div>
        <div class="small-video-date">Фев 9, 2015 в 15:40 через YouTube</div>
        <div class="small-video"><div class="video-play"></div><div class="small-video-time">4:02</div><img src="<//?php echo Yii::$app->homeUrl; ?>css/img/video1.jpg" alt=""></div>
        <div class="small-video-title">Michael Jackson - Hollywood Toni...</div>
        <div class="small-video-date">Фев 9, 2015 в 15:40 через YouTube</div>
        <div class="clearfix"></div>
        <div class="bootomImg"><img src="<?//php echo Yii::$app->homeUrl; ?>css/img/friendsList3.jpg" alt=""></div> -->
      </div>
      <!-- <div class="blockJ"> -->
        <!-- <h3><a href="#">Музыка</a></h3>
        <span>270</span>

        <div class="track">
          <img src="<//?php echo Yii::$app->homeUrl; ?>css/img/track1.jpg" alt="">
          <div class="track-avtor">Michael Jackson</div>
          <div class="track-date">3:55</div>
          <div class="track-title">Do You Know Where Your ...</div>
        </div>
        
        <div class="track">
          <img src="<//?php echo Yii::$app->homeUrl; ?>css/img/track1.jpg" alt="">
          <div class="track-avtor">Michael Jackson</div>
          <div class="track-date">3:55</div>
          <div class="track-title">Do You Know Where Your ...</div>
        </div>

        <div class="track">
          <img src="<//?php echo Yii::$app->homeUrl; ?>css/img/track1.jpg" alt="">
          <div class="track-avtor">Michael Jackson</div>
          <div class="track-date">3:55</div>
          <div class="clear"></div>-->
          <!-- <div class="track-title">Do You Know Where Your ...</div> -->
        <!-- </div> -->

        <div class="clearfix"></div> -->
        
      </div>
    </div>
    <div class="rightBlock"> 

        <?php if(!empty($modelPhotoCount)){?>


            <div class="random-foto">

                    <?php if($modelPhotoCount == 1){?>
                       <div class="random-foto-users foto-own">
                        <a href='#modal1' id="<?=$modelPhoto[0]['idPhoto']?> " class='open_modal open-div-user-foto'>
                            <img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhoto[0]['idOwner']?>/<?=$modelPhoto[0]['idAlbum']?>/small_<?=$modelPhoto[0]['nameImg']?>">
                        </a> 
                        </div>
                        <a href="<?php echo Yii::$app->homeUrl; ?>profile/<?=$model->id?>/photos/"><div class="cvadr"></div></a>
                    <?php }?>

<!-- 'profile/<id:[0-9]*>/photos' -->
                    <?php if($modelPhotoCount == 2){?>
                       <div class="random-foto-users fotos-own">
                        <a href='#modal1' id="<?=$modelPhoto[0]['idPhoto']?> " class='open_modal open-div-user-foto'>
                            <img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhoto[0]['idOwner']?>/<?=$modelPhoto[0]['idAlbum']?>/small_<?=$modelPhoto[0]['nameImg']?>">
                            </a>
                        </div>
                        <a href="<?php echo Yii::$app->homeUrl; ?>profile/<?=$model->id?>/photos/"><div class="cvadr"></div></a>
                       <div class="random-foto-users fotos-own">
                             <a href='#modal1' id="<?=$modelPhoto[1]['idPhoto']?> " class='open_modal open-div-user-foto'>
                            <img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhoto[1]['idOwner']?>/<?=$modelPhoto[1]['idAlbum']?>/small_<?=$modelPhoto[1]['nameImg']?>">
                            </a>
                        </div>
                   <?php }?>

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
                        <a href="<?php echo Yii::$app->homeUrl; ?>profile/<?=$model->id?>/photos/"><div class="cvadr"></div></a>
                        <div class="random-foto-users">
                            <a href='#modal1' id="<?=$modelPhoto[2]['idPhoto']?> " class='open_modal open-div-user-foto'>
                            <img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhoto[2]['idOwner']?>/<?=$modelPhoto[2]['idAlbum']?>/small_<?=$modelPhoto[2]['nameImg']?>"></a>
                        </div> 
                    <?php }?>

                    <?php if($modelPhotoCount >= 4){?>
                       <div class="random-foto-users">
                             <a href='#modal1' id="<?=$modelPhoto[0]['idPhoto']?> " class='open_modal open-div-user-foto'><img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhoto[0]['idOwner']?>/<?=$modelPhoto[0]['idAlbum']?>/small_<?=$modelPhoto[0]['nameImg']?>"></a>
                        </div>
                        <a href="<?php echo Yii::$app->homeUrl; ?>profile/<?=$model->id?>/photos/"><div class="cvadr"></div></a>
                        <div class="random-foto-users">
                           <div class="random-foto-user">
                                <a href='#modal1' id="<?=$modelPhoto[1]['idPhoto']?> " class='open_modal open-div-user-foto'> <img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhoto[1]['idOwner']?>/<?=$modelPhoto[1]['idAlbum']?>/small_<?=$modelPhoto[1]['nameImg']?>"></a>
                            </div>
                            <div class="random-foto-user">
                                <a href='#modal1' id="<?=$modelPhoto[2]['idPhoto']?> " class='open_modal open-div-user-foto'><img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhoto[2]['idOwner']?>/<?=$modelPhoto[2]['idAlbum']?>/small_<?=$modelPhoto[2]['nameImg']?>"></a>
                            </div>
                        </div>
                        <div class="random-foto-users">
                        <a href='#modal1' id="<?=$modelPhoto[3]['idPhoto']?> " class='open_modal open-div-user-foto'><img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhoto[3]['idOwner']?>/<?=$modelPhoto[3]['idAlbum']?>/small_<?=$modelPhoto[3]['nameImg']?>"></a>
                        </div> 
                    <?php }?>
            </div>
        <?php }?>

<!--input field-->
<!--    <div class="about">
      <div class="astatus">
        <?//php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]) ?>
          
          <?//= $form->field($newBoard, 'text')->textInput( [ 'placeholder' => "О чем вы думаете?" ] )->label(false, ['style'=>'display:none']) ?>
          <div class="astatus-form">
            <div class="form-selection">
              <img src="<?//php echo Yii::$app->homeUrl; ?>css/img/location.jpg" alt="">
              <img src="<?//php echo Yii::$app->homeUrl; ?>css/img/addition.jpg" alt="">
            </div>
            <button type="submit"></button>
          </div>
          <div class="about-menu">
          </div>
        <?//php ActiveForm::end() ?>
      </div>
    </div> -->  
       
<!-- нормальный вид формы отправки -->
<?php if($boardPrivacy){ ?>
    <div class="about">
        <!-- <div class="astatus"> -->
        
        <textarea name="" id="message" placeholder="О чем вы думаете?" rows="1"></textarea>
        
        <!--<img src="<//?php echo Yii::$app->homeUrl; ?>css/img/location.jpg" alt="">-->
        <img class="astatus_plus" src="<?php echo Yii::$app->homeUrl; ?>css/img/addition.jpg" alt="">
        <div class="about-menu">
            <a onclick="fotoAttachment('#send-on-board');" class="open_modal foto-atachment" href="#modal4">
                <div class="img-in" id="a1"></div>
            </a>
            <a onclick="videoAttachment('#send-on-board');" class="open_modal video-atachment" href="#modal5">
                <div class="img-in" id="a2"></div>
            </a>
        </div>

        <!-- </div> -->
        <button type="submit" id="send-on-board"></button>
    </div>
<?php } ?>
    
<!-- Comments -->

<script>

var homeUrl = "<?php echo Yii::$app->homeUrl; ?>";
var userId = "<?=Yii::$app->user->id?>";

$(document).ready(function() {
    
    $('.ava_class').error(function() {
        $(this).attr( "src", "<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/def_avatar.jpg" );
    });

    $('.send').on('click', function(){
        var message = $(this).parent().parent().children("textarea").val();
        var data = {
            user : <?=$model->id?>,
            message : message,
        };
        //console.log(data);

        $.ajax({
            dataType: 'JSON',
            type : 'get',
            data : data,
            url: "/chat/sendmessage/"
        }).then(function(data){
            console.log(data);
            if (data){
                alert('Сообщение успешно отправлено!');
            }
        });
    });

  /////прогрузка стены
    var data = {
        idOwnerBoard :<?=$model->id;?>,
        page : 1
    };
    //console.log(data);
    $.ajax({
        dataType: 'JSON',
        type : 'get',
        data : data,
        url: '/board/loadboard/'
    }).then(function(data){
        //console.log(data);
        if ( data.board ){
            var board = data.board;
            var count = board.length;

            for (var i = 0 ; i < count; i++ ){
                var comments = board[i].comments;
                var comentLength = board[i].comments.length;
                var repost = board[i].repost;
                var likeActive2 = (board[i].myLike == 1) ?  'likeActive2' :  '';
                 //console.log(repost);
                var attachment =  board[i].attachment;
                var url = (board[i].idOwner != <?=Yii::$app->user->id?>) ? '/profile/'+board[i].idOwner+'/' : '/myprofile/';

                if(repost != null){
                    var comText = getBrString(repost['text']);

                    var repostId =  repost.idOwner;
                    var repostName =  repost.nameOwner;
                    var repostUserId = repost.idOwner;
                    // console.log(repostUserId);
                     var urlRepost = (repostUserId != <?=Yii::$app->user->id?>) ? '/profile/'+repostUserId+'/' : '/myprofile/';
                    $('.board').append("<div id='post-"+board[i]['id']+"' class='blockM'><div class='zoom'></div><div class='massage-avatar'><a href='" + url + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + board[i].idOwner + "_small.jpg" + " alt=''></a></div><div class='message-repost'><div class='share-repost'></div><div class='massage-repost-avatar'>" +
                      "<a href='" + urlRepost + "'/'>" +
                      "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + repostId + "_small.jpg" + " alt=''></a></div><div class='message-rep'>" +
                      "<a href='" + urlRepost + "'/'>" +
                      "<div class='massage-repost-avtor'>" + repostName + "</div></a><div class='massage-repost-date' id=''>" + board[i]['timeRecord'] + "</div><div class='massage-repost-text'><div class='text'>" + comText + "</div><div class='message-repost-attachment'></div></div><div class='like "+likeActive2+"' id=" + board[i]['id'] + "><div class='like-Count'>" +  board[i].likeCount + "</div></div></div><div class='show-all-coment'>Показать все <span class='coment-count-news'>"+comentLength+"</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='all-coments'><div class='coment-mes'></div><div class='comment-plus'><div class='small-ava'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg" + " alt=''></div><div class='add-style'>" +
                      "<textarea class='coment-message' rows='1'></textarea>" +
                      "<img class='plus' src=" + "<?php echo Yii::$app->homeUrl; ?>" + "css/img/addition.jpg" + " alt=''><div class='about-menu'></div></div>" +
                      "<div id=" + board[i]['id'] + " class='m-top send'></div>" +
                      "</div></div></div></div>");

                    if (attachment != null){
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
                        var likeActive2 = (coment['myLike'] == 1) ?  'likeActive2' :  '';
                        var comText = getBrString(coment.comment);
                        var closeBtn = '';
                        var myId = <?=Yii::$app->user->id?>;
                        var idOwner = coment['user_id'];
                        if( data.isAdmin ){
                            closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                        } else {
                            if ( myId == idOwner ) {
                                closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                            } else {
                                closeBtn = '';
                            }
                        }
                          // if(!data.isAdmin){
                          //     if("<?=Yii::$app->user->id;?>" != coment.user_id){
                          //         $('#coment-' + coment.id+' > .del-coment').hide();  
                          //     }
                          // }

                        $('#post-' + board[i]['id']+' .message-repost > .all-coments  > .coment-mes').append("<div class='comment'>" +
                          closeBtn +
                          "<div class='comment-ava'>" +
                          "<a href='" + url + "'/'>" +
                          "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt='' class='ava_class'></a></div><div class='comment-massage'>" +
                          "<a href='" + url + "'/'>" +
                          "<div class='comment-avtor'>" + coment.user_name + "</div></a><div class='comment-date'>" + coment.created + "</div><div id='' class='comment-text'>" + comText + "</div><div id=" + coment.id + " class='like-coment "+likeActive2+"'><div class='like-Count'>" + coment.likeCount + "</div></div></div></div>");
                    }
                    var thisShowEl = $('#post-' + board[i]['id']+' .message-repost >  .show-all-coment');
                    var thisHideEl = $('#post-' + board[i]['id']+' .message-repost >  .hide-all-coments');

                    if ( comentLength <= 2) {
                        $(thisShowEl).hide();
                    } else {
                        $(thisShowEl).show();
                        $('#post-' + board[i]['id']+' .message-repost > .all-coments > .coment-mes > .comment').hide();
                        $('#post-' + board[i]['id']+' .message-repost > .all-coments > .coment-mes > .comment:last').show();
                        $('#post-' + board[i]['id']+' .message-repost > .all-coments > .coment-mes > .comment:last').prev().show();
                    } 
                    $('.show-all-coment').on("click",function(){
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').show();
                        $(this).parent().children('.hide-all-coments').show();
                        $(this).hide();
                    });
                    
                    $('.hide-all-coments').on("click",function(){
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').hide();
                        $(this).hide();
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').show();
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').prev().show();
                        $(this).parent().children('.show-all-coment').show();
                    });

                    var num = comentLength;
                    num = num.toString();
                    var numLast = num.charAt(num.length - 1);
                    var numLasts = num.slice(- 2);

                    if (numLasts == 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
                        $('#post-' + board[i]['id']+' .message-repost > .show-all-coment > .word').text("отзывов"); 
                    } else {
                        if (numLast == 2 || numLast == 3 || numLast == 4) {
                            $('#post-' + board[i]['id']+' .message-repost > .show-all-coment > .word').text("отзыва");
                        } else if (numLast == 0 || numLast >= 5) {
                            $('#post-' + board[i]['id']+' .message-repost > .show-all-coment > .word').text("отзывов");
                        } else {
                            $('#post-' + board[i]['id']+' .message-repost > .show-all-coment > .word').text("отзыв");
                        }
                    };
                } else {
                    var deleteBtn = '';
                    var myId = <?=Yii::$app->user->id?>;
                    var idOwner = board[i]['idOwner'];

                    if ( (myId == idOwner) || data.isAdmin ) {
                        deleteBtn = "<div id='" + board[i]['id'] + "' class='delete'>Удалить сообщение</div>";
                    } else {
                        deleteBtn = '';
                    }

                    var comText = getBrString(board[i]['text']);

                    $('.board').append("<div id='post-"+board[i]['id']+"' class='blockM'><div class='zoom'></div><div class='massage-avatar'><a href='" + url + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + board[i].idOwner + "_small.jpg" + " alt='' class='ava_class'></a></div>" +
                    "<div class='massage'>" +
                    deleteBtn +
                    "<a href='" + url + "'/'>" +
                    "<div class='massage-avtor'>" + board[i]['nameOwner'] + "</div></a><div class='massage-date' id=''>" + board[i]['timeRecord'] + "</div><div class='massage-text'><div class='text'>" + comText + "</div><div class='message-repost-attachment'></div></div><div class='add-comment'></div>" +
                    "<div class='like "+likeActive2+"' id=" + board[i]['id'] + ">" +
                    "<div class='like-Count'>" + board[i]['likeCount'] + "</div>" +
                    "</div>" +
                    "<div class='share' id='"+board[i]['id']+"'></div>" +
                    "<div class='edit'>редактировать сообщение<div class='edit-mes'>" +
                    "<textarea class='edit-message' autofocus></textarea>" +
                    "<button id=" + board[i]['id'] + " class='save'>" +
                    "<div id=" + board['id'] + " class='m-top'></div>" +
                    "</button></div></div><div class='show-all-coment'>Показать все <span class='coment-count-news'>"+comentLength+"</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='all-coments'><div class='coment-mes'></div><div class='comment-plus'><div class='small-ava'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg" + " alt=''></div><div class='add-style'>" +
                    "<textarea class='coment-message' rows='1'></textarea>" +
                    "<img class='plus' src=" + "<?php echo Yii::$app->homeUrl; ?>" + "css/img/addition.jpg" + " alt=''><div class='about-menu'><a onclick='modalUse()' class='open_modal foto-coment-atachment' href='#modal6'><div class='img-in' id='a1'></div></a><a onclick='modalUse()' class='open_modal video-coment-atachment' href='#modal7'><div class='img-in' id='a2'></div></a><div class='img-in' id='a3'></div><div class='img-in' id='a4'></div></div></div>" +
                    "<div id=" + board[i]['id'] + " class='m-top'></div>" +
                    "</div></div></div></div>");
                               
                    $('.ava_class').error(function() {
                        $(this).attr( "src", "<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/def_avatar.jpg" );
                    });

                    // <div class='about-menu'><a onclick='modalUse()' class='open_modal foto-coment-atachment' href='#modal6'><div class='img-in' id='a1'></div></a><a onclick='modalUse()' class='open_modal video-coment-atachment' href='#modal7'><div class='img-in' id='a2'></div></a><div class='img-in' id='a3'></div><div class='img-in' id='a4'></div></div>

                    // $('.comment-title').show();
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
                        var likeActive2 = (coment['myLike'] == 1) ?  'likeActive2' :  '';
                        var comText = getBrString(coment.comment);

                        var closeBtn = '';

                        var myId = <?=Yii::$app->user->id?>;
                        var idOwner = coment['user_id'];

                        // if (myId == idOwner) {
                        //   closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                        // } else {
                        //   closeBtn = '';
                        // }

                        if(data.isAdmin){
                            closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                        } else {
                            if (myId == idOwner) {
                              closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                            } else {
                              closeBtn = '';
                            }
                        }

                        $('#post-' + board[i]['id']+' .massage > .all-coments  > .coment-mes').append("<div class='comment'>" +
                        closeBtn +
                        "<div class='comment-ava'>" +
                        "<a href='/profile/" + coment.user_id + "/'>" +
                        "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt='' class='ava_class'></a></div><div class='comment-massage'>" +
                        "<a href='/profile/" + coment.user_id + "/'>" +
                        "<div class='comment-avtor'>" + coment.user_name + "</div></a><div class='comment-date'>" + coment.created + "</div><div id='' class='comment-text'>" + comText + "</div><div id=" + coment.id + " class='like-coment "+likeActive2+"'><div class='like-Count'>" + coment.likeCount + "</div></div></div></div>");
                    }

                    var thisShowEl = $('#post-' + board[i]['id']+' .massage > .show-all-coment');
                    var thisHideEl = $('#post-' + board[i]['id']+' .massage > .hide-all-coments');

                    if ( comentLength <= 2) {
                        $(thisShowEl).hide();
                    }else{
                        $(thisShowEl).show();
                        $('#post-' + board[i]['id']+' .massage > .all-coments > .coment-mes > .comment').hide();
                        $('#post-' + board[i]['id']+' .massage > .all-coments > .coment-mes > .comment:last').show();
                        $('#post-' + board[i]['id']+' .massage > .all-coments > .coment-mes > .comment:last').prev().show();
                    } 

                    $('.show-all-coment').on("click",function(){
                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').show();
                        $(this).parent().children('.hide-all-coments').show();
                        $(this).hide();
                    });

                    $('.hide-all-coments').on("click",function(){
                       $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').hide();
                       $(this).hide();
                       $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').show();
                       $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').prev().show();
                       $(this).parent().children('.show-all-coment').show();
                    });

                    var num = comentLength;
                    num = num.toString();
                    var numLast = num.charAt(num.length - 1);
                    var numLasts = num.slice(- 2);

                    if (numLasts == 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
                        $('#post-' + board[i]['id']+' .massage > .show-all-coment > .word').text("отзывов"); 
                    } 
                    else {
                        if (numLast == 2 || numLast == 3 || numLast == 4) {
                            $('#post-' + board[i]['id']+' .massage > .show-all-coment > .word').text("отзыва");
                        } else if (numLast == 0 || numLast >= 5) {
                            $('#post-' + board[i]['id']+' .massage > .show-all-coment > .word').text("отзывов");
                        } else {
                            $('#post-' + board[i]['id']+' .massage > .show-all-coment > .word').text("отзыв");
                        }
                    };
                }
            }
                            
            $('.ava_class').error(function() {
                $(this).attr( "src", "<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/def_avatar.jpg" );
            });

            ///появление поля для коментария
            $('.add-comment').on('click', function(){
                var allComents = $(this).nextAll(".all-coments");
                var curInput = $(this).nextAll(".all-coments").children(".comment-plus").children(".add-style").children(".coment-message");
                $(allComents).show();
                $(curInput).focus();
            });

            $('.m-top').off('click').on('click', function(){
            var commentMessage = $(this).prevAll(".add-style").children(".coment-message").val();
            var thisComent = $(this).parent('.comment-plus:last');
            if ($.trim(commentMessage) == ""){
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
                }).then(function(data) {
                    var closeBtn = '';
                    var comText = getBrString(data.comment);

                    var myId = <?=Yii::$app->user->id?>;
                    var idOwner = data.user_id;

                    // if (myId == idOwner) {
                    //   closeBtn = "<div id='" + data.idComment + "' class='close'></div>";
                    // } else {
                    //   closeBtn = '';
                    // }
                    if(data.isAdmin) {
                        closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                    }else{
                        if (myId == idOwner) {
                          closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                        } else {
                          closeBtn = '';
                        }
                     }

                    $(thisComent).before("<div class='comment'>" +
                      closeBtn +
                      "<div class='comment-ava'>" +
                      "<a href='/profile/" + data.user_id + "/'>" +
                      "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + data.user_id + "_small.jpg" + " alt='' class='ava_class'></a></div><div class='comment-massage'>" +
                      "<a href='/profile/" + data.user_id + "/'>" +
                      "<div class='comment-avtor'>" + data.user_name + "</div></a><div class='comment-date friends-comment'>" + data.created + "</div><div id='' class='comment-text'>" + comText + "</div><div id=" + data.idComment + " class='like-coment'><div class='like-Count'>" + data.likeCount + "</div></div></div></div>");
                    $(".coment-message").val("");

                    titleInit();
                    textareaInit('.js-click, .m-top, #send-on-board');

                    //// Удаление комментария
                    $('.close').on('click', function() {
                        var isDel = confirm('Вы желаете удалить комментарий?');
                        if (isDel) {
                            var thisComent = $(this).parent();
                            var data = {
                                 id: $(this).attr('id')
                            };
//                                console.log(data);
                            $.ajax({
                                 dataType: 'JSON',
                                 type: 'get',
                                 data: data,
                                 url: '/board/delcomment/'
                            }).then(function(data) {
                                $(thisComent[0]).fadeOut('slow');
                            });
                        }
                    });
                    //// Репост
                    $('.share').on('click', function(){
                        var postText = $(this).prevAll('.massage-text').text();
                        var postID = $(this).attr('id');
                        var data = {
                                id : postID,
                                text: postText
                        };
                        console.log(data);
                        $.ajax({
                                dataType: 'JSON',
                                type : 'get',
                                data : data,
                                url : '/board/repost/'
                        }).then(function(data){
                            alert('Репост отправлен к вам на стену');
                        });
                    });
                });
            }
        });
        //// Репост
                         $('.share').on('click', function(){
                            var postText = $(this).prevAll('.massage-text').text();
                            // var postID = $(this).attr('id');
                            var data = {
                                    id : $(this).attr('id'),
                                    text: postText
                            };
                            console.log(data);
                            $.ajax({
                                    dataType: 'JSON',
                                    type : 'get',
                                    data : data,
                                    url : '/board/repost/'
                            }).then(function(data){
                            console.log(data);
                                alert('Репост отправлен к вам на стену');
                            });
                        });

                        //// Удаление комментария
                        $('.close').on('click', function(){
                            var thisComent = $(this).parent();
                            var data = {
                                id : $(this).attr('id')
                            };
                            //console.log(data);
                            $.ajax({
                                    dataType: 'JSON',
                                    type : 'get',
                                    data : data,
                                    url: '/board/delcomment/'
                            }).then(function(data){
                                    console.log(data);
                                    $(thisComent[0]).fadeOut('slow');
                            });
                        });

                        ////удаление репостов
                        $('.delete-repost').on('click', function(){
                            var isDel = confirm('Вы желаете удалить репост?');
                            if (isDel) {
                                var thisRepost =  $(this).parent().parent().parent();
                                var data = {
                                        idRecord : $(this).attr('id'),
                                        idOwnerBoard : <?=Yii::$app->user->id;?>,
                                        page : 1,
                                };

                                $.ajax({
                                        dataType: 'JSON',
                                        type : 'get',
                                        data : data,
                                        url: '/board/delboard/'
                                }).then(function(data){
                                        console.log(data);
                                       $(thisRepost[0]).fadeOut('slow');

                                });
                            }
                        });

                        ////редактирование сообщений (только владельцы записи )
                         $('.edit').on('click', function() {
                       var ShowMessageArea = $(this).children(".edit-mes");
                       var EditMessageText = $(this).parent().children('.massage-text').children(".text").text();
                       var EditMessageArea = $(this).parent().children('.massage-text').children('.text:last');
                       $(this).children(".edit-mes").children(".edit-message").val(EditMessageText);
                       ShowMessageArea.show().focus();
                       var thisButoon = $(this).children('.edit-mes').children('button');
                       $(thisButoon).on('click', function() {
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
                           }).then(function(data) {
                               $(EditMessageArea).html(edMes);
                               ShowMessageArea.hide();
                           });
                       });
                   });

                  photoOutput();

    } //end  if(data.board) //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//приватность на комментирование постов
if(!"<?=$boardPrivacy?>"){
  $('.comment-plus').html('');
}

          ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// infinite scroll
var page = 1;
var loadMore = true;
 $(window).on('scroll', function(){
      if($(window).scrollTop() == $(document).height() - $(window).height() && loadMore == true){
        page = page + 1;
        var data = {
          idOwnerBoard : <?=$model->id;?>,
          page : page
        };
        console.log(data);
        $.ajax({
          dataType: 'JSON',
          type : 'get',
          data : data,
          url: '/board/loadboard/',
          success: function(data){
            console.log(data);
            loadMore = data.loadMore;
            if (loadMore == false){
                $('div#loadmoreajaxloader').hide();
            }else{
                $('div#loadmoreajaxloader').show();
            }
            if (data.board){

                var board = data.board;
                var count = board.length;

                for (var i = 0 ; i < count; i++ ){
                    var comments = board[i].comments;
                    var comentLength = board[i].comments.length;
                    var likeActive2 = (board[i].myLike == 1) ?  'likeActive2' :  '';
                    var repost = board[i].repost;
                    //console.log(repost);
                    var attachment =  board[i].attachment;
                    var url = (board[i].idOwner != <?=Yii::$app->user->id?>) ? '/profile/'+board[i].idOwner+'/' : '/myprofile/';

                    if(repost != null){

                        var repostId =  repost.idOwner;
                        var repostName =  repost.nameOwner;
                        var repostUserId = repost.idOwner;
                        var comText = getBrString(repost['text']);
                        // console.log(repostUserId);
                         var urlRepost = (repostUserId != <?=Yii::$app->user->id?>) ? '/profile/'+repostUserId+'/' : '/myprofile/';
                        $('.board').append("<div id='post-"+board[i]['id']+"' class='blockM'><div class='zoom'></div><div class='massage-avatar'><a href='" + url + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + board[i].idOwner + "_small.jpg" + " alt=''></a></div><div class='message-repost'><div class='share-repost'></div><div class='massage-repost-avatar'>" +
                          "<a href='" + urlRepost + "'/'>" +
                          "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + repostId + "_small.jpg" + " alt=''></a></div><div class='message-rep'>" +
                          "<a href='" + urlRepost + "'/'>" +
                          "<div class='massage-repost-avtor'>" + repostName + "</div></a><div class='massage-repost-date' id=''>" + board[i]['timeRecord'] + "</div><div class='massage-repost-text'><div class='text'>" + comText + "</div><div class='message-repost-attachment'></div></div><div class='like "+likeActive2+"' id=" + board[i]['id'] + "><div class='like-Count'>" +  board[i].likeCount + "</div></div></div><div class='show-all-coment'>Показать все <span class='coment-count-news'>"+comentLength+"</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='all-coments'><div class='coment-mes'></div><div class='comment-plus'><div class='small-ava'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg" + " alt=''></div><div class='add-style'>" +
                          "<textarea class='coment-message' rows='1'></textarea>" +
                          "<img class='plus' src=" + "<?php echo Yii::$app->homeUrl; ?>" + "css/img/addition.jpg" + " alt=''><div class='about-menu'>" +
                          "</div></div>" +
                          "<div id=" + board[i]['id'] + " class='m-top send'></div>" +
                          "</div></div></div></div>");

                              

                        if (attachment != null){
                            console.log(attachment);
                            if (attachment.type == 'photo') {
                               $('.message-repost-attachment:last').append("<a id='" + attachment[0].id + "' class='js-photo'><div class='foto-in-album'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/photo/" + attachment[0].user + "/" + attachment[0].album + "/normal_" + attachment[0].img + "></div></a>");
                            }
                            if (attachment.type == 'video') {
                                $('.message-repost-attachment:last').append("<iframe width='413' height='200' src=" + attachment.modelVideo.url_iframe + " frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><div class='video-title'>" + attachment.modelVideo.title + "</div>");
                            }
                        }
                         for (var x = 0; x < comentLength; x++) {
                        var coment = comments[x];
                           var likeActive2 = (coment['myLike'] == 1) ?  'likeActive2' :  '';
                           var closeBtn = '';
                           var comText = getBrString(coment.comment);

                           var myId = <?=Yii::$app->user->id?>;
                           var idOwner = coment['user_id'];

                           // if (myId == idOwner) {
                           //   closeBtn = "<div id=" + coment.id + "  class='close'></div>";
                           // } else {
                           //   closeBtn = '';
                           // }

                          if(data.isAdmin){
                               closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                           }else{
                               if (myId == idOwner) {
                                 closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                               } else {
                                 closeBtn = '';
                               }
                           }

                           $('#post-' + board[i]['id']+' .message-repost > .all-coments  > .coment-mes').append("<div class='comment'>" +
                             closeBtn +
                             "<div class='comment-ava'>" +
                             "<a href='" + url + "'/'>" +
                             "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt='' class='ava_class'></a></div><div class='comment-massage'>" +
                             "<a href='" + url + "'/'>" +
                             "<div class='comment-avtor'>" + coment.user_name + "</div></a><div class='comment-date'>" + coment.created + "</div><div id='' class='comment-text'>" + comText + "</div><div id=" + coment.id + " class='like-coment "+likeActive2+"'><div class='like-Count'>" + coment.likeCount + "</div></div></div></div>");
                        }
                                    var thisShowEl = $('#post-' + board[i]['id']+' .message-repost >  .show-all-coment');
                                    var thisHideEl = $('#post-' + board[i]['id']+' .message-repost >  .hide-all-coments');

                                    if ( comentLength <= 2) {
                                        $(thisShowEl).hide();
                                    }else{
                                        $(thisShowEl).show();
                                        $('#post-' + board[i]['id']+' .message-repost > .all-coments > .coment-mes > .comment').hide();
                                        $('#post-' + board[i]['id']+' .message-repost > .all-coments > .coment-mes > .comment:last').show();
                                        $('#post-' + board[i]['id']+' .message-repost > .all-coments > .coment-mes > .comment:last').prev().show();
                                    } 

                                    $('.show-all-coment').on("click",function(){
                                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').show();
                                        $(this).parent().children('.hide-all-coments').show();
                                        $(this).hide();
                                    });

                                     $('.hide-all-coments').on("click",function(){
                                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').hide();
                                        $(this).hide();
                                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').show();
                                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').prev().show();
                                        $(this).parent().children('.show-all-coment').show();
                                    });

                                    var num = comentLength;
                                    num = num.toString();
                                    var numLast = num.charAt(num.length - 1);
                                    var numLasts = num.slice(- 2);

                                    if (numLasts == 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
                                        $('#post-' + board[i]['id']+' .message-repost > .show-all-coment > .word').text("отзывов"); 
                                    } 
                                    else {
                                        if (numLast == 2 || numLast == 3 || numLast == 4) {
                                            $('#post-' + board[i]['id']+' .message-repost > .show-all-coment > .word').text("отзыва");
                                        } else if (numLast == 0 || numLast >= 5) {
                                            $('#post-' + board[i]['id']+' .message-repost > .show-all-coment > .word').text("отзывов");
                                        } else {
                                            $('#post-' + board[i]['id']+' .message-repost > .show-all-coment > .word').text("отзыв");
                                        }
                                    };
                                 }else{

                                    var deleteBtn = '';

                                    var myId = <?=Yii::$app->user->id?>;
                                    var idOwner = board[i]['idOwner'];

                                    if (myId == idOwner) {
                                      deleteBtn = "<div id='" + board[i]['id'] + "' class='delete'>Удалить сообщение</div>";
                                    } else {
                                      deleteBtn = '';
                                    }

                                    var comText = getBrString(board[i]['text']);

                                     $('.board').append("<div id='post-"+board[i]['id']+"' class='blockM'><div class='zoom'></div><div class='massage-avatar'><a href='" + url + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + board[i].idOwner + "_small.jpg" + " alt=''></a></div>" +
                                       "<div class='massage'>" +
                                       deleteBtn +
                                       "<a href='" + url + "'/'><div class='massage-avtor'>" + board[i]['nameOwner'] + "</div></a><div class='massage-date' id=''>" + board[i]['timeRecord'] + "</div><div class='massage-text'><div class='text'>" + comText + "</div><div class='message-repost-attachment'></div></div><div class='like "+likeActive2+"' id=" + board[i]['id'] + "><div class='like-Count'>" + board[i]['likeCount'] + "</div></div>" +
                                       "<div class='share' id='"+board[i]['id']+"'></div>" +
                                       "<div class='edit'>редактировать сообщение<div class='edit-mes'>" +
                                       "<textarea class='edit-message' autofocus></textarea>" +
                                       "<button id=" + board[i]['id'] + " class='save'>" +
                                       "<div id=" + board['id'] + " class='m-top send'></div>" +
                                       "</button></div></div><div class='show-all-coment'>Показать все <span class='coment-count-news'>"+comentLength+"</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='all-coments'><div class='coment-mes'></div><div class='comment-plus'><div class='small-ava'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg" + " alt=''></div><div class='add-style'>" +
                                       "<textarea class='coment-message' rows='1'></textarea>" +
                                       "<img class='plus' src=" + "<?php echo Yii::$app->homeUrl; ?>" + "css/img/addition.jpg" + " alt=''><div class='about-menu'><a onclick='modalUse()' class='open_modal foto-coment-atachment' href='#modal6'><div class='img-in' id='a1'></div></a><a onclick='modalUse()' class='open_modal video-coment-atachment' href='#modal7'><div class='img-in' id='a2'></div></a><div class='img-in' id='a3'></div><div class='img-in' id='a4'></div></div></div>" +
                                       "<div id=" + board[i]['id'] + " class='m-top send'></div>" +
                                       "</div></div></div></div>");

                       // <div class='about-menu'><a onclick='modalUse()' class='open_modal foto-coment-atachment' href='#modal6'><div class='img-in' id='a1'></div></a><a onclick='modalUse()' class='open_modal video-coment-atachment' href='#modal7'><div class='img-in' id='a2'></div></a><div class='img-in' id='a3'></div><div class='img-in' id='a4'></div></div>

                       // $('.comment-title').show();
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
                            var likeActive2 = (coment['myLike'] == 1) ?  'likeActive2' :  '';
                         var closeBtn = '';
                         var comText = getBrString(coment.comment);

                         var myId = <?=Yii::$app->user->id?>;
                         var idOwner = coment['user_id'];

                         // if (myId == idOwner) {
                         //   closeBtn = "<div id=" + coment.id + "  class='close'></div>";
                         // } else {
                         //   closeBtn = '';
                         // }
                            if(data.isAdmin){
                               closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                           }else{
                               if (myId == idOwner) {
                                 closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                               } else {
                                 closeBtn = '';
                               }
                           }

                           $('#post-' + board[i]['id']+' .massage > .all-coments  > .coment-mes').append("<div class='comment'>" +
                             closeBtn +
                             "<div class='comment-ava'>" +
                             "<a href='/profile/" + coment.user_id + "/'>" +
                             "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt='' class='ava_class'></a></div><div class='comment-massage'>" +
                             "<a href='/profile/" + coment.user_id + "/'>" +
                             "<div class='comment-avtor'>" + coment.user_name + "</div></a><div class='comment-date'>" + coment.created + "</div><div id='' class='comment-text'>" + comText + "</div><div id=" + coment.id + " class='like-coment "+likeActive2+"'><div class='like-Count'>" + coment.likeCount + "</div></div></div></div>");
                       }

                                    var thisShowEl = $('#post-' + board[i]['id']+' .massage > .show-all-coment');
                                    var thisHideEl = $('#post-' + board[i]['id']+' .massage > .hide-all-coments');

                                    if ( comentLength <= 2) {
                                        $(thisShowEl).hide();
                                    }else{
                                        $(thisShowEl).show();
                                        $('#post-' + board[i]['id']+' .massage > .all-coments > .coment-mes > .comment').hide();
                                        $('#post-' + board[i]['id']+' .massage > .all-coments > .coment-mes > .comment:last').show();
                                        $('#post-' + board[i]['id']+' .massage > .all-coments > .coment-mes > .comment:last').prev().show();
                                    } 

                                    $('.show-all-coment').on("click",function(){
                                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').show();
                                        $(this).parent().children('.hide-all-coments').show();
                                        $(this).hide();
                                    });

                                     $('.hide-all-coments').on("click",function(){
                                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment').hide();
                                        $(this).hide();
                                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').show();
                                        $(this).parent().children('.all-coments').children('.coment-mes').children('.comment:last').prev().show();
                                        $(this).parent().children('.show-all-coment').show();
                                    });

                                    var num = comentLength;
                                    num = num.toString();
                                    var numLast = num.charAt(num.length - 1);
                                    var numLasts = num.slice(- 2);

                                    if (numLasts == 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
                                        $('#post-' + board[i]['id']+' .massage > .show-all-coment > .word').text("отзывов"); 
                                    } 
                                    else {
                                        if (numLast == 2 || numLast == 3 || numLast == 4) {
                                            $('#post-' + board[i]['id']+' .massage > .show-all-coment > .word').text("отзыва");
                                        } else if (numLast == 0 || numLast >= 5) {
                                            $('#post-' + board[i]['id']+' .massage > .show-all-coment > .word').text("отзывов");
                                        } else {
                                            $('#post-' + board[i]['id']+' .massage > .show-all-coment > .word').text("отзыв");
                                        }
                                    };

                                }
                            }
                            
                            $('img').error(function() {
                                    $(this).attr( "src", "<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/def_avatar.jpg" );
                                });

                        ///появление поля для коментария
                         $('.add-comment').on('click', function(){
                                var allComents = $(this).nextAll(".all-coments");
                                var curInput = $(this).nextAll(".all-coments").children(".comment-plus").children(".add-style").children(".coment-message");
                                $(allComents).show();

                                $(curInput).focus();

                            });


                   $('.m-top').off('click').on('click', function(){
                   var commentMessage = $(this).prevAll(".add-style").children(".coment-message").val();
                   var thisComent = $(this).parent('.comment-plus:last');
                    if ($.trim(commentMessage) == ""){
            
                   }else{
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
                     }).then(function(data) {
                      console.log(data);
                       var closeBtn = '';

                       var myId = <?=Yii::$app->user->id?>;
                       var idOwner = data.user_id;
                       var comText = getBrString(data.comment);

                       // if (myId == idOwner) {
                       //   closeBtn = "<div id=" + data.idComment + " class='close'></div>";
                       // } else {
                       //   closeBtn = '';
                       // }
                          if(data.isAdmin){
                               closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                           }else{
                               if (myId == idOwner) {
                                 closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                               } else {
                                 closeBtn = '';
                               }
                           }
                         $(thisComent).before("<div class='comment'>" +
                           closeBtn +
                           "<div class='comment-ava'>" +
                           "<a href='/profile/" + data.user_id + "/'>" +
                           "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + data.user_id + "_small.jpg" + " alt='' class='ava_class'></a></div><div class='comment-massage'>" +
                           "<a href='/profile/" + data.user_id + "/'>" +
                           "<div class='comment-avtor'>" + data.user_name + "</div></a><div class='comment-date friends-comment'>" + data.created + "</div><div id='' class='comment-text'>" + comText + "</div><div id=" + data.idComment + " class='like-coment'><div class='like-Count'>" + data.likeCount + "</div></div></div></div>");
                         $(".coment-message").val("");


                       titleInit();
                       textareaInit('.js-click, .m-top, #send-on-board');

                        //// Удаление комментария
                        $('.close').on('click', function() {
                            var isDel = confirm('Вы желаете удалить комментарий?');
                            if (isDel) {
                                var thisComent = $(this).parent();
                                var data = {
                                    id: $(this).attr('id')
                                };
//                                console.log(data);
                                $.ajax({
                                    dataType: 'JSON',
                                    type: 'get',
                                    data: data,
                                    url: '/board/delcomment/'
                                }).then(function(data) {
                                    $(thisComent[0]).fadeOut('slow');
                                });
                             }
                         });
                        //// Репост
                        $('.share').on('click', function(){
                            var postText = $(this).prevAll('.massage-text').text();
                            var postID = $(this).attr('id');
                            var data = {
                                id : postID,
                                text: postText
                            };
                            console.log(data);
                            $.ajax({
                                dataType: 'JSON',
                                type : 'get',
                                data : data,
                                url : '/board/repost/'
                            }).then(function(data){
                                alert('Репост отправлен к вам на стену');
                            });
                        });
                     });
                    }
               });


            //// Репост
            $('.share').on('click', function(){
               var postText = $(this).prevAll('.massage-text').text();
               // var postID = $(this).attr('id');
               var data = {
                       id : $(this).attr('id'),
                       text: postText
               };
               console.log(data);
               $.ajax({
                       dataType: 'JSON',
                       type : 'get',
                       data : data,
                       url : '/board/repost/'
               }).then(function(data){
               console.log(data);
                   alert('Репост отправлен к вам на стену');
               });
           });

            //// Удаление комментария
            $('.close').on('click', function(){
                var isDel = confirm('Вы желаете удалить комментарий?');
                if (isDel) {
                    var thisComent = $(this).parent();
                    var data = {
                        id : $(this).attr('id')
                    };
//                    console.log(data);
                    $.ajax({
                        dataType: 'JSON',
                        type : 'get',
                        data : data,
                        url: '/board/delcomment/'
                    }).then(function(data){
                        console.log(data);
                        $(thisComent[0]).fadeOut('slow');
                    });
                }
            });
//приватность на комментирование постов
if(!"<?=$boardPrivacy?>"){
  $('.comment-plus').html('');
}

//                        ////удаление сообщений
//                            $('.delete').on('click', function(){
//                              var that = $(this).parent().parent();
//                                    var data = {
//                                            idRecord : $(this).attr('id'),
//                                            idOwnerBoard : <?//=Yii::$app->user->id;?>//,
//                                            page : 1,
//                                    };
//
//                                    $.ajax({
//                                            dataType: 'JSON',
//                                            type : 'get',
//                                            data : data,
//                                            url: '/board/delboard/'
//                                    }).then(function(data){
//                                            console.log(data);
//                                           $(that[0]).fadeOut('slow');
//                                    });
//                            });
                            ////удаление репостов
                            $('.delete-repost').on('click', function(){
                                var isDel = confirm('Вы желаете удалить комментарий?');
                                if (isDel) {
                                    var thisRepost =  $(this).parent().parent().parent();
                                    var data = {
                                            idRecord : $(this).attr('id'),
                                            idOwnerBoard : <?=Yii::$app->user->id;?>,
                                            page : 1,
                                    };
                                    $.ajax({
                                            dataType: 'JSON',
                                            type : 'get',
                                            data : data,
                                            url: '/board/delboard/'
                                    }).then(function(data){
                                            console.log(data);
                                           $(thisRepost[0]).fadeOut('slow');

                                    });
                                }
                            });

                        ////редактирование сообщений (только владельцы записи )
                        $('.edit').on('click', function() {
                        var ShowMessageArea = $(this).children(".edit-mes");
                        var EditMessageText = $(this).parent().children('.massage-text').children(".text").text();
                        var EditMessageArea = $(this).parent().children('.massage-text').children('.text:last');
                        $(this).children(".edit-mes").children(".edit-message").val(EditMessageText);
                        ShowMessageArea.show().focus();
                        var thisButoon = $(this).children('.edit-mes').children('button');
                        $(thisButoon).on('click', function() {
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
                           }).then(function(data) {
                               $(EditMessageArea).html(edMes);
                               ShowMessageArea.hide();
                           });
                       });
                   });

                         photoOutput();

                    } //end  if(data.board) //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

          }
        });
      }


    });
 //////////////////////////////////////////////////////END infinite scroll

          /////добавление записи
            $('#send-on-board').on('click', function(){
              $('.preview-box').remove();
              var aid = $(this).attr('data-id');
                        var atype = $(this).attr('data-atype');
                        var data = {
                           idOwnerBoard: <?=$model->id;?>,
                           page: 1,
                        };
                        if ($("#message").val() != "") {
                             data.text = $("#message").val();
                        }
                        if (atype != "") {
                            data.atype = atype ;
                            data.aid = aid ;
                        }
                        console.log(data)
                $.ajax({
                    dataType: 'JSON',
                    type : 'post',
                    data : data,
                    url: '/board/addboard/'
                }).then(function(data){

                  console.log(data);


                  if (data){
                     var attachment = data.attachment;
                                   var board = data;
                      var board = data;

                    var deleteBtn = '';

                    var myId = <?=Yii::$app->user->id?>;
                    var idOwner = board.idOwner;

                    if (myId == idOwner) {
                      deleteBtn = "<div id='" + board['id'] + "' class='delete'>Удалить сообщение</div>";
                    } else {
                      deleteBtn = '';
                    }

                    var comText = getBrString(board['text']);
                    

                          $('.board').prepend("<div id='message-"+board.id+"' class='blockM'><div class='zoom'></div><div class='massage-avatar'><a href='" + url + "'/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + board.idOwner + "_small.jpg" + " alt=''></a></div><div class='massage'>" +
                            deleteBtn +
                            "<a href='" + url + "'/'><div class='massage-avtor'>" + board['nameOwner'] + "</div></a><div class='massage-date' id=''>" + board['timeRecord'] + "</div><div class='massage-text'><div class='text'>" + comText + "</div><div class='message-repost-attachment'></div></div><div class='add-comment'></div><div class='like "+likeActive2+"' id=" + board['id'] + "><div class='like-Count'>" + board['likeCount'] + "</div></div>" +
                            "<div class='share' id='"+board['id']+"'></div>" +
                            "<div class='edit'>редактировать сообщение<div class='edit-mes'>" +
                            "<textarea class='edit-message' autofocus></textarea>" +
                            "<button id=" + board['id'] + " class='save'>" +
                            "<div id=" + board['id'] + " class='m-top send'></div>" +
                            "</button></div></div><div class='all-coments'><div class='comment-title'>Показать все " + comentLength + " комментария</div><div class='comment-plus'><div class='small-ava'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg" + " alt=''></div><div class='add-style'>" +
                            "<textarea class='coment-message' rows='1'></textarea>" +
                            "<img class='plus' src=" + "<?php echo Yii::$app->homeUrl; ?>" + "css/img/addition.jpg" + " alt=''><div class='about-menu'></div></div>" +
                            "<div id=" + board['id'] + " class='m-top'></div>" +
                            "</div></div></div></div>");

                          if (attachment != null) {
                                               if (attachment.type == 'photo') {
                                                   $('#message-'+board.id+' > .massage > .massage-text > .message-repost-attachment').append("<a id='" + attachment[0].id + "' class='js-photo'><div class='foto-in-album'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/photo/" + attachment[0].user + "/" + attachment[0].album + "/normal_" + attachment[0].img + "></div></a>");
                                               }
                                               if (attachment.type == 'video') {
                                                    $('#message-'+board.id+' > .massage > .massage-text > .message-repost-attachment').append("<iframe width='528' height='250' src=" + attachment.modelVideo.url_iframe + " frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><div class='video-title'>" + attachment.modelVideo.title + "</div>");
                                               }
                                           }

                          $("#message").val("");
                          $('.all-coments:first').hide();
                            if (comentLength == '0'){
                               $('.all-coments:last').hide();
                            }else{
                              $('.add-comment:last').hide();
                            }
                          // console.log(board.text);
                  }
                 //// лайки
                  //появление коментария
                  $('.add-comment').on('click', function(){
                    var allComents = $(this).nextAll(".all-coments");
                    var curInput = $(this).nextAll(".all-coments").children(".comment-plus").children(".add-style").children(".coment-message");
                    $(allComents).show();
                    $(curInput).focus();
                  });


                    //// добавление комментария
                   $('.m-top').off('click').on('click', function(){
                   var commentMessage = $(this).prevAll(".add-style").children(".coment-message").val();
                   var thisComent = $(this).parent('.comment-plus:last');
                    if ($.trim(commentMessage) == ""){
            
                   }else{
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
                     }).then(function(data) {
                      console.log(data);
                       var closeBtn = '';
                       var comText = getBrString(data.comment);

                       var myId = <?=Yii::$app->user->id?>;
                       var idOwner = data.user_id;

                       // if (myId == idOwner) {
                       //   closeBtn = "<div id=" + data.idComment + " class='close'></div>";
                       // } else {
                       //   closeBtn = '';
                       // }
                          if(data.isAdmin){
                               closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                           }else{
                               if (myId == idOwner) {
                                 closeBtn = "<div id='" + coment.id + "'  class='close'></div>";
                               } else {
                                 closeBtn = '';
                               }
                           }
                         $(thisComent).before("<div class='comment'>" +
                           closeBtn +
                           "<div class='comment-ava'>" +
                           "<a href='/profile/" + data.user_id + "/'>" +
                           "<img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + data.user_id + "_small.jpg" + " alt='' class='ava_class'></a></div><div class='comment-massage'>" +
                           "<a href='/profile/" + data.user_id + "/'>" +
                           "<div class='comment-avtor'>" + data.user_name + "</div></a><div class='comment-date friends-comment'>" + data.created + "</div><div id='' class='comment-text'>" + comText + "</div><div id=" + data.idComment + " class='like-coment'><div class='like-Count'>" + data.likeCount + "</div></div></div></div>");
                         $(".coment-message").val("");

                      titleInit();
                      textareaInit('.js-click, .m-top, #send-on-board');
                      

                         //// Удаление комментария
                         $('.close').on('click', function() {
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
                                }).then(function(data) {
                                    $(thisComent[0]).fadeOut('slow');
                                });
                            }
                         });
                          //// Репост
                          $('.share').on('click', function(){
                              var postText = $(this).prevAll('.massage-text').text();
                              var postID = $(this).attr('id');
                              var data = {
                                      id : postID,
                                      text: postText
                              };
                              console.log(data);
                              $.ajax({
                                      dataType: 'JSON',
                                      type : 'get',
                                      data : data,
                                      url : '/board/repost/'
                              }).then(function(data){
                                  alert('Репост отправлен к вам на стену');
                              });
                          });

textareaInit();

                     });
                     
          }
               });
//                          ////удаление сообщений
//                  $('.delete').on('click', function(){
//                    var that = $(this).parent().parent();
//                      var data = {
//                          idRecord : $(this).attr('id'),
//                          idOwnerBoard : <?//=$model->id;?>//,
//                          page : 1,
//                      };
//
//                      $.ajax({
//                          dataType: 'JSON',
//                          type : 'get',
//                          data : data,
//                          url: '/board/delboard/'
//                      }).then(function(data){
//                          console.log(data);
//
//                           $(that[0]).fadeOut('slow');
//
//                      });
//
//
//                  });

                  ////редактирование сообщений (только владельцы записи )
                               $('.edit').on('click', function() {
                                   var ShowMessageArea = $(this).children(".edit-mes");
                                   var EditMessageText = $(this).parent().children('.massage-text').children(".text").text();
                                   var EditMessageArea = $(this).parent().children('.massage-text').children('.text:last');
                                   $(this).children(".edit-mes").children(".edit-message").val(EditMessageText);
                                   ShowMessageArea.show().focus();
                                   var thisButoon = $(this).children('.edit-mes').children('button');
                                   $(thisButoon).on('click', function() {
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
                                       }).then(function(data) {
                                           $(EditMessageArea).html(edMes);
                                           ShowMessageArea.hide();
                                       });
                                   });
                               });

                });
              // }

            });

        textareaInit('.js-click, .m-top, #send-on-board');
        titleInit();

      });
// Запуск видео
            $('.open-div-user-video').on('click', function(){
                var data = {
                    id : $(this).attr('id'),
                };
                console.log(data);
                
              $.ajax({
                    dataType: 'JSON',
                    type : 'get',
                    data : data,
                    url: '/video/getvideoinfo/',
                }).then(function(data){
                    // var videoContent = " ";
                    $('.modal-div-user-video').html(" ");
                    console.log(data);
                    var thisVideo = data.videoInfo.video.urlIframe;
                    var titleVideo = data.videoInfo.video.title;
                    var nameUserCreator =  data.videoInfo.video.username;
                    var videoCreated =  data.videoInfo.video.created;
                    var coments = data.videoInfo.comments;
                    var comentLength = data.videoInfo.comments.length;
                    var likeCount = data.videoInfo.countLikes;
                    var likeActive2 = (data.videoInfo.video.myLike == 1) ?  'likeActive2' :  '';

                    //контент видео
                    //console.log('data.videoInfo.video.privacyComments : ', data.videoInfo.video.privacyComments);
                    if(data.videoInfo.video.privacyComments == true){
                      var writeMessage = "<div class='ava-user'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+"<?=Yii::$app->user->id?>"+"_small.jpg"+" alt=''></div><textarea class='coment-message' rows='1'></textarea><div id="+data.videoInfo.video.id+" class='send-icon'></div>";
                    }else{
                      var writeMessage = "Вы не можете комментировать данное видео";
                    }

                    $('.modal-div-user-video').append("<div class='modal_close'><h2 class='video-title'>"+titleVideo+"</h2><div id='close_for_modal'  class='close'></div></div><div  class='conten'><div class='for-user-video'><iframe width='910' height='511' src="+thisVideo+" frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div><div class='for-user-coments'><div class='coments'><div class='show-all-coment'>Показать все <span class='coment-count-news'>"+comentLength+"</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='coment-message'></div><div class='write-message'>"+ writeMessage +"</div></div><div class='video-creator'><div class='user-creator-ava'><a href='/profile/"+data.videoInfo.video.user+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+data.videoInfo.video.user+"_small.jpg"+" alt=''></a></div><a href='/profile/"+data.videoInfo.video.user+"/'><div class='user-creator-name'>"+nameUserCreator+"</div></a><div class='add-time'>Добавлено "+videoCreated+"</div><div class='creator-dostig'><div class='Add-comen'>"+data.videoInfo.comments.length+"</div><div id="+data.videoInfo.video.id+" class='lik "+likeActive2+"'><div class='count-like'>"+likeCount+"</div></div><div id="+data.videoInfo.video.id+" class='Shar'></div></div></div></div></div>");

                        modalUse();
                        
                        if (coments){
                            // alert('yo');
                            for (var x = 0; x < comentLength; x++) {
                               var coment = coments[x];
                              var likeActive2 = (coment['myLike'] == 1) ?  'likeActive2' :  '';
                              var comText = getBrString(coment.comment);
                               console.log(coment);
                              var delComent = '';

                              var myId = <?=Yii::$app->user->id?>;
                              var idOwner = coment.user_id;


                              if(data.videoInfo.isAdmin){
                                  delComent = "<div id="+coment.id+" class='del-coment'></div>";
                              }else{
                                if (myId == idOwner) {
                                  delComent = "<div id="+coment.id+" class='del-coment'></div>";
                                } else {
                                  delComent = '';
                                }
                              }

                               //коментарии для видео
                                $('.modal-div-user-video .coment-message').append("<div class='coment'><div class='user-ava'><a href='/profile/"+coment.user_id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+coment.user_id+"_small.jpg"+" alt=''></a></div><div class='info-user'><div class='for-user-vs-time'><a href='/profile/"+coment.user_id+"/'><div class='user-name'>"+coment.user_name+"</div></a><div class='time'>"+coment.created+"</div></div>" +
                                  delComent +
                                  "<div class='user-message'>"+comText+"</div><div class='reply'></div><div id="+coment.id+" class='like "+likeActive2+"'><div class='like-count'>"+coment.likeCount+"</div></div></div></div>");
                            }
                             if ( comentLength <= 2) {
                                        $('.coments > .show-all-coment').hide();
                                    }else{
                                        $(' .coments > .show-all-coment').show();
                                        $(' .coments > .coment-message > .coment').hide();
                                        $(' .coments > .coment-message > .coment:last').show();
                                        $(' .coments > .coment-message > .coment:last').prev().show();
                                    } 

                                    $('.show-all-coment').on("click",function(){
                                        $(this).parent().children('.coment-message').children('.coment').show();
                                        $(this).parent().children('.hide-all-coments').show();
                                        $(this).hide();
                                    });

                                     $('.hide-all-coments').on("click",function(){
                                        $(this).parent().children('.coment-message').children('.coment').hide();
                                        $(this).hide();
                                        $(this).parent().children('.coment-message').children('.coment:last').show();
                                        $(this).parent().children('.coment-message').children('.coment:last').prev().show();
                                        $(this).parent().children('.show-all-coment').show();
                                    });
                                     var num =  data.videoInfo.comments.length;
                                    console.log(num)
                                    var str = num.toString();
                                    var numLast = str.charAt(str.length - 1);
                                    console.log(numLast);
                                    var numLasts = str.slice(- 2);

                                    if (numLasts == 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
                                        $('  .show-all-coment > .word').text("отзывов"); 
                                    } 
                                    else {
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
                            $('.Shar').on('click', function(){ 
                                // var likeIns = $(this).parent().children(".count-like");
                                // console.log(likeIns);
                                var data = {
                                    id : $(this).attr('id')
                                };
                                console.log(data);
                              $.ajax({
                                    dataType: 'JSON',
                                    type : 'get',
                                    data : data,
                                    url: '/video/repost/',
                                }).then(function(data){
                                    // $(likeIns).html(data.likeCount);
                                    console.log(data);
                                    alert('Видео отправлено на вашу стену')

                                });
                            });
                            


                        //// Удаление комментария для видео
                        $('.del-coment').on('click', function(){
                            var isDel = confirm('Вы желаете удалить комментарий?');
                            if (isDel) {
                                var thisComent = $(this).parent().parent();
                                var data = {
                                        id : $(this).attr('id')
                                };
//                                console.log(data);
                                $.ajax({
                                        dataType: 'JSON',
                                        type : 'get',
                                        data : data,
                                        url: '/video/delcomment/'
                                }).then(function(data){
//                                        console.log(data);
                                        $(thisComent[0]).fadeOut('slow');
                                });
                            }
                        });

                         //Добавление коментария для видео
                        $('.send-icon').off();
                        $('.send-icon').on('click', function(){
                          var $this = $(this);
                            var comentText = $(this).parent().children('textarea').val();
                            var thisArea = $(this).parent().children('textarea');
                            if ($.trim(comentText) == ""){
            
                            }else{
                                var data = {
                                    id : $(this).attr('id'),
                                    text : comentText
                                };
                                console.log(data);
                                $.ajax({
                                    dataType: 'JSON',
                                    type : 'post',
                                    data : data,
                                    url: '/video/comment/',
                                }).then(function(data){
                                  var delComent = '';
                                  var comText = getBrString(data.comment);

                                  var myId = <?=Yii::$app->user->id?>;
                                  var idOwner = data.user_id;

                                  if (myId == idOwner) {
                                    delComent = "<div id="+data.idComment+" class='del-coment'></div>";
                                  } else {
                                    delComent = '';
                                  }

                                    console.log(data);
                                    $this.closest('.coments').find('.coment-message').append("<div class='coment'><div class='user-ava'><a href='/profile/"+data.user_id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+data.user_id+"_small.jpg"+" alt=''></a></div><div class='info-user'><div class='for-user-vs-time'><a href='/profile/"+data.user_id+"/'><div class='user-name'>"+data.user_name+"</div></a><div class='time'>"+data.created+"</div></div>" +
                                      delComent +
                                      "<div class='user-message'>"+comText+"</div><div class='reply'></div><div  id="+data.idComment+" class='like "+likeActive2+"'><div class='like-count'>"+data.likeCount+"</div></div></div>");
                                        $(thisArea).val("");
                                    

                                    //// Удаление комментария для видео
                                    $('.del-coment').on('click', function(){
                                        var isDel = confirm('Вы желаете удалить комментарий?');
                                        if (isDel) {
                                            var thisComent = $(this).parent().parent();
                                            var data = {
                                                    id : $(this).attr('id')
                                            };
//                                            console.log(data);
                                            $.ajax({
                                                    dataType: 'JSON',
                                                    type : 'get',
                                                    data : data,
                                                    url: '/video/delcomment/'
                                            }).then(function(data){
//                                                    console.log(data);
                                                    $(thisComent[0]).fadeOut('slow');
                                            });
                                        }
                                    });
                                });
                            }
                        });


textareaInit();

                });

            });

   $('.open-div-user-foto').on('click', function(){ 
            
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
            var likeActive = (data.photoInfo.photo.myLike == 1) ?  'likeActive' :  '';
            $('.for-foto > img').attr("src", thisPhoto);
            $('.date-LikeShare > .date').html(data.photoInfo.photo.created);
            $('.creator > .user-name > a').html(data.photoInfo.photo.userName);
            $('.creator > .ava-creator > a > img').attr("src", userCreatorAva);
            // $('.write-message > .ava-user > img').attr("src", userCreatorAva); //asdsadasdasdasdasd
            if(data.photoInfo.photo.privacyComments){
                $('div.write-message').css('display', 'block');
                $('.write-message > .ava-user > img').attr("src", userComentAva); //asdsadasdasdasdasd
            }else{
                  //$('div.write-message').html('').append('Вы не можете комментировать фото этого альбома');
                $('div.write-message').css('display', 'none');
            }
            $('.like-panel > .count-like').html(data.photoInfo.countLikes);
            $('.send-icon').attr("id", data.photoInfo.photo.idPhoto);
            $('.ava-creator > a').attr("href", "/profile/" + data.photoInfo.photo.idOwner + "/");
            $('.creator > .user-name > a').attr("href", "/profile/" + data.photoInfo.photo.idOwner + "/");
            $('.like-panel > .share-photo').attr("id", data.photoInfo.photo.idPhoto);
            $('.like-panel > .photo-like').attr("id", data.photoInfo.photo.idPhoto).addClass(likeActive);
            $('.like-panel > .photo-edit > .count-coment').text(data.photoInfo.comments.commentsCount);
            $('.like-panel > .photo-like > .count-like').text(data.photoInfo.countLikes);
            $('.content-view-foto > .creator > .del').attr("id",data.photoInfo.photo.idPhoto);
            $('.content-view-foto > .creator > .del').attr("data-idAlbum",data.photoInfo.photo.idAlbum);
            var curFoto = $('.foto-active').attr('data-id');
            $('.curentFoto').text(curFoto);
            var count = data.photoInfo.comments.commentsCount;
            if (data.photoInfo.comments) {
                for (var i = 0; i < count; i++) {
                    var coment = data.photoInfo.comments[i];
                    var likeActive2 = (coment['myLike'] == 1) ?  'likeActive2' :  '';
                  var delComent = '';
                  var comText = getBrString(coment.comment);

                  var myId = <?=Yii::$app->user->id?>;
                  var idOwner = coment.user_id;

                  // if (myId == idOwner) {
                  //   delComent = "<div id=" + coment.id + " class='del-coment'></div>";
                  // } else {
                  //   delComent = '';
                  // }
                              if(data.photoInfo.isAdmin){
                                  delComent = "<div id="+coment.id+" class='del-coment'></div>";
                              }else{
                                if (myId == idOwner) {
                                  delComent = "<div id="+coment.id+" class='del-coment'></div>";
                                } else {
                                  delComent = '';
                                }
                              }

                    $('.coments > .coment-messages').append("<div class='coment'><div class='user-ava'><a href='/profile/" + coment.user_id + "/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt=''></a></div><div class='info-user'>" +
                      delComent +
                      "<div class='for-user-vs-time'><a href='/profile/" + coment.user_id + "/'><div class='user-name'>" + coment.user_name + "</div></a><div class='time'>" + coment.created + "</div></div><div class='user-message'>" + comText + "</div><div class='reply'></div><div id=" + coment.id + " class='like "+likeActive2+"'><div class='count-like'>" + coment.likeCount + "</div></div></div></div>");
                }


                if ( data.photoInfo.comments.commentsCount <= 2) {
                    $(".show-all-coments").hide();
                }else{
                    $(".show-all-coments").show();
                    $(".coment-messages > .coment").hide();
                    $(".coment-messages > .coment:last").show();
                    $(".coment-messages > .coment:last").prev().show();
                }
                $('.show-all-coments').click(function(){
                    $('.coment-messages > .coment').show();
                    $('.hide-all-coments').show();
                    $('.show-all-coments').hide();
                });
                $('.hide-all-coments').click(function(){
                    $('.coment-messages > .coment').hide();
                    $('.hide-all-coments').hide();
                    $(".coment-messages > .coment:last").show();
                    $(".coment-messages > .coment:last").prev().show();
                    $('.show-all-coments').show();
                });


                var num = data.photoInfo.comments.commentsCount;
                // num = num + '';
                console.log(num)

                $(".show-all-coments > h1 > .coment-count-news").text(num);

                var numLast = num.charAt(num.length - 1);
                var numLasts = num.slice(- 2);
                if (numLasts== 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
                    $(".show-all-coments > h1 > .word").text("отзывов");
                } else {
                    if (numLast == 2 || numLast == 3 || numLast == 4) {
                        $(".show-all-coments > h1 > .word").text("отзыва");
                    } else if (numLast == 0 || numLast >= 5) {
                        $(".show-all-coments > h1 > .word").text("отзывов");
                    } else {
                        $(".show-all-coments > h1 > .word").text("отзыв");
                    };
                };



                // удаление фото
                $('.del').on('click', function () {
                    var isDel = confirm('Вы желаете удалить фото?');
                    if (isDel) {
                        var data = {
                            idPhoto: $(this).attr('id'),
                            idAlbum: $(this).attr('data-idAlbum')
                        };
                        console.log(data);
                        $.ajax({
                            dataType: 'JSON',
                            type: 'get',
                            data: data,
                            url: '/photos/delphoto/'
                        }).then(function (data) {
                            console.log(data);
                            // $(thisPhoto).fadeOut('slow');
                            location.reload();
                        });
                    }
                });



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
                    var isDel = confirm('Вы желаете удалить комментарий?');
                    if (isDel) {
                        var thisComent = $(this).parent().parent();
                        var data = {
                            id: $(this).attr('id')
                        };
                        //console.log(data);
                        $.ajax({
                            dataType: 'JSON',
                            type: 'get',
                            data: data,
                            url: '/photos/delcomment/'
                        }).then(function (data) {
                            console.log(data);
                            $(thisComent).fadeOut('slow');
                        });
                    }
                });
            }

            titleInit();
          textareaInit('.js-click, .m-top, #send-on-board');
        });


        //// добавление комментария для фото
        $('.send-icon').off().on('click', ComentToFoto);

        function ComentToFoto(){
          var $this = $(this);
            var commentMessage = $(this).parent().children('textarea').val();
            if ($.trim(commentMessage) == ""){
            
            }else{
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
                    console.log(data);
                  var delComent = '';
                  var comText = getBrString(data.comment);

                  var myId = <?=Yii::$app->user->id?>;
                  var idOwner = data.user_id;

                  if (myId == idOwner) {
                    delComent = "<div id=" + data.idComment + " class='del-coment'></div>";
                  } else {
                    delComent = '';
                  }
                  $this.closest('.coments').find('.coment-messages').append("<div class='coment'><div class='user-ava'><a href='/profile/" + data.user_id + "/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + data.user_id + "_small.jpg" + " alt=''></a></div><div class='info-user'>" +
                      delComent +
                      "<div class='for-user-vs-time'><a href='/profile/" + data.user_id + "/'><div class='user-name'>" + data.user_name + "</div></a><div class='time'>" + data.created + "</div></div><div class='user-message'>" + comText + "</div><div class='reply'></div><div id=" + data.idComment + " class='like'><div class='count-like'>" + data.likeCount + "</div></div></div></div>");
                  $("textarea").val("");

                    /// Лайки для коментариев

                    // //// Удаление комментария
                    $('.del-coment').on('click', function () {
                        var isDel = confirm('Вы желаете удалить комментарий?');
                        if (isDel) {
                            var thisComent = $(this).parent().parent();
                            var data = {
                                id: $(this).attr('id')

                            };
                            //console.log(data);
                            $.ajax({
                                dataType: 'JSON',
                                type: 'get',
                                data: data,
                                url: '/photos/delcomment/'
                            }).then(function (data) {
                                //console.log(data);
                                $(thisComent).fadeOut('slow');
                            });
                        }
                    });
                    titleInit();
                    textareaInit('.js-click, .m-top, #send-on-board');
                });
            }
        }

    });
     textareaInit();


     ////удаление сообщений
     $('body').on('click', '.delete', function(){
        var isDel = confirm('Вы желаете удалить сообщение?');
        if (isDel) {
            var that = $(this).parent().parent();
            var data = {
              idRecord : $(this).attr('id'),
              idOwnerBoard : <?=Yii::$app->user->id;?>,
              page : 1,
            };

            $.ajax({
              dataType: 'JSON',
              type : 'get',
              data : data,
              url: '/board/delboard/'
            }).then(function(data){
              console.log(data);
              $(that[0]).fadeOut('slow');
            });
        }
     });


     $('body').on('click', '.photo-like', likeInitToFoto);
     $('body').on('click', '.massage .like', likeInitBoardUserMessage);
     $('body').on('click', '.for-user-coments .like', likeInitVideoComment);
     $('body').on('click', '.like-coment', likeInitBoardUser);
     $('body').on('click', '.lik', likeInitVideo);
     $('body').on('click', '.content-view-foto .like', likeInitComentToFotoAlbum);

     titleInit();
     textareaInit('.js-click, .m-top, #send-on-board');
     sendCtrlEnter('.m-top, .send-icon, #send-on-board');

  });      

</script>

<div class="board-load">
  <div class="board" id="board">

  </div>
  <div id="loadmoreajaxloader" style="display:none;"><center><img src="<?php echo Yii::$app->homeUrl;?>css/img/ajax-loader.gif" alt=""></center></div>
</div>
<div id="modal1" class="modal-div-view-foto modal-div-view-user-board-foto">

    <div class="modal_close"><div id="close_for_modal" class="close"></div></div>
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
                    <textarea rows="1"></textarea>
                    <!-- <div class="add-setings">
                        <div class="drop-list">
                            <ul>
                                <li><img src="<?php echo Yii::$app->homeUrl; ?>css/img/Graffity_ICO_add.png"></li>
                                <li><img src="<?php echo Yii::$app->homeUrl; ?>css/img/Music_ICO_add.png"></li>
                                <li><img src="<?php echo Yii::$app->homeUrl; ?>css/img/Video_ICO_add.png"></li>
                                <li><img src="<?php echo Yii::$app->homeUrl; ?>css/img/Photo_ICO_add.png"></li>
                            </ul>
                            <img src="<?php echo Yii::$app->homeUrl; ?>css/img/arrow_down.png">
                        </div>
                        <img src="<?php echo Yii::$app->homeUrl; ?>css/img/Addition_ICO.png">
                    </div>
                    <div class="smile">
                        <img src="<?php echo Yii::$app->homeUrl; ?>css/img/smile.png">
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

        </div>
    </div>
</div>
     <div id="modal2" class="modal-div-user-video modal-div-view-board-video">
            
                
        </div>
    <div id="modal-send-message" class="modal-send-message">
        <div class="modal_close"> <h1>Написать сообщение</h1><div id="close_for_modal" class="close-foto"></div></div>
        <div class="content-send-message">
          <div class="user-ava">
          </div>
          <div class="message-area">
            <textarea class="form-control" type="text" placeholder="Введите ваше сообщение" rows="1"></textarea>
            <div class="foot-modal"><input id="" class="send" type="button" value="Отправить"></div>
          </div>
        </div>

    </div>
    <div id="overlay"></div><!-- Подложка -->
    </div>