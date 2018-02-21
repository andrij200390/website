<?php
   
    use yii\helpers\Html;
    use yii\helpers\Url;

    /* @var $this yii\web\View */
    $this->title = Yii::t('app', 'Фото').' - '.Yii::$app->name;
    
    $this->registerMetaTag(['name' => 'description', 'content' => $this->title]);
    $this->params['breadcrumbs'][] = Yii::t('app', '');

?>


<div class="content-foto">
	<div class="header-content-foto">
		<div data-name-header="1" id="edit-album" class="name-header">
			Редактирование альбома: <?=$albumEdit->name?>
		</div>
		
	</div>
</div>

<div class="edit-album">
	<div class="edit">
		<div class="download-image">
			<img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$albumEdit->user?>/<?=$albumEdit->id?>/small_<?=$lastPhoto?>">
		</div>
		<div class="settings-for-album">
			Название
			<input type="text" class='newNameAlbum'>
			Описание 
			<textarea type="text" class='newDescriptionAlbum'></textarea>
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
			<button class="btn-for-setings" id="<?=$idAlbum?>">Сохранить изменения</button> 
		</div>
	</div>


	<?php foreach($modelPhotos AS $key => $val){ ?>
		<div class="add-foto-to-album">
			<div class="add-foto">
				<img src="<?php echo Yii::$app->homeUrl; ?>images/photo/<?=$modelPhotos[$key]['idOwner']?>/<?=$modelPhotos[$key]['idAlbum']?>/small_<?=$modelPhotos[$key]['nameImg']?>">
			</div>
			<div class="settings-for-foto">
				Описание
				<input type="text" class='new-description'>
				<!-- <div class="add-to-album">
					Переместить в альбом
				</div>  -->
				<div class="add-to-album" id="<?=$modelPhotos[$key]['idPhoto']?>">
					Сохранить
				</div> 
				<div class="delete-from-album" id="<?=$modelPhotos[$key]['idPhoto']?>">
					Удалить
				</div>
			</div>
		</div>
	<?php } ?>

<!-- 	<div class="add-foto-to-album">
		<div class="add-foto">
			<img src="<?//php echo Yii::$app->homeUrl; ?>css/img/Photo.png">
		</div>
		<div class="settings-for-foto">
			Описание
			<input type="text">
			<div class="add-to-album">
				Переместить в альбом
			</div>
			<div class="delete-from-album">
				Удалить
			</div>
		</div>
	</div> -->
	<br>
	<br>
	<form enctype="multipart/form-data" method="post">
		   <p><input type="file" name="f" accept="image/jpeg,image/png"><br>
		  	дайте название изображению <br>
		   <input type="text" id='nameImg'><br>
		   <input type="submit" value="Загрузить фото" class="load-photo"></p>
	</form> 

</div>



<script type="text/javascript">
	$(document).ready(function() {

	///загрузка нового фото	
		var files;
		$('input[type=file]').change(function(){
		    files = this.files;
		});

		$('.load-photo').click(function( event ){
		    event.stopPropagation(); 
		    event.preventDefault();  
		    var data = new FormData();
		    $.each( files, function( key, value ){
		        data.append( key, value );
		    });
		    data.append('idAlbum' , <?=$albumEdit->id?>); /// передаем айди альбома
		    data.append('nameImg' , $("#nameImg").val()); /// название фото с поля инпут
		 
		    $.ajax({
		        url: '/photos/loadphoto/',
		        type: 'POST',
		        data: data,
		        cache: false,
		        dataType: 'json',
		        processData: false,
		        contentType: false,
		        success: function( respond, textStatus, jqXHR ){
		            if( typeof respond.error === 'undefined' ){
		 				console.log(respond); /// строим DOM посредством jQuery
		            }
		            else{
		                console.log('ОШИБКИ ОТВЕТА сервера: ' + respond.error );
		            }
		        },
		        error: function( jqXHR, textStatus, errorThrown ){
		            console.log('ОШИБКИ AJAX запроса: ' + textStatus );
		        }
		    });
		});


	///редактирование альбома
		$('.btn-for-setings').on('click', function(){ 
			var data = {
					idAlbum : $(this).attr('id'),
					newNameAlbum : $(".newNameAlbum").val(),
					newDescriptionAlbum : $(".newDescriptionAlbum").val(),
					privatAlbum : $("#privat-album option:selected").val(),
                    privatAlbumPhoto : $("#privat-album-photo option:selected").val(),
	        };

			console.log(data);
	                  
	        $.ajax({
	                dataType: 'JSON',
	                type : 'get',
	                data : data,
	                url: '/photos/editalbum/'
	        }).then(function(data){

	            console.log(data);

	        });
	    });

	// удаление фото 
		$('.delete-from-album').on('click', function(){ 
			var data = {
					idAlbum : <?=$idAlbum?>,
           			idPhoto : $(this).attr('id') 
	        };

			console.log(data);
	                  
	        $.ajax({
	                dataType: 'JSON',
	                type : 'get',
	                data : data,
	                url: '/photos/delphoto/'
	        }).then(function(data){

	            console.log(data);

	        });
	    });

	// редактирование фото 
		$('.add-to-album').on('click', function(){ 
			var data = {
           			idPhoto : $(this).attr('id'),
           			newDescription : $(this).parent().children("input").val()
	        };

			console.log(data);
	                  
	        $.ajax({
	                dataType: 'JSON',
	                type : 'get',
	                data : data,
	                url: '/1photos/editphoto/'
	        }).then(function(data){

	            console.log(data);

	        });
	    });

		titleInit();
	});
</script>
<script>
	$(function() {
		titleInit();
	});
</script>