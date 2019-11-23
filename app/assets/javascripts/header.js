$( document ).on('turbolinks:load', function() {
  // $('.my_page_btn_field').off('click')
  // $('.my_page_btn_field').on('click', function(){
  //   console.log('aaa')
  //   $('.my_window').fadeIn();
  // })
  //   $(document).on('click', function(e) {
  //     if (!$(e.target).closest('.my_window').length) {
  //     $('.my_window').fadeOut();
  //     }
  //   })

  $(document).on('click', function(e) {
    // ２．クリックされた場所の判定
    if($(e.target).closest('.my_page_btn_field').length){
      $('.my_window').fadeIn();
    }else if(!$(e.target).closest('.my_window').length ){
      $('.my_window').fadeOut();
    }
  });
})