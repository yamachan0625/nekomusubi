$( document ).on('turbolinks:load', function() {
  //登録ボタンを押したときタイトル枠を赤く＆警告を表示する
  $('#new_post').submit(function() {
    if($('#post_title').val() == ''){
      $('#post_title').css('border','1px solid red');
      $('.title_label').css('display','block');
      return false;
    }
  });
  //文字を入力すると警告が消えて枠色も戻る
  $('#post_title').keyup(function(){
    $('.title_label').css('display','none');
    $('#post_title').css('border','1px solid #D19062');
  })



  //登録ボタンを押したとき住所枠を赤く＆警告を表示する,
  $('#new_post').submit(function() {
    if($('#post_address').val() == '' && $('#post_address').css('display') == 'block'){
      $('#post_address').css('border','1px solid red');
      $('.address_label').css('display','block');
      $('#get-my-place-btn').css('display','block');
      return false;
    }else{
      return true;
    }
  });
  //文字を入力すると警告が消えて枠色も戻る
  $('#post_address').keyup(function(){
    $('.address_label').css('display','none');
    $('#post_address').css('border','1px solid #D19062');
  })




//登録ボタンを押したとき詳細枠を赤く＆警告を表示する
  $('#new_post').submit(function() {
    if($('#post_content').val() == ''){
      $('#post_content').css('border','1px solid red');
      $('.detail_label').css('display','block');
      return false;
    }
  });
  //文字を入力すると警告が消えて枠色も戻る
  $('#post_content').keyup(function(){
    $('.detail_label').css('display','none');
    $('#post_content').css('border','1px solid #D19062');
  })





  //現在地取得ボタンを押すと住所入力欄が消えてが消えてメッセージを表示する
  $('#get-my-place-btn').click(function(){
    $('.address_field').css('display','none');
    $('.btn_label').css('display','block');
  });
  //住所んを入力すると現在地取得ボタンが消える
  $('#post_address').keyup(function(){
    $('#get-my-place-btn').css('display','none');
    //住所が未入力だったらボタンを表示する
    if($('#post_address').val() == ''){
      $('#get-my-place-btn').css('display','block');
    }
  });



  $('.fa-times-circle').click(function(){
    $('.modal').css('display', 'none');
  })


})