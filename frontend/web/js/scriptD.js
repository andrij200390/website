$(function () {
    var countFoto = $(".list-foto-in-album").find(".open_modal").length;
    $(".countFoto").text(countFoto);

    $(".edit-album-btn").on("click", function(e) {
      event.stopPropagation();
      var nameAlbum = $(this).closest(".foto-album").find(".name-album").text().trim();
      $("#nameAlbum").text(nameAlbum);
      $(".edit-album-btn").show();

      $(this).hide();
      $('.list-foto-in-album').hide();
      $('#foto-in-album').hide();
      $('.edit-album').show();
      $('#edit-album').show();
      $('.comment-to-foto').hide();
      $('#coment-to-album').hide();
    });



    $(document).on("click", ".astatus_plus", function(e) {
      e.stopPropagation();
      var $this = $(this);
      var $aboutMenu = $this.next('.about-menu');

      $aboutMenu.toggle();
    });



    $(function(){
      $(document).click(function(event) {
        if ($(event.target).closest(".astatus_plus").length) return;
        $(".about-menu").hide();
        event.stopPropagation();
      });
    });

    titleInit();

  // SCROLL http://dedushka.org/uroki/5503.html
  jQuery( document ).ready(function() {
    jQuery('#scrollup img').mouseover( function(){
      jQuery( this ).animate({opacity: 0.65},100);
    }).mouseout( function(){
      jQuery( this ).animate({opacity: 1},100);
    }).click( function(){
      window.scroll(0 ,0);
      return false;
    });

    jQuery(window).scroll(function(){
      if ( jQuery(document).scrollTop() > 0 ) {
        jQuery('#scrollup').fadeIn('fast');
      } else {
        jQuery('#scrollup').fadeOut('fast');
      }
    });
  });

  });





