<?php
   
    use yii\helpers\Html;
    use yii\helpers\Url;

    /* @var $this yii\web\View */
    $this->title = Yii::t('app', 'Видео').' - '.$name;
    $this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
    $this->params['breadcrumbs'][] = Yii::t('app', '');

?>

<div class="video">
    <div class="header-video">
      <h1>Видеозаписей: <?=$countVideo?></h1>
      
    </div>
    <div class="video-content">

    </div>
    <div id="modal4" class="modal_div">
      <div class="modal_close"> <h1>Добавление по ссылке</h1><div id="close_for_modal" class="close"></div></div>
      <div class="conten">
        <div class="add-link">
          Ссылка
          <input type="text">
          <h1>Видеосервис не поддерживаеться, либо ссылка являеться неправильной</h1>
          <h2>Вы можете указать ссылку на страницу видеозаписи на таких сайтах, как Youtube, Rutube, Vimeo и др.</h2>
        </div>
      </div> 
    </div>


    <div id="modal3" class="modal_div_for_video">
      <div class="modal_close"> <h1>Ссылка на видео</h1><div id="close_for_modal" class="close"></div></div>
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
          <textarea type="text" id='description'></textarea>
          <ul class="list1">
            <li>Кто может просматривать это видео?</li>
            <li>Кто может коментировать видеозаписи?</li>
          </ul>
          <ul class="list2">
            <li>
               <select id="privacy-video">
                <option value="0">Все пользователи</option>
                <option value="1">Только друзья</option>            
                <option value="2">Друзья и друзья друзей</option>
                <option value="3">Только я</option>
                        </select>
            </li>
            <li>
              <select id="privacy-comments">
                <option value="0">Все пользователи</option>
                <option value="1">Только друзья</option>            
                <option value="2">Друзья и друзья друзей</option>
                <option value="3">Только я</option>
                        </select>
            </li>
          </ul>
          <input class="checkbox" type="checkbox" id='repost-board'> Опубликовать на моей странице
        </div>
      </div>
      <div class="foot-modal">
        <button class="for-modal2">Сохранить изменения</button>
      </div>
<script type="text/javascript">

$(document).ready(function() {


  /////вывод списка видео
    var data = {
                idOwner : <?=$id?>,
                page : 1
        };

    console.log(data);
                  
        $.ajax({
                dataType: 'JSON',
                type : 'get',
                data : data,
                url: '/video/listvideo/'
        }).then(function(data){

            console.log(data);
            var video = data.modelVideo;
            var count = data.modelVideo.length;
            if (video){
              for (var i = 0 ; i < count; i++){
                var curentVideo = video[i];
                var likeActive = (curentVideo['myLike'] == 1) ?  'likeActive' :  '';

              $('.video-content').append("<div class='my-video'><div class='video-prev'><a href='#modal2' id="+curentVideo.id+" class='open_modal'><img class='play-video' src="+"<?php echo Yii::$app->homeUrl;?>"+"css/img/videoplay.png"+"></a><img src="+curentVideo.urlImg+" width='212px' height='120px'><div class='panel-video'><div class='Add-coment'>"+curentVideo.commentsCount+"</div><div id="+curentVideo.id+" class='like "+likeActive+"'><div class='count-like'>"+curentVideo.likeCount+"</div></div><div id="+curentVideo.id+" class='Share'></div></div><h1>"+curentVideo.title+"</h1></div></div>")

              }

              modalUse();
               //Репост видео
        $('.Share').on('click', function(){ 
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
                alert('Репост отправлен к вам на стену!');
                  console.log(data);

              });
        });

          }

          // Запуск видео
      $('.open_modal').on('click', function(){
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
          $('.modal-div-user-video').html(" ");
          console.log(data);
          var thisVideo = data.videoInfo.video.urlIframe;
          var titleVideo = data.videoInfo.video.title;
          var descriptionVideo = data.videoInfo.video.description;
          var nameUserCreator =  data.videoInfo.video.username;
          var videoCreated =  data.videoInfo.video.created;
          var coments = data.videoInfo.comments;
          var comentLength = data.videoInfo.comments.length;
          var likeCount = data.videoInfo.countLikes;
          var likeActive2 = (data.videoInfo.video.myLike == 1) ?  'likeActive2' :  '';
          
                if(data.videoInfo.video.privacyComments == true){
                  var writeMessage = "<div class='ava-user'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+"<?=Yii::$app->user->id?>"+"_small.jpg"+" alt=''></div><textarea id='mess-user-index' class='coment-message' rows='1'></textarea><div id="+data.videoInfo.video.id+" class='send-icon'></div>";
                }else{
                  var writeMessage = "Вы не можете комментировать данное видео";
                }

                $('.modal-div-user-video').append(
                  "<div class='modal_close'>" +
                  "<div id='close_for_modal'  class='close'></div>" +
                  "<h2 class='video-title'>"+titleVideo+"</h2>" +
                  "</div>" +
                  "<div  class='conten'>" +
                  "<div class='for-user-video'><iframe width='910' height='511' src="+thisVideo+" frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div><h2 class='video-title'>"+ descriptionVideo +"</h2><div class='for-user-coments'><div class='coments'><div class='show-all-coment'>Показать все <span class='coment-count-news'>"+comentLength+"</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='coment-message'></div><div class='write-message'><div class='ava-user'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+"<?=Yii::$app->user->id?>"+"_small.jpg"+" alt=''></div><textarea id='mess-user-index' class='coment-message' rows='1'></textarea><div id="+data.videoInfo.video.id+" class='send-icon'>" +
                  "</div></div></div>" +
                  "<div class='video-creator'><div class='user-creator-ava'><a href='/profile/"+data.videoInfo.video.user+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+data.videoInfo.video.user+"_small.jpg"+" alt=''></a></div><a href='/profile/"+data.videoInfo.video.user+"/'><div class='user-creator-name'>"+nameUserCreator+"</div></a><div class='add-time'>Добавлено "+videoCreated+"</div><div class='creator-dostig'><div class='Add-comen'>"+data.videoInfo.comments.length+"</div><div id="+data.videoInfo.video.id+" class='lik "+likeActive2+"'><div class='count-like'>"+likeCount+"</div></div><div id="+data.videoInfo.video.id+" class='Shar'></div></div></div>" +
                  "</div></div>"
                );

                  modalUse();
                  if (coments){
                    // alert('yo');
                    for (var x = 0; x < comentLength; x++) {
                               var coment = coments[x];
                               console.log(coment);
                 var likeActive2 = (coment['myLike'] == 1) ?  'likeActive2' :  '';

//////////////////////////////////////
                          var del = '';
                          var myId = <?=Yii::$app->user->id?>;
                          var idOwner = coment['user_id'];

                          if(data.videoInfo.isAdmin){
                              del = "<div id="+coment.id+" class='del-coment'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/close.png'></div>";
                          }else{
                              if (myId == idOwner) {
                                del = "<div id="+coment.id+" class='del-coment'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/close.png'></div>";
                              } else {
                                del = '';
                              }
                          }
//////////////////////////////////////

                      var comText = getBrString(coment.comment);



                               $('.coment-message').append("<div class='coment'><div class='user-ava'><a href='/profile/"+coment.user_id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+coment.user_id+"_small.jpg"+" alt=''></a></div><div class='info-user'><div class='for-user-vs-time'><a href='/profile/"+coment.user_id+"/'><div class='user-name'>"+coment.user_name+"</div></a><div class='time'>"+coment.created+"</div></div>"+ del +"<div class='user-message'>"+comText+"</div><div class='reply'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/Share_ICO.png'></div><div id="+coment.id+" class='like "+likeActive2+"'><div class='like-count'>"+coment.likeCount+"</div></div></div></div>");

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
                         //Лайки для видео 
            $('.lik').on('click', function(){ 
              var likeIns = $(this).children(".count-like");
              var like = $(this);
              console.log(likeIns);
              var data = {
                id : $(this).attr('id'),
                elem_type : "video",
              };
              // console.log(data);
              $.ajax({
                      dataType: 'JSON',
                      type : 'get',
                      data : data,
                      url: '/video/like/',
                  }).then(function(data){
                    likeIns.html(data.likeCount);
                    var myLike = data.myLike;
                    (myLike) ? like.addClass('likeActive2') : like.removeClass('likeActive2');
                      // console.log(data);

                  });
            });
                         //Репост видео 
              $('.Shar').on('click', function(){ 
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
                      alert('Репост отправлен к вам на стену!');
                        console.log(data);

                    });
              });

                   //// Удаление комментария для видео
                         $('.del-coment').on('click', function(){
                            var thisComent = $(this).parent().parent();
                            var data = {
                                    id : $(this).attr('id')
                            };
                            console.log(data);
                            $.ajax({
                                    dataType: 'JSON',
                                    type : 'get',
                                    data : data,
                                    url: '/video/delcomment/'
                            }).then(function(data){
                                    console.log(data);
                                    $(thisComent[0]).fadeOut('slow');

                            });
                        });

               //Добавление коментария для видео
            $('.send-icon').on('click', function(){
              var comentText = $(this).parent().children('textarea').val();
              var thisArea = $(this).parent().children('textarea');
              // console.log(comentText);
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
                var comText = getBrString(data.comment);

                      console.log(data);
                      $('.coment-message').append("<div class='coment'><div class='user-ava'><a href='/profile/"+data.user_id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+data.user_id+"_small.jpg"+" alt=''></a></div><div class='info-user'><div class='for-user-vs-time'><a href='/profile/"+data.user_id+"/'><div class='user-name'>"+data.user_name+"</div></a><div class='time'>"+data.created+"</div></div><div id="+data.idComment+" class='del-coment'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/close.png'></div><div class='user-message'>"+comText+"</div><div class='reply'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/Share_ICO.png'></div><div  id="+data.idComment+" class='like'><div class='like-count'>"+data.likeCount+"</div></div></div>");
                        thisArea.val("");

                //// Удаление комментария для видео
                             $('.del-coment').on('click', function(){
                                var thisComent = $(this).parent().parent();
                                var data = {
                                        id : $(this).attr('id')
                                };
                                console.log(data);
                                $.ajax({
                                        dataType: 'JSON',
                                        type : 'get',
                                        data : data,
                                        url: '/video/delcomment/'
                                }).then(function(data){
                                        console.log(data);
                                        $(thisComent[0]).fadeOut('slow');

                                });
                            });


                  });
            });
            });

      });

          titleInit();
          textareaInit();

        }); /// end


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// infinite scroll
var page = 1;
var loadMore = true;
 $(window).on('scroll', function(){
            if($(window).scrollTop() == $(document).height() - $(window).height() && loadMore == true){
                page = page + 1;
                // $('div#loadmoreajaxloader').show();
                var data = {
                    idOwner : <?=$id?>,
                    page : page
                };
                console.log(data);
                $.ajax({
                    dataType: 'JSON',
                    type : 'get',
                    data : data,
                    url: '/video/listvideo/',
                    success: function(data){
                        console.log(data);
                        loadMore = data.loadMore;

                         console.log(data);
            var video = data.modelVideo;
            var count = data.modelVideo.length;
            if (video){
              for (var i = 0 ; i < count; i++){
                var curentVideo = video[i];
                var likeActive = (curentVideo['myLike'] == 1) ?  'likeActive' :  '';

              $('.video-content').append("<div class='my-video'><div class='video-prev'><a href='#modal2' id="+curentVideo.id+" class='open_modal'><img class='play-video' src="+"<?php echo Yii::$app->homeUrl;?>"+"css/img/VideoPlay.png"+"></a><img src="+curentVideo.urlImg+" width='212px' height='120px'><div class='panel-video'><div class='Add-coment'>121</div><div id="+curentVideo.id+" class='like "+likeActive+"'></div><div class='count-like'>"+curentVideo.likeCount+"</div><div id="+curentVideo.id+" class='Share'></div></div><h1>"+curentVideo.title+"</h1></div></div>")

              }

              modalUse();
               //Репост видео
        $('.Share').on('click', function(){ 
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
                  console.log(data);

              });
        });

          }

          // Запуск видео
      $('.open_modal').on('click', function(){ 
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
          $('.modal-div-user-video').html(" ");
          console.log(data);
          var thisVideo = data.videoInfo.video.urlIframe;
          var titleVideo = data.videoInfo.video.title;
          var descriptionVideo = data.videoInfo.video.description;
          var nameUserCreator =  data.videoInfo.video.username;
          var videoCreated =  data.videoInfo.video.created;
          var coments = data.videoInfo.comments;
          var comentLength = data.videoInfo.comments.length;
          var likeCount = data.videoInfo.countLikes;
          var likeActive2 = (data.videoInfo.video.myLike == 1) ?  'likeActive2' :  '';
                
                if(data.videoInfo.video.privacyComments){
                  var writeMessage = "<div class='ava-user'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+"<?=Yii::$app->user->id?>"+"_small.jpg"+" alt=''></div><textarea id='mess-user-index' class='coment-message' rows='1'></textarea><div id="+data.videoInfo.video.id+" class='send-icon'></div></div>";
                }else{
            var writeMessage = "Вы не можете комментировать данное видео";
                }


                $('.modal-div-user-video').append(
                  "<div class='modal_close'>" +
                  "<div id='close_for_modal'  class='close'></div>" +
                  "<h2 class='video-title'>"+titleVideo+"</h2>" +
                  "</div>" +
                  "<div  class='conten'>" +
                  "<div class='for-user-video'><iframe width='910' height='511' src="+thisVideo+" frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div><h2 class='video-title'>"+ descriptionVideo +"</h2><div class='for-user-coments'><div class='coments'><div class='show-all-coment'>Показать все <span class='coment-count-news'>"+comentLength+"</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='coment-message'></div><div class='write-message'><div class='ava-user'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+"<?=Yii::$app->user->id?>"+"_small.jpg"+" alt=''></div><textarea id='mess-user-index' class='coment-message' rows='1'></textarea><div id="+data.videoInfo.video.id+" class='send-icon'>" +
                  "</div></div></div>" +
                  "<div class='video-creator'><div class='user-creator-ava'><a href='/profile/"+data.videoInfo.video.user+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+data.videoInfo.video.user+"_small.jpg"+" alt=''></a></div><a href='/profile/"+data.videoInfo.video.user+"/'><div class='user-creator-name'>"+nameUserCreator+"</div></a><div class='add-time'>Добавлено "+videoCreated+"</div><div class='creator-dostig'><div class='Add-comen'>"+data.videoInfo.comments.length+"</div><div id="+data.videoInfo.video.id+" class='lik "+likeActive2+"'><div class='count-like'>"+likeCount+"</div></div><div id="+data.videoInfo.video.id+" class='Shar'></div></div></div>" +
                  "</div></div>");

                  modalUse();
                  if (coments){
                    // alert('yo');
                    for (var x = 0; x < comentLength; x++) {
                               var coment = coments[x];
                              var likeActive2 = (coment['myLike'] == 1) ?  'likeActive2' :  '';
                               console.log(coment);
                      var comText = getBrString(coment.comment);

                                $('.coment-message').append("<div class='coment'><div class='user-ava'><a href='/profile/"+coment.user_id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+coment.user_id+"_small.jpg"+" alt=''></a></div><div class='info-user'><div class='for-user-vs-time'><a href='/profile/"+coment.user_id+"/'><div class='user-name'>"+coment.user_name+"</div></a><div class='time'>"+coment.created+"</div></div><div id="+coment.id+" class='del-coment'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/close.png'></div><div class='user-message'>"+comText+"</div><div class='reply'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/Share_ICO.png'></div><div id="+coment.id+" class='like "+likeActive2+"'><div class='like-count'>"+coment.likeCount+"</div></div></div></div>");

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

                   //// Удаление комментария для видео
                         $('.del-coment').on('click', function(){
                            var thisComent = $(this).parent().parent();
                            var data = {
                                    id : $(this).attr('id')
                            };
                            console.log(data);
                            $.ajax({
                                    dataType: 'JSON',
                                    type : 'get',
                                    data : data,
                                    url: '/video/delcomment/'
                            }).then(function(data){
                                    console.log(data);
                                    $(thisComent[0]).fadeOut('slow');

                            });
                        });

               //Добавление коментария для видео
            $('.send-icon').on('click', function(){
              var comentText = $(this).parent().children('textarea').val();
              var thisArea = $(this).parent().children('textarea');
              // console.log(comentText);
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
                var comText = getBrString(data.comment);

                      console.log(data);
                      $('.coment-message').append("<div class='coment'><div class='user-ava'><a href='/profile/"+data.user_id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+data.user_id+"_small.jpg"+" alt=''></a></div><div class='info-user'><div class='for-user-vs-time'><a href='/profile/"+data.user_id+"/'><div class='user-name'>"+data.user_name+"</div></a><div class='time'>"+data.created+"</div></div><div id="+data.idComment+" class='del-coment'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/close.png'></div><div class='user-message'>"+comText+"</div><div class='reply'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/Share_ICO.png'></div><div  id="+data.idComment+" class='like'><div class='like-count'>"+data.likeCount+"</div></div></div>");
                        thisArea.val("");

                //// Удаление комментария для видео
                             $('.del-coment').on('click', function(){
                                var thisComent = $(this).parent().parent();
                                var data = {
                                        id : $(this).attr('id')
                                };
                                console.log(data);
                                $.ajax({
                                        dataType: 'JSON',
                                        type : 'get',
                                        data : data,
                                        url: '/video/delcomment/'
                                }).then(function(data){
                                        console.log(data);
                                        $(thisComent[0]).fadeOut('slow');

                                });
                            });


                  });
            });
            });

      });



                    }
                });
            }

        titleInit();
        textareaInit();

        });
 //////////////////////////////////////////////////////END infinite scroll


  ///добавление видео 
$('.for-modal2').on('click', function(){ 
      var data = {
                    url : $("#url").val(),
                    name : $("#name").val(),
                    description : $("#description").val(),
                    privacyVideo : $("#privacy-video option:selected").val(),
                    privacyComments : $("#privacy-comments option:selected").val(),
                    repostBoard : $('#repost-board').prop("checked")
          };

      // console.log(data);
                    
          $.ajax({
                  dataType: 'JSON',
                  type : 'get',
                  data : data,
                  url: '/video/loadvideo/'
          }).then(function(data){
              console.log(data);
          });
      });

  titleInit();
  textareaInit();

  $('body').on('click', '.coment .like', likeInitVideoComment);

  //Лайки для видео
  $('body').on('click', '.panel-video .like', function(){
    var likeIns = $(this).children(".count-like");
    var like = $(this);
    // console.log(likeIns);
    var data = {
      id : $(this).attr('id'),
      elem_type : "video",
    };
    console.log(data);
    $.ajax({
      dataType: 'JSON',
      type : 'get',
      data : data,
      url: '/video/like/',
    }).then(function(data){
      likeIns.html(data.likeCount);
      var myLike = data.myLike;
      (myLike) ? like.addClass('likeActive') : like.removeClass('likeActive');
      console.log(data);

    });
  });

  sendCtrlEnter('.send-icon');


});
</script>


    </div>
    <div id="modal2" class="modal-div-user-video">
      
    </div>
  <div id="overlay"></div><!-- Подложка -->
<!--  <?=$id?>, -->