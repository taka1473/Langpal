class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @posts = @room.posts
    unless @room.user_rooms.find_by(user_id: current_user.id)
      current_user.user_rooms.create(room_id: @room.id)
    end
  end
  
  def create
    @room = Room.new(room_params)
    @room.save
    current_user.user_rooms.create(room_id: @room.id)
    redirect_to @room
  end
  
  private
  def room_params
    params.require(:room).permit(:name)
  end
end
