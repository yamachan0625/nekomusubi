$( document ).on('turbolinks:load', function() {

  

  function buildMessage(message){
    // メッセージを送ったuserのidを用いて全userのavatarデータの入ったgon.avatarsの配列からsliceを使ってavatarを取得する
    var avatar = gon.avatars.slice(message.user_id - 1,message.user_id);
    if(avatar == "default.jpg"){
      var avatar = "/assets/default-86fc73ba77fb9b61a8a351f2ef0a9ec4a2e9a5b3f2be63f28c802f6df6b4f27a.jpg"
    }else{
      var avatar = avatar
    }
    
    var html = `<div class="message-box__message" data-message-id= "${message.id}">
                  <div class="message-box__message__image">
                    <a href="/users/${message.user_id}"><img src=${avatar}></a>
                  </div>
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
    "default.jpg"
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

    .always(function(){
      $('.message-form__submit').removeAttr("disabled");
      })
      
  })

  var reloadMessages = function() {
    if (window.location.href.match(/\/rooms\/\d+/)){
    //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
    
    
      if($('.message-box__message')[0] || $('.message-box__message2')[0]){
        var message_id = $('.message-box__message').last().data("message-id");
        var message_id2 = $('.message-box__message2').last().data("message-id");
        var current_user_id = gon.current_user_id;
        
        

        if( message_id > message_id2){
          var last_message_id = message_id
        }else{
          var last_message_id = message_id2 
        }
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
          var insertHTML = '';
          //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
          $.each(messages, function(i, message) {
            //user_idがcurrent_userのidととそうでないものを分岐させる
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
          alert("自動更新に失敗しました")
        });
      }
    }
  };
  setInterval(reloadMessages, 7000);
});