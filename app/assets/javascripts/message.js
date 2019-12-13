$( document ).on('turbolinks:load', function() {

  

  function buildMessage(message){
    var html = `<div class="message-box__message" data-message-id= "${message.id}">
                  <div class="message-box__message__style" >
                    ${message.message}
                    <br>
                    <div class="message-time">
                      ${message.created_at}
                    </div>
                  </div>
                </div>`
    return html;
  }

  function buildMessage2(message){
    var html = `<div class="message-box__message2" data-message-id= "${message.id}">
                  <div class="message-box__message2__style2" >
                    ${message.message}
                    <br>
                    <div class="message-time">
                      ${message.created_at}
                    </div>
                  </div>
                </div>`
    return html;
  }



  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(message){
      var html = buildMessage2(message);
      $('.message-box').append(html);
      $('#message_message').val('');
      $('.message-box').animate({scrollTop: $('.message-box')[0].scrollHeight}, 'fast');
    })
    .fail(function(){
      alert("メッセージ送信に失敗しました");
    })

    .always(function(data){
      $('.message-form__submit').removeAttr("disabled");
      })
      
  })

  var reloadMessages = function() {
    if (window.location.href.match(/\/rooms\/\d+/)){
    //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
    // var last_message_id = $('.message-box__message').last().data("message-id");
    
      if($('.message-box__message')[0] || $('.message-box__message2')[0]){
        var last_message_id = $('.message-box__message2').last().data("message-id");
        var current_user_id = gon.current_user_id;
        
        $.ajax({
          url: 'new_message',
          //ルーティングで設定した通りhttpメソッドをgetに指定
          type: 'GET',
          dataType: 'json',
          //dataオプションでリクエストに値を含める
          data: {
                id: last_message_id,
          }
        })
        .done(function(messages) {
          // console.log('ok')
          var insertHTML = '';
          //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
          $.each(messages, function(i, message) {
            if(message.user_id == current_user_id){
              insertHTML += buildMessage2(message)
            }else{
              insertHTML += buildMessage(message)
            }
          });
          $('.message-box').append(insertHTML);
          $('.message-box').animate({scrollTop: $('.message-box')[0].scrollHeight}, 'fast');
        })
        .fail(function() {
          // alert("自動更新に失敗しました")
          console.log('ng')
        });
      }
    }
  };
  setInterval(reloadMessages, 10000);
});