$(function(){

  $('#new_post').submit(function() {
    if($('#post_title').val() == ''){
      $('#post_title').css('border','1px solid red');
      $('.title_label').css('display','block');
      return false;
    }
  });
  $('#post_title').keyup(function(){
    $('.title_label').css('display','none');
    $('#post_title').css('border','1px solid #D19062');
  })




  $('#new_post').submit(function() {
    if($('#post_address').val() == ''){
      $('#post_address').css('border','1px solid red');
      $('.address_label').css('display','block');
      $('#get-my-place-btn').css('display','block');
      return false;
    }
  });
  $('#post_address').keyup(function(){
    $('.address_label').css('display','none');
    $('#post_address').css('border','1px solid #D19062');
  })





  $('#new_post').submit(function() {
    if($('#post_content').val() == ''){
      $('#post_content').css('border','1px solid red');
      $('.detail_label').css('display','block');
      return false;
    }
  });
  $('#post_content').keyup(function(){
    $('.detail_label').css('display','none');
    $('#post_content').css('border','1px solid #D19062');
  })






  $('#get-my-place-btn').click(function(){
    $('.address_field').css('display','none');
    $('.btn_label').css('display','block');
  });

  $('#post_address').keyup(function(){
    $('#get-my-place-btn').css('display','none');
    if($('#post_address').val() == ''){
      $('#get-my-place-btn').css('display','block');
    }
  });



})