$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#post_image").change(function(){
    $('#img_prev').css('display','block');
    $('.fa-image, .upload_name').css('display','none');
    readURL(this);
  });
});