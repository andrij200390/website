$(document).ready(function(){
	
$(".content").mCustomScrollbar({
	axis:"xy",
	theme:"3d-thick-dark",
	setHeight: 300,
	setWidth: 300,
		scrollButtons:{ 
			enable: true,
			scrollAmount: 12
		},	
});
	
$(".rh-theme").mCustomScrollbar({
	axis:"y",
	theme:"rh-theme",
	setHeight: 300,
	setWidth: 300,
		scrollButtons:{ 
				enable: true,
		}
});
	
});
