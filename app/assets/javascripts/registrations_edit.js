$( document ).on('turbolinks:load', function() {
  $('.input-field').on("focus",function(){
    $(this).addClass('focus');
  });
  $('.input-field').on("blur",function(){
    if($(this).val() == "")
      $(this).removeClass('focus');
  });
});