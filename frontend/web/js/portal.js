
window.onload = function() {

  $('.lazy').slick({
      lazyLoad: 'ondemand',
      slidesToShow: 4,
      slidesToScroll: 1
    });

  $('.slider-events').slick({
      lazyLoad: 'ondemand',
      slidesToShow: 4,
      slidesToScroll: 1
    });

  $('.header-search').on('click', function(e) {
    e.stopPropagation();
    $(this).css({
      'background': 'none',
      'border': 'none'
    }).find('.searcher').show('slow').focus();
  });

  /*$('.searcher').on('blur', function() {
   $(this).hide('slow')
     .closest('.header-search').css({
     'background': "url('img/Search-ICO.png') no-repeat center",
       'border': 'none'
   });
  });*/

};


function fil(){
  var thisFilter = $(this).parent().parent().children(".filter");
  // console.log(thisFilter)
   if ($(thisFilter).css('display') == "block"){
      $(thisFilter).hide();
   }else{
  $('.filter').hide();
  $(thisFilter).show();
   }
}

$(document).ready(function(){


$("body").on("like", function(event, data) {
  console.log(data);
});

});

$(document).ready(function(){
  $(".wrap .content").addClass("append");

  /**
   * Вывод сообщения если пользователь не зарегистрирован
   */
  $('body').on('click change', '.user-ava, .user-name, .owntext, .add-article, .add-event', function() {
    if($('#login').is(':visible')) {
      showQuestion();
      return false;
    }
  });
  
		
        $('.header-login').on('keyup', function(e) {
			if (e.keyCode == 13) {
				$('#login').trigger('click');
			}
		});
		$('#login').on('click', function(){
            var username = $.trim($("#username").val());
            var password = $.trim($("#password").val());
			var data = {
                username : username,
                password : password,
            };
            $.ajax({
                dataType: 'JSON',
                type : 'post',
                data : data,
                url: '/main/login'
            }).then(function(data){
                if(data.error) {
                    $('.login-form').addClass('animated wobble');
                    setTimeout(function() {
                        $('.login-form').removeClass('wobble');
                    }, 1000);
                    $('.btn-for-modal-login-regisration').prop('disabled', true);
                };
            });
            return false;
        });
        
        $('.btn-for-modal-login-regisration').on('click', function(){
            
            var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
            if($("#signupform-email").val() 
                    && pattern.test($("#signupform-email").val()) 
                    && $("#signupform-password").val() 
                    && $("#signupform-repeatpassword").val()
                    && $("#signupform-username").val()
                    && ($("#signupform-username").val().length > 3)
                ){
            
                $('.btn-for-modal-login-regisration').prop('disabled', true);
            
                var form = $('#form-registrate')[0];
                var formData = new FormData(form);

                $.ajax({
                    dataType: 'JSON',
                    type : 'post',
                    data : formData,
                    url: '/main/signup/',
                    cache: false,
                    processData: false,
                    contentType: false,
                }).success(function(data){
                    if(data.error) {
                        alert(data.message);
                        $('#modal-login-regisration').addClass('animated wobble');
                        setTimeout(function() {
                            $('#modal-login-regisration').removeClass('wobble');
                        }, 1000);
                        $('.btn-for-modal-login-regisration').prop('disabled', false);
                    } else {
                        $("#overlay").css("display", "none");
                        $("#modal-login-regisration").css("display", "none");
                        alert(data.message);
                    };
                });

                return false;
            };
        });
        
    $('.regisration-download__btn').on('click', function() {
      $('.regisration-download-ava input[type=file]').trigger('click');
    });

    $('.regisration-download-ava input[type=file]').on('change', function (event, files, label) {
      var fileName = this.value.replace(/\\/g, '/').replace(/.*\//, '');
      $('.regisration-download__text').text(fileName);
    });
    
                    $('.img-users').on('error', function() {
                        $(this).attr( "src", "/images/avatar/def_avatar.jpg" );
                    });
                    
    
var category = [];
var page = 1;
var loadMore = true;

function filter(){
    // Пробрасываем в глобальную область для корректной работы скролла после фильтрации
    window.page = 1;
    window.loadMore = true;

    var $checkboxes = $(this).closest('.filter').find('input:checkbox');
    if(category.length) {
      category = [];
    }

    $checkboxes.each(function(index, elem) {
        if($(elem).prop("checked") == true) {
            var checkId = $(elem).attr("data-checkId");
            category.push(checkId);
        }
    });

//  var path = window.location.pathname;
//  var categoryIndex = path.indexOf('category');
//  var categoryName = path.slice(categoryIndex + 9, -1);
//
//  if(!category.length) {
//    switch (categoryName) {
//      case 'brejk': category.push('1'); break;
//      case 'graffiti': category.push('2'); break;
//      case 'rap': category.push('3'); break;
//      case 'dj': category.push('4'); break;
//    }
//  }

    var data = {
        page : 1,
        category : category
    };

    $.ajax({
        dataType: 'JSON',
        type : 'get',
        data : data,
        url: '/api/news/shownews',
    }).then(function(data){
        $('.grid-item').remove();
        $('.poster0').remove();
        $('.poster1').remove();
        $('.poster2').remove();
        $('.poster3').remove();
        $('.poster12').remove();
        $('.poster13').remove();
        $('.poster14').remove();
        //console.log(data);
        var news = data.modelNews;
        var idd = 0;
          if (news != 0){
            var count = news.length;
            for (var i = 0;i < count;i++){
              var onenew = news[i];
              var likeActive = (news[i]['myLike'] == 1) ?  'likeActive' :  '';
              idd++;

               //console.log(news);
              $('.grid').append("<div  id='news-"+onenew.id+"' data-id="+idd+" class='grid-item'><div class='filter'><div class='filter-item'><p>фильтр</p>" +
                "<form>" +
                "<label class='all-filter'><input type='checkbox' name='cc'/><span></span><p>все</p></label>" +
                "<label class='brayk-filter'><input type='checkbox' data-checkId='1' name='cc' /><span></span><p>брейкданс</p></label>" +
                "<label class='graffiti-filter'><input type='checkbox' data-checkId='2' name='cc' /><span></span><p>графити</p></label>" +
                "<label class='mc-filter'><input type='checkbox' data-checkId='3' name='cc' /><span></span><p>мс’инг</p></label>" +
                "<label class='dj-filter'><input type='checkbox' data-checkId='4' name='cc' /><span></span><p>диджеинг</p></label>" +
                "</form>" +
                "</div> <div class='check-filter'></div></div><img class='imgGrid' src="+"/images/news/"+onenew.img+"><div class='type-news'><div class='round-green'></div></div><span class='name-type-news'>"+onenew.category+"</span>" +
                "<a class='nodecorate' href='/news/"+onenew.url+"/'>" +
                  "<span class='name-group'>"+onenew.name+"</span>" +
                "</a>" +
                "<hr style='width:150px'><div class='group-description'>"+onenew.small+"</div><div class='footer-group'><div class='icons'>" +
                "<a href='news/"+onenew.url+"/#mess'>" +
                "<div class='add-coment'>" +
                "<p>"+onenew.countComments+"</p>" +
                "</div>" +
                  "</a>" +
                "<div id="+onenew.id+" class='like "+likeActive+"'><p class='like-count'>"+onenew.countLikes+"</p></div></div>" +
                "<a href='/news/"+onenew.url+"/'>" +
                  "<div class='read-more'>Подробнее</div>" +
                "</a>" +
                "</div></div>");

              if (onenew.category == "Брейкданс"){
                $('#news-'+onenew.id+' > .type-news > .round-green').css("background","#00a651");
              }
              if (onenew.category == "Графити"){
                $('#news-'+onenew.id+' > .type-news > .round-green').css("background","#f7941d");
              }
              if (onenew.category == "Реп"){
                $('#news-'+onenew.id+' > .type-news > .round-green').css("background","#e62b00");
              }
              if (onenew.category == "Диджеинг"){
                $('#news-'+onenew.id+' > .type-news > .round-green').css("background","#0072bc");
              }
              console.log(data)
              // init Masonry after all images have loaded

                var $grid = $('.grid');
                $grid.masonry({
                  itemSelector: '.grid-item',
                  percentPosition: true,
                  gutter: 1
                }).imagesLoaded( function() {
                     $grid.masonry().masonry('reloadItems');
                });

            }

                $('.type-news > .round-green').off().on("click", fil);

                //Лайки для одного события
             $('.like').on('click', function(){

               if($('#login').is(':visible')) {
                 checkLike();
               } else {
                 var likeIns =  $(this).find(".like-count");
                 var like = $(this);
                 var data = {
                   id : $(this).attr('id'),
                   elem_type : 'news'
                 };
                 // console.log(data);
                 $.ajax({
                   dataType: 'JSON',
                   type : 'get',
                   data : data,
                   url : '/api/likes/like'
                 }).then(function(data){
                   console.log(data);
                   var likeCount = data.likeCount;
                   var myLike = data.myLike;
                   (myLike) ? like.addClass('likeActive') : like.removeClass('likeActive');
                   likeIns.html(likeCount);
                 });
               }



            });
           setTimeout(function(){

               var $grid = $('.grid');
                $grid.masonry({
                  itemSelector: '.grid-item',
                  percentPosition: true,
                  gutter: 1
                }).imagesLoaded( function() {
                  $grid.masonry().masonry('reloadItems');
                });

                $('.imgGrid').css("position","absolute");

              },300);

          }
    });
}

    $('.type-news > .round-green').off().on("click", fil);


$(window).on('scroll', function infiniteScroll(){
    if(true && loadMore == true){
      console.log('in');

        page = page + 1;
        //console.log('here');
        //console.log(category);

        if ( $('#category').attr('categoryId') != '' ) {
            category = $('#category').attr('categoryId');
        }
        //alert($('#category').attr('categoryId'));

        var data = {
            page : page,
            category :category
        };
//                console.log(data);
                $.ajax({
                  dataType: 'JSON',
                  type : 'get',
                  data : data,
                  url: '/api/news/shownews',
                success: function(data){
                    //console.log(data);
                    loadMore = (data.loadMore == false) ? false : true;
                    console.log(data);
                    var news = data.modelNews;
                    // console.log($('.grid-item:first').attr('id'));
                    if($('div').is('.grid-item') == false){
                        var idd = 0;
                    }else{
                        idd = $('.grid-item:first').attr('data-id');
                    }
                    // console.log($('div').is('.grid-item'));
                    // var idd = 0;
                      if (news){
                        var count = news.length;
                        for (var i = 0;i < count;i++){
                          var onenew = news[i];
                          var likeActive = (news[i]['myLike'] == 1) ?  'likeActive' :  '';
                          idd++;


                         $('.grid').append("<div  id='news-"+onenew.id+"' data-id="+idd+" class='grid-item'><div class='filter'><div class='filter-item'><p>фильтр</p>" +
                           "<form>" +
                           "<label class='all-filter'><input type='checkbox' name='cc'/><span></span><p>все</p></label>" +
                           "<label class='brayk-filter'><input type='checkbox' data-checkId='1' name='cc' /><span></span><p>брейкданс</p></label>" +
                           "<label class='graffiti-filter'><input type='checkbox' data-checkId='2' name='cc' /><span></span><p>графити</p></label>" +
                           "<label class='mc-filter'><input type='checkbox' data-checkId='3' name='cc' /><span></span><p>мс’инг</p></label>" +
                           "<label class='dj-filter'><input type='checkbox' data-checkId='4' name='cc' /><span></span>диджеинг</label>" +
                           "</form>" +
                           "</div> <div class='check-filter'></div></div><img class='imgGrid' src="+"/images/news/"+onenew.img+"><div class='type-news'><div class='round-green'></div></div><span class='name-type-news'>"+onenew.category+"</span>" +
                           "<a class='nodecorate' href='/news/"+onenew.url+"/'>" +
                           "<span class='name-group'>"+onenew.name+"</span>" +
                           "</a>" +
                           "<hr style='width:150px'><div class='group-description'>"+onenew.small+"</div><div class='footer-group'><div class='icons'>" +
                           "<a href='news/"+onenew.url+"/#mess'>" +
                           "<div class='add-coment'>" +
                           "<p>"+onenew.countComments+"</p>" +
                           "</div>" +
                           "</a>" +
                           "<div id="+onenew.id+" class='like "+likeActive+"'><p class='like-count'>"+onenew.countLikes+"</p></div></div><a href='/news/"+onenew.url+"/'><div class='read-more'>Подробнее</div></a></div></div>");

                           if (onenew.category == "Брейкданс"){
                              $('#news-'+onenew.id+' > .type-news > .round-green').css("background","#00a651");
                            }
                            if (onenew.category == "Графити"){
                              $('#news-'+onenew.id+' > .type-news > .round-green').css("background","#f7941d");
                            }
                            if (onenew.category == "Реп"){
                              $('#news-'+onenew.id+' > .type-news > .round-green').css("background","#e62b00");
                            }
                            if (onenew.category == "Диджеинг"){
                              $('#news-'+onenew.id+' > .type-news > .round-green').css("background","#0072bc");
                            }

                          // init Masonry after all images have loaded
                            var $grid = $('.grid');
                            $grid.masonry({
                              itemSelector: '.grid-item',
                              percentPosition: true,
                              gutter: 1
                            }).imagesLoaded( function() {
                                 $grid.masonry().masonry('reloadItems');
                            });

                          function masonInit() {
                            // init Masonry after all images have loaded
                            var $grid = $('.grid');
                            $grid.masonry({
                              itemSelector: '.grid-item',
                              percentPosition: true,
                              gutter: 1
                            }).imagesLoaded( function() {
                              $grid.masonry().masonry('reloadItems');
                            });

                          $('.imgGrid').css("position","absolute");
                          }

                        }
                           setTimeout(masonInit, 100);

                            //Лайки для одной новости
                          $('.like').off();
                         $('.like').on('click', likeInitNews);



                      }
                    $('.type-news > .round-green').off().on("click",fil);
                  }
                });
            }
    titleInit();
    onTextChange({
      selector: '.name-group',
      maxLen: 17,
      fontSize: 22,
      lineHeight: 26,
      letterSpacing: 1
    });
});

//    $(window).trigger('scroll');


    checkComment('.add-coment', '.footer-group', '.read-more');
    $('body').on('click', '.filter .check-filter', filter);

//    $(document).on('change', '.filter', function() {
//      var $this = $(this);
//      var $checkboxes = $this.find(':checkbox:checked');
//      var $allFilterInput = $this.find('.all-filter :checkbox');
//      var $ontherCheckboxes = $checkboxes.not($allFilterInput);
//
//
//      if ($allFilterInput.is(':checked')) {
//        $ontherCheckboxes.prop('checked', false);
//        $allFilterInput.prop('checked', true);
//      }
//
//    });

    $(document).on('click', '.filter label', function() {

      var $this = $(this);
      var $filter = $this.closest('.filter');
      var $labels = $filter.find('label');
      var $allInput = $filter.find('.all-filter input');

      if ($this.hasClass('all-filter')) {
        $labels.find('input').prop('checked', false);
        $allInput.prop('checked', true);
      } else {
        $allInput.prop('checked', false);
      }
    });

  onTextChange({
    selector: '.name-group',
    maxLen: 17,
    fontSize: 22,
    lineHeight: 26,
    letterSpacing: 1
  });

  onTextChange({
    selector: '.poster2 .name-group, .poster3 .name-group, .poster14 .name-group, .poster12 .name-group',
    maxLen: 8,
    fontSize: 22,
    lineHeight: 26,
    letterSpacing: 1
  });


    setTimeout(function(){
        if ("" == true){

        }else if($('.modal-div-login-regisration').is(":visible") == true){

        }else{
            $('.promo-social').fadeIn('slow');
        }
    },5000);

    $('.promo-social > .close-reg').on('click',function(){
        $('.promo-social').fadeOut('slow');
    });



});