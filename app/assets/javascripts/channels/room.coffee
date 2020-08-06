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
    if data["bool"] == "t"
      $('#posts').append('<div class="post-block post-block-mine"><div class="post-div"><p>'+data["name"]+'</><div class="post post-mine">'+data["message"]+'</div></div><img src='+data["image"]+' class = "icon_image"></div>')
    else
      $('#posts').append('<div class="post-block post-block-others"><img src="'+data["image"]+'" class = "icon_image"><div class="post-div"><p>'+data["name"]+'</p><div class="post post-others">'+data["message"]+'</div></div></div>')
    
    if data["room"] == 1
      postBlocks = document.getElementsByClassName("post-block")
      postBlock = postBlocks[0]
      $(postBlock).remove()

  speak: (message) ->
    @perform 'speak', message: message　#サーバーサイドのspeakアクションにmessageパラメータを渡す
    
  jQuery(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 # return キーのキーコードが13
      App.room.speak [event.target.value, $('[data-user]').attr('data-user'), $('[data-room]').attr('data-room'), $('[data-name]').attr('data-name'), $('[data-image]').attr('data-image') ] # speak メソッド 引数に配列
      event.target.value = ''
      event.preventDefault()
      
  jQuery(document).on 'click', '#submit-btn', (event) ->
    vl = document.getElementById("input")
    App.room.speak [vl.value, $('[data-user]').attr('data-user'), $('[data-room]').attr('data-room'), $('[data-name]').attr('data-name'), $('[data-image]').attr('data-image')] # speak メソッド 引数に配列
    vl.value = ''
    event.preventDefault()