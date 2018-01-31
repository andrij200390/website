/*
  Initialize upload form.
*/
function uploadFormInit(elem_id) {

  /**
   * Upload form for photoalbums
   * @see: https://github.com/danielm/uploader
   */
  jQuery(elem_id).dmUploader({
    url: '/demo/java-script/upload',
    maxFileSize: 3000000,
    allowedTypes: 'image/*',
    extFilter: ['jpg', 'jpeg','png','gif'],

    onDragEnter: function(){
      this.addClass('active');
    },
    onDragLeave: function(){
      this.removeClass('active');
    },

    onNewFile: function(id, file){
      if (typeof FileReader !== 'undefined'){
        var reader = new FileReader();
        var img = $('<img />');

        reader.onload = function (e) {
          img.attr('src', e.target.result);
        };
        reader.readAsDataURL(file);
      }
    },
    onFileTypeError: function(file){
    },

  });

}
