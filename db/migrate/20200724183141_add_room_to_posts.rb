class AddRoomToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :room, foreign_key: true
  end
end
