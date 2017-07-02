jQuery(document).ready(function () {
  jQuery("a.c-nav__item").on("click", function() {
      var activeClass = 'c-nav--active';
      jQuery('nav span').removeClass(activeClass);
      jQuery(this).parent().addClass(activeClass);
  });
});
