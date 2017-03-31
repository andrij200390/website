/**
 * Инициализация тайтлов по всему сайту и плейсхолдеров
 */
function titleInit() {
  $('img').attr('title', $(this).attr('alt'));
  $('.like').attr('title', 'Лайкнуть');
  $('.m-top, [type=submit]').attr('title', 'Отправить');
  $('.filtration').attr('title', 'Читать');
  $('.add-article').attr('title', 'Добавить статью');
  $('.filtering .filtration').attr('title', '');
  $('.add-coment').attr('title', 'Добавить комментарий');
  $('.add-comment').attr('title', 'Добавить комментарий');
  $('.close').attr('title', 'Закрыть');
  $('.edit').attr('title', 'Редактировать');
  $('.share-repost').attr('title', 'Отправить на стену');
  $('.message-repost .share-repost').attr('title', '');
  $('.astatus_plus, .plus').attr('title', 'Добавить');
  $('.add-friend').attr('title', 'Добавить друга');
  $('.add-video').attr('title', 'Добавить видео');
  $('.type-news').attr('title', 'Фильтр');
  $('.all-list-friends-i-manipulation-block-message').attr('title', 'Написать сообщение');
  $('.all-list-friends-i-manipulation-block-status').attr('title', 'Статус');
  $('.all-list-friends-i-manipulation-block-delete-friend').attr('title', 'Удалить друга');
  $('.all-list-friends-i-manipulation-block-plus-friend').attr('title', 'Добавить друга');
  $('.delete-user-post').attr('title', 'Удалить');
  $('.post-like').attr('title', 'Лайкнуть');
  $('.add-setings').attr('title', 'Добавить');
  $('.post-share').attr('title', 'Отправить на стену');
  $('.send-icon').attr('title', 'Отправить');
  $('.add-group-icon').attr('title', 'Добавить группу');
  $('.dell-album').attr('title', 'Удалить альбом');
  $('.edit-album-btn').attr('title', 'Редактировать альбом');
  $('.photo-edit').attr('title', 'Добавить комментарий');
  $('.photo-like').attr('title', 'Лайкнуть');
  $('.photo-share').attr('title', 'Отправить на стену');
  $('.drop-down-add').attr('title', 'Добавить');
  $('.share-photo').attr('title', 'Отправить на стену');
  $('.quantity-foto').attr('title', 'Колличество фото');
  $('.Add-coment').attr('title', 'Добавить комментарий');
  $('.video-del').attr('title', 'Удалить видео');
  $('.play-video').attr('title', 'Просмотреть');
  $('.close_for_modal').attr('title', 'Закрыть');
  $('.Add-comen').attr('title', 'Добавить комментарий');
  $('.lik').attr('title', 'Лайкнуть');
  $('.Shar').attr('title', 'Отправить на стену');
  $('.del-coment').attr('title', 'Удалить');
  $('.smile').attr('title', 'Добавить смайлик');
  $('.header-search').attr('title', 'Поиск');
  $('.delete').attr('title', 'Удалить');
  $('.Share').attr('title', 'Отправить на стену');
  $('.prev_btn').attr('title', 'Предыдущее фото');
  $('.next_btn').attr('title', 'Следующее фото');
  $('.friends-sidebar-link-list-friends').attr('title', 'Друзья');
  $('.friends-sidebar-link-list-search').attr('title', 'Поиск друзей');
  $('.friends-sidebar-link-list-news').attr('title', 'Мои новости');
  $('.delete-repost').attr('title', 'Удалить');
  $('.all-list-friends-i-manipulation-block-add').attr('title', 'Добавить в друзья');
  $('.all-list-friends-i-manipulation-block-delete-request').attr('title', 'Удалить из друзей');
  $('.like-coment').attr('title', 'Лайкнуть');
  $('.cvadr').attr('title', 'Все фото');
  $('#login').attr('title', 'Войти');
  $('.forgot-pass').attr('title', 'Забыли пароль?');
  $('.registration').attr('title', 'Зарегистрироваться');
  $('.coment-message').attr('placeholder', 'Написать сообщение');
  $('.edit-message').attr('placeholder', 'Начните редактировать');
  $('.check-filter').attr('title', 'Применить фильтр');
  $('.foto-atachment').attr('title', 'Прикрепить фото');
  $('.video-atachment').attr('title', 'Прикрепить видео');
  $('.index-school').attr('title', 'Добавить школу');
}

/**
 * Изменение высоты textarea при вводе
 * @param sendBtn {String}
 */
function textareaInit(sendBtn) {
  var sendBtn = sendBtn || '.send-icon';

  autosize($('textarea'));

  $(sendBtn).off('send').on('click.send', function() {
    $(this).parent().find('textarea').css('height', '30px').focus();
  });

}

/**
 * Вывод попап-сообщения если пользователь не залогинен
 */
function showQuestion() {
  var modalQuestion = $('#modal-question');

  if($('#login').is(':visible')) {
    $('#overlay').show();
    modalQuestion.find('.modal_close').add('#overlay').on('click', function() {
      modalQuestion.add('#overlay').hide();
    });

    modalQuestion.show().find('.btn-login').on('click', function() {
      modalQuestion.add('#overlay').hide();
      $('#username').focus();
    });
    modalQuestion.find('.btn-regisration').on('click', function() {
      modalQuestion.add('#overlay').hide();
      $('.registration').trigger('click');
    });
  }
}

/**
 * Вывод попап-сообщения если пользователь при клике на like не залогинен
 */
function checkLike() {
  var modalQuestion = $('#modal-question');

  $('body').on('click', '.like-comment, .like', function() {
    $(this).off('click');
    if($('#login').is(':visible')) {
      $('#overlay').show();
      modalQuestion.find('.modal_close').add('#overlay').on('click', function() {
        modalQuestion.add('#overlay').hide();
      });

      modalQuestion.show().find('.btn-login').on('click', function() {
        modalQuestion.add('#overlay').hide();
        $('#username').focus();
      });
      modalQuestion.find('.btn-regisration').on('click', function() {
        modalQuestion.add('#overlay').hide();
        $('.registration').trigger('click');
      });
    }
    return false;
  });
}

/**
 * По клику на addComment пользователю предоставляется возможность оставить комментарий если он залогинен.
 * Если не залогинен появляется попап окно с предложением войти или зарегестрироваться.
 * @param addComment {String}
 * @param closestElem {String}
 * @param targetElem {String}
 */
function checkComment(addComment, closestElem, targetElem) {
  var addComment = addComment || '.add-coment';
  var closestElem = closestElem || '.footer-group';
  var targetElem = targetElem || '.read-more';
  var modalQuestion = $('#modal-question');

  $('body').on('click', addComment, function() {

    if($('#login').is(':visible')) {
      $('#overlay').show();
      modalQuestion.find('.modal_close').add('#overlay').on('click', function() {
        modalQuestion.add('#overlay').hide();
      });

      modalQuestion.show().find('.btn-login').on('click', function() {
        modalQuestion.add('#overlay').hide();
        $('#username').focus();
      });
      modalQuestion.find('.btn-regisration').on('click', function() {
        modalQuestion.add('#overlay').hide();
        $('.registration').trigger('click');
      });

      return false;
    }
  });
}

/**
 * Изменяет размер шрифта в зависимости от длины текста
 * @param options {Object}
 */
function onTextChange(options) {
  $(options.selector).each(function() {
    if ($(this).text().length > options.maxLen) {
      $(this).css({
        fontSize: options.fontSize + 'px',
        lineHeight: options.lineHeight + 'px',
        letterSpacing: options.letterSpacing + 'px'
      });
    }
  });
}

/**
 *
 * @param val
 * @returns {String}
 */
function getBrString(val) {
  val = val.replace(/\r\n|\r|\n/g, '<br>');

  return val;
}

/**
 * Отправка сообщение позьзователю
 * @param sendBtn {String}
 */
function sendCtrlEnter(sendBtnString) {
  $('body').off('sendCtrlEnter').on('keydown.sendCtrlEnter', 'textarea:focus', function(e) {
    var $this = $(this);
    var $btn = $this.parent().parent().find(sendBtnString);

    if ( (e.ctrlKey) && ( (e.keyCode == 0xA) || (e.keyCode == 0xD) ) ) {
      $btn.first().trigger('click');
    }
  });
}

/**
 * Отмена аттачмента
 */
function previewBoxClose() {
  $(document).on('click', '.preview-box__close', function() {
    $('.about').css('background', '#fff');
    var $this = $(this);
    var $previewBox = $this.closest('.preview-box');
    var $btn = $previewBox.prev();

    $previewBox.remove();

    $btn.attr({
      'data-atype': '',
      'data-id': ''
    });

    return false;

  });
}


/**
 * Добавляет изображения превью перед публикацией
 * @param $img
 */
function showPreview($img, data) {
//alert(data.after);
  $('.preview-box').remove();
  $(data.after).after('<div class="preview-box" style=\"clear:both;\"></div>');

  var typeFile = data.type == 'video' ? 'Видео' : 'Фото';
  var titleFile = data.title ? data.title : '<span class="is-empty">Отсутствует</span>';

  var $imgClone = $img.clone();
  var $previewBox = $('.preview-box');
  var $previewBoxItem = $('<div class="preview-box__item"><span class="preview-box__close" title="Не прикреплять"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 16 16"><path fill="#fff" d="M8 0c-4.4 0-8 3.6-8 8s3.6 8 8 8 8-3.6 8-8-3.6-8-8-8zm4.2 10.8l-1.4 1.4-2.8-2.8-2.8 2.8-1.4-1.4 2.8-2.8-2.8-2.8 1.4-1.4 2.8 2.8 2.8-2.8 1.4 1.4-2.8 2.8 2.8 2.8z"/></svg></span></div>');
  var $previewBoxInfo = $('' +
    '<div class="preview-box__info">' +
      '<div><strong>Тип файла: </strong>'+typeFile+'</div>' +
      '<div><strong>Название файла: </strong>'+titleFile+'</div>' +
      '<p class="preview-box__warn">' +
    'К записи можно прикрепить только один файл</p>' +
    '</div>');

  $previewBox.empty();
  $previewBoxItem.append($imgClone);
  $previewBox.append($previewBoxItem);
  $previewBox.append($previewBoxInfo);

  previewBoxClose();
}


//ФОТО ФТАЧМЕНТ
function fotoAttachment( idAfter ) {
    $('.about-menu').hide();
    modalUse();
    $('.foto-list-content').empty();
    var data = {
        atype: 'photo'
    };
    //console.log(data);
    $.ajax({
        dataType: 'JSON',
        type: 'get',
        data: data,
        url: '/board/attachmentlist/'
    }).then(function (data) {
        if ( data.error ) {
            $('.foto-list-content').append( data.message );
        } else {
            //console.log(data);
            var photoList = data.photoList;
            var count = photoList.length;
            if (photoList) {
                for (var i = 0; i < count; i++) {
                    var foto = photoList[i];
                    $('.foto-list-content').append("<div class='foto'><img id=" + foto.id + " src=" + "/images/photo/" + foto.idOwner + "/" + foto.idAlbum + "/small_" + foto.nameImg + "></div>");
                }
                //добавление атачмента
                $('.foto-list-content > .foto > img').on('click', function () {
                    var aid = $(this).attr('id');
                    var $btn = $( idAfter );

                    $btn.attr('data-atype', "photo");
                    $btn.attr('data-id', aid);
                    var fotoModal = $('.modal_div_for_video');
                    var overlay = $('#overlay');
                    var $this = $(this);

                    var curentPhoto = photoList.filter(function(photo) {
                        return photo.id == aid;
                    });
                    var curentPhotoTitle = curentPhoto[0].name;
                    //alert(idAfter);
                    var dataPhoto = {
                        type: 'photo',
                        title: curentPhotoTitle,
                        after: idAfter
                    };

                    showPreview($this, dataPhoto);

                    fotoModal// все модальные окна
                    .animate({opacity: 0, top: '45%'}, 200, // плавно прячем
                      function () { // после этого
                        $(this).css('display', 'none');
                        overlay.fadeOut(400); // прячем подложку
                      }
                    );
                });
            }
        }
    });
}

//Ведео атачмент
function videoAttachment( idAfter ) {
    $('.about-menu').hide();
    modalUse();
    $('.video-list-content').empty();
    var data = {
        atype: 'video'
    };
    //console.log(data);
    $.ajax({
        dataType: 'JSON',
        type: 'get',
        data: data,
        url: '/board/attachmentlist/'
    }).then(function (data) {
        if ( data.error ) {
            $('.video-list-content').append( data.message );
        } else {//console.log(data);
            var videoList = data.videoList;
            var count = videoList.length;
            if (videoList) {
                for (var i = 0; i < count; i++) {
                    var video = videoList[i];
                    $('.video-list-content').append("<div class='video'><img id=" + video.id + " src=" + video.urlImg + "></div>");
                }

                //добавление атачмента
                $('.video-list-content > .video > img').on('click', function () {
                    var aid = $(this).attr('id');
                    var $aboutMenu = $('.about-menu');
                    var $btn = $(idAfter);
                    
                    $btn.attr('data-atype', "video");
                    $btn.attr('data-id', aid);
                    
                    var fotoModal = $('.modal_div_for_video');
                    var overlay = $('#overlay');
                    var $this = $(this);
                    var curentVideo = videoList.filter(function(video) {
                        return video.id == aid;
                    });
                    var curentVideoTitle = curentVideo[0].title;
                    var dataVideo = {
                        type: 'video',
                        title: curentVideoTitle,
                        after: idAfter
                    };

                    showPreview($this, dataVideo);

                    fotoModal// все модальные окна
                      .animate({opacity: 0, top: '45%'}, 200, // плавно прячем
                        function () { // после этого
                          $(this).css('display', 'none');
                          overlay.fadeOut(400); // прячем подложку
                        }
                      );
                });
            }
        }
    });
}

/**
 * Возвращает колличество строк в блоке
 * @param selector
 * @returns {number}
 */
function getLineCout(selector) {
  var el = selector;
  var fontSize = parseInt(el.css('fontSize'));
  var height = el.outerHeight();
  var count =  Math.floor(height/fontSize);

  return count;
}

function toggleMoreTextBtn() {
  $('body').on('click', '.more-text', function() {
    $(this).prev().children('.ttt').toggleClass('open');

    if ($(this).text() == 'Показать полностью') {
      $(this).text('Скрыть');
    } else {
      $(this).text('Показать полностью');
    }
  });
}

/**
 * Добавление кнопки показать полностью в зависимости от колличества строк в блоке
 * @param selector
 * @param count
 * @param h
 */
function addMoreTextBtn(selector, count, h) {
  selector.each(function() {
    var $this = $(this);
    var $text = $this.find('.ttt');
    var countLine = getLineCout($text);
    var more = '<div class="more-text">Показать полностью</div>';

    if (countLine > count) {
      $text.height(h);

      if (!$this.next().hasClass('more-text')) {
        $this.after(more);
      }
    }
  });
}


