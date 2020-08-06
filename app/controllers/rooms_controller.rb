class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @posts = @room.posts
    @users = @room.users
    if params[:input]
      if params[:input] != @room.password
        flash[:danger] = 'incorrect password'
        redirect_to root_url
      else
        unless @room.user_rooms.find_by(user_id: current_user.id)
          current_user.user_rooms.create(room_id: @room.id)
        end
      end
    end
  end
  
  def create
    @room = Room.new(room_params)
    @room.host_id = current_user.id
    @room.gender = current_user.gender
    if @room.save
      current_user.user_rooms.create(room_id: @room.id)
      redirect_to @room
    else
      flash[:danger] = 'failed to create new room'
      render '/home/top'
    end
  end
  
  def destroy
    @room = Room.find(params[:id])
    if @room.host_id = current_user.id
      if @room.destroy
        flash[:success] = 'Deleted the room successfully'
        redirect_to root_url
      else
        flash[:danger] = 'Failed to delete the room'
        render @room
      end
    end
    redirect_to root_url
  end
  
  private
  def room_params
    params.require(:room).permit(:name, :comment, :password)
  end
end
