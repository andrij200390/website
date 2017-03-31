function photoOutput() {

    $('body').on('click', '.js-photo', function () {
    var topScrolled = document.body;
    var dolbojob = '!important';
    $('#overlay').css('display', 'block');
    $('#modal1').css({
        'top': topScrolled.scrollTop,
        'display': 'block',
        'opacity': 1
    });

    var data = {
        idPhoto: $(this).attr('id')
    };

    $.ajax({
        dataType: 'JSON',
        type: 'get',
        data: data,
        url: '/photos/photoinfo/'
    }).then (function (data) {

    $('.coment-messages').html(' ');
    var thisPhoto = homeUrl + "images/photo/" + data.photoInfo.photo.idOwner + "/" + data.photoInfo.photo.idAlbum + "/" + data.photoInfo.photo.nameImg;
    var userCreatorAva = homeUrl + "images/avatar/" + data.photoInfo.photo.idOwner + "_small.jpg";
    var userComentAva = homeUrl + "images/avatar/" + userId + "_small.jpg";
    var likeActive = (data.photoInfo.photo.myLike == 1) ?  'likeActive' :  '';
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
    if ( data.photoInfo.photo.idOwner == userId ) {
        $('.content-view-foto > .creator > .text').css('display', 'block');
        $('.content-view-foto > .creator > .icons').css('display', 'block');
        $('.content-view-foto > .creator > .del').css('display', 'block');
        $('.content-view-foto > .creator > .del').attr("id",data.photoInfo.photo.idPhoto);
        $('.content-view-foto > .creator > .del').attr("data-idAlbum",data.photoInfo.photo.idAlbum);
    } else {
        $('.content-view-foto > .creator > .del').css('display', 'none');
        $('.content-view-foto > .creator > .text').css('display', 'none');
        $('.content-view-foto > .creator > .icons').css('display', 'none');
    }
      var curFoto = $('.foto-active').attr('data-id');
      $('.curentFoto').text(curFoto);
      var count = data.photoInfo.comments.commentsCount;
      if (data.photoInfo.comments) {
        for (var i = 0; i < count; i++) {
          var coment = data.photoInfo.comments[i];
          var likeActive2 = (coment['myLike'] == 1) ?  'likeActive2' :  '';

          $('.coments > .coment-messages').append("<div class='coment'><div class='user-ava'><a href='/profile/" + coment.user_id + "/'><img src=" + homeUrl + "images/avatar/" + coment.user_id + "_small.jpg" + " alt=''></a></div><div class='info-user'><div id=" + coment.id + " class='del-coment'></div><div class='for-user-vs-time'><a href='/profile/" + coment.user_id + "/'><div class='user-name'>" + coment.user_name + "</div></a><div class='time'>" + coment.created + "</div></div><div class='user-message'>" + coment.comment + "</div><div class='reply'></div><div id=" + coment.id + " class='like "+likeActive2+"'><div class='count-like'>" + coment.likeCount + "</div></div></div></div>");
        }


        /*Лайки для фото*/
        $('.photo-like').on('click', likeInitToFoto);

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
          }
        }


        /* удаление фото */
        $('.del').on('click', function () {
          var data = {
            idPhoto: $(this).attr('id'),
            idAlbum: $(this).attr('data-idAlbum')
          };
          $.ajax({
            dataType: 'JSON',
            type: 'get',
            data: data,
            url: '/photos/delphoto/'
          }).then(function (data) {
            location.reload();
          });
        });

        /* Лайки для коментариев */
        $('.like').on('click',likeInitToComentFoto);

        /*Репост для фото */
        $('.share-photo').on('click', function (event) {
          event.stopPropagation();
          var data = {
            id: $(this).attr('id')
          };
          $.ajax({
            dataType: 'JSON',
            type: 'get',
            data: data,
            url: '/photos/repost/'
          }).then(function (data) {
            alert('Репост отправлен на вашу стену');

          });
        });

        /* Удаление комментария */
        $('.del-coment').on('click', function () {
          var thisComent = $(this).parent().parent();
          var data = {
            id: $(this).attr('id')
          };

          $.ajax({
            dataType: 'JSON',
            type: 'get',
            data: data,
            url: '/photos/delcomment/'
          }).then(function (data) {
            $(thisComent).fadeOut('slow');

          });
        });
      }

      /* добавление комментария для фото */
    $('.send-icon').off();
    $('.send-icon').on('click', ComentToFoto);


    function ComentToFoto(){
      var commentMessage = $(this).parent().children('textarea').val();
      if ($.trim(commentMessage) == ""){
      
      }else{
        var data = {
          id: $(this).attr('id'),
          text: commentMessage
        };
        $.ajax({
          dataType: 'JSON',
          type: 'get',
          data: data,
          url: '/photos/comment/'
        }).then(function (data) {
          $('.coments > .coment-messages').append("<div class='coment'><div class='user-ava'><a href='/profile/" + data.user_id + "/'><img src=" + homeUrl + "images/avatar/" + data.user_id + "_small.jpg" + " alt=''></a></div><div class='info-user'><div id=" + data.idComment + " class='del-coment'></div><div class='for-user-vs-time'><a href='/profile/" + data.user_id + "/'><div class='user-name'>" + data.user_name + "</div></a><div class='time'>" + data.created + "</div></div><div class='user-message'>" + data.comment + "</div><div class='reply'></div><div id=" + data.idComment + " class='like'><div class='count-like'>" + data.likeCount + "</div></div></div></div>");
          $("textarea").val("");


          /* Лайки для коментариев */
          $('.like').off();
          $('.like').on('click',likeInitToComentFoto);

          /* Удаление комментария */
          $('.del-coment').on('click', function () {
            var thisComent = $(this).parent().parent();
            var data = {
              id: $(this).attr('id')

            };
            $.ajax({
              dataType: 'JSON',
              type: 'get',
              data: data,
              url: '/photos/delcomment/'
            }).then(function (data) {
              $(thisComent).fadeOut('slow');

            });
          });
          titleInit();
          textareaInit();
        });
      }
    }

  })





  });

  

}