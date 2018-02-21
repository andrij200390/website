<?php
use yii\helpers\Html; 
use yii\helpers\Url;
use app\models\FriendRequests;
use frontend\models\UserAvatar;
use app\models\UserDescription;
use app\models\Country;

use frontend\widgets\WidgetProfileUserMenu;
use yii\widgets\ActiveForm;
use app\models\User;
use app\models\Photo; 

/* @var $this yii\web\View */
$this->title = Yii::t('app', 'Друзья').' - '.Yii::$app->name;
$this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Друзья'), 'url' => Url::toRoute('friends/')];
$this->params['breadcrumbs'][] = Yii::t('app', 'Друзья');
?>

<div class="wrapper-friends-main friends_backgraund">
	<div class="wrapper-friends-sidebar fr-123">
		<div class="wrapper-friends-sidebar-i">
			<div class="wp-search-friend-block">
				<div class="wrapper-list-input-checkbox">
					<input type="text" id="search" class="search-field-friend">
					<input type="submit" value="" class="search-button-friend">
				</div>
			</div>
			<div class="friends-sidebar-link-list"> 
				<ul>
					<li class="friends-sidebar-link-list-friends"><a href="<?=Url::toRoute('/myprofile/friends/');?>" class="friends-sidebar-active"></a></li>
					<li class="friends-sidebar-link-list-search"><a href="<?=Url::toRoute('/search/');?>" ></a></li>
					<li class="friends-sidebar-link-list-news"><a href="<?=Url::toRoute('/myprofile/newsfeed');?>" ></a></li>
					<!-- <li><a href="<?//=Url::toRoute('/groups/');?>" ></a></li> -->
					<div class="clearboth"></div>
				</ul>
			</div>
			<div class="wrapper-list-input-checkbox">
			
					<div class="wrapper-sort-select_main">
						<p></p>
						<select id="sort">
							<option value="rating">По рейтингу</option>
							<option value="id">Дате регистрации</option>
						</select>
					</div>
					<p class="wp-list-input-checkbox-country-i-title">Страна</p>
					<div class="wp-list-input-checkbox-country-i">
						<p></p>
						<select id="country" >
							<option value="0">-Не выбрано-</option>
							<?=Country::getCountryOption();?>
						</select>
					</div>
					<p class="wp-list-input-checkbox-country-i-title">Город</p>
					<div class="wp-list-input-checkbox-country-i">
						<p></p>
						<select id="city">
							<option value="0">-Не выбрано</option>
						</select>
					</div>
					<p class="wp-title-age">Возраст</p>
					<div class="wp-age-content">
						<input type="text" id="age_start" class="wp-age-content-from" placeholder="От">
						<div class="wp-separator-age-field">-</div>
						<input type="text" id="age_end" class="wp-age-content-before" placeholder="До"> 
						<div class="clearboth"></div>
					</div>
					<div class="wrapper-flooring-checkbox">
						<p class="wrapper-flooring-checkbox-title">Пол</p>
						<div class="wrapper-flooring-checkbox-i">
		                    <input id="wrapper-flooring-checkbox-female" type="checkbox" >
		                    <label for="wrapper-flooring-checkbox-female"><span></span>Женский</label>
		                    <div class="clearboth"></div>
	                    </div>
	                    <div class="wrapper-flooring-checkbox-i">
		                    <input id="wrapper-flooring-checkbox-male" type="checkbox" >
		                    <label for="wrapper-flooring-checkbox-male"><span></span>Мужской</label>
		                    <div class="clearboth"></div>
	                    </div>
	                </div>
					<p class="wp-list-those-culture-i-title">Кто в культуре</p>
					<div class="wp-list-those-culture-i">
						<p></p>
						<select id="culture" >
							<option value="0">-Не выбрано</option>
							<option value="1">Бибой</option>
							<option value="2">mc</option>
							<option value="3">dj</option>
							<option value="4">writer</option>
							<option value="5">Ганста</option>
						</select>
					</div>
					
			</div>


			<script>
$(document).ready(function() {
    
    var city = $("#city option:selected").val();
    var country = $("#country option:selected").val();

    if ( country == 0) {
        $( "#city").parent().find('p').html("-Не выбрано");
        city = 0;
    }
    
/////вывод друзей
    var data = {
        search : $("#search").val(),
        sort : $("#sort option:selected").val(),
        country : $("#country option:selected").val(),
        city : city,
        age_start : $('#age_start').val(),
        age_end : $('#age_end').val(),
        female : $('#wrapper-flooring-checkbox-female').prop("checked"),
        male : $('#wrapper-flooring-checkbox-male').prop("checked"),
        culture : $("#culture option:selected").val(),
        page : 1,
    };
    //console.log(data);

    $.ajax({
        dataType: 'JSON',
        type : 'get',
        data : data,
        url: '/friends/list/'
    }).then(function(data){
//        console.log(data.myFriends);
        if (data.myFriends){
            var friends = data.myFriends;
            var count = data.myFriends.length;
            for (var i = 0 ; i < count; i++ ){
                if (friends[i]['onlineInd'] == 1){
                    var  status = "<div style='background:#00a651' class='all-list-friends-i-manipulation-block-status'></div>";
                }else{
                    var  status = "<div style='background:red' class='all-list-friends-i-manipulation-block-status'></div>";
                }
                $('.wp-all-list-friends').append("<div class='wp-all-list-friends-i'><div class='wp-all-list-friends-i-ico'><a href='/profile/"+friends[i].id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+friends[i]['id']+"_small.jpg"+" class='ava_class'></a></div><div class='wp-all-list-friends-i-info'><a href='/profile/"+friends[i].id+"/' class='all-list-friends-i-info-nickname'>"+friends[i]['name']+"</a><p class='all-list-friends-i-info-sity'>"+friends[i]['city']+"</p></div><div class='wp-all-list-friends-i-manipulation-block'><a id="+friends[i]['id']+" href='#modal-send-message' onclick='modalUse()' class='all-list-friends-i-manipulation-block-message open_modal'></a> "+ status +"<div id="+friends[i]['id']+" class='all-list-friends-i-manipulation-block-delete-friend'></div></div><div class='clearboth'></div></div>");
                if (friends[i]['onlineInd'] == 1){
                    $('.wp-all-list-friends-online').append("<div class='wp-all-list-friends-i'><div class='wp-all-list-friends-i-ico'><a href='/profile/"+friends[i].id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+friends[i]['id']+"_small.jpg"+" class='ava_class'></a></div><div class='wp-all-list-friends-i-info'><a href='/profile/"+friends[i].id+"/' class='all-list-friends-i-info-nickname'>"+friends[i]['name']+"</a><p class='all-list-friends-i-info-sity'>"+friends[i]['city']+"</p></div><div class='wp-all-list-friends-i-manipulation-block'><a id="+friends[i]['id']+" href='#modal-send-message' onclick='modalUse()' class='all-list-friends-i-manipulation-block-message open_modal'></a> "+ status +"<div id="+friends[i]['id']+" class='all-list-friends-i-manipulation-block-delete-friend'></div></div><div class='clearboth'></div></div>");
                }
            }
            $('.ava_class').error(function() {
                $(this).attr( "src", "<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/def_avatar.jpg" );
            });
        }
        
        $('.ava_class').error(function() {
            $(this).attr( "src", "<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/def_avatar.jpg" );
        });
        
        //пересылаем id пользователя
        $('.all-list-friends-i-manipulation-block-message').on('click',function(){
            var userId = $(this).attr('id');
            $('.content-send-message > .message-area > .foot-modal > .send').attr('id',userId);
        });

    /////удаление из друзей
        $('.all-list-friends-i-manipulation-block-delete-friend').on('click', function(){
           if (confirm("Вы действительно хотите удалить своего друга?")){
               var thisFriend = $(this).parent().parent();
               var data = {
                       idDel : $(this).attr('id'),
               };
               //console.log(data);
               $.ajax({
                    dataType: 'JSON',
                    type : 'get',
                    data : data,
                    url: '/friends/del/'
               }).then(function(data){
                   console.log(data);
                   $(thisFriend).fadeOut('slow');
               });
            }
        });

    /////// прием заявки
        $('.all-list-friends-i-manipulation-block-add').on('click', function(){
            var data = {
                idUserRequest : $(this).attr('id'),
            };
//            console.log(data);

            $.ajax({
                dataType: 'JSON',
                type : 'get',
                data : data,
                url: '/friends/accept/'
            }).then(function(data){
                //console.log(data);
                alert("Друг добавлен");
            });
        });
        titleInit();
    });

	                /////сортировка-фильтр друзей
					$('.wrapper-list-input-checkbox').change(function(){
                    
                        var newCountry = $("#country option:selected").val();
                        if ( newCountry == country ) {
                            city = $("#city option:selected").val();
                        } else {
                            country = newCountry;
                            $( "#city").parent().find('p').html("-Не выбрано");
                            city = 0;
                        }
						
                        var data = {
                            search : $("#search").val(),
                            sort : $("#sort option:selected").val(),
                            country : $("#country option:selected").val(),
                            city : city,
                            age_start : $('#age_start').val(),
                            age_end : $('#age_end').val(),
                            female : $('#wrapper-flooring-checkbox-female').prop("checked"),
                            male : $('#wrapper-flooring-checkbox-male').prop("checked"),
                            culture : $("#culture option:selected").val(),
                            page : 1,
		                };
						//console.log(data);

	                    $.ajax({
                            dataType: 'JSON',
                            type : 'get',
                            data : data,
                            url: '/friends/list/'
		                }).then(function(data){

                            $('img').error(function() {
                                $(this).attr( "src", "<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/def_avatar.jpg" );
                            });
//		                      	console.log(data);

		                      	if (data.myFriends){
		                      	$('.wp-all-list-friends-i').remove();
		                   	   	var friends = data.myFriends;
		                   	   	var count = data.myFriends.length;
		                    	for (var i = 0 ; i < count; i++ ){
                                    if (friends[i]['onlineInd'] == 1){
                                        var  status = "<div style='background:#00a651' class='all-list-friends-i-manipulation-block-status'></div>";
                                    }else{
                                        var  status = "<div style='background:red' class='all-list-friends-i-manipulation-block-status'></div>";
                                    }

                                    $('.wp-all-list-friends').append("<div class='wp-all-list-friends-i'><div class='wp-all-list-friends-i-ico'><a href='../../users/"+friends[i].id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+friends[i]['id']+"_small.jpg"+" class='ava_class'></a></div><div class='wp-all-list-friends-i-info'><a href='../../users/"+friends[i].id+"/' class='all-list-friends-i-info-nickname'>"+friends[i]['name']+"</a><p class='all-list-friends-i-info-sity'>"+friends[i]['city']+"</p></div><div class='wp-all-list-friends-i-manipulation-block'><a id="+friends[i]['id']+" href='#modal-send-message' onclick='modalUse()' class='all-list-friends-i-manipulation-block-message open_modal'></a> "+ status +"<div id="+friends[i]['id']+" class='all-list-friends-i-manipulation-block-delete-friend'></div></div><div class='clearboth'></div></div>");

                                    if (friends[i]['onlineInd'] == 1){
                                        $('.wp-all-list-friends-online').append("<div class='wp-all-list-friends-i'><div class='wp-all-list-friends-i-ico'><a href='/profile/"+friends[i].id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+friends[i]['id']+"_small.jpg"+" class='ava_class'></a></div><div class='wp-all-list-friends-i-info'><a href='/profile/"+friends[i].id+"/' class='all-list-friends-i-info-nickname'>"+friends[i]['name']+"</a><p class='all-list-friends-i-info-sity'>"+friends[i]['city']+"</p></div><div class='wp-all-list-friends-i-manipulation-block'><a id="+friends[i]['id']+" href='#modal-send-message' onclick='modalUse()' class='all-list-friends-i-manipulation-block-message open_modal'></a> "+ status +"<div id="+friends[i]['id']+" class='all-list-friends-i-manipulation-block-delete-friend'></div></div><div class='clearboth'></div></div>");

                                    }
		                    	}
                                $('.ava_class').error(function() {
                                    $(this).attr( "src", "<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/def_avatar.jpg" );
                                });

		                    }
		                    //пересылаем id пользователя
		                    	$('.all-list-friends-i-manipulation-block-message').on('click',function(){
		                    		var userId = $(this).attr('id');
		                    		$('.content-send-message > .message-area > .foot-modal > .send').attr('id',userId);
		                    	});

		                /////удаление из друзей
						$('.all-list-friends-i-manipulation-block-delete-friend').on('click', function(){
							if (confirm("Вы действительно хотите удалить своего друга?")){
								var thisFriend = $(this).parent().parent();
								var data = {
										idDel : $(this).attr('id'),
						        };
								console.log(data);

						        $.ajax({
						                dataType: 'JSON',
						                type : 'get',
						                data : data,
						                url: '/friends/del/'
						        }).then(function(data){

						            console.log(data);
						            $(thisFriend).fadeOut('slow');
						        });
						    }
					    });

						// прием заявки
						$('.all-list-friends-i-manipulation-block-add').on('click', function(){
							var data = {
									idUserRequest : $(this).attr('id'),
					        };
							console.log(data);

				            $.ajax({
				                dataType: 'JSON',
				                type : 'get',
				                data : data,
				                url: '/friends/accept/'
				            }).then(function(data){

				                console.log(data);
				                alert("Друг добавлен");
				            });
					    });
												titleInit();
	                    });
		            });

				});			




var page = 1;
var loadMore = true;
 $(window).on('scroll', function(){
            if($(window).scrollTop() == $(document).height() - $(window).height() && loadMore == true){
                
                var newCountry = $("#country option:selected").val();
                if ( newCountry == country ) {
                    city = $("#city option:selected").val();
                } else {
                    country = newCountry;
                    $( "#city").parent().find('p').html("-Не выбрано");
                    city = 0;
                }

                page = page + 1;
                $('div#loadmoreajaxloader').show();
                var data = {
                    search : $("#search").val(),
                    sort : $("#sort option:selected").val(),
                    country : $("#country option:selected").val(),
                    city : city,
                    age_start : $('#age_start').val(),
                    age_end : $('#age_end').val(),
                    female : $('#wrapper-flooring-checkbox-female').prop("checked"),
                    male : $('#wrapper-flooring-checkbox-male').prop("checked"),
                    culture : $("#culture option:selected").val(),
                    page : page
                };
                console.log(data);
                $.ajax({
                    dataType: 'JSON',
                    type : 'get',
                    data : data,
                    url: '/friends/list/',
                    success: function(data){
//                        console.log(data);
                        loadMore = data.loadMore;

                       if (data.myFriends){
		                   	   	var friends = data.myFriends;
		                   	   	var count = data.myFriends.length;
		                    	for (var i = 0 ; i < count; i++ ){
                                    if (friends[i]['onlineInd'] == 1){
                                        var  status = "<div style='background:#00a651' class='all-list-friends-i-manipulation-block-status'></div>";
                                    }else{
                                        var  status = "<div style='background:red' class='all-list-friends-i-manipulation-block-status'></div>";
                                    }  

                                    $('.wp-all-list-friends').append("<div class='wp-all-list-friends-i'><div class='wp-all-list-friends-i-ico'><a href='/profile/"+friends[i].id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+friends[i]['id']+"_small.jpg"+" class='ava_class'></a></div><div class='wp-all-list-friends-i-info'><a href='/profile/"+friends[i].id+"/' class='all-list-friends-i-info-nickname'>"+friends[i]['name']+"</a><p class='all-list-friends-i-info-sity'>"+friends[i]['city']+"</p></div><div class='wp-all-list-friends-i-manipulation-block'><a id="+friends[i]['id']+" href='#modal-send-message' onclick='modalUse()' class='all-list-friends-i-manipulation-block-message open_modal'></a> "+ status +"<div id="+friends[i]['id']+" class='all-list-friends-i-manipulation-block-delete-friend'></div></div><div class='clearboth'></div></div>");


                                    if (friends[i]['onlineInd'] == 1){
                                        $('.wp-all-list-friends-online').append("<div class='wp-all-list-friends-i'><div class='wp-all-list-friends-i-ico'><a href='/profile/"+friends[i].id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+friends[i]['id']+"_small.jpg"+" class='ava_class'></a></div><div class='wp-all-list-friends-i-info'><a href='/profile/"+friends[i].id+"/' class='all-list-friends-i-info-nickname'>"+friends[i]['name']+"</a><p class='all-list-friends-i-info-sity'>"+friends[i]['city']+"</p></div><div class='wp-all-list-friends-i-manipulation-block'><a id="+friends[i]['id']+" href='#modal-send-message' onclick='modalUse()' class='all-list-friends-i-manipulation-block-message open_modal'></a> "+ status +"<div id="+friends[i]['id']+" class='all-list-friends-i-manipulation-block-delete-friend'></div></div><div class='clearboth'></div></div>");

                                    }
		                    	}
                                $('.ava_class').error(function() {
                                    $(this).attr( "src", "<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/def_avatar.jpg" );
                                });
		                    }
		                     //пересылаем id пользователя
		                    	$('.all-list-friends-i-manipulation-block-message').on('click',function(){
		                    		var userId = $(this).attr('id');
		                    		$('.content-send-message > .message-area > .send').attr('id',userId);
		                    	});

		            /////сортировка-фильтр друзей
					$('.wrapper-list-input-checkbox').change(function(){
                        var newCountry = $("#country option:selected").val();
                        if ( newCountry == country ) {
                            city = $("#city option:selected").val();
                        } else {
                            country = newCountry;
                            $( "#city").parent().find('p').html("-Не выбрано");
                            city = 0;
                        }
                        
						var data = {
                            search : $("#search").val(),
                            sort : $("#sort option:selected").val(),
                            country : $("#country option:selected").val(),
                            city : city,
                            age_start : $('#age_start').val(),
                            age_end : $('#age_end').val(),
                            female : $('#wrapper-flooring-checkbox-female').prop("checked"),
                            male : $('#wrapper-flooring-checkbox-male').prop("checked"),
                            culture : $("#culture option:selected").val(),
                            page : 1,
		                };
						//console.log(data);
	                    $.ajax({
		                        dataType: 'JSON',
		                        type : 'get',
		                        data : data,
		                        url: '/friends/list/'
		                }).then(function(data){
                            if (data.myFriends){
		                      	$('.wp-all-list-friends-i').remove();
		                   	   	var friends = data.myFriends;
		                   	   	var count = data.myFriends.length;
		                    	for (var i = 0 ; i < count; i++ ){
                                    if (friends[i]['onlineInd'] == 1){
                                        var  status = "<div style='background:#00a651' class='all-list-friends-i-manipulation-block-status'></div>";
                                    }else{
                                        var  status = "<div style='background:red' class='all-list-friends-i-manipulation-block-status'></div>";
                                    }  

                                    $('.wp-all-list-friends').append("<div class='wp-all-list-friends-i'><div class='wp-all-list-friends-i-ico'><a href='/profile/"+friends[i].id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+friends[i]['id']+"_small.jpg"+" class='ava_class'></a></div><div class='wp-all-list-friends-i-info'><a href='/profile/"+friends[i].id+"/' class='all-list-friends-i-info-nickname'>"+friends[i]['name']+"</a><p class='all-list-friends-i-info-sity'>"+friends[i]['city']+"</p></div><div class='wp-all-list-friends-i-manipulation-block'><a id="+friends[i]['id']+" href='#modal-send-message' onclick='modalUse()' class='all-list-friends-i-manipulation-block-message open_modal'></a> "+ status +"<div id="+friends[i]['id']+" class='all-list-friends-i-manipulation-block-delete-friend'></div></div><div class='clearboth'></div></div>");

                                    if (friends[i]['onlineInd'] == 1){
                                        $('.wp-all-list-friends-online').append("<div class='wp-all-list-friends-i'><div class='wp-all-list-friends-i-ico'><a href='/profile/"+friends[i].id+"/'><img src="+"<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/"+friends[i]['id']+"_small.jpg"+" class='ava_class'></a></div><div class='wp-all-list-friends-i-info'><a href='/profile/"+friends[i].id+"/' class='all-list-friends-i-info-nickname'>"+friends[i]['name']+"</a><p class='all-list-friends-i-info-sity'>"+friends[i]['city']+"</p></div><div class='wp-all-list-friends-i-manipulation-block'><a id="+friends[i]['id']+" href='#modal-send-message' onclick='modalUse()' class='all-list-friends-i-manipulation-block-message open_modal'></a> "+ status +"<div id="+friends[i]['id']+" class='all-list-friends-i-manipulation-block-delete-friend'></div></div><div class='clearboth'></div></div>");

                                    }
		                    	}
                                $('.ava_class').error(function() {
                                    $(this).attr( "src", "<?php echo Yii::$app->homeUrl; ?>"+"images/avatar/def_avatar.jpg" );
                                });
		                    	 //пересылаем id пользователя
		                    	$('.all-list-friends-i-manipulation-block-message').on('click',function(){
		                    		var userId = $(this).attr('id');
		                    		$('.content-send-message > .message-area > .foot-modal > .send').attr('id',userId);
		                    	});

						/////удаление из друзей
						$('.all-list-friends-i-manipulation-block-delete-friend').on('click', function(){ 
							if (confirm("Вы действительно хотите удалить своего друга?")){
								var thisFriend = $(this).parent().parent();
								var data = {
										idDel : $(this).attr('id'),
						        };
								console.log(data);
						                  
						        $.ajax({
						                dataType: 'JSON',
						                type : 'get',
						                data : data,
						                url: '/friends/del/'
						        }).then(function(data){

						            console.log(data);
						            $(thisFriend).fadeOut('slow');
						        });
						    }
					    });

						// прием заявки
						$('.all-list-friends-i-manipulation-block-add').on('click', function(){
							var data = {
									idUserRequest : $(this).attr('id'),
					        };
							console.log(data);
					                  
				            $.ajax({
				                dataType: 'JSON',
				                type : 'get',
				                data : data,
				                url: '/friends/accept/'
				            }).then(function(data){

				                console.log(data);
				                alert("Друг добавлен");
				            });
					    });

		                    }
												titleInit();

	                    });
		            });	

                    }
                });
            }

	 titleInit();
        });
			</script>
		</div>
	</div>
	<div class="wrapper-tabs-friends">
		<div class="friends-tabs_container">
		  <ul class="friends-tabs">
		    <li class="inl-bl active-tabs">Все друзья</li>
		    <li class="inl-bl">Друзья онлайн</li>
		    <li class="inl-bl">Заявки в друзья
				<?php if($countRequest!=0){ ?>
		    		<span class="friends-count-friends-oline"><?=$countRequest?></span>
				<?php }?>
		    </li>
		    <div class="clearboth"></div>
		  </ul>

<!--    Все друзья    -->

		  <div class="friends-tab_container" style="display: block;">
		    <div class="wp-all-list-friends">
				<? if (empty($model)){ ?>

				    <div class="new-uzer no-uzers">
						У Вас нет еще друзей<br>
						Можете найти их <a href="<?=Url::toRoute('/search/');?>"><strong>здесь</strong></a>
					</div>

		    	<? } ?>
		    	<div class="clearboth"></div>
		    </div>
		    <!-- <div id="loadmoreajaxloader" style="display:none;"><center><img src="<?php echo Yii::$app->homeUrl;?>css/img/ajax-loader.gif" alt=""></center></div> -->
		  </div>

<!--    Друзья он-лайн   -->

		  <div class="friends-tab_container">
		  	<div class="wp-all-list-friends-online">

<!-- 				<?//php foreach($friends as $key => $val){ 
                           // if($friendsInd[$friends[$key]->id] == '#fff'){ continue; } ?>
					
                  
			    	<div class="wp-all-list-friends-i">
			    		<div class="wp-all-list-friends-i-ico"><img src="<?//php echo Yii::$app->homeUrl; ?>images/avatar/<?//=$friends[$key]->id;?>_small.jpg"></div>
			    		<div class="wp-all-list-friends-i-info">
			    			<a href="<?//=Url::toRoute('users/'.$friends[$key]->id)?>" class="all-list-friends-i-info-nickname"><?//=$friends[$key]->name;?></a>
			    			<p class="all-list-friends-i-info-sity"><?//=UserDescription::getCityList($friends[$key]->city);?></p>
			    		</div>
			    		<div class="wp-all-list-friends-i-manipulation-block">
			    			<a href="#" class="all-list-friends-i-manipulation-block-message"></a>
			    			<div class="all-list-friends-i-manipulation-block-status" style="background:<?//=$friendsInd[$friends[$key]->id];?>"></div>
			    			<a href="#" class="all-list-friends-i-manipulation-block-delete-friend"></a>
			    		</div>
			    		<div class="clearboth"></div>
			    	</div>

                <?////php ;} ;?> -->

		    		<div class="clearboth"></div>
		      </div>
		    </div>

<!-- Заявки в друзья -->

		    <div class="friends-tab_container">
			    <div class="wp-all-list-friends-apply">

				    <?php foreach($userRequest as $key => $val){ ?>
				    	<div class="wp-all-list-friends-i">
				    		<div class="wp-all-list-friends-i-ico"><img src="<?php echo Yii::$app->homeUrl; ?>images/avatar/<?=$userRequest[$key]['id'];?>_small.jpg"></div>
				    		<div class="wp-all-list-friends-i-info">
				    			<a href="<?=Url::toRoute('profile/'.$userRequest[$key]['id'])?>" class="all-list-friends-i-info-nickname"><?=$userRequest[$key]['name'];?></a>
				    			<p class="all-list-friends-i-info-sity"><?=$userRequest[$key]['city'];?></p>
				    		</div>
				    		<div class="wp-all-list-friends-i-manipulation-block">
				    			<a id="<?=$userRequest[$key]['id'];?>" href="#modal-send-message"  onclick='modalUse()' class="all-list-friends-i-manipulation-block-message open_modal"></a>
				    			<div id="<?=$userRequest[$key]['id']?>" class="all-list-friends-i-manipulation-block-add"></div>
				    			<div id="<?=$userRequest[$key]['id']?>" class="all-list-friends-i-manipulation-block-delete-request"></div>
				    		</div>
				    		<div class="clearboth"></div>
				    	</div>
				    <?php ;} ;?>
		    		    	
		    		<div class="clearboth"></div>
		    	</div>
		  	</div>

		</div>
	</div>
	<div class="clearboth"></div>
</div>
<script type="text/javascript">
	$('.wrapper-sort-select_main select').each(function(){
		$(this).siblings('p').text( $(this).children('option:selected').text() );
	});
	$('.wrapper-sort-select_main select').change(function(){
		$(this).siblings('p').text( $(this).children('option:selected').text() );
	});
	
	$('.wp-list-input-checkbox-country-i select').each(function(){
		$(this).siblings('p').text( $(this).children('option:selected').text() );
	});
	$('.wp-list-input-checkbox-country-i select').change(function(){
		$(this).siblings('p').text( $(this).children('option:selected').text() );
	});

	$('.wp-list-those-culture-i select').each(function(){
		$(this).siblings('p').text( $(this).children('option:selected').text() );
	});
	$('.wp-list-those-culture-i select').change(function(){
		$(this).siblings('p').text( $(this).children('option:selected').text() );
	});

    $('#country').on( 'change', function(){
        $.post( "/board/city/?id="+$(this).val(), function( data ){
            $( "#city" ).html( data );
            $( "#city").parent().find('p').html("-Не выбрано");
            $( "#city option[value='0']" ).prop( "selected", true );
        });
    });

	$(document).ready(function() {  
  $('ul.friends-tabs').each(function() {
    $(this).find('li').each(function(i) {
      $(this).click(function() {
        $(this).addClass('active-tabs').siblings().removeClass('active-tabs');
        var p = $(this).parents('div.friends-tabs_container');
        p.find('div.friends-tab_container').hide();
        p.find('div.friends-tab_container:eq(' + i + ')').show();
      });
    });
  });
})
</script>		

<script>
	$(document).ready(function() {

		// отклонение заявки
		    $('.all-list-friends-i-manipulation-block-delete-request').on('click', function(){
				var data = {
						idUserRefuse : $(this).attr('id'),
		        };
				console.log(data);
		                  
	            $.ajax({
	                dataType: 'JSON',
	                type : 'get',
	                data : data,
	                url: '/friends/refuse/'
	            }).then(function(data){

	                console.log(data);

	            });
		    });

		    	 //пересылаем id пользователя
		                    	$('.all-list-friends-i-manipulation-block-message').on('click',function(){
		                    		var userId = $(this).attr('id');
		                    		$('.content-send-message > .message-area > .foot-modal > .send').attr('id',userId);
		                    	});
		sendCtrlEnter('.send');

		$('.content-send-message > .message-area > .foot-modal > .send').on('click', function(){
			var message = $(this).parent().parent().children("textarea").val();
			var self = $(this);
			var data = {
				user : $(this).attr('id'),
				message : message,
			};
			console.log(data);

			$.ajax({
				dataType: 'JSON',
				type : 'get',
				data : data,
				url: "/chat/sendmessage/"
			}).then(function(data){
				console.log(data);
				if (data){
					self.closest('.modal-send-message').find('.modal_close').trigger('click');
					self.closest('.modal-send-message').find('textarea').val('');
				}
			});
		});


	});
</script>
 <div id="modal-send-message" class="modal-send-message">
        <div class="modal_close"> <h1>Написать сообщение</h1><div id="close_for_modal" class="close-foto"></div></div>
        <div class="content-send-message">
        	<div class="user-ava">
        	</div>
        	<div class="message-area">
        		<textarea class="form-control" type="text" placeholder="Введите ваше сообщение"></textarea>
						<div class="foot-modal"><input id="" class="send" type="button" value="Отправить"></div>
        	</div>
        </div>

    </div>
    <div id="overlay"></div><!-- Подложка -->