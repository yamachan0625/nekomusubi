$(document).on('turbolinks:load', function(){
  $('.input_field').on("focus",function(){
    $(this).addClass('focus');
  });
  $('.input_field').on("blur",function(){
    if($(this).val() == '')
    $(this).removeClass('focus');
  });
});