<?php
   
    use yii\helpers\Html;
    use yii\helpers\Url;

    /* @var $this yii\web\View */
    $this->title = Yii::t('app', 'Фото').' - '.Yii::$app->name;
    
    $this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
    $this->params['breadcrumbs'][] = Yii::t('app', '');

?>

<script type="text/javascript">


	$(document).ready(function() {  
	    $('.album').on('click', function(){
	        var that = $(this);

	        $('.edit-album-btn').show();
	        $('#foto-in-album').show();
			$('.list-foto-in-album').show();

			$('#edit-album').hide();
			$('.edit-album').hide();
			$('.comment-to-foto').hide();
			$('#coment-to-album').hide();

	        $('.album').removeClass('active');
	        that.addClass('active');

	        // var index = that.data('index');
	        // $('.ModalSettings').hide();
	        // $('[data-content-index="' + index + '"]').show();
	    });
	})

	function editalbum () {
			event.stopPropagation();
			$('.edit-album-btn').hide();
			$('.list-foto-in-album').hide();
			$('#foto-in-album').hide();
			$('.edit-album').show();
			$('#edit-album').show();
			$('.comment-to-foto').hide();
			$('#coment-to-album').hide();
	}
	function comentalbum(){
			event.stopPropagation();
			$('#edit-album').hide();
			$('.edit-album').hide();
			$('#foto-in-album').hide();
			$('.list-foto-in-album').hide();
			$('.comment-to-foto').show();
			$('#coment-to-album').show();
	}

</script>


<script type="text/javascript">
    jQuery(function()
    {
        var el = $('.sidebar-foto').jScrollPane({
        	showArrows: true,
        	verticalDragMinHeight: 50,
	        verticalDragMaxHeight: 150,
	        horizontalDragMinWidth: 50,
	        horizontalDragMaxWidth: 150
        });
        var api = el.data('jsp');

			titleInit();
    });
</script>



<div data-name-header="2" id="foto-in-album" class="name-header">
	Фотографий в альбоме: <?=$countPhotos?>
</div>

<div class="list-foto-in-album">
	<?php foreach($modelPhotos AS $key => $val){ ?>
			<a href="#modal1" class="open_modal">
				<div class="foto-in-album">

					<img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhotos[$key]['idOwner']?>/<?=$modelPhotos[$key]['idAlbum']?>/small_<?=$modelPhotos[$key]['nameImg']?>">
					<div class="foot-photo">
						<div class="photo-edit">
						<img src="<?php echo Yii::$app->homeUrl; ?>css/img/AddComment_ICO.png"> 
						121
					</div>
						<?php $likeActive2 = ($modelNews['myLike'] == 1) ? "likeActive2" : "";?>
					<div class="photo-like <?=$likeActive2;?>">
						<img src="<?php echo Yii::$app->homeUrl; ?>css/img/Like_ICO.png"> 
						587
					</div>
					<div class="photo-share">
						<img src="<?php echo Yii::$app->homeUrl; ?>css/img/share.png">
					</div>
				</div>
			</a>
	<?php } ?>
</div>



<script>
	$(window).load(function () {

	/////вывод фото
		
			var data = {
					id : <?=$id?>,
                    page : 1,
            };
			console.log(data);

            $.ajax({
                    dataType: 'JSON',
                    type : 'get',
                    data : data,
                    url: ''
            }).then(function(data){

                  	console.log(data);

            });


		titleInit();

	});				


</script>

<div id="modal1" class="modal-div-view-foto">
		<div class="modal_close"> <h1>Фотография 15 из 45</h1><div id="close_for_modal" class="close"></div></div>
		<div class="content-view-foto">
			<div class="for-foto">
				<img src="<?php echo Yii::$app->homeUrl; ?>css/img/Photo2.png">
			</div>
			<div class="date-LikeShare">
				<h5>Добавлено 12 июля 2015</h5>
				<div class="like-panel">
					<div class="photo-edit">
						<img src="<?php echo Yii::$app->homeUrl; ?>css/img/AddComment_ICO.png"> 121
					</div>
					<?php $likeActive2 = ($modelNews['myLike'] == 1) ? "likeActive2" : "";?>
					<div class="photo-like <?=$likeActive2;?>">
						<img src="<?php echo Yii::$app->homeUrl; ?>css/img/Like_ICO.png"> 587
					</div>
					<div class="photo-share">
						<img src="<?php echo Yii::$app->homeUrl; ?>css/img/Share_ICO.png">
					</div>
				</div>
			</div>
			<div class="coments">
						<div class="coment">
							<div class="user-ava">
								<img src="<?php echo Yii::$app->homeUrl; ?>css/img/ava-use.png">
							</div>
							<div class="info-user">
								<div class="del-coment">
									<img src="<?php echo Yii::$app->homeUrl; ?>css/img/close.png">
								</div>
								<div class="for-user-vs-time">
									<div class="user-name">
									Bootuz
									</div>
									<div class="time">
									вчера в 17:45
									</div>
								</div>
								<div class="user-message">
									Ну, на самом деле, мне очень понравилось. Я был рад посмотреть его. Правда, как-то затянуто ИМХО.
								</div>
								<div class="reply">
									<img src="<?php echo Yii::$app->homeUrl; ?>css/img/Share_ICO.png">
								</div>
								<?php $likeActive2 = ($modelNews['myLike'] == 1) ? "likeActive2" : "";?>
								<div class="like <?=$likeActive2;?>">
								
								</div>
							</div>
						</div>
						<div class="coment">
							<div class="user-ava">
								<img src="<?php echo Yii::$app->homeUrl; ?>css/img/ava-use2.png">
							</div>
							<div class="info-user">
								<div class="del-coment">
									<img src="<?php echo Yii::$app->homeUrl; ?>css/img/close.png">
								</div>
								<div class="for-user-vs-time">
									<div class="user-name">
									Mateew
									</div>
									<div class="time">
									вчера в 17:45
									</div>
								</div>
								<div class="user-message">
									Стиви. Иди в ж.
								</div>
								<div class="reply">
									<img src="<?php echo Yii::$app->homeUrl; ?>css/img/Share_ICO.png">
								</div>
								<?php $likeActive2 = ($modelNews['myLike'] == 1) ? "likeActive2" : "";?>
								<div class="like <?=$likeActive2;?>">
								
								</div>
							</div>
						</div>
						<div class="write-message">
							<div class="ava-user">
								<img style="height: 31px; width: 31px;" src="<?php echo Yii::$app->homeUrl; ?>css/img/ava-use2small.png">
							</div>
							<div class="message-area">
								<input  type="text">
								<div class="add-setings">
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
								</div>
								<div class="smile">
									<img src="<?php echo Yii::$app->homeUrl; ?>css/img/smile.png">
								</div>
							</div>
							<div class="send-icon">
								<img src="<?php echo Yii::$app->homeUrl; ?>css/img/Send_ICO.png">
							</div>
						</div>
			</div>
			<div class="creator">
				<div class="ava-creator">
					<img src="<?php echo Yii::$app->homeUrl; ?>css/img/ava-use3.png">
				</div>
				<div class="user-name">
					Stewee
				</div>
				<div class="name-album">
					Брейкданс
				</div>
				<div class="text">
					Дествия
				</div>
				<div class="icons">
					<img src="<?php echo Yii::$app->homeUrl; ?>css/img/Location-ICO.png">
					<img src="<?php echo Yii::$app->homeUrl; ?>css/img/Wall-ICO.png">
				</div>
				<div class="del">
					Удалить фото
				</div>
			</div>
		</div>
	</div>

<script>
	$(function() {
		titleInit();
		$('textarea:first').focus();
	});
</script>

