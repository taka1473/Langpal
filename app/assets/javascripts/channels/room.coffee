App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    #通信が確立された時
    # Called when the subscription is ready for use on the server

  disconnected: ->
    #通信が切断された時
    # Called when the subscription has been terminated by the server

  received: (data) ->
    #値を受け取った時
    # Called when there's incoming data on the websocket for this channel
    $('#posts').append('<div class="'+data["cls_block"]+'">'+'<p class="'+data["cls_post"]+'">'+data["message"]+'</p>'+'</div>');

  speak: (message) ->
    @perform 'speak', message: message　#サーバーサイドのspeakアクションにmessageパラメータを渡す
    
  jQuery(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 # return キーのキーコードが13
      App.room.speak [event.target.value, $('[data-user]').attr('data-user'), $('[data-room]').attr('data-room')] # speak メソッド 引数に配列
      event.target.value = ''
      event.preventDefault()