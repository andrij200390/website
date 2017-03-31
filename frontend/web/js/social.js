/// Лайки для коментариев
 function likeInitBoardUser(){
     var likeIns = $(this).find(".like-Count");
      var like = $(this);
     var data = {
         id: $(this).attr('id'),
         elem_type: "comments"
     };
     $.ajax({
         dataType: 'JSON',
         type: 'get',
         data: data,
         url: '/board/like/'
     }).then(function(data) {
         var likeCount = data.likeCount;
         var myLike = data.myLike;
         (myLike) ? like.addClass('likeActive2') : like.removeClass('likeActive2');
         likeIns.html(likeCount);

     });
 }


  //// лайки
   function likeInitBoardUserMessage(){
     var likeIns = $(this).find(".like-Count");
     var like = $(this);

     var data = {
         id: $(this).attr('id'),
     };
     console.log(data)

     $.ajax({
         dataType: 'JSON',
         type: 'get',
         data: data,
         url: '/board/like/'
     }).then(function(data) {
     console.log(data)

         var likeCount = data.likeCount;
         var myLike = data.myLike;
         (myLike) ? like.addClass('likeActive2') : like.removeClass('likeActive2');
         likeIns.html(likeCount);

     });
 }



//Лайки для коментариев
function likeInitComentToFotoAlbum(){
  var likeIns = $(this).find(".count-like");
  var like = $(this);
  console.log(likeIns);
  var data = {
    id: $(this).attr('id'),
    elem_type: 'comments',
  };
  $.ajax({
    dataType: 'JSON',
    type: 'get',
    data: data,
    url: '/photos/like/',
  }).then(function (data) {
    likeIns.html(data.likeCount);
    var myLike = data.myLike;
    (myLike) ? like.addClass('likeActive2') : like.removeClass('likeActive2');
    console.log(data);
  });
}

//Лайки для фото
function likeInitToFoto(event){
  event.stopPropagation();
  var likeIns = $(this).find(".count-like");
  var like = $(this);

  like.off().removeClass('likeActive');
  console.log(likeIns);
  var data = {
    id: $(this).attr('id'),
    elem_type: 'photo'
  };
  // console.log(data);
  $.ajax({
    dataType: 'JSON',
    type: 'get',
    data: data,
    url: '/photos/like/'
  }).then(function (data) {
    likeIns.html(data.likeCount);
    var myLike = data.myLike;
    (myLike) ? like.addClass('likeActive2') : like.removeClass('likeActive2');

  });
  return false;
}

/// Лайки для коментариев
function likeInitToComentFoto(){
    var likeIns = $(this).find(".count-like");
    var like = $(this);
    var data = {
      id: $(this).attr('id'),
      elem_type: 'comments'
    };
    // console.log(data);
    $.ajax({
      dataType: 'JSON',
      type: 'get',
      data: data,
      url: '/photos/like/'
    }).then(function (data) {
      var likeCount = data.likeCount;
      var myLike = data.myLike;
      (myLike) ? like.addClass('likeActive2') : like.removeClass('likeActive2');
      likeIns.html(likeCount);
      console.log(data);

    });
  }

//Лайки для видео
function likeInitVideo(){
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
  });
}

//Лайки для комментов к видео
function likeInitVideoComment(){
  var likeIns = $(this).children(".like-count");
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
  });
}