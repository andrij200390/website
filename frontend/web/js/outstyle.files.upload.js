/**
 * Initialize upload form for photoalbums
 * @see    https://github.com/danielm/uploader
 * @param  {string} elem_id    Element ID, i.e. '#yourid'
 */
function uploadPhotoFormInit(elem_id) {

  var uploadForm = jQuery(elem_id);

  var album_id = uploadForm.find('#photo-album').val();
  var album_photos_count = uploadForm.find('#photo-album_photos_count').val();
  var active_album_id = '#album-'+album_id;

  uploadForm.dmUploader({
    url: uploadForm.attr('action'),
    fieldName: 'Photo[img]',
    maxFileSize: 3000000,
    allowedTypes: 'image/*',
    extFilter: ['jpg','jpeg','png','gif'],
    extraData: {
       "album_id": album_id ? album_id : 0
    },

    onInit: function(){
      if (album_photos_count == 0) {
        uploadForm.show();
      }
    },
    onComplete: function(){
        Intercooler.triggerRequest(active_album_id);
    },
    onDragEnter: function(){
      this.addClass('active');
    },
    onDragLeave: function(){
      this.removeClass('active');
      setTimeout(function() {
        jQuery("#photos_area .user__photo").hide();
      }, 10);
    },
    onDocumentDragEnter: function(){
      jQuery("#photos_area .user__photo").hide();
      this.show();
    },
    onDocumentDragLeave: function(){
      jQuery("#photos_area .user__photo").show();
      this.hide();
    },
    onNewFile: function(id, file){
      jQuery("#photos_area .user__photo").hide();
      ui_multi_add_file(id, file);
      if (typeof FileReader !== 'undefined'){
        var reader = new FileReader();
        var img = $('#uploaderFile' + id).find('img');

        reader.onload = function (e) {
          img.attr('src', e.target.result);
        };
        reader.readAsDataURL(file);
      }
    },
    onBeforeUpload: function(id){
      this.hide();
      ui_multi_update_file_progress(id, 0, '', true);
      ui_multi_update_file_status(id, 'uploading', 'Uploading...');
    },
    onUploadProgress: function(id, percent){
      ui_multi_update_file_progress(id, percent);
    },
    onUploadSuccess: function(id, data){
      ui_multi_update_file_status(id, 'success', 'Upload Complete');
      ui_multi_update_file_progress(id, 100, 'success', false);
      var currentPhotosCount = parseInt(jQuery(active_album_id).find('.album__title div span').html());
      jQuery(active_album_id).find('.album__title div span').html(currentPhotosCount+1);

    },
    onUploadError: function(id, xhr, status, message){
      ui_multi_update_file_status(id, 'danger', message);
      ui_multi_update_file_progress(id, 0, 'danger', false);
    },


    /* Handle upload form errors */
    onFileSizeError: function(file){
      var errorDescription = uploadForm.find('#uploadbox-locale__FileSizeError').html();
      ohSnap(errorDescription, {'color':'red'});
    },
    onFileTypeError: function(file){
      var errorDescription = uploadForm.find('#uploadbox-locale__FileTypeError').html();
      ohSnap(errorDescription, {'color':'red'});
    },
    onFileExtError: function(file){
      var errorDescription = uploadForm.find('#uploadbox-locale__FileExtError').html();
      ohSnap(errorDescription, {'color':'red'});
    }
  });

}

/* Creates a new file and add it to our list */
function ui_multi_add_file(id, file)
{
  var template = $('#files__template').text();
  template = template.replace('%%filename%%', file.name);

  template = $(template);
  template.prop('id', 'uploaderFile' + id);
  template.data('file-id', id);

  $('#files').find('li.empty').fadeOut(); // remove the 'no files yet'
  $('#files').append(template);
}

// Changes the status messages on our list
function ui_multi_update_file_status(id, status, message)
{
  $('#uploaderFile' + id).find('span').html(message).prop('class', 'status text-' + status);
}

// Updates a file progress, depending on the parameters it may animate it or change the color.
function ui_multi_update_file_progress(id, percent, color, active)
{
  color = (typeof color === 'undefined' ? false : color);
  active = (typeof active === 'undefined' ? true : active);

  var bar = $('#uploaderFile' + id).find('div.progress-bar');

  bar.width(percent + '%').attr('aria-valuenow', percent);
  bar.toggleClass('progress-bar-striped progress-bar-animated', active);

  if (percent === 0){
    bar.html('');
  } else {
    bar.html(percent + '%');
  }

  if (color !== false){
    bar.removeClass('bg-success bg-info bg-warning bg-danger');
    bar.addClass('bg-' + color);
  }
}
