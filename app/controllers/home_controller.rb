class HomeController < ApplicationController
  require 'date'
  
  def top
    if user_signed_in?
      redirect_to "/home/lobby/#{current_user.gender.downcase}"
    end
  end
  
  def lobby
    if user_signed_in?
      @room = Room.new
      @rooms = current_user.rooms.where(gender: current_user.gender).where.not(id: 1)
      destroy_abandoned_room(@rooms)
      @nonrooms = Room.where(gender: current_user.gender).where.not(id: UserRoom.where(user_id: current_user.id).pluck(:room_id)).where.not(id: 1).where.not(id:2)
      destroy_abandoned_room(@nonrooms)
      @users = User.where(gender: current_user.gender)
      if current_user.gender == 'Male'
        @posts = Post.where(room_id: 1).last(9)
      else
        @posts = Post.where(room_id: 2).last(9)
      end
    end
  end
  
  def room_last_updated_date(room)
    if room.posts.any?
      return room.posts.last.created_at
    else
      return room.created_at
    end
  end
  
  def destroy_abandoned_room(rooms)
    rooms.each do |room|
      if room_last_updated_date(room) < Time.now.ago(1.hours)
        room.destroy
      end
    end
  end
  
end
