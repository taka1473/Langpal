class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(message)
    Post.create(message: message['message'][0], user_id: message['message'][1].to_i, room_id: message['message'][2].to_i)
    if current_user.id = message['message'][1]
      cls_post = "post post-mine"
      cls_block = "post-block-mine"
    else
      cls_post = "post post-others"
      cls_block = "post-block-others"
    end
    ActionCable.server.broadcast('room_channel', message: message['message'][0], cls_post: cls_post, cls_block: cls_block)#フロントに返す
  end
end
