class HomeController < ApplicationController
  def top
    if user_signed_in?
      @room = Room.new
      @rooms = current_user.rooms.where.not(id: 1)
      @nonrooms = Room.where(id: UserRoom.where.not(user_id: current_user.id).where.not(id: 1).pluck(:id))
      @posts = Post.where(room_id: 1)
    end
  end
end
