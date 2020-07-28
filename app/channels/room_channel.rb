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
      bool = "t"
    else
      bool = "f"
    end
    ActionCable.server.broadcast('room_channel', message: message['message'][0], bool: bool, name: message['message'][3], image: message["message"][4])#フロントに返す
  end
end
