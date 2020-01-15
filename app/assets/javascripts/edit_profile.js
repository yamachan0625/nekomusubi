$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar-img-prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#profile-img").change(function(){
    $('.avatar-present-img').remove();
    $('#avatar-img-prev').css("display", "block");

    readURL(this);
  });

  $('.fa-camera').hover(
    function(){
      $('.avatar-present-img,#avatar-img-prev').css({
        'opacity' : '0.4',
      });
    },
    function(){
      $('.avatar-present-img,#avatar-img-prev').css({
        'opacity' : '1',
      });
    }
  );

  $('.profile-back-button').click(function(){
    $('#edit-modal-wrapper').css("display", "none");
  })

});

  
