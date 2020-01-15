$( document ).on('turbolinks:load', function() {

  


  //登録ボタンを押したときタイトル枠を赤く＆警告を表示する
  $('#new_post').submit(function() {
    if($('#post_title').val() == ''){
      $('#post_title').css('border','1px solid red');
      $('.title-label').css('display','block');
      return false;
    }
  });
  //文字を入力すると警告が消えて枠色も戻る
  $('#post_title').keyup(function(){
    $('.title-label').css('display','none');
    $('#post_title').css('border','1px solid #D19062');
  })



  //登録ボタンを押したとき住所枠を赤く＆警告を表示する,
  $('#new_post').submit(function() {
    if($('#post_address').val() == ''){
      $('#post_address').css('border','1px solid red');
      $('.address_label').css('display','block');
      $('#get-my-place-btn').css('display','block');
      return false;
    };
  });


  //文字を入力すると警告が消えて枠色も戻る
  $('#post_address').keyup(function(){
    $('.address_label').css('display','none');
    $('#post_address').css('border','1px solid #D19062');
  });




//登録ボタンを押したとき詳細枠を赤く＆警告を表示する
  $('#new_post').submit(function() {
    if($('#post_content').val() == ''){
      $('#post_content').css('border','1px solid red');
      $('.detail-label').css('display','block');
      return false;
    }
  });
  //文字を入力すると警告が消えて枠色も戻る
  $('#post_content').keyup(function(){
    $('.detail-label').css('display','none');
    $('#post_content').css('border','1px solid #D19062');
  })


  $('#get-my-place-btn').click(function(){
    $('#get-my-place-btn').text('現在地が表示されるまでお待ちください')
  });


  $('.fa-times-circle, .back-button').click(function(){
    $('.modal').css('display', 'none');
  })

  $('.post-btn').click(function(){
    $('.modal').css('display', 'block');
  })

  $('.post-detail-edit-btn').click(function(){
    $('.modal').css('display', 'block');
  })

})