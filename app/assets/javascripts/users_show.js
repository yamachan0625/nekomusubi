$(document).on('turbolinks:load', function(){
  $('.profile-edit-btn').click(function(){
    $('#edit-modal-wrapper').css('display','block')
  });
  $('.fa-times-circle').click(function(){
    $('#edit-modal-wrapper').css('display','none')
  });
});