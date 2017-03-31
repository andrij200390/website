<?php
   
    use yii\helpers\Html;
    use yii\helpers\Url;

    /* @var $this yii\web\View */
    $this->title = Yii::t('app', 'Видео');
    $this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
    $this->params['breadcrumbs'][] = Yii::t('app', '');

?>

<div class="video">
    <div class="header-video">
      <h1>Видеозаписей: <?=$countVideo?></h1>
      <div class="drop-down-add">
        <div class="drop-add">
          <img src="<?php echo Yii::$app->homeUrl; ?>css/img/arrow_up.png">
          <ul>
            <!-- <a href="#modal4" class="open_modal"><li>Добавить видео</li></a> -->
            <a href="#modal3" class="open_modal"><li>Добавить по ссылке</li></a>
            <!-- <a href="#" class="open_modal"><li>Комментарии к видео</li></a> -->
          </ul>
        </div>
      </div>
    </div>

    <div class="video-content">
        <? if (empty($model)){ ?>
            <div class="new-uzer">
            У Вас еще нет видеозаписей<br>
          </div>
          <? } ?>
    </div>
    <div id="modal4" class="modal_div">
      <div class="modal_close"> <div id="close_for_modal" class="close close-foto"></div><h1>Добавление по ссылке</h1></div>
      <div class="conten">
        <div class="add-link">
          Ссылка
          <input type="text">
          <h1 style="display:none">Видеосервис не поддерживаеться, либо ссылка являеться неправильной</h1>
          <h2>Вы можете указать ссылку на страницу видеозаписи на таких сайтах, как Youtube, Rutube, Vimeo и др.</h2>
        </div>
      </div>
    </div>


    <div id="modal3" class="modal_div_for_video">
      <div class="modal_close"><div id="close_for_modal" class="close close-foto"></div> <h1>Ссылка на видео</h1></div>
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
          <div class="checkbox-label"> Опубликовать на моей странице </div>
        </div>
      </div>
      <div class="foot-modal">
        <button class="for-modal2">Сохранить изменения</button>
      </div>
      
<script type="text/javascript" src="/js/jquery.cookie.js"></script>
    
<script type="text/javascript">

$(document).ready(function() {
    
    // Устанавливать на коммент фокус при показе модального окна с видео
    $.cookie("setCommentFocus", "false");

    /////вывод списка видео
    var data = {
        idOwner : <?=Yii::$app->user->id?>,
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
        if (video) {
            for (var i = 0 ; i < count; i++){
                var curentVideo = video[i];
                var likeActive = (curentVideo['myLike'] == 1) ?  'likeActive' :  '';

                $('.video-content').append("<div class='my-video'><div class='video-prev'><a href='#modal2' id="+curentVideo.id+" class='open_modal'><img class='play-video' src="+"<?php echo Yii::$app->homeUrl;?>"+"css/img/videoplay.png"+"></a><img src="+curentVideo.urlImg+" width='212px' height='120px'><h2 class='video-del' id="+curentVideo.id+"></h2><div class='panel-video'>" +
                "<div class='Add-coment'>" +
                "<div class='count-coment'>"+curentVideo.commentsCount+"</div>" +
                "</div>" +
                "<div id="+curentVideo.id+" class='like "+likeActive+"'><div class='count-like'>"+curentVideo.likeCount+"</div></div><div id="+curentVideo.id+" class='Share'></div></div><h1>"+curentVideo.title+"</h1></div></div>")
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
                    alert('Видео отправлено на вашу стену')
                });
            });

            //Лайки для видео 
        $('.panel-video > .like').on('click', function(){ 
          var likeIns = $(this).find(".count-like");
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
                (myLike) ? like.addClass('likeActive') : like.removeClass('likeActive');
                  // console.log(data);

              });
        });

        ///удаление видео
        $('.video-del').on('click', function(){ 
          if (confirm("Вы действительно хотите удалить это видео?")){
            var thisVideo = $(this).parent().parent();
            var data = {
              idDel : $(this).attr('id'),
                };
            console.log(data);
                          
                $.ajax({
                        dataType: 'JSON',
                        type : 'get',
                        data : data,
                        url: '/video/delvideo/'
                }).then(function(data){

                    console.log(data);
                    $(thisVideo).fadeOut('slow');
                });
            }
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
                               $('.coment-message').append("<div class='coment'><div class='user-ava'><a href='/profile/"+coment.user_id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+coment.user_id+"_small.jpg"+" alt=''></a></div><div class='info-user'><div class='for-user-vs-time'><a href='/profile/"+coment.user_id+"/'><div class='user-name'>"+coment.user_name+"</div></a><div class='time'>"+coment.created+"</div></div><div id="+coment.id+" class='del-coment'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/close.png'></div><div class='user-message'>"+coment.comment+"</div><div class='reply'></div><div id="+coment.id+" class='like "+likeActive2+"'><div class='like-count'>"+coment.likeCount+"</div></div></div></div>");
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
                        console.log(data);
                        alert('Видео отправлено на вашу стену')

                    });
              });

                        //Лайки для видео 
            $('.lik').on('click', function(){ 
              var likeIns = $(this).find(".count-like");
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

                           //Лайки для коментариев 
                $('.like').on('click', function(){ 
                  var likeIns = $(this).find(".like-count");
                  var like = $(this);
                  // console.log(likeIns);
                  // console.log($(this).attr('id'));
                  var data = {
                    id : $(this).attr('id'),
                    elem_type : "comments"
                  };
                  // console.log(data);
                  $.ajax({
                          dataType: 'JSON',
                          type : 'get',
                          data : data,
                          url: '/video/like/',
                      }).then(function(data){
                        console.log(data);
                        likeIns.html(data.likeCount);
                        var myLike = data.myLike;
                        (myLike) ? like.addClass('likeActive2') : like.removeClass('likeActive2');

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

                        console.log(data);
                        $('.coment-message').append("<div class='coment'><div class='user-ava'><a href='/profile/"+data.user_id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+data.user_id+"_small.jpg"+" alt=''></a></div><div class='info-user'><div class='for-user-vs-time'><a href='/profile/"+data.user_id+"/'><div class='user-name'>"+data.user_name+"</div></a><div class='time'>"+data.created+"</div></div><div id="+data.idComment+" class='del-coment'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/close.png'></div><div class='user-message'>"+data.comment+"</div><div class='reply'></div><div  id="+data.idComment+" class='like'><div class='like-count'>"+data.likeCount+"</div></div></div>");
                          $(thisArea).val("");
                        
                        //Лайки для коментариев 
                              $('.like').off();
                  $('.like').on('click', function(){ 
                    var likeIns = $(this).find(".like-count");
                    var like = $(this);
                    // console.log(likeIns);
                    // console.log($(this).attr('id'));
                    var data = {
                      id : $(this).attr('id'),
                      elem_type : "comments"
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
                    });
              }
            });
            
            var s = $.cookie("setCommentFocus");
            if ( s == "true" ) {
                var scrollPos = $('#mess-user-index').offset().top;
                $("html, body").animate({ scrollTop: scrollPos }, 1);
                $('#mess-user-index').focus();
            }

            });

      });
      $('.video > .header-video > .drop-down-add').click(function() {
           $('.video > .header-video > .drop-down-add >.drop-add').toggle();
       });

          titleInit();
          textareaInit();



        }); /// end


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// infinite scroll
var page = 1;
var loadMore = true;
 $(window).on('scroll', function() {

            if($(window).scrollTop() == $(document).height() - $(window).height() && loadMore == true){
                page = page + 1;
                // $('div#loadmoreajaxloader').show();
                var data = {
                    idOwner : <?=Yii::$app->user->id?>,
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

                $('.video-content').append("<div class='my-video'><div class='video-prev'><a href='#modal2' id="+curentVideo.id+" class='open_modal'><img class='play-video' src="+"<?php echo Yii::$app->homeUrl;?>"+"css/img/videoplay.png"+"></a><img src="+curentVideo.urlImg+" width='212px' height='120px'><h2 class='video-del' id="+curentVideo.id+"></h2><div class='panel-video'>" +
                  "<div class='Add-coment'>" +
                  "<div class='count-coment'>"+curentVideo.commentsCount+"</div>" +
                  "</div>" +
                  "<div id="+curentVideo.id+" class='like "+likeActive+"'><div class='count-like'>"+curentVideo.likeCount+"</div></div><div id="+curentVideo.id+" class='Share'></div></div><h1>"+curentVideo.title+"</h1></div></div>")

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
            //Лайки для видео 
                        $('.panel-video > .like').off();

        $('.panel-video > .like').on('click', function(){ 
          var likeIns = $(this).find(".count-like");
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
                (myLike) ? like.addClass('likeActive') : like.removeClass('likeActive');
                  // console.log(data);

              });
        });
        ///удаление видео
        $('.video-del').off();
        $('.video-del').on('click', function(){ 
          if (confirm("Вы действительно хотите удалить это видео?")){
            var thisVideo = $(this).parent().parent();
            var data = {
              idDel : $(this).attr('id'),
                };
            console.log(data);
                          
                $.ajax({
                        dataType: 'JSON',
                        type : 'get',
                        data : data,
                        url: '/video/delvideo/'
                }).then(function(data){

                    console.log(data);
                    $(thisVideo).fadeOut('slow');
                });
            }
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
              // var videoContent = " ";
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

                //контент видео

                $('.modal-div-user-video').append(
                  "<div class='modal_close'>" +
                  "<div id='close_for_modal'  class='close'></div>" +
                  "<h2 class='video-title'>"+titleVideo+"</h2>" +
                  "</div>" +
                  "<div  class='conten'>" +
                  "<div class='for-user-video'><iframe width='910' height='511' src="+thisVideo+" frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div><h2 class='video-title'>"+ descriptionVideo +"</h2><div class='for-user-coments'><div class='coments'><div class='show-all-coment'>Показать все <span class='coment-count-news'>"+comentLength+"</span> <span class='word'></span></div><div class='hide-all-coments'>Cкрыть все отзывы</div><div class='coment-message'></div><div class='write-message'><div class='ava-user'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+"<?=Yii::$app->user->id?>"+"_small.jpg"+" alt=''></div><textarea id='mess-user-index' class='coment-message' rows='1'></textarea><div id="+data.videoInfo.video.id+" class='send-icon'>" +
                  "</div></div></div><div class='video-creator'><div class='user-creator-ava'><a href='/profile/"+data.videoInfo.video.user+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+data.videoInfo.video.user+"_small.jpg"+" alt=''></a></div><a href='/profile/"+data.videoInfo.video.user+"/'><div class='user-creator-name'>"+nameUserCreator+"</div></a><div class='add-time'>Добавлено "+videoCreated+"</div><div class='creator-dostig'><div class='Add-comen'>"+data.videoInfo.comments.length+"</div><div id="+data.videoInfo.video.id+" class='lik "+likeActive2+"'><div class='count-like'>"+likeCount+"</div></div><div id="+data.videoInfo.video.id+" class='Shar'></div></div></div></div></div>");

                  modalUse();
                  if (coments){
                    // alert('yo');
                    for (var x = 0; x < comentLength; x++) {
                               var coment = coments[x];
                              var likeActive2 = (coment['myLike'] == 1) ?  'likeActive2' :  '';
                               console.log(coment);
                               //коментарии для видео
                                $('.coment-message').append("<div class='coment'><div class='user-ava'><a href='/profile/"+coment.user_id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+coment.user_id+"_small.jpg"+" alt=''></a></div><div class='info-user'><div class='for-user-vs-time'><a href='/profile/"+coment.user_id+"/'><div class='user-name'>"+coment.user_name+"</div></a><div class='time'>"+coment.created+"</div></div><div id="+coment.id+" class='del-coment'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/close.png'></div><div class='user-message'>"+coment.comment+"</div><div class='reply'></div><div id="+coment.id+" class='like "+likeActive2+"'><div class='like-count'>"+coment.likeCount+"</div></div></div></div>");
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
                        console.log(data);
                        alert('Видео отправлено на вашу стену')

                    });
              });
              
                          //Лайки для видео 
                        $('.lik').off();
            $('.lik').on('click', function(){ 
              var likeIns = $(this).find(".count-like");
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
                            //Лайки для коментариев
                            $('.like').off();
                $('.like').on('click', function(){ 
                  var likeIns = $(this).find(".like-count");
                  var like = $(this);
                  // console.log(likeIns);
                  // console.log($(this).attr('id'));
                  var data = {
                    id : $(this).attr('id'),
                    elem_type : "comments"
                  };
                  // console.log(data);
                  $.ajax({
                          dataType: 'JSON',
                          type : 'get',
                          data : data,
                          url: '/video/like/',
                      }).then(function(data){
                        console.log(data);
                        likeIns.html(data.likeCount);
                        var myLike = data.myLike;
                        (myLike) ? like.addClass('likeActive2') : like.removeClass('likeActive2');
                          // console.log(likeIns);
                          // console.log(data.likeCount);

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
                        $('.send-icon').off();
            $('.send-icon').on('click', function(){
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

                        console.log(data);
                        $('.coment-message').append("<div class='coment'><div class='user-ava'><a href='/profile/"+data.user_id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+data.user_id+"_small.jpg"+" alt=''></a></div><div class='info-user'><div class='for-user-vs-time'><a href='/profile/"+data.user_id+"/'><div class='user-name'>"+data.user_name+"</div></a><div class='time'>"+data.created+"</div></div><div id="+data.idComment+" class='del-coment'><img src='<?php echo Yii::$app->homeUrl; ?>css/img/close.png'></div><div class='user-message'>"+data.comment+"</div><div class='reply'></div><div  id="+data.idComment+" class='like'><div class='like-count'>"+data.likeCount+"</div></div></div>");
                          $(thisArea).val("");
                        
                        //Лайки для коментариев 
                              $('.like').off();
                  $('.like').on('click', function(){ 
                    var likeIns = $(this).find(".like-count");
                    var like = $(this);
                    // console.log(likeIns);
                    // console.log($(this).attr('id'));
                    var data = {
                      id : $(this).attr('id'),
                      elem_type : "comments"
                    };
                    // console.log(data);
                    $.ajax({
                            dataType: 'JSON',
                            type : 'get',
                            data : data,
                            url: '/video/like/',
                        }).then(function(data){
                          likeIns.html(data.likeCount);
                            console.log(data);
                            var myLike = data.myLike;
                            (myLike) ? like.addClass('likeActive2') : like.removeClass('likeActive2');

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
                    });
              }
            });

            var s = $.cookie("setCommentFocus");
            if ( s == "true" ) {
                var scrollPos = $('#mess-user-index').offset().top;
                $("html, body").animate({ scrollTop: scrollPos }, 1);
                $('#mess-user-index').focus();
            }

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

    $('body').on('click', '.Add-coment', function() {
        var $this = $(this);
        $.cookie("setCommentFocus", "true");
        
        $this.closest('.video-prev').find('.open_modal').trigger('click');
        
//        var scrollPos = $('#mess-user-index').offset().top;
//        $("html, body").animate({ scrollTop: scrollPos }, 1);
//        $('#mess-user-index').focus();
    });

    sendCtrlEnter('.send-icon');

});

</script>


</div>
    
<div id="modal2" class="modal-div-user-video"></div>
<div id="overlay"></div><!-- Подложка -->
