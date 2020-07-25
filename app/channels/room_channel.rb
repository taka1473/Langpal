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
    ActionCable.server.broadcast 'room_channel', message: message['message'][0] #フロントに返す
  end
end
