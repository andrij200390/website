$(document).ready(function(){
     var link = document.location.pathname;
     $('.sidebar>.sidebarMenu>li>a[href="'+link+'"]').addClass('active-sitebar');
});