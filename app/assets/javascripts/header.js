$(function(){
  $('.my_page_btn_field').click(function(){
    if($('.my_window').css('display') == 'none'){
      $('.my_window').css('display','block');
    }else{
      $('.my_window').css('display','none');
    }
    
  })
})