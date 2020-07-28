class HomeController < ApplicationController
  def top
    if user_signed_in?
      @room = Room.new
      @rooms = current_user.rooms.where.not(id: 1)
      @nonrooms = Room.where.not(id: UserRoom.where(user_id: current_user.id).pluck(:room_id)).where.not(id: 1)
      @posts = Post.where(room_id: 1).last(9)
    end
  end
end
