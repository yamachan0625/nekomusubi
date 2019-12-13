$( document ).on('turbolinks:load', function() {

  

  function buildMessage(message){
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
      var html = buildMessage(message);
      $('.message-box').append(html);
      $('#message_message').val('');
      $('.message-form__submit').removeAttr("disabled");
      $('.message-content').animate({scrollTop: $('.message-content')[0].scrollHeight}, 'fast');
    })
    .fail(function(){
      alert("メッセージ送信に失敗しました");
    })
  })

  var reloadMessages = function() {
    //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
    var last_message_id = $('.message-box__message2').last().data("message-id");

    $.ajax({
      
      url: 'new_message',
      //ルーティングで設定した通りhttpメソッドをgetに指定
      type: 'GET',
      dataType: 'json',
      //dataオプションでリクエストに値を含める
      data: {
            id: last_message_id,
            // room_id: room_id 
      }
    })
    .done(function(messages) {
      var insertHTML = '';
      //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
      $.each(messages, function(i, message) {
        insertHTML += buildMessage(message)
      });
      $('.message-box').append(insertHTML);
      $('.message-content').animate({scrollTop: $('.message-content')[0].scrollHeight}, 'fast');
    })
    .fail(function(messages) {
      // alert("自動更新に失敗しました")
    });
  };
  setInterval(reloadMessages, 5000);
});