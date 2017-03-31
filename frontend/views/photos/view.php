<?php
use yii\helpers\Html;
use yii\helpers\Url;
/* @var $this yii\web\View */
$this->title = Yii::t('app', 'Фото').' - '.$name;
$this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
$this->params['breadcrumbs'][] = Yii::t('app', '');
?>

<script>
	jQuery(function()
	{ $('.sidebar-foto').jScrollPane({
		showArrows: true,
		verticalDragMinHeight: 50,
		verticalDragMaxHeight: 150,
		horizontalDragMinWidth: 50,
		horizontalDragMaxWidth: 150,
		autoReinitialise: true
	});
	});
	$(document).ready(function() {

		// Функция открытия модалки
		function openModal(data) {


			$.ajax({
				dataType: 'JSON',
				type: 'get',
				data: data,
				url: '/photos/photoinfo/'
			}).then(function (data) {
				$('.coment-messages').html(' ');
				var thisPhoto = "<?php echo Yii::$app->homeUrl;?>" + "images/photo/" + data.photoInfo.photo.idOwner + "/" + data.photoInfo.photo.idAlbum + "/" + data.photoInfo.photo.nameImg;
				console.log(data);
				var userCreatorAva = "<?php echo Yii::$app->homeUrl;?>" + "images/avatar/" + data.photoInfo.photo.idOwner + "_small.jpg";
				var userComentAva = "<?php echo Yii::$app->homeUrl;?>" + "images/avatar/" + "<?=Yii::$app->user->id?>" + "_small.jpg";
				var likeActive = (data.photoInfo.photo.myLike == 1) ?  'likeActive' :  '';
				console.log('data.photoInfo.photo.privacyComments : ',data.photoInfo.photo.privacyComments);

				if(data.photoInfo.photo.privacyComments){
					$('div.write-message').css('display', 'block');
              		$('.write-message > .ava-user > img').attr("src", userComentAva); //asdsadasdasdasdasd
                }else{
                 	//$('div.write-message').html('').append('Вы не можете комментировать фото этого альбома');
                 	$('div.write-message').css('display', 'none');
                }

				$('.for-foto > img').attr("src", thisPhoto);
				$('.date-LikeShare > .date').html(data.photoInfo.photo.created);
				$('.creator > .user-name > a').html(data.photoInfo.photo.userName);
				$('.creator > .ava-creator > a > img').attr("src", userCreatorAva);
				$('.like-panel > .count-like').html(data.photoInfo.countLikes);
				$('.send-icon').attr("id", data.photoInfo.photo.idPhoto);
				$('.ava-creator > a').attr("href", "/profile/" + data.photoInfo.photo.idOwner + "/");
				$('.creator > .user-name > a').attr("href", "/profile/" + data.photoInfo.photo.idOwner + "/");
				$('.like-panel > .share-photo').attr("id", data.photoInfo.photo.idPhoto);
				$('.like-panel > .photo-like').attr("id", data.photoInfo.photo.idPhoto).addClass(likeActive);
				$('.like-panel > .photo-edit > .count-coment').text(data.photoInfo.comments.commentsCount);
				$('.like-panel > .photo-like > .count-like').text(data.photoInfo.countLikes);
				$('.content-view-foto > .creator > .del').attr("id",data.photoInfo.photo.idPhoto);
				$('.content-view-foto > .creator > .del').attr("data-idAlbum",data.photoInfo.photo.idAlbum);
				var curFoto = $('.foto-active').attr('data-id');
				$('.curentFoto').text(curFoto);
				var count = data.photoInfo.comments.commentsCount;
				if (data.photoInfo.comments) {
					for (var i = 0; i < count; i++) {
						var coment = data.photoInfo.comments[i];
						var likeActive2 = (coment['myLike'] == 1) ?  'likeActive2' :  '';
						var delComent = '';

						var myId = <?=Yii::$app->user->id?>;
						var idOwner = coment.user_id;
						
						if(data.photoInfo.isAdmin){
							delComent = "<div id=" + coment.id + " class='del-coment'></div>";
						}else{
							if (myId == idOwner) {
								delComent = "<div id=" + coment.id + " class='del-coment'></div>";
							} else {
								delComent = '';
							}							
						}

						var comText = getBrString(coment.comment);

						$('.coments > .coment-messages').append("<div class='coment'><div class='user-ava'><a href='/profile/" + coment.user_id + "/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt=''></a></div><div class='info-user'>" +
								delComent +
								"<div class='for-user-vs-time'><a href='/profile/" + coment.user_id + "/'><div class='user-name'>" + coment.user_name + "</div></a><div class='time'>" + coment.created + "</div></div><div class='user-message'>" + comText + "</div><div class='reply'></div><div id=" + coment.id + " class='like "+likeActive2+"'><div class='count-like'>" + coment.likeCount + "</div></div></div></div>");
					}


					if ( data.photoInfo.comments.commentsCount <= 2) {
						$(".show-all-coments").hide();
					}else{
						$(".show-all-coments").show();
						$(".coment-messages > .coment").hide();
						$(".coment-messages > .coment:last").show();
						$(".coment-messages > .coment:last").prev().show();
					}
					$('.show-all-coments').click(function(){
						$('.coment-messages > .coment').show();
						$('.hide-all-coments').show();
						$('.show-all-coments').hide();
					});
					$('.hide-all-coments').click(function(){
						$('.coment-messages > .coment').hide();
						$('.hide-all-coments').hide();
						$(".coment-messages > .coment:last").show();
						$(".coment-messages > .coment:last").prev().show();
						$('.show-all-coments').show();
					});


					var num = data.photoInfo.comments.commentsCount;
					// num = num + '';
					console.log(num)

					$(".show-all-coments > h1 > .coment-count-news").text(num);

					var numLast = num.charAt(num.length - 1);
					var numLasts = num.slice(- 2);
					if (numLasts== 11 || numLasts == 12 || numLasts == 13 || numLasts == 14) {
						$(".show-all-coments > h1 > .word").text("отзывов");
					} else {
						if (numLast == 2 || numLast == 3 || numLast == 4) {
							$(".show-all-coments > h1 > .word").text("отзыва");
						} else if (numLast == 0 || numLast >= 5) {
							$(".show-all-coments > h1 > .word").text("отзывов");
						} else {
							$(".show-all-coments > h1 > .word").text("отзыв");
						};
					};

					/// Лайки для коментариев
					$('.like').on('click',likeInitToComentFoto);

					//Репост для фото
					$('.share-photo').on('click', function (event) {
						event.stopPropagation();
						var data = {
							id: $(this).attr('id')
						};
						// console.log(data);
						$.ajax({
							dataType: 'JSON',
							type: 'get',
							data: data,
							url: '/photos/repost/'
						}).then(function (data) {
							// console.log(data);
							alert('Репост отправлен на вашу стену');

						});
					});

					//// Удаление комментария
					$('.del-coment').on('click', function () {
						var thisComent = $(this).parent().parent();
						var data = {
							id: $(this).attr('id')
						};

						console.log(data);
						$.ajax({
							dataType: 'JSON',
							type: 'get',
							data: data,
							url: '/photos/delcomment/'
						}).then(function (data) {
							console.log(data);
							$(thisComent).fadeOut('slow');

						});
					});
				}

				titleInit();
				textareaInit();

			});


			//// добавление комментария для фото
			$('.send-icon').off();
			$('.send-icon').on('click', ComentToFoto);

			function ComentToFoto(){
				var commentMessage = $(this).parent().children('textarea').val();
				if ($.trim(commentMessage) == ""){

				}else{
					var data = {
						id: $(this).attr('id'),
						text: commentMessage
					};
					// console.log(data);
					$.ajax({
						dataType: 'JSON',
						type: 'get',
						data: data,
						url: '/photos/comment/'
					}).then(function (data) {
						console.log(data);
						var comText = getBrString(data.comment);
						$('.coments > .coment-messages').append("<div class='coment'><div class='user-ava'><a href='/profile/" + data.user_id + "/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + data.user_id + "_small.jpg" + " alt=''></a></div><div class='info-user'><div id=" + data.idComment + " class='del-coment'>" +
								"</div><div class='for-user-vs-time'><a href='/profile/" + data.user_id + "/'><div class='user-name'>" + data.user_name + "</div></a><div class='time'>" + data.created + "</div></div><div class='user-message'>" + comText + "</div><div class='reply'></div><div id=" + data.idComment + " class='like'><div class='count-like'>" + data.likeCount + "</div></div></div></div>");
						$("textarea").val("");

						/// Лайки для коментариев
						$('.like').off();
						$('.like').on('click',likeInitToComentFoto);

						// //// Удаление комментария
						$('.del-coment').on('click', function () {
							var thisComent = $(this).parent().parent();
							var data = {
								id: $(this).attr('id')

							};
							console.log(data);
							$.ajax({
								dataType: 'JSON',
								type: 'get',
								data: data,
								url: '/photos/delcomment/'
							}).then(function (data) {
								console.log(data);
								$(thisComent).fadeOut('slow');

							});
						});
						titleInit();
					});
				}
			}

			modalUse();
			textareaInit();

		}


		//сайдбар фото вынрузка
		var data = {
			idOwner: "<?=$id?>",
			page: 1
		};
		console.log(data);
		$.ajax({
			dataType: 'JSON',
			type: 'get',
			data: data,
			url: '/photos/albumlist/'
		}).then(function (data) {
			console.log(data);
			var albums = data.albums;
			var countAlbums = data.albums.length;
			if (albums) {
				for (var i = 0; i < countAlbums; i++) {
					var album = albums[i];
					var coverLength = album.photoCover.length;
					$('.jspPane').append("<div id=" + album.idAlbum + " class='album album1'><div class='foto-album'>" +
							"<div class='footer-album'><div class='name-album'>" + album.name + "</div>" +
							"<div class='quantity-foto'><img src=" + "<?php echo Yii::$app->homeUrl;?>" + "css/img/Photo_ICO.png" + ">" + album.countPhoto + "</div></div></div></div>");
					if (coverLength == '0') {
						$('.foto-album:last').prepend("<div class='bg-photo'><img src=" + "<?php echo Yii::$app->homeUrl;?>" + "css/img/Photo.png" + "></div>");
					} else {
						$('.foto-album:last').prepend("<div class='bg-photo'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/photo/" + album.idUser + "/" + album.idAlbum + "/small_" + album.photoCover + "></div>");
					}
				}
			}

			//Коментарии к альбому
			$('.list-coments-to-album').on('click', function () {
				var data = {
					idAlbum: $(this).attr('id')
				};
				console.log(data);
				$.ajax({
					dataType: 'JSON',
					type: 'get',
					data: data,
					url: '/photos/albumcomment/'
				}).then(function (data) {
					$('.name-header').hide();
					$('.list-foto-in-album').hide();
					$('.edit-album').hide();
					$('.nameAlbum').html(data.albumName);
					$('.comment-to-foto').html(" ");
					$('.comment-to-foto').show();
					$('#coment-to-album').show();

					console.log(data);
					var count = data.countComments;
					if (data) {
						for (var i = 0; i < count; i++) {
							var coment = data[i];
							var likeActive2 = (coment['myLike'] == 1) ?  'likeActive2' :  '';
							var comText = getBrString(coment.comment);

							$('.comment-to-foto').append("<div class='coment'><div class='user-ava'><a href='/profile/" + coment.user_id + "/'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/avatar/" + coment.user_id + "_small.jpg" + " alt=''></a></div><div class='user-inf'><a href='/profile/" + coment.user_id + "/'><div class='user-name'>" + coment.user_name + "</div></a><div class='user-message'>" + comText + "</div><div class='time'>" + coment.created + "</div><div id=" + coment.idComment + " class='dell-coment'>Удалить</div><div id=" + coment.idComment + " class='photo-like "+likeActive2+"'><div class='count-like'>" + coment.likeCount + "</div></div></div><div class='foto-coment'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/photo/" + data.idOwner + "/" + data.idAlbum + "/" + coment.nameImg + "></div></div>");
						}
					}


					//// Удаление комментария
					$('.dell-coment').on('click', function () {
						var thisComent = $(this).parent().parent();
						var data = {
							id: $(this).attr('id')
						};
						console.log(data);
						$.ajax({
							dataType: 'JSON',
							type: 'get',
							data: data,
							url: '/photos/delcomment/'
						}).then(function (data) {
							console.log(data);
							$(thisComent).fadeOut('slow');

						});
					});
				});
			});




			//Вывод фото альбома
			$('.album').on('click', function () {
				$('.edit-album').hide();
				$('.coment-to-album').hide();
				$('.album').removeClass('active');
				$('.comment-to-foto').hide();
				$(this).addClass('active');
				// alert('a');
				var data = {
					idAlbum: $(this).attr('id'),
					page: 1,
				};
				console.log(data);
				$.ajax({
					dataType: 'JSON',
					type: 'get',
					data: data,
					url: '/photos/photolist/'
				}).then(function (data) {
					$('.name-header').hide();
					$('#foto-in-album').show();
					$('.list-foto-in-album').show();
					$('.countFoto').html(data.countPhotos);
					$('.list-foto-in-album').html(" ");
					console.log(data);
					var photos = data.modelPhotos;
					var count = data.modelPhotos.length;
					var idAlbum = data.modelPhotos[0].idAlbum;
					$('.list-foto-in-album').attr('id',idAlbum);

					if (photos) {
						var cur =  0;
						for (var i = 0; i < count; i++) {
							var photo = photos[i];
							var likeActive = (photo['myLike'] == 1) ?  'likeActive' :  '';
							// console.log(photo);
							cur++
							$('.list-foto-in-album').append("<a href='#modal1' data-id='" + cur + "' id=" + photo.idPhoto + " class='open_modal'><div class='foto-in-album'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/photo/" + photo.idOwner + "/" + photo.idAlbum + "/small_" + photo.nameImg + "><div class='foot-photo'><div class='photo-edit'><div class='count-coment'>"+photo.commentsCount+"</div></div><div id=" + photo.idPhoto + " class='photo-like "+likeActive+"'><div class='count-like'>" + photo.likeCount + "</div></div><div id=" + photo.idPhoto + " class='photo-share'></div></div></div></a>");

							modalUse();

						}
						$('.list-coments-to-album').attr("id", photo.idAlbum);
					}

					//Репост для фото
					$('.photo-share').on('click', function (event) {
						event.stopPropagation();
						var data = {
							id: $(this).attr('id'),
						};
						// console.log(data);
						$.ajax({
							dataType: 'JSON',
							type: 'get',
							data: data,
							url: '/photos/repost/'
						}).then(function (data) {
							// console.log(data);
							alert('Репост отправлен на вашу стену');

						});
					});


					///Открытие фотографии

					titleInit();

					$('.open_modal').on('click', function(e){
						e.stopPropagation();
						$('.open_modal').removeClass('foto-active');
						$(this).addClass('foto-active');
						var data = {
							idPhoto: $(this).attr('id')
						};

						openModal(data);
					});


				});
			});


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// infinite scroll

			var page = 1;
			var loadMore = true;
			$(window).on('scroll', function(){
				if ($('.list-foto-in-album').is(':visible') == true){
					if($(window).scrollTop() == $(document).height() - $(window).height() && loadMore == true){

						page = page + 1;
						var albumId = $('.list-foto-in-album').attr('id');

						var data = {
							page : page,
							idAlbum :albumId
						};
						console.log(data);
						$.ajax({
							dataType: 'JSON',
							type : 'get',
							data : data,
							url: '/photos/photolist/',
							success: function(data){

								console.log(data)
								$('.name-header').hide();
								$('#foto-in-album').show();
								$('.list-foto-in-album').show();
								$('.countFoto').html(data.countPhotos);
								console.log(data);
								var photos = data.modelPhotos;
								var count = data.modelPhotos.length;
								var idAlbum = data.modelPhotos[0].idAlbum;
								$('.list-foto-in-album').attr('id',idAlbum);

								if (photos) {
									var cur =  $(".list-foto-in-album").children('.open_modal:last').attr('data-id');
									for (var i = 0; i < count; i++) {
										var photo = photos[i];
										var likeActive = (photo['myLike'] == 1) ?  'likeActive' :  '';
										// console.log(photo);
										cur++
										$('.list-foto-in-album').append("<a href='#modal1' data-id='" + cur + "' id=" + photo.idPhoto + " class='open_modal'><div class='foto-in-album'><img src=" + "<?php echo Yii::$app->homeUrl; ?>" + "images/photo/" + photo.idOwner + "/" + photo.idAlbum + "/small_" + photo.nameImg + "><div class='foot-photo'><div class='photo-edit'><div class='count-coment'>"+photo.commentsCount+"</div></div><div id=" + photo.idPhoto + " class='photo-like "+likeActive+"'><div class='count-like'>" + photo.likeCount + "</div></div><div id=" + photo.idPhoto + " class='photo-share'></div></div></div></a>");


									}
									$('.list-coments-to-album').attr("id", photo.idAlbum);
								}


								//Репост для фото
								$('.photo-share').on('click', function (event) {
									event.stopPropagation();
									var data = {
										id: $(this).attr('id'),
									};
									// console.log(data);
									$.ajax({
										dataType: 'JSON',
										type: 'get',
										data: data,
										url: '/photos/repost/'
									}).then(function (data) {
										// console.log(data);
										alert('Репост отправлен на вашу стену');

									});
								});


								///Открытие фотографии
								$('.open_modal').on('click', function(){
									$('.open_modal').removeClass('foto-active');
									$(this).addClass('foto-active');
									var data = {
										idPhoto: $(this).attr('id')
									};

									openModal(data);

								});
							}
						});
					}
				}

			});

//////////////////////////////////////END infinite scroll///////////////////////////////










			titleInit();
			textareaInit();
		});

		$('.modal-div-view-foto').on('click', '.for-foto', function () {
			$('.next_btn').trigger('click');
		});

		$('.modal-div-view-foto').on('click', '.next_btn', function(e) {
			e.stopPropagation();


			var active = $('.foto-active').attr('data-id');
			active++;
			var dom = $('[data-id="'+active+'"]');
			$('.open_modal').removeClass('foto-active');

			var lastFoto = $(".list-foto-in-album").children('.open_modal:last').attr('data-id');
			var firstFoto = $(".list-foto-in-album").children('.open_modal:first');

			if (lastFoto != active-1 ){
				$(dom).addClass('foto-active');
			}else{
				$(firstFoto).addClass('foto-active');
			}

			var data = {
				idPhoto: $('.foto-active').attr('id')
			};

			openModal(data);
		});



		$('.modal-div-view-foto_prev').on('click', '.prev_btn', function(e) {
			e.stopPropagation();

			var active = $('.foto-active').attr('data-id');
			active--;
			var dom = $('[data-id="'+active+'"]');
			$('.open_modal').removeClass('foto-active');


			var lastFoto = $(".list-foto-in-album").children('.open_modal:last');
			var firstFoto = $(".list-foto-in-album").children('.open_modal:first').attr('data-id');

			if (firstFoto != active+1 ){
				$(dom).addClass('foto-active');
			}else{
				$(lastFoto).addClass('foto-active');
			}

			var data = {
				idPhoto: $('.foto-active').attr('id')
			};
			openModal(data);
		});



		titleInit();
		$('textarea:first').focus();
		textareaInit();
	});

	titleInit();
	textareaInit();

</script>
<div class="foto">
	<div class="wp-search-friend-block">
		<div class="wrapper-list-input-checkbox">
			<input type="text" id="search" class="search-field-friend">
			<input type="submit" value="" class="search-button-friend">
		</div>
	</div>
	<div class="sidebar-foto">

	</div>
	<div class="content-foto">

		<div class="header-content-foto">

			<div data-name-header="2" id="foto-in-album" style="display:none;" class="name-header">
				Фотографий в альбоме: <span class="countFoto"></span>
			</div>
			<div data-name-header="1" id="edit-album" style="display:none;" class="name-header">
				Редактирование альбома: <span id="nameAlbum"></span>
			</div>
			<div  data-name-header="3" id="coment-to-album" style="display:none;" class="name-header">
				Коментарии к альбому: <span class="nameAlbum"></span>
			</div>
		</div>

		<? if (empty($model)){ ?>
			<div class="new-uzer">
				У Вашего друга еще нет альбомов<br>
			</div>

		<? } ?>
		<div style="display:none;" id="" class="list-foto-in-album">

		</div>

		<div style="display:none;" class="comment-to-foto">

		</div>


		<div style="display:none;" class="edit-album">
			<div class="edit">
				<div class="add-foto_first">
					<img src="">
					<div class="cover-album">
						<a onclick="modalUse()" href="#modal4" class='open_modal foto-atachment' >Выбрать обложку</a>
					</div>
				</div>
				<div class="settings-for-album">
					Название
					<input type="text" value="" class='newNameAlbum'>
					Описание
					<textarea type="text" value="" class='newDescriptionAlbum'></textarea>
					<ul>
						<li>Кто может просматривать этот альбом?</li>
						<li>Кто может комментировать фотографии?</li>
					</ul>
					<ul>
						<li>
							<select id="privat-album">
								<option value="0">Все пользователи</option>
								<option value="1">Только друзья</option>
								<option value="2">Друзья и друзья друзей</option>
								<option value="3">Только я</option>
							</select>
						</li>
						<li>
							<select id="privat-album-photo">
								<option value="0">Все пользователи</option>
								<option value="1">Только друзья</option>
								<option value="2">Друзья и друзья друзей</option>
								<option value="3">Только я</option>
							</select>
						</li>
					</ul>


				</div>
			</div>
			<div class="foto-in-album">

			</div>
			<br>
			<br>
			<script type="text/javascript">

			</script>
			<form enctype="multipart/form-data" method="post">
				<p id="fileInputContainer"><input id="fileInput" type="file" name="f" accept="image/jpeg,image/png"><br>
					дайте название изображению <br>
					<input type="text" id='nameImg'><br>
					<input  id="" type="submit" value="Загрузить фото" class="load-photo" ></p>
			</form>
		</div>






	</div>
	<div class="footer-foto">
		<div class="title">
			Альбомы
		</div>
		<div class="for-elements">
		</div>
	</div>
</div>


</div>

</div>
<div id="modal1" class="modal-div-view-foto">
	<div class="modal-div-view-foto_prev">
		<div class="prev_btn"> </div>

	</div>
	<div class="modal-div-view-foto_next">
		<div class="next_btn"> </div>
	</div>
	<div class="modal_close"> <h1>Фотография <span class="curentFoto"></span> из <span class="countFoto"></span></h1><div id="close_for_modal" class="close"></div></div>
	<div class="content-view-foto">
		<div class="for-foto">
			<img src="">
		</div>
		<div class="date-LikeShare">
			<h5 class="date"></h5>
		</div>
		<div class="coments">
			<div class="show-all-coments">
				<h1>Показать все <span class='coment-count-news'> </span> <span class="word"></span></h1>
			</div>
			<div class="hide-all-coments hide-comments">
				<h1>Cкрыть все отзывы</h1>
			</div>
			<div class="coment-messages">
			</div>
			<div class="write-message">
				<div class="ava-user">
					<img src="">
				</div>
				<!-- <div class="message-area"> -->
				<textarea name="" id="com-photo" cols="30" rows="1"></textarea>
				<!-- <div class="add-setings">
            <div class="drop-list">
              <ul>
                <li><img src="<?php echo Yii::$app->homeUrl; ?>css/img/Graffity_ICO_add.png"></li>
                <li><img src="<?php echo Yii::$app->homeUrl; ?>css/img/Music_ICO_add.png"></li>
                <li><img src="<?php echo Yii::$app->homeUrl; ?>css/img/Video_ICO_add.png"></li>
                <li><img src="<?php echo Yii::$app->homeUrl; ?>css/img/Photo_ICO_add.png"></li>
              </ul>
              <img src="<?php echo Yii::$app->homeUrl; ?>css/img/arrow_down.png">
            </div>
            <img src="<?php echo Yii::$app->homeUrl; ?>css/img/Addition_ICO.png">
          </div> -->
				<!-- <div class="smile">
            <img src="<?php echo Yii::$app->homeUrl; ?>css/img/smile.png">
          </div> -->
				<!-- </div> -->
				<div id="" class="send-icon"></div>
			</div>
		</div>
		<div class="creator">
			<div class="ava-creator">
				<a href=""><img src=""></a>
			</div>

			<div class="user-name">
				<a href=""></a>
			</div>

			<div class="like-panel">
				<div class="photo-edit">
					<div class='Add-comen count-coment'></div>
				</div>
				<div class="photo-like">
					<div class='count-like'></div>
				</div>

				<div id="" class="share-photo">

				</div>
			</div>
			<div class="icons">
				<img src="<?php echo Yii::$app->homeUrl; ?>css/img/Location-ICO.png">
				<img src="<?php echo Yii::$app->homeUrl; ?>css/img/Wall-ICO.png">
			</div>
		</div>
	</div>
</div>
<div id="modal" class="modal-div-add-album">
	<div class="modal_close"> <h1>Добавить альбом</h1><div id="close_for_modal" class="close-foto"></div></div>
	<div class="conten">
		<div class="add-link">
			Название
			<input type="text" id="name-new-album">
			Описание
			<textarea type="text" id="description-new-album"></textarea>
			<ul>
				<li>Кто может просматривать этот альбом?</li>
				<li>Кто может комментировать фотографии?</li>
			</ul>
			<ul>
				<li>
					<select id="privat-new-album">
						<option value="0">Все пользователи</option>
						<option value="1">Только друзья</option>
						<option value="2">Друзья и друзья друзей</option>
						<option value="3">Только я</option>
					</select>
				</li>
				<li>
					<select id="privat-new-album-photo">
						<option value="0">Все пользователи</option>
						<option value="1">Только друзья</option>
						<option value="2">Друзья и друзья друзей</option>
						<option value="3">Только я</option>
					</select>
				</li>
			</ul>
		</div>
	</div>
	<div class="foot-modal">
		<button id="add-album" class="for-modal2">Сохранить изменения</button>
	</div>
</div>
<div id="modal4" class="modal_div_for_video">
	<div class="modal_close">
		<div id="close_for_modal" class="close"></div>
		<h1>Выберите обложку альбома "<!-- nameAlbum -->"</h1>
	</div>
	<div class="foto-list-content">

	</div>
</div>
<div id="overlay"></div><!-- Подложка -->
<script>
	$(document).ready(function() {
		/////Добавление альбома
		$('#add-album').on('click', function(){
			if($("#name-new-album").val() != ""){
				var data = {
					nameNewAlbum : $("#name-new-album").val(),
					descriptionNewAlbum : $("#description-new-album").val(),
					privatNewAlbum : $("#privat-new-album option:selected").val(),
					privatNewAlbumPhoto : $("#privat-new-album-photo option:selected").val(),
				};
				console.log(data);
				$.ajax({
					dataType: 'JSON',
					type : 'get',
					data : data,
					url: '/photos/addalbum/'
				}).then(function(data){
					console.log(data);
				});
			}
		});


		$('.drop-down-add').on('click', function(){
			$('.drop-add').toggle();
		});

		$('body').on('click', '.photo-edit', function() {
			$(this).closest('.modal-div-view-foto').find('textarea:first').focus();
		});

		// удаление фото
		$('body').on('click', '.del', function () {
			var isDel = confirm('Вы желаете удалить фото?');
			if (isDel) {
				var data = {
					idPhoto: $(this).attr('id'),
					idAlbum: $(this).attr('data-idalbum')
				};
				console.log(data);
				$.ajax({
					dataType: 'JSON',
					type: 'get',
					data: data,
					url: '/photos/delphoto/'
				}).then(function (data) {
					console.log(data);
					// $(thisPhoto).fadeOut('slow');
					location.reload();
				});
			}
		});



		//Лайки для фото
		$('body').on('click', '.content-view-foto .photo-like', likeInitToFoto);

		//Лайки для коментариев
		$('body').on('click', '.coment .photo-like', likeInitComentToFotoAlbum);

		sendCtrlEnter('.send-icon');

	});


</script>


