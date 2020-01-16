$( document ).on('turbolinks:load', function() {

  $(document).on('click', function(e) {
    // ２．クリックされた場所の判定
    if($(e.target).closest('.mypage-btn-field').length){
      $('.my_window').fadeIn();
    }else if(!$(e.target).closest('.my_window').length ){
      $('.my_window').fadeOut();
    }
  });
})