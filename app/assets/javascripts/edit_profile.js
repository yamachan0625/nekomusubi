$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#profile_img").change(function(){
    $('.avatar_present_img').remove();
    $('#avatar_img_prev').css("display", "block");

    readURL(this);
  });

  $('.fa-camera').hover(
    function(){
      $('.avatar_present_img,#avatar_img_prev').css({
        'opacity' : '0.4',
      });
    },
    function(){
      $('.avatar_present_img,#avatar_img_prev').css({
        'opacity' : '1',
      });
    }
  );

  $('.profile-back-button').click(function(){
    $('#edit_modal_wrapper').css("display", "none");
  })

});

  
