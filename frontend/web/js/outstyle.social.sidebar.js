var activeMenuClass = 'c-nav--active';

jQuery(document).ready(function () {
  jQuery("a.c-nav__item").on("click", function() {
      jQuery('nav span').removeClass(activeMenuClass);
      jQuery(this).parent().addClass(activeMenuClass);
  });
});

function sidebarHighlightActiveMenuItem(elementId) {
    jQuery('nav span').removeClass(activeMenuClass);
    jQuery(elementId).addClass(activeMenuClass);
}
