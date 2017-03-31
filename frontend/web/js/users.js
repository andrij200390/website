window.onload = function() {

  $(function() {
    $('.push').on('click', function(){
      $('.js-active-1').toggleClass('open');
      $('.push-item').toggle();
      $('.push').hide();
    });
    $('.push-item').on('click', function(){
      $('.js-active-1').toggleClass('open');
      $('.push-item').hide();
      $('.push').toggle();
    });
  });

}


$('#js-more').on('click', function() {
  $('#js-1').css('height', 'auto')
});