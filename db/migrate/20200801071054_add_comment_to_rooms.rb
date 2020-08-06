class AddCommentToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :comment, :text
  end
end
