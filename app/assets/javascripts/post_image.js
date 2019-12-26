$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img_prev, #edit_img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#post_image").change(function(){
    $('#img_prev').css('display','block');
    $('.upload_name, .fa-image').css('display','none');
    readURL(this);
  });
});