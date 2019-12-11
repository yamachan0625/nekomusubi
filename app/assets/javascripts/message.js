$( document ).on('turbolinks:load', function() {

  function buildMessage(message){
    var html = `<div class="message-box__message2">
                  <div class="message-box__message2__style2">
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
});