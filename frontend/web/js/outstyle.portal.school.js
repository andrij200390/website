/*
    Schools single page scripts init
    Used:
    - echoJS for lazy load images:          https://www.npmjs.com/package/echo-js
    - PreciseTextResize for text:           @frontend/web/js/misc/preciseTextResize.js
    - wayjs for two-way data-binding:       https://github.com/gwendall/way.js
    - jQuery Mousewheel for OwlCarousel:    https://github.com/jquery/jquery-mousewheel (Owl Carousel built-in)
    - jQuery OwlCarousel:                   https://owlcarousel2.github.io/OwlCarousel2/
*/
function schoolInit() {

    var mapDiv = jQuery('#map__canvas--single');
    var carouselDiv = jQuery('.owl-carousel');

    /* GOOGLE MAPS INIT */
    function initGoogleMap(mapDiv) {
      var location = {lat: Number(mapDiv.attr('data-lat')),lng: Number(mapDiv.attr('data-lng'))};
      var options = {
        center: location,
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        styles: [{"featureType":"all","elementType":"labels","stylers":[{"visibility":"on"}]},{"featureType":"all","elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#000000"},{"lightness":40}]},{"featureType":"all","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#000000"},{"lightness":16}]},{"featureType":"all","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]},{"featureType":"administrative.country","elementType":"labels.text.fill","stylers":[{"color":"#e5c163"}]},{"featureType":"administrative.locality","elementType":"labels.text.fill","stylers":[{"color":"#c4c4c4"}]},{"featureType":"administrative.neighborhood","elementType":"labels.text.fill","stylers":[{"color":"#e5c163"}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":21},{"visibility":"on"}]},{"featureType":"poi.business","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#e5c163"},{"lightness":"0"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"visibility":"off"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"road.highway","elementType":"labels.text.stroke","stylers":[{"color":"#e5c163"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#575757"}]},{"featureType":"road.arterial","elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"road.arterial","elementType":"labels.text.stroke","stylers":[{"color":"#2c2c2c"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":16}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#999999"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":17}]}]
      };
      var map = new google.maps.Map(mapDiv[0], options);
      var marker = new google.maps.Marker({position: location, map: map});
    }

    /* OWL CAROUSEL INIT */
    function initOwlCarousel(carouselDiv) {
      carouselDiv.owlCarousel({
        loop:true,
        lazyLoad:true,
        items:4,
        nav: false,
      });
      carouselDiv.on('mousewheel', '.owl-stage', function (e) {
          if (e.deltaY>0) {
              carouselDiv.trigger('next.owl');
          } else {
              carouselDiv.trigger('prev.owl');
          }
          e.preventDefault();
      });
    }


      jQuery('.block__item .overlay').show();

      /* --- Now to init images lazy loading, Google Maps and carousel --- */
      echo.init({offset:1000});
      initGoogleMap(mapDiv);
      initOwlCarousel(carouselDiv);

    /* Error handling: no user image is available */
    jQuery("img.avatar").error(function () {
      jQuery(this).unbind("error").attr("src", "/css/i/broken/avatar_128x128.png");
    });
}
