$(document).ready(function(){
	var link = document.location.pathname;
	var linkIndex = link.indexOf('/');
	var slicePath = link.slice(linkIndex + 1, link.indexOf('/', linkIndex + 1));

	$('.header-login>.login-menu>ul>a[href="'+link+'"]').addClass('activeNav');
	$('.header-login>.login-menu>ul>a[href="'+link+'"]>span').addClass('vis');

	switch (slicePath) {
		case 'news': $('.login-menu a').eq(0).addClass('activeNav').find('span').addClass('vis'); break;
		case 'article': $('.login-menu a').eq(1).addClass('activeNav').find('span').addClass('vis'); break;
		case 'events': $('.login-menu a').eq(2).addClass('activeNav').find('span').addClass('vis'); break;
		case 'school': $('.login-menu a').eq(3).addClass('activeNav').find('span').addClass('vis'); break;
	}

});
